package com.huifu.base;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;

import cn.org.rapid_framework.beanutils.BeanUtils;
import cn.org.rapid_framework.page.Page;
import cn.org.rapid_framework.page.PageRequest;

import com.huifu.base.CommonUtil;
import com.huifu.base.LogFactory;

@SuppressWarnings({"rawtypes", "deprecation", "unchecked"})
public abstract class BaseIbatis3Dao<E, PK extends Serializable> extends SqlSessionDaoSupport implements EntityDao<E, PK> {
    protected final Logger logger = LogFactory.LOGGER_DAO;
    
	public abstract Class getEntityClass();
    
    public E getById(PK primaryKey) {
    	return getSqlSession().selectOne(getFindByPrimaryKeyQuery(), primaryKey);
    }
    
    public PK findMaxRecordId() {
    	return getSqlSession().selectOne(getMaxRecordId());
    }
    
  
    public void deleteById(PK id) {
        getSqlSession().delete(getDeleteQuery(), id);
    }

    /**
     * 用于子类覆盖,在insert,update之前调用
     */
    protected void prepareObjectForSaveOrUpdate(E o) {
    }
    
    public void save(E entity) {
        prepareObjectForSaveOrUpdate(entity);
        getSqlSession().insert(getInsertQuery(), entity);
    }
    
    public void update(E entity) {
        prepareObjectForSaveOrUpdate(entity);
        getSqlSession().update(getUpdateQuery(), entity);
    }
    
    public String getFindByPrimaryKeyQuery() {
        return getEntityClass().getSimpleName() + ".getById";
    }
    
    public String getInsertQuery() {
        return getEntityClass().getSimpleName() + ".insert";
    }
    
    public String getUpdateQuery() {
        return getEntityClass().getSimpleName() + ".update";
    }
    
    public String getDeleteQuery() {
        return getEntityClass().getSimpleName() + ".delete";
    }
    
    public String getCountQuery() {
        return getEntityClass().getSimpleName() + ".count";
    }
    
    public String getMaxRecordId() {
        return getEntityClass().getSimpleName() + ".maxRecordId";
    }
    
    public String getFindAllQuery() {
        return getEntityClass().getSimpleName() + ".findAll";
    }
    
    public String getFindAllByMapQuery() {
        return getEntityClass().getSimpleName() + ".findAllByMap";
    }
    
    protected Page pageQuery(String statementName, PageRequest pageRequest) {
        return pageQuery(statementName, this.getCountQuery(), pageRequest);
    }
    
    /**
    * 历史订单特殊分页（分公司参与的订单数）
    */
    protected Page historyOrderCountOther(String statementName, PageRequest pageRequest) {
        return pageQuery(statementName, getEntityClass().getSimpleName()+".historyOrderCountOther", pageRequest);
    }
    
    /**
     * 历史款式特殊分页（总公司创建的款式数）
     */
    protected Page findHistoryStyle(String statementName, PageRequest pageRequest) {
        return pageQuery(statementName, getEntityClass().getSimpleName()+".historyStyleCount", pageRequest);
    }
    
	protected Page pageQuery(String statementName, String countStatement, PageRequest pageRequest) {
        Number totalCount = (Number) this.getSqlSession().selectOne(countStatement, pageRequest.getFilters());
        if (totalCount == null || totalCount.intValue() <= 0)
            return new Page(pageRequest, 0);
        
        Page page = new Page(pageRequest, totalCount.intValue());
        
        /* 其它分页参数,用于不喜欢或是因为兼容性而不使用方言(Dialect)的分页用户使用.
         * 与getSqlMapClientTemplate().queryForList(statementName, parameterObject)配合使用
         */
        Map<String, Object> filters = new HashMap<String, Object>();
        filters.put("offset", page.getFirstResult());
        filters.put("pageSize", page.getPageSize());
        filters.put("lastRows", page.getFirstResult() + page.getPageSize());
        filters.put("sortColumns", pageRequest.getSortColumns());
        
        // 混合两个filters为一个filters,MapAndObject.get()方法将在两个对象取值,Map如果取值为null,则再在Bean中取值
        if (pageRequest.getFilters() instanceof Map) {
            filters.putAll((Map) pageRequest.getFilters());
        } else {
            Map parameterObject = BeanUtils.describe(pageRequest.getFilters());
            filters.putAll(parameterObject);
        }
        
        List list = getSqlSession().selectList(statementName, filters, new RowBounds(page.getFirstResult(), page.getPageSize()));
        page.setResult(list);
        
        return page;
    }
    
	/**
     * 该方法不支持
     */
    @Deprecated
    public boolean isUnique(E entity, String uniquePropertyNames) {
        throw new UnsupportedOperationException();
    }
    
    /**
     * 该方法不支持
     */
    @Deprecated
    public void flush() {
    }
    
    /** **************************************************** */
    public List<E> findAll(E e) {
        return getSqlSession().selectList(getFindAllQuery(), e);
    }
    
    public List findAll() {
        return getSqlSession().selectList(getFindAllQuery());
    }
    
    /**
     * 该方法不支持
     */
    @Deprecated
    public List findAll(String sql, HashMap paraMap) {
        throw new UnsupportedOperationException();
    }
    
    /**
     * 该方法不支持
     */
    @Deprecated
    public List<E> findAll(String sql) {
        throw new UnsupportedOperationException();
    }
    
    public List<E> findAllBy(String propertyName, Object value) {
        Class c = getEntityClass();
        Object o = CommonUtil.methodInvoke(c, "set", propertyName, value);
        return getSqlSession().selectList(getFindAllQuery(), o);
    }
    
    public List<E> findAllBy(Map paraMap) {
        Class c = getEntityClass();
        Object o = null;
		try {
			o = c.newInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        Iterator it = paraMap.keySet().iterator();
        while (it.hasNext()) {
        	String key = (String) it.next();
        	try {
	            Field field = c.getDeclaredField(key);
	            Class parameterType = field.getType();
	            String methodName = "set" + key.substring(0, 1).toUpperCase() + key.substring(1);
	            Method m = c.getMethod(methodName, parameterType);
	            if (m != null)
	            	m.invoke(o, paraMap.get(key));
        	} catch (Exception e) {
                logger.error("Not find param "+key+ " mapping setter.");
            }
        }
        
        return getSqlSession().selectList(getFindAllQuery(), o);
    }
    
    public List<E> findAllByMap(Map paraMap) {
        return getSqlSession().selectList(getFindAllByMapQuery(), paraMap);
    }
    
    public E findByProperty(String propertyName, Object value) {
        Class c = getEntityClass();
        Object o = CommonUtil.methodInvoke(c, "set", propertyName, value);
        return (E) getSqlSession().selectOne(getFindAllQuery(), o);
    }
    
    /**
     * 该方法不支持
     */
    @Deprecated
    public E loadById(PK id) {
        throw new UnsupportedOperationException();
    }
    
    /**
     * 该方法需要子类重载，不能直接使用
     */
    public void saveOrUpdate(E entity) {
    }
}

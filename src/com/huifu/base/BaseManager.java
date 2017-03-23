package com.huifu.base;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;

import cn.org.rapid_framework.page.Page;
import cn.org.rapid_framework.page.PageRequest;

import com.huifu.base.LogFactory;

@SuppressWarnings({"unchecked", "rawtypes"})
public abstract class BaseManager<E, PK extends Serializable> {
    protected final Logger logger = LogFactory.LOGGER_SERVICE;
    
	protected abstract EntityDao getEntityDao();
    
    public E getById(PK id) {
        return (E) this.getEntityDao().getById(id);
    }
    
    /**
     * 该方法不支持
     */
    @Deprecated
    public E loadById(PK id) {
        return (E) this.getEntityDao().loadById(id);
    }
    
    public List<E> findAll() {
        return this.getEntityDao().findAll();
    }
    
    public PK findMaxRecord(){
    	return (PK) this.getEntityDao().findMaxRecordId();
    }
    
    /**
     * 该方法需要子类重载，不能直接使用
     */
    public void saveOrUpdate(E entity) {
        this.getEntityDao().saveOrUpdate(entity);
    }
    
    public void save(E entity) {
        this.getEntityDao().save(entity);
    }
    
    public void removeById(PK id) {
        this.getEntityDao().deleteById(id);
    }
    
    public void removeById(PK[] ids) {
        for (PK id : ids) {
            this.removeById(id);
        }
    }
    
    public void update(E entity) {
        this.getEntityDao().update(entity);
    }
    
    /**
     * 该方法不支持
     */
    @Deprecated
    public boolean isUnique(E entity, String uniquePropertyNames) {
        return this.getEntityDao().isUnique(entity, uniquePropertyNames);
    }
    
    public List<E> findAllBy(final String propertyName, final Object value) {
        return this.getEntityDao().findAllBy(propertyName, value);
    }
    
    public List<E> findAllBy(final Map paraMap) {
        return this.getEntityDao().findAllBy(paraMap);
    }
    
    public List<E> findAll(E e) {
        return this.getEntityDao().findAll(e);
    }
    
    public List<E> findAllByMap(final Map paraMap) {
        return this.getEntityDao().findAllByMap(paraMap);
    }
    
    /**
     * 该方法不支持
     */
    @Deprecated
    public List<E> findAll(String sql, HashMap paraMap) {
        return this.getEntityDao().findAll(sql, paraMap);
    }
    
    /**
     * 该方法不支持
     */
    @Deprecated
    public List<E> findAll(String sql) {
        return this.getEntityDao().findAll(sql);
    }
    
    public E findByProperty(final String propertyName, final Object value) {
        return (E) this.getEntityDao().findByProperty(propertyName, value);
    }
    
    /**
     * 该方法不支持
     */
    @Deprecated
    public Page findByPageRequest(PageRequest request) {
        return null;
    }
}

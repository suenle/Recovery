package com.huifu.base;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SuppressWarnings({"rawtypes"})
public interface EntityDao<E, PK extends Serializable> {
    public E getById(PK id);
    
    public void deleteById(PK id);
    
    public void save(E entity);
    
    public void update(E entity);
    
    public PK findMaxRecordId();
    
    /**
     * 该方法不支持
     */
    @Deprecated
    public E loadById(PK id);
    
    /**
     * 该方法需要子类重载，不能直接使用
     */
    public void saveOrUpdate(E entity);
    
    /**
     * 该方法不支持
     */
    @Deprecated
    public boolean isUnique(E entity, String uniquePropertyNames);
    
    @Deprecated
    public void flush();
    
    public List<E> findAll(E e);
    
    public List<E> findAll();
    
    public List<E> findAllBy(final String propertyName, final Object value);
    
    public List<E> findAllBy(final Map paraMap);
    
    public List<E> findAllByMap(Map paraMap);
    
    /**
     * 该方法不支持
     */
    @Deprecated
    public List findAll(String sql, HashMap paraMap);
    
    /**
     * 该方法不支持
     */
    @Deprecated
    public List<E> findAll(String sql);
    
    public E findByProperty(final String propertyName, final Object value);
}

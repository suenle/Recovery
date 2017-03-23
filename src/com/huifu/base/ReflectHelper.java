/*
 * 版权所有 北京中科院软件中心有限公司 Copyright(c) 2012 All Rights Reserved. Project: limulus
 * Description:
 */

package com.huifu.base;

import java.lang.reflect.Field;

/**
 * User: Nick Date: 2010-5-14 Time: 19:29:43
 */
public class ReflectHelper {
    public static Object getFieldValue(Object object, String fieldName) throws NoSuchFieldException,
            IllegalAccessException {
        Field field = getDeclaredField(object, fieldName);
        if (!field.isAccessible()) {
            field.setAccessible(true);
        }
        
        Object result = null;
        try {
            result = field.get(object);
        } catch (IllegalAccessException e) {
            throw e;
        }
        return result;
    }
    
    /**
     * 直接设置对象属性值,无视private/protected修饰符,不经过setter函数.
     */
    public static void setFieldValue(Object object, String fieldName, Object value) throws NoSuchFieldException,
            IllegalAccessException {
        Field field = getDeclaredField(object, fieldName);
        if (!field.isAccessible()) {
            field.setAccessible(true);
        }
        try {
            field.set(object, value);
        } catch (IllegalAccessException e) {
            throw e;
        }
    }
    
    /**
     * 循环向上转型,获取对象的DeclaredField.
     */
    public static Field getDeclaredField(Object object, String fieldName) throws NoSuchFieldException {
        return getDeclaredField(object.getClass(), fieldName);
    }
    
    /**
     * 循环向上转型,获取类的DeclaredField.
     */
    @SuppressWarnings("unchecked")
    public static Field getNestDeclaredField(Class clazz, String fieldName) throws NoSuchFieldException {
        for (Class superClass = clazz; superClass != Object.class; superClass = superClass.getSuperclass()) {
            try {
                return superClass.getDeclaredField(fieldName);
            } catch (NoSuchFieldException e) {
                // Field不在当前类定义,继续向上转型
            }
        }
        throw new NoSuchFieldException("No such field: " + clazz.getName() + '.' + fieldName);
    }
    
    /**
     * 获取当前类的DeclaredField.
     */
    @SuppressWarnings("unchecked")
    public static Field getDeclaredField(Class clazz, String fieldName) throws NoSuchFieldException {
        return clazz.getDeclaredField(fieldName);
    }
}

/*
 * Copyright 2001-2008 Software Engineering Center Chinese Academy of Sciences.
 * All rights reserved. SEC PROPRIETARY/CONFIDENTIAL. Use is subject to license
 * terms.
 */
package com.huifu.base;

import org.springframework.core.NestedRuntimeException;

/**
 * 后台异常对象.
 * 
 * @author zhangxu
 */
public class SecRuntimeException extends NestedRuntimeException {
    
    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = -2611333967959433916L;
    
    /**
     * . messageKey
     */
    private String            messageKey;
    /**
     * args.
     */
    private Object[]          args;
    
    private String            forward;
    
    /**
     * .
     */
    public SecRuntimeException() {
        super("");
        
    }
    
    /**
     * .
     * 
     * @param s .
     */
    public SecRuntimeException(String s) {
        super(s);
        setMessageKey(s);
    }
    
    /**
     * .
     * 
     * @param s
     *            异常信息
     * @param obj ：
     *            异常参数
     */
    public SecRuntimeException(String s, Object[] obj) {
        super(s);
        setMessageKey(s);
        setArgs(obj);
    }
    
    /**
     * .
     * 
     * @param s .
     * @param throwable .
     */
    public SecRuntimeException(String s, Throwable throwable) {
        super(s, throwable);
        setMessageKey(s);
    }
    
    /**
     * .
     * 
     * @param s .
     * @param forward.
     */
    public SecRuntimeException(String s, String forward) {
        super(s);
        setMessageKey(s);
        setForward(forward);
    }
    
    /**
     * .
     * 
     * @param s
     *            异常信息
     * @param obj ：
     *            异常参数
     * @param forward
     *            跳转地址.
     */
    public SecRuntimeException(String s, Object[] obj, String forward) {
        super(s);
        setMessageKey(s);
        setArgs(obj);
        setForward(forward);
    }
    
    /**
     * .
     * 
     * @param s .
     * @param throwable .
     * @param forward
     *            跳转地址.
     */
    public SecRuntimeException(String s, Throwable throwable, String forward) {
        super(s, throwable);
        setMessageKey(s);
        setForward(forward);
    }
    
    /**
     * .
     * 
     * @return messageKey.
     */
    public String getMessageKey() {
        return messageKey;
    }
    
    /**
     * .
     * 
     * @param messageKey
     *            messageKey.
     */
    public void setMessageKey(String messageKey) {
        this.messageKey = messageKey;
    }
    
    /**
     * @return args.
     */
    public Object[] getArgs() {
        return args;
    }
    
    /**
     * @param args
     *            args.
     */
    public void setArgs(Object[] args) {
        this.args = args;
    }
    
    /**
     * @return the forward
     */
    public String getForward() {
        return forward;
    }
    
    /**
     * @param forward
     *            the forward to set
     */
    public void setForward(String forward) {
        this.forward = forward;
    }
    
}

/*
 * Copyright 2001-2008 Software Engineering Center Chinese Academy of Sciences.
 * All rights reserved. SEC PROPRIETARY/CONFIDENTIAL. Use is subject to license
 * terms.
 */
package com.huifu.base;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * <p>
 * 系统日志工厂类，代理给<code>org.slf4j.LoggerFactory</code>获取 系统日志.
 * </p>
 * 
 * @author sec.
 */
public final class LogFactory {
    
    /**
     * securityLogger:安全系统日志.
     */
    public static final Logger LOGGER_SECURITY  = LoggerFactory.getLogger("sec.security");
    /**
     * actionLogger:action层日志.
     */
    public static final Logger LOGGER_ACTION    = LoggerFactory.getLogger("sec.action");
    /**
     * serviceLogger:service层日志.
     */
    public static final Logger LOGGER_SERVICE   = LoggerFactory.getLogger("sec.service");
    /**
     * daoLogger:dao层日志.
     */
    public static final Logger LOGGER_DAO       = LoggerFactory.getLogger("sec.dao");
    /**
     * modelLogger:model层日志.
     */
    public static final Logger LOGGER_MODEL     = LoggerFactory.getLogger("sec.model");
    /**
     * frameworkLogger:框架日志.
     */
    public static final Logger LOGGER_FRAMEWORK = LoggerFactory.getLogger("sec.framework");
    /**
     * exceptionLogger:异常日志.
     */
    public static final Logger LOGGER_EXCEPTION = LoggerFactory.getLogger("sec.exception");
}

/*
 * Copyright 2001-2012 Software Engineering Center Chinese Academy of Sciences.
 * All rights reserved. SEC PROPRIETARY/CONFIDENTIAL. Use is subject to license
 * terms.
 */
package com.huifu.base;

import org.aspectj.lang.JoinPoint;
import org.slf4j.Logger;

import com.huifu.base.LogFactory;


/**
 * @author zx.
 * @since 1.0
 * @version 1.0
 */
public class ManagerLoggerAspect {
    private static final Logger logger  = LogFactory.LOGGER_FRAMEWORK;
    private static final Logger loggerE = LogFactory.LOGGER_EXCEPTION;
    
    public void before(JoinPoint joinPoint) {
        String methodName = joinPoint.getSignature().getName();
        Object target = joinPoint.getTarget();
        logger.debug("Manager entrance : Target [" + target.getClass().getName() + "], method [" + methodName + "()].");
    }
    
    public void after(JoinPoint joinPoint) {
        String methodName = joinPoint.getSignature().getName();
        Object target = joinPoint.getTarget();
        logger.debug("Manager exit : Target [" + target.getClass().getName() + "], method [" + methodName + "()].");
    }
    
    public void afterThrowing(Exception exception) {
        loggerE.error("Manager exception : Target [" + exception.getClass().getName() + "], message ["
                      + exception.getMessage() + "].", exception);
    }
    
}

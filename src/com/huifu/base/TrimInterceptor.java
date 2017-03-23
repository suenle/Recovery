/*
 * Copyright 2001-2012 Software Engineering Center Chinese Academy of Sciences.
 * All rights reserved. SEC PROPRIETARY/CONFIDENTIAL. Use is subject to license
 * terms.
 */
package com.huifu.base;

import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.huifu.mybatis.handler.Utils;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.opensymphony.xwork2.util.TextParseUtil;

/**
 * @author 金鲁峰
 */
public class TrimInterceptor extends MethodFilterInterceptor {
    
    Set<Pattern>    acceptParams       = Collections.EMPTY_SET;
    Set<Pattern>    excludeParams      = Collections.EMPTY_SET;
    
    // Allowed names of parameters
    private String  acceptedParamNames = "[a-zA-Z0-9\\.\\]\\[_'\\s]+";
    private Pattern acceptedPattern    = Pattern.compile(this.acceptedParamNames);
    
    /**
     * {@inheritDoc}
     * 
     * @see com.opensymphony.xwork2.interceptor.MethodFilterInterceptor#doIntercept(com.opensymphony.xwork2.ActionInvocation)
     */
    @Override
    protected String doIntercept(ActionInvocation invocation) throws Exception {
        Map<String, Object> parameters = invocation.getInvocationContext().getParameters();
        
        for (String param : parameters.keySet()) {
            if (this.acceptableName(param)) {
                String[] vals = (String[]) parameters.get(param);
                boolean allNull = true;
                for (int i = 0; i < vals.length; i++) {
                    vals[i] = Utils.trim(vals[i]);
                    allNull = allNull && (vals[i] == null);
                }
                if (allNull) {
                    parameters.put(param, null);
                }
                
            }
        }
        
        return invocation.invoke();
    }
    
    protected boolean acceptableName(String name) {
        if (this.isAccepted(name) && !this.isExcluded(name)) {
            return true;
        }
        return false;
    }
    
    protected boolean isAccepted(String paramName) {
        if (!this.acceptParams.isEmpty()) {
            for (Pattern pattern : this.acceptParams) {
                Matcher matcher = pattern.matcher(paramName);
                if (matcher.matches()) {
                    return true;
                }
            }
            return false;
        } else {
            return this.acceptedPattern.matcher(paramName).matches();
        }
    }
    
    protected boolean isExcluded(String paramName) {
        if (!this.excludeParams.isEmpty()) {
            for (Pattern pattern : this.excludeParams) {
                Matcher matcher = pattern.matcher(paramName);
                if (matcher.matches()) {
                    return true;
                }
            }
        }
        return false;
    }
    
    /**
     * Sets a comma-delimited list of regular expressions to match parameters
     * that should be removed from the parameter map.
     * 
     * @param commaDelim
     *            A comma-delimited list of regular expressions
     */
    public void setExcludeParams(String commaDelim) {
        Collection<String> excludePatterns = this.asCollection(commaDelim);
        if (excludePatterns != null) {
            this.excludeParams = new HashSet<Pattern>();
            for (String pattern : excludePatterns) {
                this.excludeParams.add(Pattern.compile(pattern));
            }
        }
    }
    
    public void setAcceptParamNames(String commaDelim) {
        Collection<String> acceptPatterns = this.asCollection(commaDelim);
        if (acceptPatterns != null) {
            this.acceptParams = new HashSet<Pattern>();
            for (String pattern : acceptPatterns) {
                this.acceptParams.add(Pattern.compile(pattern));
            }
        }
    }
    
    /**
     * Return a collection from the comma delimited String.
     * 
     * @param commaDelim
     * @return A collection from the comma delimited String.
     */
    private Collection asCollection(String commaDelim) {
        if ((commaDelim == null) || (commaDelim.trim().length() == 0)) {
            return null;
        }
        return TextParseUtil.commaDelimitedStringToSet(commaDelim);
    }
    
}

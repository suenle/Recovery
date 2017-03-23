/*
 * Copyright 2001-2008 Software Engineering Center Chinese Academy of Sciences.
 * All rights reserved. SEC PROPRIETARY/CONFIDENTIAL. Use is subject to license
 * terms.
 */
package com.huifu.base;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.StrutsConstants;
import org.apache.struts2.StrutsStatics;
import org.codehaus.jackson.map.ObjectMapper;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.Result;
import com.opensymphony.xwork2.inject.Inject;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

/**
 * @author jinlf
 */
public class GsonResult implements Result {
    
    private static final long   serialVersionUID   = 8624350183189931165L;
    
    private static final Logger LOG                = LoggerFactory.getLogger(GsonResult.class);
    
    public static final String  GSON_RESULT_OBJECT = "GSON_RESULT_OBJECT";
    
    private String              encoding;
    private String              defaultEncoding    = "ISO-8859-1";
    
    private String              dateFormat;
    private final String        defaultDateFormat  = "yyyy-MM-dd";
    
    private boolean             envlope;
    
    /**
     * @return the envlope
     */
    public boolean isEnvlope() {
        return envlope;
    }
    
    /**
     * @param envlope
     *            the envlope to set
     */
    public void setEnvlope(boolean envlope) {
        this.envlope = envlope;
    }
    
    @Inject(StrutsConstants.STRUTS_I18N_ENCODING)
    public void setDefaultEncoding(String val) {
        this.defaultEncoding = val;
    }
    
    public void execute(ActionInvocation invocation) throws Exception {
        ActionContext actionContext = invocation.getInvocationContext();
        HttpServletRequest request = (HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
        HttpServletResponse response = (HttpServletResponse) actionContext.get(StrutsStatics.HTTP_RESPONSE);
        
        try {
            Object result;
            Object dataObject;
            dataObject = readDataObject(invocation);
            
            if (isEnvlope()) {
                Map mapResult = new HashMap();
                mapResult.put("error", 0);
                mapResult.put("msg", dataObject);
                
                result = mapResult;
            } else {
                result = dataObject;
            }

            StringWriter writer = new StringWriter();
            ObjectMapper mapper = new ObjectMapper();
            mapper.writeValue(writer, result);
            String jsonString = writer.toString();

            response.setContentType("application/json");
            response.setHeader("Cache-Control", "no-store");
            PrintWriter out = response.getWriter();
            
            out.println(jsonString);
            out.flush();
            out.close();
            
        } catch (IOException exception) {
            LOG.error(exception.getMessage(), exception);
            throw exception;
        }
    }
    
    protected Object readDataObject(ActionInvocation invocation) {
        ActionContext actionContext = invocation.getInvocationContext();
        HttpServletRequest request = (HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
        Object dataObject = request.getAttribute(GSON_RESULT_OBJECT);
        
        return dataObject;
    }
    
    /**
     * Retrieve the encoding <p/>
     * 
     * @return The encoding associated with this template (defaults to the value
     *         of param 'encoding', if empty default to 'struts.i18n.encoding'
     *         property)
     */
    protected String getEncoding() {
        String encoding = this.encoding;
        
        if (encoding == null) {
            encoding = this.defaultEncoding;
        }
        
        if (encoding == null) {
            encoding = System.getProperty("file.encoding");
        }
        
        if (encoding == null) {
            encoding = "UTF-8";
        }
        
        return encoding;
    }
    
    /**
     * If defined will be used instead of {@link #defaultEncoding}, you can
     * define it with result &lt;result name=&quot;success&quot;
     * type=&quot;json&quot;&gt; &lt;param
     * name=&quot;encoding&quot;&gt;UTF-8&lt;/param&gt; &lt;/result&gt;
     * 
     * @param encoding
     *            valid encoding string
     */
    public void setEncoding(String encoding) {
        this.encoding = encoding;
    }
    
    /**
     * @return the dateFormat
     */
    public String getDateFormat() {
        String dateFormat = this.dateFormat;
        
        if (dateFormat == null) {
            dateFormat = this.defaultDateFormat;
        }
        
        if (dateFormat == null) {
            dateFormat = "yyyy-MM-dd";
        }
        
        return dateFormat;
    }
    
    /**
     * @param dateFormat
     *            the dateFormat to set
     */
    public void setDateFormat(String dateFormat) {
        this.dateFormat = dateFormat;
    }
    
}

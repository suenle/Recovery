package com.huifu.base;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;

import com.huifu.base.LogFactory;

/**
 * 防止用户以JSP方式直接访问
 */
public class SecurityRejectJsp implements Filter {
    Logger log = LogFactory.LOGGER_SECURITY;
    
    public static String[] allowUrlArr = {"/ueditor1_4_3-utf8-jsp/jsp/controller.jsp"};
    
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        String rul = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                     + request.getContextPath();
        
        String curl = request.getRequestURI();
        for (String allowUrl : allowUrlArr) {
        	if (curl.contains(allowUrl)) {
        		chain.doFilter(req, response);
        		return;
        	}
        }
        
        this.log.error("拦截JSP直接访问,请求地址: " + request.getRequestURI());
        
        response.sendRedirect(rul + "/mainPage.do");
        return;
    }
    
    public void init(FilterConfig arg0) throws ServletException {
        
    }
    
    public void destroy() {
        
    }
}

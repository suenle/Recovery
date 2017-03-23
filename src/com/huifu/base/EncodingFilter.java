package com.huifu.base;

import java.io.IOException; 
import javax.servlet.Filter; 
import javax.servlet.FilterChain; 
import javax.servlet.FilterConfig; 
import javax.servlet.ServletException; 
import javax.servlet.ServletRequest; 
import javax.servlet.ServletResponse; 

/**
 * 字符转码过滤器，防止页面出现乱码
 */

public class EncodingFilter implements Filter{
	private String encode; 

	public void destroy() { 
	} 

	public void doFilter(ServletRequest sreq, ServletResponse sres, 
	FilterChain chain) throws IOException, ServletException { 
	// 在此截获请求 
	sreq.setCharacterEncoding(encode); 
	System.out.println("进入doFilter");
	sres.setContentType("text/html;charset="+encode); 
	chain.doFilter(sreq, sres); 
	
	// 截获响应 
	} 

	public void init(FilterConfig arg0) throws ServletException { 
	encode = arg0.getInitParameter("encode"); 
	} 
}

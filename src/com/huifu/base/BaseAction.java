package com.huifu.base;

import java.io.IOException;
import java.io.PrintWriter;
// Download by http://www.codefans.net
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSONObject;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class BaseAction extends ActionSupport {

	public String jsonString;

	public void outJsonString(String str) {
		getResponse().setContentType("text/javascript;charset=UTF-8");
		System.out.println("ActionSupport outJsonString = " + str);
		outString(str);
	}
	/**
	 * 以流的方式输出前台(xf)
	 */
	public static void resultJson(JSONObject jsonObj) {
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println(jsonObj.toJSONString());
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void setUtfEncoding()
	{
		try
		{
			this.getRequest().setCharacterEncoding("UTF-8");
			this.getResponse().setContentType("text/html;charset=utf-8");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	/*
	 * public void outJson(Object obj) {
	 * outJsonString(JSONObject.fromObject(obj).toString()); }
	 * 
	 * public void outJsonArray(Object array) {
	 * outJsonArray(JSONArray.fromObject(array).toString()); }
	 */

	public void outString(String str) {
		try {
			PrintWriter out = getResponse().getWriter();
			out.write(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void outXMLString(String xmlStr) {
		getResponse().setContentType("application/xml;charset=UTF-8");
		System.out.println("ActionSupport outxmlString = " + xmlStr);
		outString(xmlStr);
	}

	/**
	 * ���request
	 * 
	 * @return
	 */
	public HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	}

	/**
	 * ���response
	 * 
	 * @return
	 */
	public HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	}

	/**
	 * ���session
	 * 
	 * @return
	 */
	public HttpSession getSession() {
		return getRequest().getSession();
	}

	/**
	 * ���servlet������
	 * 
	 * @return
	 */
	public ServletContext getServletContext() {
		return ServletActionContext.getServletContext();
	}

	public String getRealyPath(String path) {
		return getServletContext().getRealPath(path);
	}
}

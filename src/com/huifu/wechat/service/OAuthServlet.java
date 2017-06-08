package com.huifu.wechat.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.huifu.wechat.pojo.SNSUserInfo;
import com.huifu.wechat.pojo.WeixinOauth2Token;
import com.huifu.wechat.util.AdvancedUtil;

public class OAuthServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public OAuthServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		 request.setCharacterEncoding("utf-8");
	        response.setCharacterEncoding("utf-8");

	        // 用户同意授权后，能获取到code
	        String code = request.getParameter("code");
	        String state = request.getParameter("state");
	        
	        // 用户同意授权
	        if (!"authdeny".equals(code)) {
	            // 获取网页授权access_token
	            WeixinOauth2Token weixinOauth2Token = AdvancedUtil.getOauth2AccessToken("wxd3b4d1cab699520c", "d4624c36b6795d1d99dcf0547af5443d", code);
	            // 网页授权接口访问凭证
	            String accessToken = weixinOauth2Token.getAccessToken();
	            // 用户标识
	            String openId = weixinOauth2Token.getOpenId();
	            // 获取用户信息
	            SNSUserInfo snsUserInfo = AdvancedUtil.getSNSUserInfo(accessToken, openId);

	            // 设置要传递的参数
	            request.setAttribute("snsUserInfo", snsUserInfo);
	            request.setAttribute("state", state);
	        }
	        // 跳转到index.jsp
	        request.getRequestDispatcher("/MyJsp.jsp").forward(request, response);
	    }

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}

package com.huifu.base;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.huifu.constant.Constant;
import com.huifu.entity.User;
import com.huifu.service.impl.UserService;
import cn.org.rapid_framework.util.holder.ApplicationContextHolder;

public class loginFilter implements Filter {

	private static UserService userService = (UserService) ApplicationContextHolder
			.getBean("userService");

	public static UserService getUserService() {
		return userService;
	}

	public static void setUserService(UserService userService) {
		loginFilter.userService = userService;
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest servletRequest,
			ServletResponse servletResponse, FilterChain chain)
			throws IOException, ServletException {

		//System.out.println("进入过滤器");

		/**
		 * 从session中获取existUser 如果不为空，说明已经登录并且没有关闭浏览器，放行
		 * 如果为空说明没有登录，获取指定名称的cookie *如果找不到该cookie说明用户没有开启自动登录功能 ，放行
		 * *如果不为空，从cookie中拿到用户名和密码从数据库中查询 *如果查不到 ，则用户名或密码改变了，不处理 放行
		 * *如果查到了放到session中，放行
		 * 
		 */

		// 从session中获取用户existUser
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		HttpSession session = request.getSession();

		// 获取根目录所对应的绝对路径
		String currentURL = request.getRequestURI();
		// 截取到当前文件名用于比较
		String targetURL = currentURL.substring(currentURL.indexOf("/", 1),
				currentURL.length());
		Object Userid = session.getAttribute("userId");

		if (Userid != null) {
			chain.doFilter(request, response);
		} else {
			// 为空，说明没有登录
			// 获取指定cookie
			// 获取保存cookie的数组
			//Cookie[] cookies = request.getCookies();

			//Cookie cookie = MyCookieUtile.findCookieByName(cookies, "userId");
			
			if (!"/index.jsp".equals(targetURL)&&!"/OAlogin.do".equals(targetURL)) {
				// 如果session为空表示用户没有登陆就重定向到login.jsp页面
				response.sendRedirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxd3b4d1cab699520c&redirect_uri="+Constant.WECHAT_DOLOGIN+"&response_type=code&scope=snsapi_userinfo&state=STATE&connect_redirect=1#wechat_redirect");
				chain.doFilter(request, response);
				return;
			} else {
				chain.doFilter(request, response);
			}
			
			// 判断cookie是否为空
			
			
			
		/*	if (cookie == null) {
				if (!"/login.jsp".equals(targetURL)
						&& !"/login.do".equals(targetURL)&&!"/pages/register.jsp".equals(targetURL) &&!"/User/register.do".equals(targetURL)
						) {
					// 如果session为空表示用户没有登陆就重定向到login.jsp页面
					response.sendRedirect(request.getContextPath()
							+ "/login.jsp");
					return;
				} else {
					chain.doFilter(request, response);
				}

			} else {
				// 获取cookie的value值
				Integer value = Integer.valueOf(cookie.getValue());

				// 拿到cookie中的用户名和密码去数据库中查
				User user = getUserService().selectByPrimaryKey(value);
				if (user == null) {
					if (!"/login.jsp".equals(targetURL)
							&& !"/login.do".equals(targetURL)&&!"/pages/register.jsp".equals(targetURL) &&!"/User/register.do".equals(targetURL)
							) {
						// 如果session为空表示用户没有登陆就重定向到login.jsp页面
						response.sendRedirect(request.getContextPath()
								+ "/login.jsp");
						return;
					} else {
						chain.doFilter(request, response);
					}

				} else {
					// 说明成功，自动登录
					session.setAttribute("userId", user.getId());
					// 放行
					chain.doFilter(request, response);

				}

			}*/

		}

	}
	public void init(FilterConfig filterConfig) throws ServletException {

	}

}

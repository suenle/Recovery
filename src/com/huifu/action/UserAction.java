package com.huifu.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.huifu.base.BaseAction;
import com.huifu.base.BaseUtils;
import com.huifu.constant.Constant;
import com.huifu.entity.User;
import com.huifu.entity.UserInfo;
import com.huifu.service.impl.UserInfoService;
import com.huifu.service.impl.UserService;

import java.io.PrintWriter;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

/**
 * 用户操作相关Action
 */
@Controller
public class UserAction extends BaseAction {
	private UserService userService;
	private UserInfoService userInfoService;
	static Logger logger = LogManager.getLogger(UserAction.class.getName());

	/**
	 * 用户登录
	 */
	public String login() {
		setUtfEncoding();
		String account = getRequest().getParameter("account");
		String password = getRequest().getParameter("password");
		String errorMsg = "";
		Map<String, Object> result = new HashMap<String, Object>();
		if (null == account || "".equals(account)
				|| account.trim().length() == 0 || null == password
				|| "".equals(password) || password.trim().length() == 0) {
			errorMsg = "账户或密码为空";
			result.put("error", errorMsg);
			this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
			return INPUT;
		}

		User checkuser = new User();
		checkuser.setAccount(account);
		// user.setPassword(password);
		// 验证用户工号密码是否匹配
		User user = getUserService().checkLogin(checkuser);
		int iRet = verifyUser(user, password);
		if (0 != iRet) {
			errorMsg = getLoginErrorMsg(iRet);
			result.put("errorMsg", errorMsg);
			this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
			return INPUT;
		}

		// this.getRequest().setAttribute("errorMsg", errorMsg);
		// this.getRequest().setAttribute("menuArray", jMenuArr);

		result.put("errorMsg", errorMsg);
		// result.put("userInfo", user);
		this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
		this.getRequest().setAttribute("userId", user.getId());
		this.getSession().setAttribute("user", user);
		this.getRequest().getSession().setAttribute("userId", user.getId());
		// 如果为0则为无个人信息进入信息配置界面
		if (user.getStatus() == 0) {
			return "addinfo";
		} else {
			return SUCCESS;
		}
	}

	/**
	 * 用户注册
	 */
	public String register() {
		setUtfEncoding();
		String account = getRequest().getParameter("account");
		String password = getRequest().getParameter("password");
		String errorMsg = "";
		Map<String, Object> result = new HashMap<String, Object>();
		if (null == account || "".equals(account)
				|| account.trim().length() == 0 || null == password
				|| "".equals(password) || password.trim().length() == 0) {
			errorMsg = "账户或密码为空";
			result.put("error", errorMsg);
			this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
			return INPUT;
		}
		User user = new User();
		user.setAccount(account);
		user.setPassword(password);
		user.setStatus(0);
		int iNum = getUserService().insertSelective(user);

		this.getRequest().getSession().setAttribute("userId", user.getId());

		return SUCCESS;

	}

	public String toaddinfo() {

		return "/addInfo.jsp";
	}



	/**
	 * 验证登录用户 return: int (0:用户工号、密码正确； 1：无此用户； 2：密码不正确； 3：用户无效; )
	 */
	public int verifyUser(User user, String password) {
		if (null == user) {
			return Constant.USER_LOGIN_NOUSER;
		}

		if (password.equals(user.getPassword())) {
			return Constant.USER_LOGIN_OK;
		} else {
			return Constant.USER_LOGIN_PASSWORD_ERROR;
		}
	}

	/**
	 * 根据登录结果值获取错误原因
	 */
	public String getLoginErrorMsg(int iRet) {
		String errorMsg = "";
		switch (iRet) {
		case 0:
			errorMsg = "用户工号密码正确";
			break;
		case 1:
			errorMsg = "无此用户";
			break;
		case 2:
			errorMsg = "密码不正确";
			break;
		case 3:
			errorMsg = "用户工号处于禁用状态";
			break;
		default:
			errorMsg = "用户工号密码不正确";
		}

		return errorMsg;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public UserInfoService getUserInfoService() {
		return userInfoService;
	}

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}

}

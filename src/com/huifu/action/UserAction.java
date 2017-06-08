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
import com.huifu.wechat.pojo.SNSUserInfo;
import com.huifu.wechat.pojo.WeixinOauth2Token;
import com.huifu.wechat.util.AdvancedUtil;

import java.io.PrintWriter;
import java.util.regex.Pattern;

import javax.servlet.http.Cookie;
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
	 * 微信登录实现方法
	 * 
	 * @return
	 */
	public String weChatLogin() {
		// 用户同意授权后，能获取到code
		String code = getRequest().getParameter("code");
		String state = getRequest().getParameter("state");

		// 用户同意授权
		if (!"authdeny".equals(code)) {
			// 获取网页授权access_token
			WeixinOauth2Token weixinOauth2Token = AdvancedUtil
					.getOauth2AccessToken(Constant.WECHAT_APPID,
							Constant.WECHAT_SECRET, code);
			// 网页授权接口访问凭证
			String accessToken = weixinOauth2Token.getAccessToken();
			// 用户标识
			String openId = weixinOauth2Token.getOpenId();
			// 获取用户信息
			SNSUserInfo snsUserInfo = AdvancedUtil.getSNSUserInfo(accessToken,
					openId);

			// 查询openId是否注册
			User user = new User();
			user.setOpenid(openId);

			User getUser = getUserService().checkLogin(user);
			if (getUser == null) {
				user.setStatus(0);
				user.setUsergroupid("0");
				int iNum = getUserService().insertSelective(user);
				if (iNum > 0) {
					this.getRequest().setAttribute("userId", user.getId());
					this.getSession().setAttribute("user", user);
					this.getRequest().getSession()
							.setAttribute("userId", user.getId());

					Cookie userIdcookie = new Cookie("userId", user.getId()
							.toString());
					userIdcookie.setMaxAge(365 * 24 * 3600);
					userIdcookie.setPath("/");
					this.getResponse().addCookie(userIdcookie);
					return "addinfo.do";
				} else {
					return "/pages/faileLogin.jsp";
				}
			} else {
				this.getRequest().setAttribute("userId", getUser.getId());
				this.getSession().setAttribute("user", getUser);
				this.getRequest().getSession()
						.setAttribute("userId", getUser.getId());

				Cookie userIdcookie = new Cookie("userId", getUser.getId()
						.toString());
				userIdcookie.setMaxAge(365 * 24 * 3600);
				userIdcookie.setPath("/");
				this.getResponse().addCookie(userIdcookie);
				int status = getUser.getStatus();
				if (status == 0) {
					return "/pages/addInfo.jsp";
				} else {
					return "/pages/recoveryLifeInfo.jsp";
				}
			
			}
		} else {
			return "/pages/faileLogin.jsp";
		}
	}

	/**
	 * 用户登录
	 */

	public String OAlogin() {
		setUtfEncoding();
		String userCode = getRequest().getParameter("userCode");
		String password = getRequest().getParameter("password");
		String errorMsg = "";
		Map<String, Object> result = new HashMap<String, Object>();
		// 超级管理员登陆入口
		if (userCode.trim().equals(Constant.USER_SUPER_USERCODE)
				&& Constant.USER_SUPER_PASSWORD.equals(password.trim())) {
			this.getRequest().setAttribute("userCode", userCode);
			this.getRequest().setAttribute("userName",
					Constant.USER_SUPER_USERNAME);
			this.getRequest()
					.setAttribute("userId", Constant.USER_SUPER_USERID);
			User user = new User();
			user.setAccount(userCode);
			user.setPassword(password);
			user.setId(Constant.USER_SUPER_USERID);
			user.setUsergroupid(Constant.USER_SUPER_USERGROUPID.toString());
			this.getSession().setAttribute("user", user);
			this.getRequest().getSession().setAttribute("userId", "-1");
			return SUCCESS;
		} else {
			ServletContext sc = getServletContext();
			if (null == userCode || "".equals(userCode)
					|| userCode.trim().length() == 0 || null == password
					|| "".equals(password) || password.trim().length() == 0) {
				errorMsg = "用户工号或密码为空";
				result.put("error", errorMsg);
				this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
				return INPUT;
			}

		}
		return INPUT;
	}

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

		Cookie userIdcookie = new Cookie("userId", user.getId().toString());
		userIdcookie.setMaxAge(365 * 24 * 3600);
		userIdcookie.setPath("/");
		this.getResponse().addCookie(userIdcookie);

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
			return "/pages/register.jsp";
		}
		Integer accountNum = account.length();
		Integer passwordNum = password.length();
		if (accountNum < 6 || passwordNum < 6) {
			errorMsg = "账户和密码不能小于6位";
			result.put("error", errorMsg);
			this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
			return "/pages/register.jsp";
		}

		User checkuser = new User();
		checkuser.setAccount(account);
		// user.setPassword(password);
		// 验证用户工号密码是否匹配
		User newcheckuser = getUserService().checkLogin(checkuser);
		if (newcheckuser != null) {
			errorMsg = "该账户已被占用";
			result.put("error", errorMsg);
			this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
			return "/pages/register.jsp";
		}
		User user = new User();
		user.setAccount(account);
		user.setPassword(password);
		user.setStatus(0);
		user.setUsergroupid("0");
		int iNum = getUserService().insertSelective(user);
		if (iNum < 0) {
			errorMsg = "注册失败";
			result.put("error", errorMsg);
			this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
			return "/pages/register.jsp";
		}
		Cookie userIdcookie = new Cookie("userId", user.getId().toString());
		userIdcookie.setMaxAge(365 * 24 * 3600);
		userIdcookie.setPath("/");
		this.getResponse().addCookie(userIdcookie);
		this.getRequest().getSession().setAttribute("userId", user.getId());
		return "redirect:User/addinfo.do";
	}

	public String addinfo() {
		return "/pages/addInfo.jsp";
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

	// 菜单控制
	public String getMeun() {
		setUtfEncoding();

		String errorMsg = "";

		// 获取session中的id
		Integer userid = (Integer) getSession().getAttribute("userId");

		User user = getUserService().selectByPrimaryKey(userid);

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("userid", userid);
		UserInfo userInfo = getUserInfoService().getInfoByUserId(data);

		Map<String, Object> result = new HashMap<String, Object>();

		result.put("errorMsg", errorMsg);

		result.put("userGroup", user.getUsergroupid());

		result.put("userName", userInfo.getUsername());

		result.put("sex", returnSex(userInfo.getSex()));

		this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);

		return "ajax";
	}

	public String returnSex(Integer sex) {

		if (sex == 0) {
			return "弟兄";
		} else {
			return "姊妹";
		}

	}

	/**
	 * 注销登录
	 */
	public String outlogin() {
		this.getSession().removeAttribute("userId");
		Cookie userId = new Cookie("userId", null);
		userId.setMaxAge(0);
		userId.setPath("/");
		this.getResponse().addCookie(userId);
		return "redirect:/login.jsp";
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

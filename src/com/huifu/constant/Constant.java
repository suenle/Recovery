package com.huifu.constant;

import java.util.HashMap;
import java.util.Map;

/**
 * 系统宏定义
 */
public abstract class Constant {
	/**
	 * 以下宏数据，以加载配置文件中配置为准。 系统启动时将加载配置文件，以下宏将被覆盖
	 */
	public static String SYSTEM_CODE = "00001"; // 系统编号

	/**
	 * 以下宏数据不会被覆盖
	 */
	public static final String XPATH_ROOT = "yundao"; // xml文件根节点

	public static final Integer SYS_AVALIBLE = 0; // 有效/启用等状态
	public static final Integer SYS_INVALIBLE = 1; // 无效/禁用等状态

	// 用户登录状态
	public static final Integer USER_LOGIN_OK = 0; // 用户名密码正确
	public static final Integer USER_LOGIN_NOUSER = 1; // 无此用户
	public static final Integer USER_LOGIN_PASSWORD_ERROR = 2; // 密码错误
	public static final Integer USER_LOGIN_USER_INVALIBLE = 3; // 用户无效

	// 用户默认密码
	public static final String USER_DEFAULT_PASSWORD = "88888888";

	// 用户登录、退录操作
	public static final Integer USER_OPERATOR_LOGIN = 0; // 用户登录操作
	public static final Integer USER_OPERATOR_LOGOUT = 1; // 用户手工退录操作
	public static final Integer USER_OPERATOR_LOGOUTFORCE = 2; // 用户自动退录操作
	public static final String[] USER_OPERATOR_ACTION_DESC = { "用户登录", "手动退录","自动退录" }; // 用户操作事描述
	

	// 页面跳转
	public static final String DIRECT_URL_MAINPAGE = "/mainpage.jsp"; // 主界面
	public static final String DIRECT_URL_INDEXPAGE = "redirect:/index.jsp"; // 登录界面
	public static final String DIRECT_URL_INSTOREPAGE = "/pages/inStore.jsp";	      				// 入库界面(xf)
	public static final String DIRECT_URL_INSTORDETAILSEPAGE = "/pages/inStoreDetails.jsp";	    // 入库详情界面(xf)
	public static final String DIRECT_URL_QUALITYCHECKPAGE = "/pages/qualityCheck.jsp";	     	// 质检界面	(xf)
	public static final String DIRECT_URL_ONTRANSPORT = "/pages/onTransport.jsp";	      			// 上架运输界面	(xf)
	public static final String DIRECT_URL_DEVICEDETAILSEPAGE = "/pages/onTransportDetails.jsp";	// 上架运输 设备详情界面(xf)
	
	public static final String DIRECT_URL_life = "/pages/recoveryLifeInfo.jsp";	

	
	
}

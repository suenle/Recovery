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
	
	public static final String USER_SUPER_USERCODE = "nanjingzhaohui"; // 用户编号
	public static final String USER_SUPER_PASSWORD = "weareone"; // 用户密码
	public static final String USER_SUPER_USERNAME = "超级管理员"; // 用户名称
	public static final Integer USER_SUPER_USERID = -1; // 用户id
	public static final Integer USER_SUPER_USERGROUPID = -1; // 超级用户组id标识

	// 用户登录、退录操作
	public static final Integer USER_OPERATOR_LOGIN = 0; // 用户登录操作
	public static final Integer USER_OPERATOR_LOGOUT = 1; // 用户手工退录操作
	public static final Integer USER_OPERATOR_LOGOUTFORCE = 2; // 用户自动退录操作
	public static final String[] USER_OPERATOR_ACTION_DESC = { "用户登录", "手动退录",
			"自动退录" }; // 用户操作事描述

	// 页面跳转
	public static final String DIRECT_URL_MAINPAGE = "/mainpage.jsp"; // 主界面
	public static final String DIRECT_URL_INDEXPAGE = "redirect:/index.jsp"; // 登录界面
	public static final String DIRECT_URL_INSTOREPAGE = "/pages/inStore.jsp"; // 入库界面(xf)
	public static final String DIRECT_URL_INSTORDETAILSEPAGE = "/pages/inStoreDetails.jsp"; // 入库详情界面(xf)
	public static final String DIRECT_URL_QUALITYCHECKPAGE = "/pages/qualityCheck.jsp"; // 质检界面
																						// (xf)
	public static final String DIRECT_URL_ONTRANSPORT = "/pages/onTransport.jsp"; // 上架运输界面
																					// (xf)
	public static final String DIRECT_URL_DEVICEDETAILSEPAGE = "/pages/onTransportDetails.jsp"; // 上架运输
																								// 设备详情界面(xf)

	public static final String DIRECT_URL_life = "/pages/recoveryLifeInfo.jsp";

	public static final String DO_IT = "1"; // 一为做了

	public static final String[] BOOK_OF_THE_OLD_TESTAMENT = { "创世记", "出埃及记",
			"利未记", "民数记", "申命记", "约书亚记", "士师记", "路得记", "撒母耳记上", "撒母耳记下",
			"列王纪上", "列王纪下", "历代志上", "历代志下", "以斯拉记", "尼希米记", "以斯帖记", "约伯记",
			"诗篇", "箴言", "传道书", "雅歌", "以赛亚书", "耶利米书", "耶利米哀歌", "以西结书", "但以理书",
			"何西阿书", "约珥书", "阿摩司书", "俄巴底亚书", "约拿书", "弥迦书", "那鸿书", "哈巴谷书",
			"西番雅书", "哈该书", "撒迦利亚书", "玛拉基书" };
	public static final Integer[] BOOK_OF_THE_OLD_TESTAMENT_NUM = { 50, 40, 27,
			36, 34, 24, 21, 4, 31, 24, 22, 25, 29, 36, 10, 13, 10, 42, 150, 31,
			12, 8, 66, 52, 5, 48, 12, 14, 3, 9, 1, 4, 7, 3, 3, 3, 2, 14, 4 };

	public static final String[] BOOK_OF_THE_NEW_TESTAMENT = { "马太福音", "马可福音",
			"路加福音", "约翰福音", "使徒行传", "罗马书", "哥林多前书", "哥林多后书", "加拉太书", "以弗所书",
			"腓立比书", "歌罗西书", "帖撒罗尼迦前书", "帖撒罗尼迦后书", "提摩太前书", "提摩太后书", "提多书",
			"腓利门书", "希伯来书", "雅各书", "彼得前书", "彼得后书", "约翰一书", "约翰二书", "约翰三书",
			"犹大书", "启示录" };
	public static final Integer[] BOOK_OF_THE_NEW_TESTAMENT_NUM = { 28, 16, 24,
			21, 28, 16, 16, 13, 6, 6, 4, 4, 5, 3, 6, 4, 3, 1, 13, 5, 5, 3, 5,
			1, 1, 1, 22 };

}

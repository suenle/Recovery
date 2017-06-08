package com.huifu.wechat.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStreamReader;
import javax.servlet.http.HttpServlet;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.huifu.base.XmlParam;
import com.huifu.constant.Constant;
import com.huifu.wechat.util.WeixinUtil;

/**
 * token获取参数加载(启动时加载一次)
 */
public class AccessTokenParams extends HttpServlet{
	static Logger logger = LogManager.getLogger(AccessTokenParams.class.getName());
	
	/**
	 * 初始化配置参数
	 */
	public AccessTokenParams()
	{
		Constant.WECHAT_ACCESS_TOKEN = WeixinUtil.getAccessToken(
				Constant.WECHAT_APPID, Constant.WECHAT_SECRET).getToken();
		System.out.println(Constant.WECHAT_ACCESS_TOKEN);
		
	}
	
	
}

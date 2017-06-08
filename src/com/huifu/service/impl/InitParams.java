package com.huifu.service.impl;

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

/**
 * 系统参数加载(启动时加载一次)
 */
public class InitParams extends HttpServlet{
	private String strResponse;
	static Logger logger = LogManager.getLogger(InitParams.class.getName());
	
	/**
	 * 初始化配置参数
	 */
	public InitParams()
	{
		try
		{
			String path = getXmlPath();
			logger.info("path = " + path);
			strResponse = xmlfileToString(path);
			System.out.println("strResponse = " + strResponse);
			if ("".equals(strResponse) || null == strResponse)
			{
				logger.error("读取初始化配置文件失败");
				return ;
			}
	
			logger.info("========参数读取=============");
			XmlParam xml = new XmlParam();
			xml.createXML();
			logger.info(strResponse);
			xml.loadXML(strResponse);

			// 以下为需要覆盖的宏定义
			Constant.SYSTEM_CODE = xml.getParamVal("Application/Server-Param/System_Code").trim();
			Constant.WECHAT_DOLOGIN = xml.getParamVal("Application/Server-Param/WECHAT_DOLOGIN").trim();
			Constant.WECHAT_DOLOGIN = xml.getParamVal("Application/Server-Param/WECHAT_DOLOGIN").trim();
			logger.info("读取到的SYSTEM_CODE参数为：" + Constant.SYSTEM_CODE);
			logger.info("读取到的SYSTEM_CODE参数为：" + Constant.WECHAT_DOLOGIN);
			logger.info("=========参数读取完毕=============");
		}
		catch(Exception e)
		{
			
		}
		
	}
	
	/**
	 * 获取自定义配置文件绝对路径
	 */
	public static String getXmlPath()
	{
		//file:/D:/JavaWeb/.metadata/.me_tcat/webapps/TestBeanUtils/WEB-INF/classes/
		String path=Thread.currentThread().getContextClassLoader().getResource("").toString();
		path=path.replace('/', '\\'); 		// 将/换成\   
        path=path.replace("file:", ""); 	// 去掉file:   
        path=path.replace("classes\\", ""); // 去掉class\   
        path=path.substring(1); 			// 去掉第一个\,如 \D:\JavaWeb...   
        path+="params.properties";  		// 配置文件名
        return path;  
	}
	
	/**
	 * xml文件内容转String
	 */
	public String xmlfileToString(String path)
	{
		StringBuffer sResponse = new StringBuffer("");
		try{
			File file = new File(path);   
			if (!file.exists() || file.isDirectory()) 
			{   
				throw new FileNotFoundException();   
			}   
	    // 以"GB2312"编码，解决中文乱码问题  
			InputStreamReader read = new InputStreamReader(   
	            new FileInputStream(file), "GB2312");   
			BufferedReader br = new BufferedReader(read);   
			java.lang.String temp = null;   
			 
			temp = br.readLine();   
			while (temp != null) 
			{   
				sResponse.append(temp + "\n");   
				temp = br.readLine();   
			} 
			br.close();   
			read.close();

			}catch(Exception e)
			{
				e.printStackTrace();
			}
			
			return sResponse.toString();
	}
}

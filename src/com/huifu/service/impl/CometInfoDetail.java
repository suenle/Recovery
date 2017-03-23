package com.huifu.service.impl;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.comet4j.core.CometConnection;
import org.comet4j.core.CometContext;
import org.comet4j.core.CometEngine;
import org.comet4j.core.event.ConnectEvent;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSONArray;
import com.google.gson.Gson;
import com.huifu.constant.Constant;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.org.rapid_framework.util.holder.ApplicationContextHolder;

public class CometInfoDetail implements Job {

	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		// TODO Auto-generated method stub
		
	}
	/*private static final String CHANNEL1 = "OnlineBoard";
	
	private static final String CHANNEL2 = "OtherChannel";
	
	private static AlarmInfoService alarmInfoService = (AlarmInfoService) ApplicationContextHolder
			.getBean("alarmInfoService");
	
	
	
	public static AlarmInfoService getAlarmInfoService() {
		return alarmInfoService;
	}



	public static void setAlarmInfoService(AlarmInfoService alarmInfoService) {
		CometInfoDetail.alarmInfoService = alarmInfoService;
	}



	*//**
	 * Quartz预警通知信息逻辑处理执行方法
	 *//*
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		
		Map<String, Object> filter=new HashMap<String, Object>();
		filter.put("readflag", 0);
		//filter.put("alarmuserid", 0);
	    List<AlarmInfo> alarminfolist=alarmInfoService.selectNoReadAlarmInfo(filter);
	    CometEngine engine = CometContext.getInstance()
				.getEngine();
	    engine.sendToAll(CHANNEL2, "0");
	    for(AlarmInfo alarminfo: alarminfolist){
	    	Integer id=alarminfo.getAlarmuserid();
	    	//System.out.println("ssss");
			String cId = Constant.ALARMINFO_COMET_DATA_MAP
					.get(id);
			if(cId!=null){
				System.out.println("准备发送");
				// 客户端连接
				CometConnection engineConn = engine.getConnection(cId);
					engine.sendTo(CHANNEL1, engineConn,
							alarminfolist.size());
			}
				
			
			
			// 参数分别为频道，精准客户端推送，推送数据
			//测试是否重复退送
			System.out.println(pid.getPortid());
			System.out.println("map"+map.get("companyid"));
			System.out.println("map"+map.get("lineid"));
			
			
	    	
	    	
	    }
		
		
		//System.out.println(1);

	}*/

	
}
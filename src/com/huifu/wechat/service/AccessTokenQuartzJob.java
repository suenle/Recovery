package com.huifu.wechat.service;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.huifu.constant.Constant;
import com.huifu.wechat.util.WeixinUtil;

/**
 * 获取accesstoken计时任务
 * 
 * @author sel
 * 
 */
public class AccessTokenQuartzJob implements Job {

	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		Constant.WECHAT_ACCESS_TOKEN = WeixinUtil.getAccessToken(
				Constant.WECHAT_APPID, Constant.WECHAT_SECRET).getToken();
		System.out.println(Constant.WECHAT_ACCESS_TOKEN);

	}

}
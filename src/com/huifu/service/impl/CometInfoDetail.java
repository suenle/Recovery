package com.huifu.service.impl;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
import com.huifu.base.BaseUtils;
import com.huifu.constant.Constant;
import com.huifu.entity.LifeScore;
import com.huifu.entity.RecoveryLife;
import com.huifu.entity.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.org.rapid_framework.util.holder.ApplicationContextHolder;

public class CometInfoDetail implements Job {

	private static UserService userService = (UserService) ApplicationContextHolder
			.getBean("userService");

	private static RecoveryLifeService recoveryLifeService = (RecoveryLifeService) ApplicationContextHolder
			.getBean("recoveryLifeService");

	private static LifeScoreService lifeScoreService = (LifeScoreService) ApplicationContextHolder
			.getBean("lifeScoreService");

	public static LifeScoreService getLifeScoreService() {
		return lifeScoreService;
	}

	public static void setLifeScoreService(LifeScoreService lifeScoreService) {
		CometInfoDetail.lifeScoreService = lifeScoreService;
	}

	public static UserService getUserService() {
		return userService;
	}

	public static void setUserService(UserService userService) {
		CometInfoDetail.userService = userService;
	}

	public static RecoveryLifeService getRecoveryLifeService() {
		return recoveryLifeService;
	}

	public static void setRecoveryLifeService(
			RecoveryLifeService recoveryLifeService) {
		CometInfoDetail.recoveryLifeService = recoveryLifeService;
	}

	/**
	 * 周分数记录
	 */
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		/**
		 * 首先先获取所有用户的ID 遍历所有用户的ID 根据用户的ID，时间间隔获取一周操练的数据 通过计算方法写入分数表
		 */
		// Date d = new Date();// 生成当前日期
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar endcalendar = Calendar.getInstance();
		endcalendar.add(Calendar.DATE, -1); // 得到前一天
		Date enddate = endcalendar.getTime();
		Calendar startcalendar = Calendar.getInstance();
		endcalendar.add(Calendar.DATE, -8); // 得到前八天
		Date startdate = endcalendar.getTime();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("startTime", startdate);
		data.put("endTime", enddate);
		List<User> userList = getUserService().listAllUserId();
		for (User user : userList) {
			data.put("userid", user.getId());
			List<RecoveryLife> RecoveryLifeList = getRecoveryLifeService()
					.listLifeInfoByUserIdAndTime(data);
			Integer morningRevialScore = 0;
			Integer twoAltarPrayScore = 0;
			Integer PSRPScore = 0;
			Integer threeOldScore = 0;
			Integer oneNewScore = 0;
			Integer personalPrayScore = 0;

			Integer scoreType = 1;
			Integer totalScore = 0;

			Integer shepherdScore = 0;
			Integer gospelScore = 0;

			Integer birdsEyeMeeting = 0;

			Integer PSRPMeeting = 0;
			Integer prayMeeting = 0;

			Integer groupShare = 0;
			Integer groupMeeting = 0;
			Integer sundayProphesy = 0;
			Integer sundayScore = 0;

			Double shepherdTime = 0.0;
			Double gospelTime = 0.0;

			for (RecoveryLife recoveryLife : RecoveryLifeList) {
				// 晨兴
				Integer morningRevial = recoveryLife.getMorningrevial();
				morningRevialScore = morningRevialScore
						+ returnMorningrevial(morningRevial);
				// 两坛祷告
				Integer twoAltarPray = recoveryLife.getTwoaltarpray();
				twoAltarPrayScore = twoAltarPrayScore
						+ returnTwoaltarpray(twoAltarPray);
				// 职事信息祷研背讲默想主话
				Integer PSRPS = recoveryLife.getPsrp();
				PSRPScore = PSRPScore + returnPsrp(PSRPS);
				// 三章旧约

				// 一章新约

				// 个人祷告15’

				Integer personalPray = recoveryLife.getPersonalpray();
				personalPrayScore = personalPrayScore
						+ returnPersonalpray(personalPray);

				// 传福音（同伴）时数
				Double gospel = recoveryLife.getGospel();
				gospelTime = BaseUtils.add(gospel, gospelTime);
				// 牧养看望(同伴）爱筵
				Double shepherd = recoveryLife.getShepherd();
				shepherdTime = BaseUtils.add(shepherd, shepherdTime);
				// 聚会
				// 7主日聚会
				// 2祷告聚会
				// 5小排聚会
				// 1周初PSRP追求聚会
				// 6脱稿鸟瞰展览
				Integer meeting = recoveryLife.getMeeting();
				Integer meetingType = recoveryLife.getMeetingtype();
				if (meeting.equals(7)) {
					// 迟到不迟到
					if (meetingType.equals(1)) {
						sundayScore = sundayScore + 2;

					} else {
						sundayScore = sundayScore + 1;
					}
					Integer prophesy = recoveryLife.getProphesy();
					if (prophesy == 1) {
						sundayProphesy = sundayProphesy + 3;

					}

				} else if (meeting.equals(5)) {
					// 迟到不迟到
					if (meetingType.equals(1)) {
						groupMeeting = groupMeeting + 2;
					} else {
						groupMeeting = groupMeeting + 1;
					}
					Integer prophesy = recoveryLife.getProphesy();
					if (prophesy == 1) {
						groupShare = groupShare + 3;

					}

				} else if (meeting.equals(1)) {

					PSRPMeeting = PSRPMeeting + 3;

				} else if (meeting.equals(2)) {

					if (meetingType.equals(1)) {
						prayMeeting = prayMeeting + 2;
					} else {
						prayMeeting = prayMeeting + 1;
					}
				} else if (meeting.equals(6)) {

					birdsEyeMeeting = birdsEyeMeeting + 3;
				}

			}
			if (shepherdTime >= 1) {
				shepherdScore = shepherdScore + 3;
			}
			if (gospelTime >= 2) {
				gospelScore = gospelScore + 4;
			} else if (gospelTime < 2 && gospelTime > 1) {
				gospelScore = gospelScore + 2;
			} else if (gospelTime > 0.5 && gospelTime < 1) {
				gospelScore = gospelScore + 1;
			}

			LifeScore lifeScore = new LifeScore();

			lifeScore.setUserid(user.getId());
			lifeScore.setMorningrevialscore(morningRevialScore);
			lifeScore.setTwoaltarprayscore(twoAltarPrayScore);
			lifeScore.setPsrpscore(PSRPScore);
			// 三旧
			lifeScore.setThreeoldscore(threeOldScore);
			// 一新
			lifeScore.setOnenewscore(oneNewScore);
			lifeScore.setPersonalprayscore(personalPrayScore);
			lifeScore.setGospelscore(gospelScore);
			lifeScore.setShepherdscore(shepherdScore);
			lifeScore.setSundayscore(sundayScore);
			lifeScore.setSundayprophesy(sundayProphesy);
			lifeScore.setPsrpmeeting(PSRPMeeting);
			lifeScore.setPraymeeting(prayMeeting);
			lifeScore.setGroupmeeting(groupMeeting);
			lifeScore.setGroupshare(groupShare);
			lifeScore.setBirdseyemeeting(birdsEyeMeeting);
			lifeScore.setStarttime(startdate);
			lifeScore.setEndtime(enddate);
			lifeScore.setScoretype(scoreType);
			// 总分
			totalScore = morningRevialScore + twoAltarPrayScore + PSRPScore
					+ threeOldScore + oneNewScore + personalPrayScore
					+ gospelScore + shepherdScore + sundayScore
					+ sundayProphesy + PSRPMeeting + prayMeeting + groupMeeting
					+ groupShare + birdsEyeMeeting;
			lifeScore.setTotalscore(totalScore);

			getLifeScoreService().insertSelective(lifeScore);

		}

	}

	public Integer returnMorningrevial(Integer morningrevial) {
		if (morningrevial >= 20) {
			return 2;
		}
		if (morningrevial < 20 && morningrevial > 0) {
			return 1;
		} else {
			return 0;
		}
	}

	public Integer returnTwoaltarpray(Integer twoaltarpray) {
		if (twoaltarpray >= 30) {
			return 2;
		}
		if (twoaltarpray < 30 && twoaltarpray > 0) {
			return 1;
		} else {
			return 0;
		}
	}

	public Integer returnPsrp(Integer psrp) {
		if (psrp == 1) {
			return 2;

		} else {
			return 0;
		}
	}

	public Integer returnPersonalpray(Integer personalpray) {
		if (personalpray >= 15) {
			return 2;
		}
		if (personalpray < 15 && personalpray > 0) {
			return 1;
		} else {
			return 0;
		}
	}

	public String returnGospel(Double gospel) {
		if (gospel.compareTo(0.0) == 0) {
			return "";
		} else {
			return gospel.toString();
		}
	}
}
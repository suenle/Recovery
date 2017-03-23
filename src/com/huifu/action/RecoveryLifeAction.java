package com.huifu.action;

import java.util.Date;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import com.huifu.base.BaseAction;
import com.huifu.entity.User;
import com.huifu.entity.UserInfo;
import com.huifu.service.impl.RecoveryLifeService;
import com.huifu.service.impl.TransactionManagerService;
import com.huifu.service.impl.UserInfoService;
import com.huifu.service.impl.UserService;

/**
 * 操练表相关Action
 */
@Controller
public class RecoveryLifeAction extends BaseAction {

	private RecoveryLifeService recoveryLifeService;

	private UserInfoService userInfoService;

	private UserService userService;

	private TransactionManagerService transactionManagerService;

	static Logger logger = LogManager.getLogger(RecoveryLifeAction.class
			.getName());

	public RecoveryLifeService getRecoveryLifeService() {
		return recoveryLifeService;
	}

	public void setRecoveryLifeService(RecoveryLifeService recoveryLifeService) {
		this.recoveryLifeService = recoveryLifeService;
	}

	public UserInfoService getUserInfoService() {
		return userInfoService;
	}

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public TransactionManagerService getTransactionManagerService() {
		return transactionManagerService;
	}

	public void setTransactionManagerService(
			TransactionManagerService transactionManagerService) {
		this.transactionManagerService = transactionManagerService;
	}

	public String addInfo() {
		setUtfEncoding();
		String name = getRequest().getParameter("userName");
		String strsex = getRequest().getParameter("sex");
		String strgroupID = getRequest().getParameter("groupId");
		String strhomeID = getRequest().getParameter("homeID");

		Integer sex = null;

		Integer groupID = null;

		Integer homeID = null;

		try {
			sex = Integer.valueOf(strsex);
			groupID = Integer.valueOf(strgroupID);
			homeID = Integer.valueOf(strhomeID);
		} catch (Exception e) {

		}
		// 获取session中的id
		Integer userid = (Integer) getSession().getAttribute("userId");

		UserInfo userInfo = new UserInfo();
		userInfo.setName(name);
		userInfo.setSex(sex);
		userInfo.setGroupid(groupID);
		userInfo.setHomeid(homeID);
		// userInfo.setUserid(userid);

		// 更改状态为已填个人信息
		User user = new User();
		user.setId(userid);
		user.setStatus(1);
		int iNum = 0;
		// 暂时用这种方式控制事物
		try {
			iNum = getTransactionManagerService()
					.addinfoservice(user, userInfo);
		} catch (Exception e) {
		}

		if (iNum > 0) {
			// 跳转至单天操练信息
			return "/pages/recoveryLifeInfo.jsp";
		} else {
			// 跳转提醒重新填写
			return "/login.html";
		}
	}

	/**
	 * 添加当天的操练信息 当天已经添加的则换为修改，以保持一天只有一条操练信息
	 */
	public String addLifeInfo() {
		setUtfEncoding();

		//晨兴
		String morningrevial = getRequest().getParameter("morningRevial");

		String strmorningrevialnum = getRequest().getParameter(
				"morningRevialNum");
        //两坛的祷告
		String twoaltarpray = getRequest().getParameter("twoAltarPray");

		String strtwoaltarpraynum = getRequest()
				.getParameter("twoAltarPrayNum");

		//祷言背讲
		String psrp = getRequest().getParameter("psrp");

		String strpsrpnum = getRequest().getParameter("psrpNum");
		
        //三旧
		String threeold = getRequest().getParameter("threeOld");

		//一新
		String onenew = getRequest().getParameter("oneNew");

		//个祷
		String personalpray = getRequest().getParameter("personalPray");

		String personalpraynum = getRequest().getParameter("personalPrayNum");

		//
		String shepherd = getRequest().getParameter("shepherd");

		String strshepherdnum = getRequest().getParameter("shepherd");

		String gospel = getRequest().getParameter("userName");

		String meeting = getRequest().getParameter("meeting");

		// Integer meetingtype = getRequest().getParameter("userName");

		String strmeetingnum = getRequest().getParameter("meetingNum");

		return null;

	}

}

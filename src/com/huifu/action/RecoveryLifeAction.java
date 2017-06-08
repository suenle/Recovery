package com.huifu.action;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import sun.org.mozilla.javascript.internal.Undefined;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.gson.JsonArray;
import com.huifu.base.BaseAction;
import com.huifu.base.BaseUtils;
import com.huifu.constant.Constant;
import com.huifu.entity.Church;
import com.huifu.entity.District;
import com.huifu.entity.Group;
import com.huifu.entity.Home;
import com.huifu.entity.RecoveryLife;
import com.huifu.entity.RequestInfo;
import com.huifu.entity.User;
import com.huifu.entity.UserInfo;
import com.huifu.service.impl.RecoveryLifeService;
import com.huifu.service.impl.RequestInfoService;
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

	private RequestInfoService requestInfoService;

	private TransactionManagerService transactionManagerService;

	static Logger logger = LogManager.getLogger(RecoveryLifeAction.class
			.getName());

	public RequestInfoService getRequestInfoService() {
		return requestInfoService;
	}

	public void setRequestInfoService(RequestInfoService requestInfoService) {
		this.requestInfoService = requestInfoService;
	}

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

	/**
	 * 添加当天的操练信息 当天已经添加的则换为修改，以保持一天只有一条操练信息
	 */
	public String addLifeInfo() {
		setUtfEncoding();
		String errorMsg = "";
		Map<String, Object> result = new HashMap<String, Object>();

		RecoveryLife recoveryLife = new RecoveryLife();
		// 晨兴
		String morningrevial = getRequest().getParameter("morningRevial");
		String strmorningrevialnum = getRequest().getParameter(
				"morningRevialNum");
		// 满分晨兴时间
		Integer morningrevialTime = 20;
		// 当两者都不为空的时候算是完成
		if (!(morningrevial == null) || !strmorningrevialnum.equals("")) {
			// 当有时间的时候根据时间来计算分数
			if (!strmorningrevialnum.equals("")) {
				Integer morningrevialnum = 0;
				try {
					morningrevialnum = Integer.valueOf(strmorningrevialnum);
				} catch (Exception e) {
					errorMsg = "晨兴数据转换错误，请检查填写晨兴数据内容";
					result.put("error", errorMsg);
					this.getRequest()
							.setAttribute("GSON_RESULT_OBJECT", result);
					return "/pages/recoveryLifeInfo.jsp";
				}
				recoveryLife.setMorningrevial(morningrevialnum);
			}
			// 无填写时间默认满分
			else {
				recoveryLife.setMorningrevial(morningrevialTime);
			}

		} else {
			recoveryLife.setMorningrevial(0);

		}

		// 两坛的祷告
		String twoaltarpray = getRequest().getParameter("twoAltarPray");

		String strtwoaltarpraynum = getRequest()
				.getParameter("twoAltarPrayNum");
		// 满分两坛时间
		Integer twoaltarprayTime = 30;
		// 当两者都不为空的时候算是完成
		if (!(twoaltarpray == null) || !strtwoaltarpraynum.equals("")) {
			// 当有时间的时候根据时间来计算分数
			if (!strtwoaltarpraynum.equals("")) {
				Integer twoaltarpraynum = 0;
				try {
					twoaltarpraynum = Integer.valueOf(strtwoaltarpraynum);
				} catch (Exception e) {
					errorMsg = "两坛祷告数据转换错误，请检查填写两坛祷告数据内容";
					result.put("error", errorMsg);
					this.getRequest()
							.setAttribute("GSON_RESULT_OBJECT", result);
					return "/pages/recoveryLifeInfo.jsp";

				}
				recoveryLife.setTwoaltarpray(twoaltarpraynum);
			}
			// 无填写时间默认满分
			else {
				recoveryLife.setTwoaltarpray(twoaltarprayTime);
			}

		} else {
			recoveryLife.setTwoaltarpray(0);
		}

		// 祷言背讲
		String psrp = getRequest().getParameter("psrp");
		// String strpsrpnum = getRequest().getParameter("psrpNum");
		// 满分两坛时间
		Integer psrpTime = 30;
		if (!(psrp == null)) {
			recoveryLife.setPsrp(1);
		} else {
			recoveryLife.setPsrp(0);
		}

		// 三旧
		String threeOldRecord = getRequest().getParameter("threeOldRecord");

		if (!(threeOldRecord == null)) {
			recoveryLife.setThreeold(1);
		} else {
			recoveryLife.setThreeold(0);
		}

		// 一新
		String oneNewRecord = getRequest().getParameter("oneNewRecord");

		if (!(oneNewRecord == null)) {
			recoveryLife.setOnenew(1);
		} else {
			recoveryLife.setOnenew(0);
		}

		String strthreeold = getRequest().getParameter("threeOld");
		String strthreeoldNum = getRequest().getParameter("threeOldNum");
		recoveryLife.setThreeoldnum(strthreeold + "," + strthreeoldNum);

		// 一新
		String stronenew = getRequest().getParameter("oneNew");
		String stronenewNum = getRequest().getParameter("oneNewNum");
		recoveryLife.setOnenewnum(stronenew + "," + stronenewNum);

		// 个祷
		String personalpray = getRequest().getParameter("personalPray");

		String strpersonalpraynum = getRequest()
				.getParameter("personalPrayNum");

		// 满分个祷时间
		Integer personalprayTime = 15;
		// 当两者都不为空的时候算是完成
		if (!(personalpray == null) || !strpersonalpraynum.equals("")) {
			// 当有时间的时候根据时间来计算分数
			if (!strpersonalpraynum.equals("")) {
				Integer personalpraynum = 0;
				try {
					personalpraynum = Integer.valueOf(strpersonalpraynum);
				} catch (Exception e) {
					errorMsg = "个祷数据转换错误，请检查填写个祷数据内容";
					result.put("error", errorMsg);
					this.getRequest()
							.setAttribute("GSON_RESULT_OBJECT", result);
					return "/pages/recoveryLifeInfo.jsp";

				}
				recoveryLife.setPersonalpray(personalpraynum);
			}
			// 无填写时间默认满分
			else {
				recoveryLife.setPersonalpray(personalprayTime);
			}

		} else {
			recoveryLife.setPersonalpray(0);
		}
		// 牧养次数
		// String shepherd = getRequest().getParameter("shepherd");

		String strshepherdnum = getRequest().getParameter("shepherdNum");
		// 当两者都不为空的时候算是完成
		if (!strshepherdnum.equals("")) {
			Double shepherdnum = 0.0;
			try {
				shepherdnum = Double.valueOf(strshepherdnum);
			} catch (Exception e) {
				errorMsg = "牧养数据转换错误，请检查填写牧养内容";
				result.put("error", errorMsg);
				this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
				return "/pages/recoveryLifeInfo.jsp";
			}
			recoveryLife.setShepherd(shepherdnum);
		} else {
			recoveryLife.setShepherd(0.0);
		}

		// 传福音时数
		String strgospelnum = getRequest().getParameter("gospelNum");

		if (!strshepherdnum.equals("")) {
			Double gospelnum = 0.0;
			try {
				gospelnum = Double.valueOf(strgospelnum);
			} catch (Exception e) {
				errorMsg = "传福音数据转换错误，请检查填写传福音时间内容";
				result.put("error", errorMsg);
				this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
				return "/pages/recoveryLifeInfo.jsp";
			}
			recoveryLife.setGospel(gospelnum);
		} else {
			recoveryLife.setGospel(0.0);
		}
		// 聚会
		String strmeeting = getRequest().getParameter("meeting");
		String strmeetingType = getRequest().getParameter("meetingType");
		String strprophesy = getRequest().getParameter("prophesy");
		Integer meetingType = null;
		Integer meeting = null;
		Integer prophesy = null;
		if (!strmeeting.equals("-1")) {
			meeting = Integer.valueOf(strmeeting);
			meetingType = Integer.valueOf(strmeetingType);
			recoveryLife.setMeetingtype(meetingType);
			recoveryLife.setMeeting(meeting);
			if (strmeeting.equals("5") || strmeeting.equals("7")) {
				if (!(strprophesy == null)) {
					prophesy = Integer.valueOf(strprophesy);
					recoveryLife.setProphesy(prophesy);
				} else {
					recoveryLife.setProphesy(0);
				}
			}
		} else {
			recoveryLife.setMeeting(0);
			recoveryLife.setMeetingtype(0);
			recoveryLife.setProphesy(0);
		}

		// String strmeeting = getRequest().getParameter("meeting");

		try {
			meetingType = Integer.valueOf(strmeetingType);
			// meeting = Integer.valueOf(strmeeting);
			// prophesy = Integer.valueOf(strprophesy);
		} catch (Exception e) {

		}
		recoveryLife.setMeetingtype(meetingType);
		// recoveryLife.setProphesy(prophesy);
		// 获取session中的id
		Integer userid = (Integer) getSession().getAttribute("userId");

		recoveryLife.setUserid(userid);

		Date d = new Date();
		// SimpleDateFormat format = new
		// SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		recoveryLife.setTime(d);

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		String newdate = format.format(d);
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("userid", userid);
		data.put("time", newdate);
		RecoveryLife getrecoveryLife = getRecoveryLifeService()
				.getTodayInfoByUseridAndTime(data);
		if (getrecoveryLife == null) {
			getRecoveryLifeService().insertSelective(recoveryLife);
		} else {
			recoveryLife.setId(getrecoveryLife.getId());
			getRecoveryLifeService().updateByPrimaryKey(recoveryLife);
		}
		return "redirect:RecoveryLife/endinfo.do";

	}

	public String endinfo() {

		return "/pages/end.jsp";
	}

	/**
	 * 一次性把四级的信息都获取
	 * 
	 * @return
	 */
	public String getBook() {

		setUtfEncoding();

		String errorMsg = "";

		Map<String, Object> result = new HashMap<String, Object>();

		result.put("OldBook", Constant.BOOK_OF_THE_OLD_TESTAMENT);

		result.put("NewBook", Constant.BOOK_OF_THE_NEW_TESTAMENT);

		result.put("OldBookNum", Constant.BOOK_OF_THE_OLD_TESTAMENT_NUM);

		result.put("NewBookNum", Constant.BOOK_OF_THE_NEW_TESTAMENT_NUM);

		result.put("errorMsg", errorMsg);

		this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);

		return "ajax";

	}

	/**
	 * 查询是否含有当天数据
	 */
	public String getTodayDate() {

		setUtfEncoding();

		String errorMsg = "";
		Map<String, Object> result = new HashMap<String, Object>();

		Date d = new Date();// 生成当前日期
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		String newdate = format.format(d);

		Integer userid = (Integer) getSession().getAttribute("userId");
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("userid", userid);
		data.put("time", newdate);
		RecoveryLife recoveryLife = getRecoveryLifeService()
				.getTodayInfoByUseridAndTime(data);
		if (recoveryLife == null) {
			RecoveryLife lastrecoveryLife = getRecoveryLifeService()
					.getLastdayInfoByUseridAndTime(data);
			result.put("recoveryLife", lastrecoveryLife);
			// 查询的是最后一次
			result.put("status", 0);
		} else {
			// 查询的是新的
			result.put("recoveryLife", recoveryLife);
			result.put("status", 1);
		}

		result.put("errorMsg", errorMsg);

		this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);

		return "ajax";
	}

	/**
	 * 获取搜索获得的对象
	 */
	public void getInfoList() {
		setUtfEncoding();
		String strdistrictId = getRequest().getParameter("districtId");
		String strgroupId = getRequest().getParameter("groupId");
		String strhomeId = getRequest().getParameter("homeId");
		String userName = getRequest().getParameter("userName");

		if (userName == "") {

			userName = null;
		}

		String errorMsg = "";

		Integer districtId = null;

		Integer groupId = null;

		Integer homeId = null;

		if (strdistrictId != null && !strdistrictId.equals("-1")) {
			districtId = Integer.valueOf(strdistrictId);
		} else {
			districtId = null;
		}
		if (strgroupId != null && !strgroupId.equals("-1")) {
			groupId = Integer.valueOf(strgroupId);
		} else {
			groupId = null;
		}
		if (strhomeId != null && !strhomeId.equals("-1")) {
			homeId = Integer.valueOf(strhomeId);
		} else {
			homeId = null;
		}
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("districtid", districtId);
		data.put("groupid", groupId);
		data.put("homeid", homeId);
		data.put("username", userName);

		List<UserInfo> userList = getUserInfoService().getLifeInfoBySomeDate(
				data);

		if (userList.isEmpty()) {
			errorMsg = "未查询到相关数据\n";
			returnErrorInfo(errorMsg);
			return;
		}

		JSONObject retObj = new JSONObject();
		JSONArray jArr = new JSONArray();
		JSONObject rowObj = null;
		for (UserInfo userinfo : userList) {
			rowObj = new JSONObject();
			rowObj.put("id", userinfo.getId());
			rowObj.put("userId", userinfo.getUserid());
			rowObj.put("userName", userinfo.getUsername());
			rowObj.put("sex", returnSex(userinfo.getSex()));
			rowObj.put("churchId", userinfo.getChurchid());
			rowObj.put("churchName", userinfo.getChurchname());
			rowObj.put("groupId", userinfo.getGroupid());
			rowObj.put("groupName", userinfo.getGroupname());
			rowObj.put("districtId", userinfo.getDistrictid());
			rowObj.put("districtName", userinfo.getDistrictname());
			rowObj.put("homeId", userinfo.getHomeid());
			rowObj.put("homeName", userinfo.getHomename());
			jArr.add(rowObj);
		}
		retObj.put("rows", jArr);
		retObj.put("errorMsg", errorMsg);
		try {
			// 直接返回JSON菜单，在前台显示
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(retObj.toJSONString());
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * 获取搜索获得的对象分页
	 */
	public void queryInfoList() {
		setUtfEncoding();
		String strdistrictId = getRequest().getParameter("districtId");
		String strgroupId = getRequest().getParameter("groupId");
		String strhomeId = getRequest().getParameter("homeId");
		String userName = getRequest().getParameter("userName");

		String errorMsg = "";
		String strPageIndex = getRequest().getParameter("pageIndex"); // 第X页
		String strPageRowCount = getRequest().getParameter("pageNums"); // 每页显示记录

		Integer pageIndex = 0;
		Integer pageRowCount = 20; // 每页显示记录

		if (userName == "") {

			userName = null;
		}

		Integer districtId = null;

		Integer groupId = null;

		Integer homeId = null;

		if (null != strPageIndex && !"".equals(strPageIndex)) {
			pageIndex = Integer.valueOf(strPageIndex);
		}
		if (null != strPageRowCount && !"".equals(strPageRowCount)) {
			pageRowCount = Integer.valueOf(strPageRowCount);
		}
		if (strdistrictId != null && !strdistrictId.equals("-1")) {
			districtId = Integer.valueOf(strdistrictId);
		} else {
			districtId = null;
		}
		if (strgroupId != null && !strgroupId.equals("-1")) {
			groupId = Integer.valueOf(strgroupId);
		} else {
			groupId = null;
		}
		if (strhomeId != null && !strhomeId.equals("-1")) {
			homeId = Integer.valueOf(strhomeId);
		} else {
			homeId = null;
		}

		Map<String, Object> data = new HashMap<String, Object>();
		Integer dataStartNum = (pageIndex - 1) * pageRowCount; // 初始页
		data.put("dataStartNum", dataStartNum); // 开始的下一条记录
		data.put("dataCount", pageRowCount); // 检索的记录数
		data.put("districtid", districtId);
		data.put("groupid", groupId);
		data.put("homeid", homeId);
		data.put("username", userName);

		List<UserInfo> userList = getUserInfoService().queryLifeInfoBySomeDate(
				data);
		Integer purchaseordeNums = getUserInfoService()
				.queryLifeInfoBySomeDateNum(data);

		if (userList.isEmpty()) {
			errorMsg = "未查询到相关数据\n";
			returnErrorInfo(errorMsg);
			return;
		}
		// 总页数
		Integer totalPage = BaseUtils.getFloorDev(purchaseordeNums,
				pageRowCount);
		JSONObject retObj = new JSONObject();
		JSONArray jArr = new JSONArray();
		JSONObject rowObj = null;
		retObj.put("errorMsg", ""); // 错误标识
		retObj.put("page", pageIndex); // 页码序号
		retObj.put("total", totalPage); // 总页码数
		retObj.put("records", purchaseordeNums); // 记录总数
		Integer num = dataStartNum + 1;
		for (UserInfo userinfo : userList) {
			rowObj = new JSONObject();
			rowObj.put("num", num);
			num++;
			rowObj.put("id", userinfo.getId());
			rowObj.put("userId", userinfo.getUserid());
			rowObj.put("userName", userinfo.getUsername());
			rowObj.put("sex", returnSex(userinfo.getSex()));
			rowObj.put("churchId", userinfo.getChurchid());
			rowObj.put("churchName", userinfo.getChurchname());
			rowObj.put("groupId", userinfo.getGroupid());
			rowObj.put("groupName", userinfo.getGroupname());
			rowObj.put("districtId", userinfo.getDistrictid());
			rowObj.put("districtName", userinfo.getDistrictname());
			rowObj.put("homeId", userinfo.getHomeid());
			rowObj.put("homeName", userinfo.getHomename());
			jArr.add(rowObj);
		}
		retObj.put("rows", jArr);
		retObj.put("errorMsg", errorMsg);
		try {
			// 直接返回JSON菜单，在前台显示
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(retObj.toJSONString());
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * 获取详细的操练信息
	 */
	public void getRecoveryLife() {
		setUtfEncoding();

		String struserId = getRequest().getParameter("userId");
		Integer userId = null;
		String errorMsg = "";
		try {
			userId = Integer.valueOf(struserId);
		} catch (Exception e) {
			errorMsg = "未查询到相关数据\n";
			returnErrorInfo(errorMsg);
			return;
		}
		Date d = new Date();// 生成当前日期
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String endtime = format.format(d);

		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DATE, -7); // 得到前一天
		Date date = calendar.getTime();
		String starttime = format.format(date);
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("endTime", endtime);
		data.put("startTime", starttime);
		data.put("userid", userId);

		List<RecoveryLife> rlList = getRecoveryLifeService()
				.getLifeInfoListByUserId(data);

		JSONObject retObj = new JSONObject();
		JSONArray jArr = new JSONArray();
		JSONObject rowObj = null;

		if (rlList.isEmpty()) {
			errorMsg = "未查询到相关数据\n";
			returnErrorInfo(errorMsg);
			return;
		}

		for (RecoveryLife recoverylife : rlList) {
			rowObj = new JSONObject();
			rowObj.put("id", recoverylife.getId());
			rowObj.put("userId", recoverylife.getUserid());
			rowObj.put("morningrevial",
					returnMorningrevial(recoverylife.getMorningrevial()));
			rowObj.put("twoaltarpray",
					returnTwoaltarpray(recoverylife.getTwoaltarpray()));

			rowObj.put("psrp", returnPsrp(recoverylife.getPsrp()));
			rowObj.put("threeold",
					returnThreeold(recoverylife.getThreeoldnum()));
			// rowObj.put("threeoldnum", recoverylife.getThreeoldnum());

			rowObj.put("onenew", returnOnenew(recoverylife.getOnenewnum()));
			// rowObj.put("onenewnum", recoverylife.getOnenewnum());
			rowObj.put("personalpray",
					returnPersonalpray(recoverylife.getPersonalpray()));
			rowObj.put("shepherd", returnshepherd(recoverylife.getShepherd()));
			rowObj.put("gospel", returnGospel(recoverylife.getGospel()));
			rowObj.put("meeting", returnMeeting(recoverylife.getMeeting()));
			rowObj.put("meetingtype", recoverylife.getMeetingtype());
			rowObj.put("prophesy", retureProphesy(recoverylife.getProphesy()));
			rowObj.put("time", getWeekOfDate(recoverylife.getTime()));
			jArr.add(rowObj);
			retObj.put("userName", recoverylife.getUsername());
			retObj.put("sex", returnSex(recoverylife.getSex()));
		}
		retObj.put("rows", jArr);
		retObj.put("errorMsg", errorMsg);

		try {
			// 直接返回JSON菜单，在前台显示
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(retObj.toJSONString());
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * 获取详细的操练信息
	 */
	public void queryRecoveryLife() {
		setUtfEncoding();

		String struserId = getRequest().getParameter("userId");

		Integer userId = null;
		String strPageIndex = getRequest().getParameter("pageIndex"); // 第X页
		String strPageRowCount = getRequest().getParameter("pageNums"); // 每页显示记录

		Integer pageIndex = 0;
		Integer pageRowCount = 20; // 每页显示记录

		String errorMsg = "";

		Timestamp startTime = null;
		Timestamp endTime = null;
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		String startPurchaseTime = getRequest().getParameter(
				"startPurchaseTime"); // 开始时间
		if (null != startPurchaseTime && !"".equals(startPurchaseTime)) {
			startTime = timestamp.valueOf(startPurchaseTime);
		}
		String endPurchaseTime = getRequest().getParameter("endPurchaseTime"); // 截止时间
		if (null != endPurchaseTime && !"".equals(endPurchaseTime)) {
			endTime = timestamp.valueOf(endPurchaseTime);
		}
		try {
			userId = Integer.valueOf(struserId);
		} catch (Exception e) {
			errorMsg = "未查询到相关数据\n";
			returnErrorInfo(errorMsg);
			return;
		}
		try {
			if (null != strPageIndex && !"".equals(strPageIndex)) {
				pageIndex = Integer.valueOf(strPageIndex);
			}
			if (null != strPageRowCount && !"".equals(strPageRowCount)) {
				pageRowCount = Integer.valueOf(strPageRowCount);
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			returnErrorInfo("页面输入数据格式不正确");
			return;
		}

		Date d = new Date();// 生成当前日期
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String endtime = format.format(d);

		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DATE, -7); // 得到前一天
		Date date = calendar.getTime();
		String starttime = format.format(date);
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("endTime", endtime);
		data.put("startTime", starttime);
		data.put("userid", userId);
		Integer dataStartNum = (pageIndex - 1) * pageRowCount; // 初始页
		data.put("dataStartNum", dataStartNum); // 开始的下一条记录
		data.put("dataCount", pageRowCount); // 检索的记录数

		data.put("startTime", startTime); // 开始时间
		data.put("endTime", endTime); // 截止时间

		List<RecoveryLife> rlList = getRecoveryLifeService()
				.queryLifeInfoListByUserId(data);

		// 数据总数
		Integer pgisNums = getRecoveryLifeService()
				.queryLifeInfoListByUserIdNum(data);
		// 总页数
		Integer totalPage = BaseUtils.getFloorDev(pgisNums, pageRowCount);
		JSONObject retObj = new JSONObject();
		JSONArray jArr = new JSONArray();
		JSONObject rowObj = null;
		retObj.put("errorMsg", ""); // 错误标识
		retObj.put("page", pageIndex); // 页码序号
		retObj.put("total", totalPage); // 总页码数
		retObj.put("records", pgisNums); // 记录总数
		if (rlList.isEmpty()) {
			errorMsg = "未查询到相关数据\n";
			returnErrorInfo(errorMsg);
			return;
		}
		Integer num = dataStartNum + 1;
		for (RecoveryLife recoverylife : rlList) {
			rowObj = new JSONObject();
			rowObj.put("num", num);
			num++;
			rowObj.put("id", recoverylife.getId());
			rowObj.put("userId", recoverylife.getUserid());
			rowObj.put("morningrevial",
					returnMorningrevial(recoverylife.getMorningrevial()));
			rowObj.put("twoaltarpray",
					returnTwoaltarpray(recoverylife.getTwoaltarpray()));

			rowObj.put("psrp", returnPsrp(recoverylife.getPsrp()));
			rowObj.put("threeold",
					returnThreeold(recoverylife.getThreeoldnum()));
			// rowObj.put("threeoldnum", recoverylife.getThreeoldnum());

			rowObj.put("onenew", returnOnenew(recoverylife.getOnenewnum()));
			// rowObj.put("onenewnum", recoverylife.getOnenewnum());
			rowObj.put("personalpray",
					returnPersonalpray(recoverylife.getPersonalpray()));
			rowObj.put("shepherd", returnshepherd(recoverylife.getShepherd()));
			rowObj.put("gospel", returnGospel(recoverylife.getGospel()));

			rowObj.put("meeting", returnMeeting(recoverylife.getMeeting()));
			if (returnMeeting(recoverylife.getMeeting()).equals("")) {
				rowObj.put("meetingtype", "");
				rowObj.put("prophesy", "");
			} else {
				rowObj.put("meetingtype",
						returnMeetingType(recoverylife.getMeetingtype()));
				rowObj.put("prophesy",
						retureProphesy(recoverylife.getProphesy()));
			}

			rowObj.put("time", format.format(recoverylife.getTime()) + "("
					+ getWeekOfDate(recoverylife.getTime()) + ")");
			jArr.add(rowObj);
			retObj.put("userName", recoverylife.getUsername());
			retObj.put("sex", returnSex(recoverylife.getSex()));
		}
		retObj.put("rows", jArr);
		retObj.put("errorMsg", errorMsg);

		try {
			// 直接返回JSON菜单，在前台显示
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(retObj.toJSONString());
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public String returnSex(Integer sex) {
		if (sex == 0) {
			return "弟兄";
		} else {
			return "姊妹";

		}
	}

	public String returnMorningrevial(Integer morningrevial) {
		if (morningrevial >= 20) {
			return "√";
		}
		if (morningrevial < 20 && morningrevial > 0) {
			return "○";
		} else {
			return "";
		}
	}

	public String returnTwoaltarpray(Integer twoaltarpray) {
		if (twoaltarpray >= 30) {
			return "√";
		}
		if (twoaltarpray < 30 && twoaltarpray > 0) {
			return "○";
		} else {
			return "";
		}
	}

	public String returnThreeold(String threeoldnum) {
		String[] arr = threeoldnum.split(",");

		return Constant.BOOK_OF_THE_OLD_TESTAMENT_LOGOGRAM[Integer
				.valueOf(arr[0])] + "," + arr[1];
	}

	public String returnOnenew(String Onenewnum) {
		String[] arr = Onenewnum.split(",");
		return Constant.BOOK_OF_THE_NEW_LOGOGRAM[Integer.valueOf(arr[0])] + ","
				+ arr[1];
	}

	public String returnPersonalpray(Integer personalpray) {
		if (personalpray >= 15) {
			return "√";
		}
		if (personalpray < 15 && personalpray > 0) {
			return "○";
		} else {
			return "";
		}
	}

	public String returnPsrp(Integer psrp) {
		if (psrp == 1) {
			return "√";

		} else {
			return "";
		}
	}

	public String returnshepherd(Double shepherd) {
		if (shepherd.compareTo(0.0) == 0) {
			return "";
		} else {
			return shepherd.toString();
		}
	}

	public String returnGospel(Double gospel) {
		if (gospel.compareTo(0.0) == 0) {
			return "";
		} else {
			return gospel.toString();
		}
	}

	public String returnMeeting(Integer meeting) {
		if (meeting == 7) {
			return "主日";
		} else if (meeting == 2) {
			return "祷告";
		} else if (meeting == 5) {
			return "小排";
		} else if (meeting == 1) {
			return "PSRP";
		} else if (meeting == 6) {
			return "鸟瞰";
		} else {
			return "";
		}
	}

	public String retureProphesy(Integer prophesy) {
		if (prophesy == 1) {
			return "√";
		} else {
			return "○";
		}

	}

	public String returnMeetingType(Integer MeetingType) {
		if (MeetingType == 2) {
			return "√";
		} else {
			return "";
		}

	}

	public String recoveryLifeInfo() {
		return "/pages/recoveryLifeInfo.jsp";
	}

	public static String getWeekOfDate(Date date) {
		String[] weekOfDays = { "日", "一", "二", "三", "四", "五", "六" };
		Calendar calendar = Calendar.getInstance();
		if (date != null) {
			calendar.setTime(date);
		}
		Integer w = calendar.get(Calendar.DAY_OF_WEEK) - 1;
		if (w < 0) {
			w = 0;
		}
		return weekOfDays[w];
	}

	/**
	 * 申请服侍者
	 */
	public String requestCarer() {
		setUtfEncoding();
		Integer userid = (Integer) getSession().getAttribute("userId");
		String info = getRequest().getParameter("info");
		String errorMsg = "";
		Map<String, Object> result = new HashMap<String, Object>();

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("userid", userid);
		RequestInfo queryRequestInfo = getRequestInfoService().selectByUserid(
				data);

		RequestInfo requestInfo = new RequestInfo();
		requestInfo.setUserid(userid);
		requestInfo.setInfo(info);
		requestInfo.setStatusinfo(0);
		int iNum = 0;
		if (queryRequestInfo != null) {
			requestInfo.setId(queryRequestInfo.getId());
			iNum = getRequestInfoService().updateByPrimaryKeySelective(
					requestInfo);
		} else {
			iNum = getRequestInfoService().insertSelective(requestInfo);
		}

		if (iNum > 0) {
			return "redirect:RecoveryLife/endinfo.do";
		} else {
			errorMsg = "申请失败，请重试！";
			result.put("error", errorMsg);
			this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
			return "/pages/requestCareInfo.jsp";
		}
	}

	/**
	 * 返回页面报错
	 */
	public void returnErrorInfo(String errorMsg) {
		JSONObject retObj = new JSONObject();
		retObj.put("errorMsg", errorMsg);
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(retObj.toJSONString());
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

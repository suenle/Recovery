package com.huifu.action;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.huifu.base.BaseAction;
import com.huifu.base.BaseUtils;
import com.huifu.constant.Constant;
import com.huifu.entity.LifeScore;
import com.huifu.service.impl.LifeScoreService;

/**
 * 区域Action操作
 */
@Controller
public class LifeScoreAction extends BaseAction {
	private LifeScoreService lifeScoreService;
	static Logger logger = LogManager
			.getLogger(LifeScoreAction.class.getName());

	public LifeScoreService getLifeScoreService() {
		return lifeScoreService;
	}

	public void setLifeScoreService(LifeScoreService lifeScoreService) {
		this.lifeScoreService = lifeScoreService;
	}

	/**
	 * 查询操练信息操作打印
	 */
	public void queryLifeScorePrint() {
		try {
			this.getRequest().setCharacterEncoding("UTF-8");
			this.getResponse().setContentType("text/html;charset=utf-8");
		} catch (Exception e) {
			logger.error(e.getMessage());
			return;
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		String strgroupId = getRequest().getParameter("groupId");// 小排ID

		String strdistrictId = getRequest().getParameter("districtId");// 小排ID

		String strhomeId = getRequest().getParameter("homeId");// 小排ID

		String userName = getRequest().getParameter("userName");// 小排ID

		String strscoreType = getRequest().getParameter("scoreType");// 小排ID

		String strstartTime = getRequest().getParameter("startTime"); // 开始时间

		String strendTime = getRequest().getParameter("endTime"); // 截止时间

		String strquickChoice = getRequest().getParameter("quickChoice"); // 截止时间

		Integer groupId = null;
		Integer scoreType = null;
		Integer districtId = null;
		Integer homeId = null;
		Timestamp startTime = null;
		Timestamp endTime = null;

		String errorMsg = "";

		if (null != strgroupId && !"".equals(strgroupId)
				&& !"-1".equals(strgroupId)) {
			groupId = Integer.valueOf(strgroupId);
		}
		if (null != strdistrictId && !"".equals(strdistrictId)
				&& !"-1".equals(strdistrictId)) {
			districtId = Integer.valueOf(strdistrictId);
		}
		if (null != strhomeId && !"".equals(strhomeId)
				&& !"-1".equals(strhomeId)) {
			homeId = Integer.valueOf(strhomeId);
		}
		if (null != strscoreType && !"".equals(strscoreType)&& !"-1".equals(strscoreType)) {
			scoreType = Integer.valueOf(strscoreType);
		}

		if (null != strstartTime && !"".equals(strstartTime)) {
			startTime = Timestamp.valueOf(strstartTime);
		}

		if (null != strendTime && !"".equals(strendTime)) {
			endTime = Timestamp.valueOf(strendTime);
		}

		String pageNums = getRequest().getParameter("pageNums"); // 每页显示行数
		String pageIndex = getRequest().getParameter("pageIndex"); // 第x页
		Integer idx = 0;
		Integer iPageNums = 20;
		// Integer dataStartNum = 1;
		Map<String, Object> filter = new HashMap<String, Object>();
		Map<String, Object> result = new HashMap<String, Object>();

		try {
			if (null != pageNums && !"".equals(pageNums)) {
				iPageNums = Integer.valueOf(pageNums);
			}
			if (null != pageIndex && !"".equals(pageIndex)) {
				idx = Integer.valueOf(pageIndex);
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			errorMsg += "页面输入的数据格式错误\n";
			result.put("error", errorMsg);
			this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
		}

		Integer dataStartNum = (idx - 1) * iPageNums;
		if ("".equals(userName)) {
			filter.put("userName", null);
		} else {

			filter.put("userName", userName);
		}

		filter.put("scoreType", scoreType);

		filter.put("districtId", districtId);

		filter.put("homeId", homeId);

		filter.put("groupId", groupId);


		if (strscoreType.equals("2")) {
			filter.put("startTime", startTime);

			filter.put("endTime", endTime);
		} else {
			Integer quickChoice = Integer.valueOf(strquickChoice);
			List<LifeScore> timeList = getLifeScoreService()
					.ListFourWeekIndex();
			if ((timeList.size()) >= quickChoice) {
				filter.put("startTime", timeList.get(quickChoice-1)
						.getStarttime());
			} else {
				filter.put("startTime", timeList.get(timeList.size()-1)
						.getStarttime());
			}

			filter.put("endTime", timeList.get(0).getEndtime());
		}



		filter.put("dataStartNum", dataStartNum);

		filter.put("dataCount", iPageNums);

		Integer totalNum = getLifeScoreService().LifeScoreByTimeNum(filter);
		List<LifeScore> gtcList = getLifeScoreService()
				.listLifeScoreByTimePrint(filter);
		if (null == gtcList) {
			errorMsg = "未查询到符合条件的颜色信息\n";
			returnErrorInfo(errorMsg);
			return;
		}

		// 对返回数据加工
		JSONObject retObj = new JSONObject();
		JSONArray jArr = new JSONArray();
		JSONObject rowObj = null;
		Integer totalPage = BaseUtils.getFloorDev(totalNum, iPageNums);
		retObj.put("page", pageIndex); // 页码序号
		retObj.put("total", totalPage); // 总页码数
		retObj.put("records", totalNum); // 记录总数
		Integer num = dataStartNum + 1;
		int flag = 0;
		if ("2".equals(strscoreType)) {
			for (LifeScore ls : gtcList) {
				rowObj = new JSONObject();
				rowObj.put("num", num);
				rowObj.put("id", ls.getId());
				rowObj.put("userId", ls.getUserid());
				rowObj.put("morningrevialscore", ls.getMorningrevialscore());
				rowObj.put("twoaltarprayscore", ls.getTwoaltarprayscore());
				rowObj.put("psrpscore", ls.getPsrpscore());
				rowObj.put("threeoldscore", ls.getThreeoldscore());
				rowObj.put("onenewscore", ls.getOnenewscore());
				rowObj.put("personalprayscore", ls.getPersonalprayscore());
				rowObj.put("shepherdscore", ls.getShepherdscore());
				rowObj.put("gospelscore", ls.getGospelscore());
				rowObj.put("sundayscore", ls.getSundayscore());
				rowObj.put("sundayprophesy", ls.getSundayprophesy());
				rowObj.put("praymeeting", ls.getPraymeeting());
				rowObj.put("groupmeeting", ls.getGroupmeeting());
				rowObj.put("groupshare", ls.getGroupshare());
				rowObj.put("psrpmeeting", ls.getPsrpmeeting());
				rowObj.put("birdseyemeeting", ls.getBirdseyemeeting());
				rowObj.put("starttime", format.format(ls.getStarttime()));
				rowObj.put("endtime", format.format(ls.getEndtime()));
				rowObj.put("scoretype", scoreType(ls.getScoretype()));
				rowObj.put("totalscore", ls.getTotalscore());
				rowObj.put("groupid", ls.getGroupid());
				rowObj.put("userName", ls.getUserName());
				rowObj.put("sex", returnSex(ls.getSex()));
				rowObj.put("userName", ls.getUserName());
				rowObj.put("groupname", ls.getGroupname());
				retObj.put("sex", returnSex(ls.getSex()));
				jArr.add(rowObj);
				num++;
			}
			retObj.put("rows", jArr);
			retObj.put("errorMsg", errorMsg);
		} else {

			for (LifeScore ls : gtcList) {
				rowObj = new JSONObject();
				rowObj.put("num", num);
				rowObj.put("id", ls.getId());
				rowObj = new JSONObject();
				rowObj.put("userId", ls.getUserid());
				rowObj.put("morningrevialscore", ls.getMorningrevialscore());
				rowObj.put("twoaltarprayscore", ls.getTwoaltarprayscore());
				rowObj.put("psrpscore", ls.getPsrpscore());
				rowObj.put("threeoldscore", ls.getThreeoldscore());
				rowObj.put("onenewscore", ls.getOnenewscore());
				rowObj.put("personalprayscore", ls.getPersonalprayscore());
				rowObj.put("shepherdscore", ls.getShepherdscore());
				rowObj.put("gospelscore", ls.getGospelscore());
				rowObj.put("sundayscore", ls.getSundayscore());
				rowObj.put("sundayprophesy", ls.getSundayprophesy());
				rowObj.put("praymeeting", ls.getPraymeeting());
				rowObj.put("groupmeeting", ls.getGroupmeeting());
				rowObj.put("groupshare", ls.getGroupshare());
				rowObj.put("psrpmeeting", ls.getPsrpmeeting());
				rowObj.put("birdseyemeeting", ls.getBirdseyemeeting());
				rowObj.put("starttime", format.format(ls.getStarttime()));
				rowObj.put("endtime", format.format(ls.getEndtime()));
				rowObj.put("scoretype", scoreType(ls.getScoretype()));
				rowObj.put("totalscore", ls.getTotalscore());

				rowObj.put("groupid", ls.getGroupid());
				rowObj.put("userName", ls.getUserName());
				rowObj.put("sex", returnSex(ls.getSex()));
				if (flag == 0) {
					rowObj.put("userName", ls.getUserName());
					rowObj.put("groupname", ls.getGroupname());
					flag = 1;
				} else {
					rowObj.put("userName", "");
					rowObj.put("groupname", "");
				}

				if (ls.getScoretype() == 2) {
					flag = 0;
				}
				retObj.put("sex", returnSex(ls.getSex()));
				jArr.add(rowObj);
				num++;
			}
			retObj.put("rows", jArr);
			retObj.put("errorMsg", errorMsg);
		}

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
	 * 查询操练信息操作
	 */
	public void queryLifeScore() {
		try {
			this.getRequest().setCharacterEncoding("UTF-8");
			this.getResponse().setContentType("text/html;charset=utf-8");
		} catch (Exception e) {
			logger.error(e.getMessage());
			return;
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		String strgroupId = getRequest().getParameter("groupId");// 小排ID

		String strdistrictId = getRequest().getParameter("districtId");// 小排ID

		String strhomeId = getRequest().getParameter("homeId");// 小排ID

		String userName = getRequest().getParameter("userName");// 小排ID

		String strscoreType = getRequest().getParameter("scoreType");// 小排ID

		String strstartTime = getRequest().getParameter("startTime"); // 开始时间

		String strendTime = getRequest().getParameter("endTime"); // 截止时间

		String strquickChoice = getRequest().getParameter("quickChoice"); // 截止时间
		Integer groupId = null;
		Integer scoreType = null;
		Integer districtId = null;
		Integer homeId = null;
		Timestamp startTime = null;
		Timestamp endTime = null;

		String errorMsg = "";

		if (null != strgroupId && !"".equals(strgroupId)
				&& !"-1".equals(strgroupId)) {
			groupId = Integer.valueOf(strgroupId);
		}
		if (null != strdistrictId && !"".equals(strdistrictId)
				&& !"-1".equals(strdistrictId)) {
			districtId = Integer.valueOf(strdistrictId);
		}
		if (null != strhomeId && !"".equals(strhomeId)
				&& !"-1".equals(strhomeId)) {
			homeId = Integer.valueOf(strhomeId);
		}
		if (null != strscoreType && !"".equals(strscoreType)&& !"-1".equals(strscoreType)) {
			scoreType = Integer.valueOf(strscoreType);
		}

		if (null != strstartTime && !"".equals(strstartTime)) {
			startTime = Timestamp.valueOf(strstartTime);
		}

		if (null != strendTime && !"".equals(strendTime)) {
			startTime = Timestamp.valueOf(strendTime);
		}

		String pageNums = getRequest().getParameter("pageNums"); // 每页显示行数
		String pageIndex = getRequest().getParameter("pageIndex"); // 第x页
		Integer idx = 0;
		Integer iPageNums = 20;
		// Integer dataStartNum = 1;
		Map<String, Object> filter = new HashMap<String, Object>();
		Map<String, Object> result = new HashMap<String, Object>();

		try {
			if (null != pageNums && !"".equals(pageNums)) {
				iPageNums = Integer.valueOf(pageNums);
			}
			if (null != pageIndex && !"".equals(pageIndex)) {
				idx = Integer.valueOf(pageIndex);
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			errorMsg += "页面输入的数据格式错误\n";
			result.put("error", errorMsg);
			this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
		}

		Integer dataStartNum = (idx - 1) * iPageNums;
		if ("".equals(userName)) {
			filter.put("userName", null);
		} else {

			filter.put("userName", userName);
		}

		filter.put("scoreType", scoreType);

		filter.put("districtId", districtId);

		filter.put("homeId", homeId);

		filter.put("groupId", groupId);


		if (strscoreType.equals("2")) {
			filter.put("startTime", startTime);

			filter.put("endTime", endTime);
		} else {
			Integer quickChoice = Integer.valueOf(strquickChoice);
			List<LifeScore> timeList = getLifeScoreService()
					.ListFourWeekIndex();
			if ((timeList.size()) >= quickChoice) {
				filter.put("startTime", timeList.get(quickChoice-1)
						.getStarttime());
			} else {
				filter.put("startTime", timeList.get(timeList.size()-1)
						.getStarttime());
			}

			filter.put("endTime", timeList.get(0).getEndtime());
		}


		filter.put("dataStartNum", dataStartNum);

		filter.put("dataCount", iPageNums);

		Integer totalNum = getLifeScoreService().LifeScoreByTimeNum(filter);
		List<LifeScore> gtcList = getLifeScoreService().listLifeScoreByTime(
				filter);
		if (null == gtcList) {
			errorMsg = "未查询到符合条件的颜色信息\n";
			returnErrorInfo(errorMsg);
			return;
		}

		// 对返回数据加工
		JSONObject retObj = new JSONObject();
		JSONArray jArr = new JSONArray();
		JSONObject rowObj = null;
		Integer totalPage = BaseUtils.getFloorDev(totalNum, iPageNums);
		retObj.put("page", pageIndex); // 页码序号
		retObj.put("total", totalPage); // 总页码数
		retObj.put("records", totalNum); // 记录总数
		Integer num = dataStartNum + 1;
		int flag = 0;
		if ("2".equals(strscoreType)) {
			for (LifeScore ls : gtcList) {
				rowObj = new JSONObject();
				rowObj.put("num", num);
				rowObj.put("id", ls.getId());
				rowObj = new JSONObject();
				rowObj.put("userId", ls.getUserid());
				rowObj.put("morningrevialscore", ls.getMorningrevialscore());
				rowObj.put("twoaltarprayscore", ls.getTwoaltarprayscore());
				rowObj.put("psrpscore", ls.getPsrpscore());
				rowObj.put("threeoldscore", ls.getThreeoldscore());
				rowObj.put("onenewscore", ls.getOnenewscore());
				rowObj.put("personalprayscore", ls.getPersonalprayscore());
				rowObj.put("shepherdscore", ls.getShepherdscore());
				rowObj.put("gospelscore", ls.getGospelscore());
				rowObj.put("sundayscore", ls.getSundayscore());
				rowObj.put("sundayprophesy", ls.getSundayprophesy());
				rowObj.put("praymeeting", ls.getPraymeeting());
				rowObj.put("groupmeeting", ls.getGroupmeeting());
				rowObj.put("groupshare", ls.getGroupshare());
				rowObj.put("psrpmeeting", ls.getPsrpmeeting());
				rowObj.put("birdseyemeeting", ls.getBirdseyemeeting());
				rowObj.put("starttime", format.format(ls.getStarttime()));
				rowObj.put("endtime", format.format(ls.getEndtime()));
				rowObj.put("scoretype", scoreType(ls.getScoretype()));
				rowObj.put("totalscore", ls.getTotalscore());
				rowObj.put("groupid", ls.getGroupid());
				rowObj.put("userName", ls.getUserName());
				rowObj.put("sex", returnSex(ls.getSex()));
				rowObj.put("userName", ls.getUserName());
				rowObj.put("groupname", ls.getGroupname());
				retObj.put("sex", returnSex(ls.getSex()));
				jArr.add(rowObj);
				num++;
			}
			retObj.put("rows", jArr);

		} else {

			for (LifeScore ls : gtcList) {
				rowObj = new JSONObject();
				rowObj.put("num", num);
				rowObj.put("id", ls.getId());
				rowObj = new JSONObject();
				rowObj.put("userId", ls.getUserid());
				rowObj.put("morningrevialscore", ls.getMorningrevialscore());
				rowObj.put("twoaltarprayscore", ls.getTwoaltarprayscore());
				rowObj.put("psrpscore", ls.getPsrpscore());
				rowObj.put("threeoldscore", ls.getThreeoldscore());
				rowObj.put("onenewscore", ls.getOnenewscore());
				rowObj.put("personalprayscore", ls.getPersonalprayscore());
				rowObj.put("shepherdscore", ls.getShepherdscore());
				rowObj.put("gospelscore", ls.getGospelscore());
				rowObj.put("sundayscore", ls.getSundayscore());
				rowObj.put("sundayprophesy", ls.getSundayprophesy());
				rowObj.put("praymeeting", ls.getPraymeeting());
				rowObj.put("groupmeeting", ls.getGroupmeeting());
				rowObj.put("groupshare", ls.getGroupshare());
				rowObj.put("psrpmeeting", ls.getPsrpmeeting());
				rowObj.put("birdseyemeeting", ls.getBirdseyemeeting());
				rowObj.put("starttime", format.format(ls.getStarttime()));
				rowObj.put("endtime", format.format(ls.getEndtime()));
				rowObj.put("scoretype", scoreType(ls.getScoretype()));
				rowObj.put("totalscore", ls.getTotalscore());

				rowObj.put("groupid", ls.getGroupid());
				rowObj.put("userName", ls.getUserName());
				rowObj.put("sex", returnSex(ls.getSex()));
				if (flag == 0) {
					rowObj.put("userName", ls.getUserName());
					rowObj.put("groupname", ls.getGroupname());
					flag = 1;
				} else {
					rowObj.put("userName", "");
					rowObj.put("groupname", "");
				}

				if (ls.getScoretype() == 2) {
					flag = 0;
				}
				retObj.put("sex", returnSex(ls.getSex()));
				jArr.add(rowObj);
				num++;
			}
			retObj.put("rows", jArr);
			retObj.put("errorMsg", errorMsg);
		}

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

	public String scoreType(Integer scoretype) {
		if (scoretype == 1) {
			return "";

		} else {
			return "汇总";
		}

	}

	public String returnSex(Integer sex) {
		if (sex == 0) {
			return "弟兄";
		} else {
			return "姊妹";

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

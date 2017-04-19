package com.huifu.action;

import java.io.PrintWriter;
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
import com.huifu.entity.RequestInfo;
import com.huifu.service.impl.RequestInfoService;

/**
 * 申请信息Action操作
 */
@Controller
public class RequestInfoAction extends BaseAction {
	private RequestInfoService requestInfoService;
	static Logger logger = LogManager.getLogger(RequestInfoAction.class
			.getName());

	/**
	 * 更新申请信息操作
	 */
	public String updateRequestInfo() {
		try {
			this.getRequest().setCharacterEncoding("UTF-8");
			this.getResponse().setContentType("text/html;charset=utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}

		String strId = getRequest().getParameter("id");
		// 获取页面参数
		String requestInfoName = getRequest().getParameter("requestInfoName");
		String requestInfoDesc = getRequest().getParameter("requestInfoDesc");
		String strdistrictId = getRequest().getParameter("districtId");
		String errorMsg = "";
		Integer id = null;
		Integer districtId = null;
		Map<String, Object> result = new HashMap<String, Object>();
		if (null == strId || "".equals(strId)) {
			errorMsg += "页面传递的申请信息类型id为空\n";
		}
		if (null == requestInfoName || "".equals(requestInfoName)
				|| requestInfoName.trim().length() == 0) {
			errorMsg += "页面传递的申请信息类型名称为空\n";
		}

		if (null == strdistrictId || "".equals(strdistrictId)
				|| "-1".equals(strdistrictId)) {
			errorMsg += "页面传递的申请信息类型名称为空\n";
		}

		try {
			districtId = Integer.valueOf(strdistrictId);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errorMsg += "页面传递的区数据格式错误\n";
		}

		try {
			id = Integer.valueOf(strId);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errorMsg += "页面传递的区数据格式错误\n";
		}
		if (!"".equals(errorMsg)) {
			result.put("errorMsg", errorMsg);
			this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
			return "ajax";
		}

		RequestInfo gtc = new RequestInfo();

		gtc.setId(id);
		// gtc.setRequestInfoname(requestInfoName);
		// gtc.setRequestInfodesc(requestInfoDesc);
		gtc.setGroupid(districtId);
		gtc.setSystemcode(Constant.SYSTEM_CODE);
		Integer iNum = getRequestInfoService().updateByPrimaryKeySelective(gtc);
		if (0 >= iNum) {
			errorMsg += "区在数据库中更新失败\n";
		}

		result.put("errorMsg", errorMsg);
		this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
		return "ajax";
	}

	/**
	 * 查询申请信息操作
	 */
	public void queryRequestInfo() {
		try {
			this.getRequest().setCharacterEncoding("UTF-8");
			this.getResponse().setContentType("text/html;charset=utf-8");
		} catch (Exception e) {
			logger.error(e.getMessage());
			return;
		}
		String userName = getRequest().getParameter("userName");// 申请信息类型名称

		String pageNums = getRequest().getParameter("pageNums"); // 每页显示行数
		String pageIndex = getRequest().getParameter("pageIndex"); // 第x页
		Integer districtId = null;
		Integer idx = 0;
		Integer iPageNums = 20;
		// Integer dataStartNum = 1;
		String errorMsg = "";
		Map<String, Object> filter = new HashMap<String, Object>();
		Map<String, Object> result = new HashMap<String, Object>();

		
		Integer dataStartNum = (idx - 1) * iPageNums;
		filter.put("userName", userName);
		filter.put("dataStartNum", dataStartNum);
		filter.put("dataCount", iPageNums);

		Integer totalNum = getRequestInfoService().queryRequestInfoNum(filter);
		List<RequestInfo> gtcList = getRequestInfoService().queryRequestInfo(
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

		for (RequestInfo gtc : gtcList) {
			rowObj = new JSONObject();
			rowObj.put("num", num);
			rowObj.put("id", gtc.getId());
			rowObj.put("UserId", gtc.getUserid());
			rowObj.put("userName", gtc.getUsername());
			rowObj.put("sex", gtc.getSex());
			rowObj.put("groupName", gtc.getGroupname());
			rowObj.put("homeName", gtc.getHomename());
			rowObj.put("info", gtc.getInfo());
			rowObj.put("statusinfo", gtc.getStatusinfo());
			rowObj.put("statusinfoName", returnStatusInfo(gtc.getStatusinfo()));
			jArr.add(rowObj);
			num++;
		}
		retObj.put("rows", jArr);

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

	public String returnStatusInfo(Integer StatusInfo) {
		if (StatusInfo == 0) {
			return "申请中";
		} else {
			return "服侍者";
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

	public RequestInfoService getRequestInfoService() {
		return requestInfoService;
	}

	public void setRequestInfoService(RequestInfoService requestInfoService) {
		this.requestInfoService = requestInfoService;
	}

}

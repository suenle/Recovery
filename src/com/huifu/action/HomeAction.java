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
import com.huifu.entity.Home;
import com.huifu.service.impl.HomeService;

/**
 * 区域Action操作
 */
@Controller
public class HomeAction extends BaseAction {
	private HomeService homeService;
	static Logger logger = LogManager.getLogger(HomeAction.class.getName());

	/**
	 * 添加区域操作
	 */
	public String addHome() {
		try {
			this.getRequest().setCharacterEncoding("UTF-8");
			this.getResponse().setContentType("text/html;charset=utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 获取页面参数
		String homeName = getRequest().getParameter("homeName");
		String homeDesc = getRequest().getParameter("homeDesc");
		String strdistrictId = getRequest().getParameter("districtId");
		String errorMsg = "";
		Integer districtId = null;

		Map<String, Object> result = new HashMap<String, Object>();
		if (null == homeName || "".equals(homeName)
				|| homeName.trim().length() == 0) {
			errorMsg += "页面传递的区名称为空\n";
		}
		if (null == strdistrictId || "".equals(strdistrictId)
				|| "-1".equals(strdistrictId)) {
			errorMsg += "页面传递的区名称为空\n";
		}
		if (!"".equals(errorMsg)) {
			result.put("errorMsg", errorMsg);
			this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
			return "ajax";
		}
		try {
			districtId = Integer.valueOf(strdistrictId);
		} catch (Exception e) {
			errorMsg += "数据转换失败\n";
			result.put("errorMsg", errorMsg);
			this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
			return "ajax";
		}

		Home gtc = new Home();
		gtc.setHomename(homeName);

		Home strGtc = getHomeService().HomeIsExist(gtc);

		if (null != strGtc) {
			errorMsg += "该区名称已存在\n";
			result.put("errorMsg", errorMsg);
			this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
			return "ajax";
		}
		gtc.setGroupid(districtId);
		gtc.setHomedesc(homeDesc);
		gtc.setSystemcode(Constant.SYSTEM_CODE);
		Integer iNum = getHomeService().insertSelective(gtc);
		if (0 >= iNum) {
			errorMsg += "区域类型在数据库中添加失败\n";
		}

		result.put("homeId", gtc.getId());
		System.out.println(gtc.getId());
		result.put("errorMsg", errorMsg);
		this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
		return "ajax";
	}

	/**
	 * 删除区域操作
	 */
	public String deleteHome() {
		try {
			this.getRequest().setCharacterEncoding("UTF-8");
			this.getResponse().setContentType("text/html;charset=utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}

		String strId = getRequest().getParameter("id");
		String errorMsg = "";
		Integer id = null;
		Map<String, Object> result = new HashMap<String, Object>();
		if (null == strId || "".equals(strId)) {
			errorMsg += "页面输入的区域类型id为空\n";
		}
		try {
			id = Integer.valueOf(strId);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errorMsg += "页面输入的区域类型数据格式错误\n";
		}
		if (!"".equals(errorMsg)) {
			result.put("errorMsg", errorMsg);
			this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
			return "ajax";
		}

		Integer iNum = getHomeService().deleteByPrimaryKey(id);
		if (0 >= iNum) {
			errorMsg = "该区域类型已被使用，暂时无法修改";
			result.put("errorMsg", errorMsg);
			this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
			return "ajax";
		}

		result.put("errorMsg", errorMsg);
		this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
		return "ajax";
	}

	/**
	 * 更新区域操作
	 */
	public String updateHome() {
		try {
			this.getRequest().setCharacterEncoding("UTF-8");
			this.getResponse().setContentType("text/html;charset=utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}

		String strId = getRequest().getParameter("id");
		// 获取页面参数
		String homeName = getRequest().getParameter("homeName");
		String homeDesc = getRequest().getParameter("homeDesc");
		String strdistrictId = getRequest().getParameter("districtId");
		String errorMsg = "";
		Integer id = null;
		Integer districtId = null;
		Map<String, Object> result = new HashMap<String, Object>();
		if (null == strId || "".equals(strId)) {
			errorMsg += "页面传递的区域类型id为空\n";
		}
		if (null == homeName || "".equals(homeName)
				|| homeName.trim().length() == 0) {
			errorMsg += "页面传递的区域类型名称为空\n";
		}

		if (null == strdistrictId || "".equals(strdistrictId)
				|| "-1".equals(strdistrictId)) {
			errorMsg += "页面传递的区域类型名称为空\n";
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

		Home gtc = new Home();

		gtc.setId(id);
		gtc.setHomename(homeName);
		gtc.setHomedesc(homeDesc);
		gtc.setGroupid(districtId);
		gtc.setSystemcode(Constant.SYSTEM_CODE);
		Integer iNum = getHomeService().updateByPrimaryKeySelective(gtc);
		if (0 >= iNum) {
			errorMsg += "区在数据库中更新失败\n";
		}

		result.put("errorMsg", errorMsg);
		this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
		return "ajax";
	}

	/**
	 * 查询区域操作
	 */
	public void queryHome() {
		try {
			this.getRequest().setCharacterEncoding("UTF-8");
			this.getResponse().setContentType("text/html;charset=utf-8");
		} catch (Exception e) {
			logger.error(e.getMessage());
			return;
		}
		String homeName = getRequest().getParameter("homeName");// 区域类型名称

		String strdistrictId = getRequest().getParameter("districtId");// 区域类型名称
		String pageNums = getRequest().getParameter("pageNums"); // 每页显示行数
		String pageIndex = getRequest().getParameter("pageIndex"); // 第x页
		Integer districtId = null;
		Integer idx = 0;
		Integer iPageNums = 20;
		// Integer dataStartNum = 1;
		String errorMsg = "";
		Map<String, Object> filter = new HashMap<String, Object>();
		Map<String, Object> result = new HashMap<String, Object>();

		try {
			if (null == strdistrictId || "".equals(strdistrictId)
					|| "-1".equals(strdistrictId)) {

			}else{
				districtId=Integer.valueOf(strdistrictId);
			}
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
		filter.put("homeName", homeName);
		filter.put("districtId", districtId);
		filter.put("dataStartNum", dataStartNum);
		filter.put("dataCount", iPageNums);

		Integer totalNum = getHomeService().getHomeNum(filter);
		List<Home> gtcList = getHomeService().queryHome(filter);
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

		for (Home gtc : gtcList) {
			rowObj = new JSONObject();
			rowObj.put("num", num);
			rowObj.put("id", gtc.getId());
			rowObj.put("homeName", gtc.getHomename());
			rowObj.put("homeDesc", gtc.getHomedesc());
			rowObj.put("districtId", gtc.getDistrictid());
			rowObj.put("districtName", gtc.getDistrictname());
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

	public HomeService getHomeService() {
		return homeService;
	}

	public void setHomeService(HomeService homeService) {
		this.homeService = homeService;
	}

}

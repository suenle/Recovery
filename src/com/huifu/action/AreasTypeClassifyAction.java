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


/**
 * 区域Action操作
 */
@Controller
public class AreasTypeClassifyAction extends BaseAction{
	/*private AreasTypeClassifyService areasTypeClassifyService;
	private StoreAreaService storeAreaService;	
	static Logger logger = LogManager.getLogger(AreasTypeClassifyAction.class.getName());
	

	*//**
	 * 查询所有区域(下拉框效果)
	 *//*
	public String getAreasTypeClassify() {
		try {
			this.getRequest().setCharacterEncoding("UTF-8");
			this.getResponse().setContentType("text/html;charset=utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		String errorMsg = "";
		Map<String, Object> result = new HashMap<String, Object>();
		List<AreasTypeClassify> AreasTypeClassifyList = areasTypeClassifyService.getAllAreasTypeName();
		if (null == AreasTypeClassifyList || 0 >= AreasTypeClassifyList.size()) {
			errorMsg += "数据库中未查询到符合条件的区域信息\n";
		}
		if (!"".equals(errorMsg)) {
			result.put("errorMsg", errorMsg);
			this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
			return "ajax";
		}
		JSONArray jArr = new JSONArray();
		JSONObject rowObj = null;
		for (AreasTypeClassify areasTypeClassify : AreasTypeClassifyList) {
			rowObj = new JSONObject();
			rowObj.put("id", areasTypeClassify.getId());
			rowObj.put("areastypename", areasTypeClassify.getAreastypename());
			jArr.add(rowObj);
		}
		result.put("errorMsg", errorMsg);
		result.put("areasTypeClassifyInfo", jArr);
		this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
		return "ajax";

	}

	*//**
	 * 添加区域操作
	 *//*
	public String addAreasTypeClassify() {
		try {
			this.getRequest().setCharacterEncoding("UTF-8");
			this.getResponse().setContentType("text/html;charset=utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 获取页面参数
		String areasTypeName = getRequest().getParameter("areasTypeName");
		String areasTypeDesc = getRequest().getParameter("areasTypeDesc");
		String errorMsg = "";
		Map<String, Object> result = new HashMap<String, Object>();
		if (null == areasTypeName || "".equals(areasTypeName) || areasTypeName.trim().length()==0) {
			errorMsg += "页面传递的区域类型名称为空\n";
		}
		if (!"".equals(errorMsg)) {
			result.put("errorMsg", errorMsg);
			this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
			return "ajax";
		}

		AreasTypeClassify gtc = new AreasTypeClassify();
		gtc.setAreastypename(areasTypeName);
		AreasTypeClassify strGtc = getAreasTypeClassifyService()
				.areasTypeClassifyIsExist(gtc);
		if (null != strGtc) {
			errorMsg += "该区域类型名称已存在\n";
			result.put("errorMsg", errorMsg);
			this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
			return "ajax";
		}
		gtc.setAreastypedesc(areasTypeDesc);
		gtc.setSystemcode(Constant.SYSTEM_CODE);
		Integer iNum = getAreasTypeClassifyService().addAreasTypeClassify(gtc);
		if (0 >= iNum) {
			errorMsg += "区域类型在数据库中添加失败\n";
		}

		result.put("areasTypeClassifyId", gtc.getId());
		System.out.println(gtc.getId());
		result.put("errorMsg", errorMsg);
		this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
		return "ajax";
	}

	*//**
	 * 删除区域操作
	 *//*
	public String deleteAreasTypeClassify() {
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
		if(id==1||id==2){
			errorMsg += "系统固定数据无法删除\n";
			result.put("errorMsg", errorMsg);
			this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
			return "ajax";
			
		}
		
		// 查询区域类型id在区域表中是否被使用
		List<StoreArea> storeAreaList=getStoreAreaService().getStoreAreaByAreaType(id);
		if(storeAreaList.size()>0){
			errorMsg = "该区域类型已被使用，暂时无法修改";
			result.put("errorMsg", errorMsg);
			this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
			return "ajax";
				}
		Integer iNum = getAreasTypeClassifyService()
				.deleteAreasTypeClassify(id);
		if (0 >= iNum) {
			errorMsg += "区域类型在数据库中删除失败\n";
		}

		result.put("errorMsg", errorMsg);
		this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
		return "ajax";
	}

	*//**
	 * 更新区域操作
	 *//*
	public String updateAreasTypeClassify() {
		try {
			this.getRequest().setCharacterEncoding("UTF-8");
			this.getResponse().setContentType("text/html;charset=utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}

		String strId = getRequest().getParameter("id");
		String areasTypeName = getRequest().getParameter("areasTypeName");
		String areasTypeDesc = getRequest().getParameter("areasTypeDesc");
		String errorMsg = "";
		Integer id = null;
		Map<String, Object> result = new HashMap<String, Object>();
		if (null == strId || "".equals(strId)) {
			errorMsg += "页面传递的区域类型id为空\n";
		}
		if (null == areasTypeName || "".equals(areasTypeName) || areasTypeName.trim().length()==0) {
			errorMsg += "页面传递的区域类型名称为空\n";
		}
		try {
			id = Integer.valueOf(strId);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errorMsg += "页面传递的区域类型数据格式错误\n";
		}
		if (!"".equals(errorMsg)) {
			result.put("errorMsg", errorMsg);
			this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
			return "ajax";
		}

		AreasTypeClassify gtc = new AreasTypeClassify();
		
		gtc.setId(id);
		gtc.setAreastypename(areasTypeName);
		gtc.setAreastypedesc(areasTypeDesc);
		gtc.setSystemcode(Constant.SYSTEM_CODE);
		Integer iNum = getAreasTypeClassifyService().updateAreasTypeClassify(
				gtc);
		if (0 >= iNum) {
			errorMsg += "区域类型在数据库中更新失败\n";
		}

		result.put("errorMsg", errorMsg);
		this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
		return "ajax";
	}

	*//**
	 * 查询区域操作
	 *//*
	public void queryAreasTypeClassify() {
		try {
			this.getRequest().setCharacterEncoding("UTF-8");
			this.getResponse().setContentType("text/html;charset=utf-8");
		} catch (Exception e) {
			logger.error(e.getMessage());
			return;
		}
		String areasTypeName = getRequest().getParameter("areasTypeName");// 区域类型名称
		String pageNums = getRequest().getParameter("pageNums"); // 每页显示行数
		String pageIndex = getRequest().getParameter("pageIndex"); // 第x页
		Integer idx = 0;
		Integer iPageNums = 20;
		// Integer dataStartNum = 1;
		String errorMsg = "";
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
		filter.put("areasTypeName", areasTypeName);
		filter.put("dataStartNum", dataStartNum);
		filter.put("dataCount", iPageNums);

		Integer totalNum = getAreasTypeClassifyService()
				.getAreasTypeClassifyNum(filter);
		List<AreasTypeClassify> gtcList = getAreasTypeClassifyService()
				.queryAreasTypeClassify(filter);
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
		 Integer num=dataStartNum+1;
		
		for (AreasTypeClassify gtc : gtcList) {
			rowObj = new JSONObject();
			rowObj.put("num",num); 
			rowObj.put("id", gtc.getId());
			rowObj.put("areasTypeName", gtc.getAreastypename());
			rowObj.put("areasTypeDesc", gtc.getAreastypedesc());
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

	*//**
	 * 返回页面报错
	 *//*
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


	public AreasTypeService getAreasTypeService() {
		return areasTypeService;
	}

	public void setAreasTypeService(AreasTypeService areasTypeService) {
		this.areasTypeService = areasTypeService;
	}
	
	

	

	public StoreAreaService getStoreAreaService() {
		return storeAreaService;
	}

	public void setStoreAreaService(StoreAreaService storeAreaService) {
		this.storeAreaService = storeAreaService;
	}
	

	
	public AreasTypeClassifyService getAreasTypeClassifyService() {
		return areasTypeClassifyService;
	}


	public void setAreasTypeClassifyService(
			AreasTypeClassifyService areasTypeClassifyService) {
		this.areasTypeClassifyService = areasTypeClassifyService;
	}
	*/
}

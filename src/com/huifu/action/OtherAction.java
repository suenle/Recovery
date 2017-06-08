package com.huifu.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;

import com.huifu.base.BaseAction;
import com.huifu.constant.Constant;
import com.huifu.entity.Church;
import com.huifu.entity.District;
import com.huifu.entity.Group;
import com.huifu.entity.Home;
import com.huifu.entity.User;
import com.huifu.entity.UserInfo;
import com.huifu.service.impl.ChurchService;
import com.huifu.service.impl.DistrictService;
import com.huifu.service.impl.GroupService;
import com.huifu.service.impl.HomeService;
import com.huifu.service.impl.TransactionManagerService;
import com.huifu.service.impl.UserInfoService;
import com.huifu.service.impl.UserService;

/**
 * 操练表相关Action
 */
@Controller
public class OtherAction extends BaseAction {

	/**
	 * 获取现有的地址信息
	 * 
	 */
	public String getLink() {
		setUtfEncoding();
		String errorMsg = "";
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("cx", Constant.WECHAT_CX);
		result.put("cxp", Constant.WECHAT_CX_PASSWORD);
		result.put("xp", Constant.WECHAT_XP);
		result.put("xpp", Constant.WECHAT_XP_PASSWORD);
		result.put("qt", Constant.WECHAT_QT);
		result.put("qtp", Constant.WECHAT_QT_PASSWORD);
		result.put("errorMsg", errorMsg);
		this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
		return "ajax";
	}

	/**
	 * 修改地址
	 * 
	 * @return
	 */
	public String updateLink() {
		setUtfEncoding();
		String errorMsg = "";
		Constant.WECHAT_CX = getRequest().getParameter("cx");
		Constant.WECHAT_CX_PASSWORD = getRequest().getParameter("cxp");
		Constant.WECHAT_XP = getRequest().getParameter("xp");
		Constant.WECHAT_XP_PASSWORD = getRequest().getParameter("xpp");
		Constant.WECHAT_QT = getRequest().getParameter("qt");
		Constant.WECHAT_QT_PASSWORD = getRequest().getParameter("qtp");
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("errorMsg", errorMsg);
		this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
		return "ajax";
	}

}

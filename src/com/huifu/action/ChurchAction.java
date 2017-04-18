package com.huifu.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;

import sun.org.mozilla.javascript.internal.Undefined;

import com.huifu.base.BaseAction;
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
public class ChurchAction extends BaseAction {

	private UserInfoService userInfoService;

	private UserService userService;

	private ChurchService churchService;

	private GroupService groupService;

	private DistrictService districtService;

	private HomeService homeService;

	private TransactionManagerService transactionManagerService;

	public ChurchService getChurchService() {
		return churchService;
	}

	public void setChurchService(ChurchService churchService) {
		this.churchService = churchService;
	}

	public GroupService getGroupService() {
		return groupService;
	}

	public void setGroupService(GroupService groupService) {
		this.groupService = groupService;
	}

	public DistrictService getDistrictService() {
		return districtService;
	}

	public void setDistrictService(DistrictService districtService) {
		this.districtService = districtService;
	}

	public HomeService getHomeService() {
		return homeService;
	}

	public void setHomeService(HomeService homeService) {
		this.homeService = homeService;
	}

	public TransactionManagerService getTransactionManagerService() {
		return transactionManagerService;
	}

	public void setTransactionManagerService(
			TransactionManagerService transactionManagerService) {
		this.transactionManagerService = transactionManagerService;
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

	/**
	 * 添加个人信息
	 * 
	 */
	public String addGroupOrHome() {

		setUtfEncoding();

		String strdistrictID = getRequest().getParameter("districtId");

		String addType = getRequest().getParameter("addType");

		String userName = getRequest().getParameter("userName");
		
		String errorMsg = "";

		Map<String, Object> result = new HashMap<String, Object>();
		
		if ("Undefined" == strdistrictID || "" == strdistrictID || "-1" == strdistrictID) {
			errorMsg = "请选择所属区";
			result.put("error", errorMsg);
			this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
			return "/pages/Addhomeorgroup.jsp";
		}

		if ("Undefined" == userName || "" == userName || userName==null) {
			errorMsg = "请输入名称";
			result.put("error", errorMsg);
			this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
			return "/pages/Addhomeorgroup.jsp";
		}
		

		Integer districtID = null;

		if (strdistrictID != null && !strdistrictID.equals("")) {

			districtID = Integer.valueOf(strdistrictID);
		}

		Integer iNum = 0;

		if (addType.equals("0")) {
			Group group = new Group();
			group.setDistrictid(districtID);
			group.setGroupname(userName);

			Group querygroup = getGroupService().selectByName(group);
			if (querygroup == null) {
				iNum = getGroupService().insertSelective(group);
			} else {
				errorMsg = userName + "已存在！";
				result.put("error", errorMsg);
				this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
				return "/pages/Addhomeorgroup.jsp";
			}

		} else {
			Home home = new Home();

			home.setGroupid(districtID);
			home.setHomename(userName);
			Home queryhome = getHomeService().selectByName(home);

			if (queryhome == null) {
				iNum = getHomeService().insertSelective(home);
			} else {
				errorMsg = userName + "已存在！";
				result.put("error", errorMsg);
				this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
				return "/pages/Addhomeorgroup.jsp";
			}

			iNum = getHomeService().insertSelective(home);

		}

		if (iNum > 0) {
			// 跳转至单天操练信息
			return "redirect:RecoveryLife/endinfo.do";
		} else {
			errorMsg = "添加失败";
			result.put("error", errorMsg);
			this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
			return "/pages/Addhomeorgroup.jsp";
		}
	}

	/**
	 * 添加个人信息
	 * 
	 * @return
	 */
	public String updateInfo() {
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
		userInfo.setUsername(name);
		userInfo.setSex(sex);
		userInfo.setGroupid(groupID);
		userInfo.setHomeid(homeID);
		userInfo.setUserid(userid);

		int iNum = 0;
		// 暂时用这种方式控制事物
		try {
			iNum = getUserInfoService().updateByPrimaryKeySelectiveByUserID(
					userInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (iNum > 0) {
			// 跳转至单天操练信息
			return "redirect:/RecoveryLife/recoveryLifeInfo.do";
		} else {
			// 跳转提醒重新填写
			Map<String, Object> result = new HashMap<String, Object>();
			String errorMsg = "修改出错请重试";
			result.put("errorMsg", errorMsg);
			this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);
			return "/login.jsp";
		}
	}

	/**
	 * 一次性把四级的信息都获取
	 * 
	 * @return
	 */
	public String getChurchInfo() {

		setUtfEncoding();

		String errorMsg = "";

		List<Church> churchList = getChurchService().getAllChurch();

		List<District> districtList = getDistrictService().getAllDistrict();

		List<Group> groupList = getGroupService().getAllGroup();

		List<Home> homeList = getHomeService().getAllHome();

		Map<String, Object> result = new HashMap<String, Object>();

		result.put("churchList", churchList);

		result.put("districtList", districtList);

		result.put("groupList", groupList);

		result.put("homeList", homeList);

		if (churchList.isEmpty() || districtList.isEmpty()
				|| groupList.isEmpty() || homeList.isEmpty()) {

			errorMsg = "获取数据出错请刷新页面";
		}
		result.put("errorMsg", errorMsg);

		this.getRequest().setAttribute("GSON_RESULT_OBJECT", result);

		return "ajax";

	}
}

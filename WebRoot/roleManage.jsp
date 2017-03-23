<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/pages/commons/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title>江苏云道仓储管理系统</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="css/style.css" rel="stylesheet" type="text/css">
	<link href="css/stylemain.css" rel="stylesheet" type="text/css">
	<link rel="StyleSheet" href="css/dtree_4Role.css" type="text/css" />
	<link rel="stylesheet" type="text/css" media="screen" href="css/ui.jqgrid.css" />
	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/jqGrid/i18n/grid.locale-en.js" type="text/javascript"></script>
	<script src="js/jqGrid/jquery.jqGrid.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/dtree.js"></script>
	<!-- link 日历资源 -->
	<link rel="stylesheet" type="text/css" href="../css/jquery.datetimepicker.css"/>
	<script src="../js/jquery.datetimepicker.js"></script>
	<!-- jquery对话框资源 -->
	<script src="js/jqEasyui/jquery.easyui.min.js" type="text/javascript"></script>
   	<script src="js/jqEasyui/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
   	<link href="css/jqEasyui/themes/gray/easyui.css" rel="stylesheet" type="text/css" />
   	<link href="css/jqEasyui/icon.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		/*#keyword_id_roleUserGroup::-webkit-scrollbar{width:0px;}*/
		.bg_prompt{
			width:250px;
			height:30px;
			background-image: url('/StoreManagement/images/common/bg_prompt.png');
			background-repeat: no-repeat;
		}
		#keyword_id_roleUserGroup option:nth-child(odd){
			background:#EEF7FF;
		}
	</style>
</head>
<body>
		<input type="hidden" id="keyword_id_role_allRoles" value="" />
		<input type="hidden" id="keyword_id_role_allStores" value="" />

	<table width="100%" height="100%" border="0" bordercolor="red" cellspacing="0" cellpadding="3">
	  <tr>
		<td height="34" width="100%" style="padding:0px;background-color: white;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="line-height: 34px;height: 34px;">
				<tr>
					<td class="barWord">
						&nbsp;&nbsp;<img src="/StoreManagement/images/icon_card.gif" width="16" height="16" align="absmiddle" style="margin-bottom: 4px;">
						当前位置&nbsp;<img src="/StoreManagement/images/common/rightArrow.png" width="8" height="14" align="absmiddle" style="margin-bottom: 2px;">
						系统设置&nbsp;<img src="/StoreManagement/images/common/rightArrow.png" width="8" height="14" align="absmiddle" style="margin-bottom: 2px;">
						权限管理
					</td>
					<td align="right" class="white" style="padding-right:20px">
						<a href="#" class="barBtn" onClick="javascript:history.go(-1);">
							<img src="/StoreManagement/images/btn_left.gif" width="18" height="18" align="absmiddle"> 后退
						</a> 
						<a href="#" class="barBtn" onClick="javascript:history.go(+1);">
							<img src="/StoreManagement/images/btn_right.gif" width="18" height="18" align="absmiddle"> 前进
						</a> 
						<a href="#" class="barBtn" onclick="javascript:location.reload();">
							<img src="/StoreManagement/images/btn_refresh.gif" width="18" height="18" align="absmiddle"> 刷新
						</a>
					</td>
				</tr>
			</table>
		</td>
	  </tr>
	  
	    <td style="border-bottom:1px solid #cfd8e0;background-color:#ffffff;" height="100%" valign="top">
	    	<table width="100%" height="650" border="0" bordercolor="red" cellspacing="0" cellpadding="0">
	    		<tr>
	    			<td width="25%" height="100%" align="center" valign="top">
	    				<div style="vertical-align:top;">
	    					<table  width="100%" height="100%" border="0" bordercolor="blue" cellspacing="0" cellpadding="0">
	    						<tr>
		    						<td height="100%" align="right" style="padding-left: 60px;">
				    					<!-- 用户组列表框 -->
				    					<br />
				    					<div>
				    						 <div style="width: 190px;height: 25px;line-height: 25px;padding: 5px 30px 5px 30px;text-align: center;background-image: url('/StoreManagement/images/common/bg_prompt.png');background-size:100%;background-repeat: no-repeat;">
				    						 	<span style="font-size: 15px;font-family: 微软雅黑;color: #ffffff;">请选择用户组</span>
				    						 </div>
				    					</div>
				    					<br />
				    					<select id="keyword_id_roleUserGroup" onclick="javascript:getUserGroupRoles();" size="20" style="width:250px;height:500px;border:1px solid #484891;font-size:18px;overflow-y: scroll;outline: none;text-align: center;font-family: 微软雅黑;">
				    						
				    					</select>
		    						</td>
	    						</tr>
	    						<tr>
	    							<td align="center">
	    								<table width="100%" height="100%">
	    									<tr>
	    										<td height="12"></td>	
	    									</tr>
	    									<tr>
	    										<td width="75%">
	    										</td>
	    										<td width="25%" align="right" style="padding-right: 75px;">
	    											<input type="button" style="width: 100px;height: 30px;background-color: #5DAF54;color: #ffffff;font-size: 15px;font-family: 微软雅黑;border: none;outline: none;cursor: pointer;border-radius: 4px;" value="提交"  onClick="javascript:commitGroupRoles();" />
	    										</td>
	    									</tr>
	    									<tr>
	    										<td height="13"></td>	
	    									</tr>
	    								</table>
	    							</td>
	    						</tr>
	    					</table>
	    				</div>
	    			</td>
	    			<td>
	    				<div style="width:50px;">
	    					<!-- 中间隔离div -->
	    					
	    				</div>
	    			</td>
	    			<td align="left">
	    				<div>
	    					<div style="width: 190px;height: 25px;line-height: 25px;padding: 5px 30px 5px 30px;text-align: center;background-image: url('/StoreManagement/images/common/bg_prompt.png');background-size:100%;background-repeat: no-repeat;margin-top: -70px;">
    						 	<span style="font-size: 15px;font-family: 微软雅黑;color: #ffffff;">用户组已配置权限列表</span>
    						 </div>
	    				</div>
    					<br /><!-- background:#cfd8e0; -->
	    				<div id="" style="width:450px;height:500px;overflow-y:scroll;border:1px solid #484891;background-color: #EEF7FF;">
	    					<!-- 权限配置复选框菜单树 -->
	    					<table width="100%" height="100%" border="0" bordercolor="red" cellpadding="0" cellspacing="0">
	    						<tr height="500">
	    							<td width="50%" id="keyword_id_roleMenuTree" valign="top"></td>
	    							<td width="50%" id="keyword_id_roleStoreTree" valign="top"></td>
	    						</tr>
	    					</table>
	    				</div>
	    			</td>	
	    		</tr>
	    	</table>
			</td>
		</tr>
	</table>
	
</body>
</html>

<script language="javascript">
	// 页面初始化
	$(document).ready(function(){
		$.browser={};
		$.browser.msie=false; 
		$.browser.version=0;
		if(navigator.userAgent.match(/MSIE ([0-9]+)./)){ 
			$.browser.msie=true;
			$.browser.version=RegExp.$1;
		}
		
		// 获取全部用户组
		$.ajax({
			type : "POST",
			url : "${ctx}/UserGroup/getAllUserGroup.do",
			data : {
				needTitle : "no"					// 是否需要"全部"标题
			},
			async : false,
			cache : false,
			success : function(data) {
				var errorMsg = data.errorMsg;
				if("" != errorMsg)
				{
					alert(errorMsg);
					return ;
				}
				var groupInfo = data.userGroupInfo;
				if(null == groupInfo || 0 >= groupInfo.length)
				{
					alert(未获取到用户组数据);	
				}
				
				for(var nloop = 0; nloop < groupInfo.length; nloop ++)
				{
					var strOption = "<option style='text-align: center;width: 100%;height: 35px;line-height: 35px;padding-top: 10px;' value='";
					strOption += groupInfo[nloop].groupId;
					strOption += "'>";
					strOption += groupInfo[nloop].groupName;
					strOption += "</option>";
					$("#keyword_id_roleUserGroup").append(strOption);
				}
			},
			error : function(data) {
				alert("与后台服务通讯失败");
			}
		});
		
	});
	
	function getUserGroupRoles()
	{
		// 从隐藏域中取值
		var strAllRoles = $("#keyword_id_role_allRoles").val();
		var strAllStore = $("#keyword_id_role_allStores").val();
		if("" == strAllRoles || "" == strAllStore)
		{
			// 发送ajax请求，获取全部权限菜单数据、仓库列表数据
			$.ajax({
				type : "POST",
				url : "${ctx}/Menu/getAllMenu.do",
				data : {},
				async : false,
				cache : false,
				success : function(data) {
					var errorMsg = data.errorMsg;
					if("" != errorMsg)
					{
						$.messager.alert("操作提示",errorMsg,"error");
						return ;
					}
					var strAllMenu = JSON.stringify(data.allMenuInfo);
					var strAllStore = JSON.stringify(data.allStoreInfo);
					$("#keyword_id_role_allRoles").val(strAllMenu);
					$("#keyword_id_role_allStores").val(strAllStore);
					//createRoleMenuTree();
					createRoleTree();
				},
				error : function(data) {
					$.messager.alert("操作提示","获取菜单时,与后台服务通讯失败!","error");
				}
			});
		}
		else
		{
			//createRoleMenuTree();
			createRoleTree();
		}
	}
	
	// 根据groupId获取对应的菜单目录树、仓库数据
	function createRoleTree()
	{
		var groupId = $("#keyword_id_roleUserGroup").children("option:selected").val();
		if(undefined == groupId || "" == groupId)
		{
			return ;	
		}

		// 获取全部权限数据
		var strAllMenu = 	$("#keyword_id_role_allRoles").val();
		var jsonAllMenu = eval('(' + strAllMenu +')');
		if(undefined == jsonAllMenu && 0 >= jsonAllMenu.length)
		{
			$.messager.alert("操作提示","未获取到权限数据","error");
			return ;
		}
		// 获取全部仓库数据
		var strAllStore = 	$("#keyword_id_role_allStores").val();
		var jsonAllStore = eval('(' + strAllStore +')');
		if(undefined == jsonAllStore && 0 >= jsonAllStore.length)
		{
			$.messager.alert("操作提示","未获取到仓库数据","error");
			return ;
		}
		
		// 生成带有复选框的全部权限菜单数据
		var roleMenuTree = new dTree("roleMenuTree");
		roleMenuTree.config.stepDepth = 2;
		roleMenuTree.config.useCheckbox = true;
		roleMenuTree.config.useStatusText = true;
		//roleMenuTree.config.useCheckBox = false;	// 其默认值就为false
		roleMenuTree.add(0,-1,' <strong>权限菜单</strong>');	// 根目录
		for(var nloop = 0; nloop < jsonAllMenu.length; nloop ++)
		{
			var parentMenuNode = jsonAllMenu[nloop];
			var subMenuArray = parentMenuNode.children;
			// 先生成父菜单节点
			// dTree数据结构(menuCode[菜单编号], parentMenuId[父节点Id], menuName[菜单显示名称],menuUrl[节点url],
			//[参数5可选][鼠标移至该节点时节点的Title],[参数6可选][节点的target],[参数7可选][用做节点的图标,节点没有指定图标时使用默认值], 
			//[参数8可选][用做节点打开的图标,节点没有指定图标时使用默认值], [参数9可选][判断节点是否打开]
			var strParentShowName = '<input type="checkbox" class="parentNode" id="keyword_id_checkbox_' + parentMenuNode.menuCode + '" menuId="' + parentMenuNode.id +'" onClick="caBox(\'keyword_id_checkbox_'+parentMenuNode.menuCode+'\')" >' + parentMenuNode.menuName + '</input>';
			roleMenuTree.add(parentMenuNode.id, parentMenuNode.parentMenuId, strParentShowName, "", parentMenuNode.menuDescription);
			if(undefined != subMenuArray && 0 < subMenuArray.length)
			{
				for(var jloop = 0; jloop < subMenuArray.length; jloop ++)
				{
					var subMenuNode = subMenuArray[jloop];
					var strShowName = '<input type="checkbox" class="childNode" id="keyword_id_checkbox_' + subMenuNode.menuCode +'" parentMenuIds="'+parentMenuNode.id+ '" menuId="' + subMenuNode.id +'" onClick="caBox(\'keyword_id_checkbox_'+subMenuNode.menuCode+'\')" >' + subMenuNode.menuName+ '</input>';
					roleMenuTree.add(subMenuNode.id, subMenuNode.parentMenuId, strShowName,"", subMenuArray.menuDescription, "page");
				}
			}
		}
		var menuTreeDiv = document.getElementById("keyword_id_roleMenuTree");
		if(undefined != menuTreeDiv && null != menuTreeDiv)
		{
			$("#keyword_id_roleMenuTree").html(roleMenuTree.toString());
		}
		
		
		
		parentStoreId =-2;
		parentStoreNode = -1;
		parentStoreCode = 0000;
		// 生成带有复选框的全部仓库列表数据
		var roleStoreTree = new dTree("roleStoreTree");
		roleStoreTree.config.stepDepth = 2;
		roleStoreTree.config.useCheckbox = true;
		roleStoreTree.config.useStatusText = true;
		roleStoreTree.add(0,-1,' <strong>仓库菜单</strong>');	// 根目录
		
		// 先生成父菜单节点
		var strParentShowName = '<input type="checkbox" class="parentNode" id="keyword_id_checkbox_' + parentStoreCode + '_'+parentStoreId+'" storeId="' + parentStoreId +'" onClick="stBox(\'keyword_id_checkbox_'+parentStoreCode+'_'+parentStoreId+'\')" >' + '所有仓库' + '</input>';
		roleStoreTree.add(parentStoreId, parentStoreNode, strParentShowName);
		for(var nloop = 0; nloop < jsonAllStore.length; nloop ++)
		{
			var childStoreNode = jsonAllStore[nloop];
			
			var strChildShowName = '<input type="checkbox" class="childNode" id="keyword_id_checkbox_' + childStoreNode.storecode + '_' + childStoreNode.id +'" parentStoreIds="'+parentStoreId+ '" storeId="' + childStoreNode.id +'" onClick="stBox(\'keyword_id_checkbox_'+childStoreNode.storecode+'_'+ childStoreNode.id +'\')" >' + childStoreNode.storename + '</input>';
			roleStoreTree.add(childStoreNode.id, parentStoreId, strChildShowName);
		}
		var storeTreeDiv = document.getElementById("keyword_id_roleStoreTree");
		if(undefined != storeTreeDiv && null != storeTreeDiv)
		{
			$("#keyword_id_roleStoreTree").html(roleStoreTree.toString());
		}
		
		// 获取用户组对应的权限数据
		$.ajax({
			type : "POST",
			url : "${ctx}/Menu/getMenusByGroupId.do",
			data : {
				groupId : groupId
			},
			async : false,
			cache : false,
			success : function(data) {
				var errorMsg = data.errorMsg;
				if("" != errorMsg)
				{
					$.messager.alert("操作提示",errorMsg,"error");
					return ;
				}
				
				var groupMenu = data.groupMenuInfo;
				var group = data.groupInfo;
				// 权限菜单复选框填充
				if(undefined != groupMenu && 0 < groupMenu.length)
				{
					// 基于空白权限菜单数据进行权限复选框填充
					var checkboxes = $('#keyword_id_roleMenuTree input[type=checkbox]');
					if(null != checkboxes && 0 < checkboxes.length)
					{
						for(var nloop = 0; nloop < checkboxes.length; nloop ++)
						{
							var strCheckboxesId = checkboxes[nloop].id;
							var menuCode = strCheckboxesId.substring(20, strCheckboxesId.length);
							for(var jloop = 0; jloop < groupMenu.length; jloop ++)
							{
								if(menuCode == groupMenu[jloop].menuCode)
								{
									checkboxes[nloop].checked = true;	
								}	
							}
						}
					}
				}
				// 仓库列表复选框填充
				if(undefined != group){
					var storeIds = group.storeids;
					// 基于空白仓库列表数据进行仓库复选框填充
					var storeIdsArr = storeIds.split(",");
					var checkboxes = $('#keyword_id_roleStoreTree input[type=checkbox]');
					if(null != checkboxes && 0 < checkboxes.length){
						// 获得父节点的id
						var strParentCheckboxesId = checkboxes[0].id;
						for(var nloop = 0; nloop < checkboxes.length; nloop ++){
							var strCheckboxesId = checkboxes[nloop].id;
							var storeId = strCheckboxesId.substring(strCheckboxesId.lastIndexOf("_")+1, strCheckboxesId.length);
							for(var jloop = 0; jloop < storeIdsArr.length; jloop ++)
							{
								if(storeId == storeIdsArr[jloop])
								{
									checkboxes[nloop].checked = true;
									// 子节点有为true的，则父节点必为true
									$("#"+strParentCheckboxesId).prop("checked",true);
								}
							}
						}
					}
					
				}
				
			},
			error : function(data) {
				$.messager.alert("操作提示","获取菜单时,与后台服务通讯失败","error");
			}
		});
	}
	
	// 更新权限菜单数据|更新仓库列表数据
	function commitGroupRoles()
	{
		var groupId = $("#keyword_id_roleUserGroup").children("option:selected").val();
		if(undefined == groupId || "" == groupId)
		{
			return ;
		}
		
		// [更新权限菜单数据]获取权限菜单树中的已选权限
		var checkboxes = $('#keyword_id_roleMenuTree input[type=checkbox]:checked');
		if(undefined == checkboxes || 0 >= checkboxes.length)
		{
			return ;
		}
		var jsonRoles = [];
		for(var nloop = 0; nloop < checkboxes.length; nloop ++)
		{
			var strMenuId = checkboxes[nloop].getAttribute("menuId");
			if(undefined != strMenuId && "" != strMenuId)
			{
				jsonRoles.push(strMenuId);
			}
		}
		if(null != jsonRoles)
		{
			// 向后台提交权限配置数据
			$.ajax({
				type : "POST",
				url : "${ctx}/Role/updateRolesByGroupId.do",
				data : {
					groupId : groupId,
					roleList : JSON.stringify(jsonRoles)
				},
				async : false,
				cache : false,
				success : function(data) {
					var errorMsg = data.errorMsg;
					if("" != errorMsg)
					{
						$.messager.alert("操作提示",errorMsg,"error");
						//return ;
					}
					else
					{
						$.messager.alert("操作提示","权限菜单数据修改成功!","info");
						//return ;
					}
				},
				error : function(data) {
					$.messager.alert("操作提示","向后台提交权限数据失败!","error");
				}
			});
		}
		// [更新仓库列表数据]获取仓库列表树中的已选项
		checkboxes = $('#keyword_id_roleStoreTree input[type=checkbox]:checked');
		if(undefined == checkboxes || 0 >= checkboxes.length)
		{
			return ;
		}
		jsonRoles = [];
		// 此处循环从1开始，忽略值为0的根目录数据
		for(var nloop = 1; nloop < checkboxes.length; nloop ++)
		{
			var strStoreId = checkboxes[nloop].getAttribute("storeId");
			if(undefined != strStoreId && "" != strStoreId)
			{
				jsonRoles.push(strStoreId);
			}
		}if(null != jsonRoles)
		{
			// 向后台提交仓库列表配置数据
			$.ajax({
				type : "POST",
				url : "${ctx}/UserGroup/updateUserGroupInfo.do",
				data : {
					groupId : groupId,
					storeIds : jsonRoles.toString()
				},
				async : false,
				cache : false,
				success : function(data) {
					var errorMsg = data.errorMsg;
					if("" != errorMsg)
					{
						$.messager.alert("操作提示",errorMsg,"error");
					}
					else
					{
						$.messager.alert("操作提示","仓库列表配置数据修改成功!","info");
					}
				},
				error : function(data) {
					$.messager.alert("操作提示","向后台提交仓库配置数据失败!","error");
				}
			});
		}
	}
	
	// 仓库列表：checkbox父子复选框的联动
	function stBox(store_id){
		var flag = $("#"+store_id).prop("checked");
		// 获取父节点
		var parentNode = $('#keyword_id_roleStoreTree .parentNode');
		// 获取所有子节点
		var childNodes = $('#keyword_id_roleStoreTree .childNode');
		if($("#"+store_id).attr("class")=="parentNode"){
			/**
			 * 点击父节点时的操作
			 */
			// 获得父节点的id
			var storeId = $("#"+store_id).attr("storeId");
			
			if(undefined == childNodes || 0 >= childNodes.length){
				return ;
			}
			// 父节点选中为true时，子节点全部变为true;反之亦然
			for(var nloop = 0;nloop < childNodes.length;nloop++){
				var childMenuId = childNodes[nloop].getAttribute("storeId");
				var parentStoreIds = childNodes[nloop].getAttribute("parentStoreIds");
				if(parentStoreIds == storeId){
					var childId = childNodes[nloop].getAttribute("id");
					$("#"+childId).prop("checked",flag);
				}
			}
		}else{
			/**
			 * 点击子节点时的操作
			 */
			// 获得该子节点中关联父节点的值
			var selParentStoreIds = $("#"+store_id).attr("parentStoreIds");
			if(flag){
				// 如果选中的子节点为true,则父节点必为true
				var parentId = getParentStoreId(store_id);
				$("#"+parentId).prop("checked",true);
			}else{
				// 如果选中的子节点为为最后同类中一个子节点且为false,则父节点必为false
				// 获得所有子节点
				for(var nloop = 0;nloop < childNodes.length;nloop++){
					var childId = childNodes[nloop].getAttribute("id");
					var parentStoreIds = childNodes[nloop].getAttribute("parentStoreIds");
					if(parentStoreIds == selParentStoreIds && childId != store_id){
						var otherChildFlag = $("#"+childId).prop("checked");
						if(otherChildFlag){
							return ;
						}
					}
				}
				// 将父节点置为false
				var parentId = getParentStoreId(store_id);
				$("#"+parentId).prop("checked",false);
			}
		}
	}
	// 仓库列表：根据子节点获得相应的父节点的id
	function getParentStoreId(store_id){
		// 获得子节点中关联父节点的值
		var selParentStoreIds = $("#"+store_id).attr("parentStoreIds");
		// 获取所有父节点
		var parentNode = $('#keyword_id_roleStoreTree .parentNode');
		for(var nloop = 0;nloop < parentNode.length;nloop++){
			var parentStoreId = parentNode[nloop].getAttribute("storeId");
			if(selParentStoreIds == parentStoreId){
				var parentId = parentNode[nloop].getAttribute("id");
				return parentId;
			}
		}
	}
	
	// 权限菜单：checkbox父子复选框的联动
	function caBox(sel_id){
		// 被选中的节点的check状态
		//var flag = $("#"+sel_id).is(":checked");
		var flag = $("#"+sel_id).prop("checked");
		// 获取所有子节点
		var childNodes = $('#keyword_id_roleMenuTree .childNode');
		// 获取所有父节点
		var parentNodes = $('#keyword_id_roleMenuTree .parentNode');
		
		if($("#"+sel_id).attr("class")=="parentNode"){
			/**
			 * 点击父节点时的操作
			 */
			// 获得父节点的id
			var menuId = $("#"+sel_id).attr("menuId");
			
			if(undefined == childNodes || 0 >= childNodes.length){
				return ;
			}
			// 父节点选中为true时，子节点全部变为true;反之亦然
			for(var nloop = 0;nloop < childNodes.length;nloop++){
				//var childMenuId = childNodes[nloop].getAttribute("menuId");
				var parentMenuIds = childNodes[nloop].getAttribute("parentMenuIds");
				if(parentMenuIds == menuId){
					var childId = childNodes[nloop].getAttribute("id");
					$("#"+childId).prop("checked",flag);
				}
			}
		}else{
			/**
			 * 点击子节点时的操作
			 */
			// 获得该子节点中关联父节点的值（其本身的id为sel_id）
			var selParentMenuIds = $("#"+sel_id).attr("parentMenuIds");
			
			if(flag){
				// 如果选中的子节点为true,则父节点必为true
				var parentId = getParentId(sel_id);
				$("#"+parentId).prop("checked",true);
			}else{
				// 如果选中的子节点为为最后同类中一个子节点且为false,则父节点必为false
				// 获得所有子节点
				for(var nloop = 0;nloop < childNodes.length;nloop++){
					var childId = childNodes[nloop].getAttribute("id");
					var childMenuId = childNodes[nloop].getAttribute("menuId");
					var parentMenuIds = childNodes[nloop].getAttribute("parentMenuIds");
					if(parentMenuIds == selParentMenuIds && childId != sel_id){
						var otherChildFlag = $("#"+childId).prop("checked");
						if(otherChildFlag){
							return ;
						}
					}
				}
				// 将父节点置为false
				var parentId = getParentId(sel_id);
				$("#"+parentId).prop("checked",false);
			}
		}
	}
	
	// 权限菜单：根据子节点获得相应的父节点的id
	function getParentId(sel_id){
		// 获得子节点中关联父节点的值（其本身的id为sel_id）
		var parentMenuIds = $("#"+sel_id).attr("parentMenuIds");
		// 获取所有父节点
		var parentNodes = $('#keyword_id_roleMenuTree .parentNode');
		
		for(var nloop = 0;nloop < parentNodes.length;nloop++){
			var parentMenuId = parentNodes[nloop].getAttribute("menuId");
			if(parentMenuIds == parentMenuId){
				var parentId = parentNodes[nloop].getAttribute("id");
				return parentId;
			}
		}
	}
	
</script>
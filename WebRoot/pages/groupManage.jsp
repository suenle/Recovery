<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/pages/commons/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>江苏云道仓储管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/beforestyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" media="screen"
	href="../css/ui.jqgrid.css" />
<script src="../js/jquery-1.9.1.min.js"></script>
<script src="../js/jqGrid/i18n/grid.locale-en.js" type="text/javascript"></script>
<script src="../js/jqGrid/jquery.jqGrid.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="../css/jquery-ui.min.css" />
<!-- link 日历资源 -->
<link rel="stylesheet" type="text/css"
	href="../css/jquery.datetimepicker.css" />
<script src="../js/jquery.datetimepicker.js"></script>
<!-- jquery对话框资源 -->
<script src="../js/jqEasyui/jquery.easyui.min.js" type="text/javascript"></script>
<script src="../js/jqEasyui/locale/easyui-lang-zh_CN.js"
	type="text/javascript"></script>
<link href="../css/jqEasyui/themes/gray/easyui.css" rel="stylesheet"
	type="text/css" />
<link href="../css/jqEasyui/icon.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<table width="100%" height="100%" border="0" cellspacing="0"
		cellpadding="3">
		<tr>
			<td height="34" width="100%" style="padding:0px;">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					style="line-height: 34px;height: 34px;">
					<tr>
						<td class="barWord">&nbsp;&nbsp;<img
							src="../images/icon_card.gif" width="16" height="16"
							align="absmiddle" style="margin-bottom: 4px;"> 当前位置&nbsp;<img
							src="../images/common/rightArrow.png" width="8" height="14"
							align="absmiddle" style="margin-bottom: 2px;"> 添区加排&nbsp;<img
							src="../images/common/rightArrow.png" width="8" height="14"
							align="absmiddle" style="margin-bottom: 2px;"> 小排管理</td>
						<td align="right" class="white" style="padding-right:20px"><a
							href="#" class="barBtn" id="keyword_id_areasType_addBtn"
							onclick="addGroup();"> <img src="../images/btn_add.gif"
								width="18" height="18" align="absmiddle" /> 新增 </a> <a href="#"
							class="barBtn" onclick="javascript:editGroup();"> <img
								src="../images/btn_edit.gif" width="18" height="18"
								align="absmiddle" /> 编辑 </a> <a href="#" class="barBtn"
							onclick="javascript:delGroup();"> <img
								src="../images/delete.gif" width="18" height="18"
								align="absmiddle" /> 删除 </a> <a href="#" class="barBtn"
							onClick="javascript:history.go(-1);"> <img
								src="../images/btn_left.gif" width="18" height="18"
								align="absmiddle"> 后退 </a> <a href="#" class="barBtn"
							onClick="javascript:history.go(+1);"> <img
								src="../images/btn_right.gif" width="18" height="18"
								align="absmiddle"> 前进 </a> <a href="#" class="barBtn"
							onclick="javascript:location.reload();"> <img
								src="../images/btn_refresh.gif" width="18" height="18"
								align="absmiddle"> 刷新 </a>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td
							style="height:30px; width:100%; border-bottom:1px solid #cfd8e0;">
							<table width="100%" border="0" cellpadding="3" cellspacing="1">
								<tr>
									<td width="10%" align="center" style="margin-left: 20px;">
										<div class="div_keyword_prompt">所属分区</div>
									</td>
									<td width="20%"><select id="keyword_id_group_districtName"
										class="select_keyword">
											<option value="-1">请选择所属分区</option>
									</td>
									<td width="10%" align="center" style="margin-left: 20px;">
										<div class="div_keyword_prompt">小排名称</div>
									</td>
									<td width="20%"><input class="input_keyword" type="text"
										id="keyword_id_group_groupName" placeholder="请输入小排名称" />
									</td>
									<td width="10%" align="right" style="padding-right: 20px;">
										<a href="#" class="query"
										onclick="javascript:queryAreastypeclassify();"> <img
											src="../images/common/query_logo.png" width="18" height="18"
											align="absmiddle">查询 </a>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td valign="top">
							<div style="overflow:auto;height:100%; width:100%;">
								<table width="100%" border="0" cellpadding="0" cellspacing="0"
									id="keyword_id_tab_groupList">
								</table>
							</div>
							<div style="overflow:auto;height:40px; width:100%;"
								id="keyword_id_div_groupListPage"></div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<!-- 添加小排数据 -->
	<div id="keyword_id_group_divAddBack" class="div_background"></div>
	<div id="keyword_id_group_divAddFront" class="div_front">
		<table border="0" cellpadding="0" cellspacing="0" width="450"
			height="550">
			<tr style="height:40px;">
				<td colspan="2"
					style="border-bottom:1px solid gainsboro;padding-top: 10px;"><h1
						class="h1">添加小排</h1></td>
			</tr>
			<tr style="height:10px;">
				<td colspan="2"></td>
			</tr>
			<tr style="height:35px;">
				<td class="div_font_left_word"><span class="div_front_prompt">*</span>小排名称：</td>
				<td><input type="text" id="keyword_id_id_groupAdd_groupName"
					class="div_font_right_input" placeholder="请输入小排名称" />
				</td>
			</tr>
			<tr style="height:35px;">
				<td class="div_font_left_word"><span class="div_front_prompt">*</span>所属分区：</td>
				<td><select id="keyword_id_groupAdd_districtName"
					class="select_keyword">
						<option value="-1">-请选择所属分区-</option>
				</select>
				</td>
			</tr>
			<tr style="height:20px;">
				<td class="div_font_left_word">小排描述：</td>
				<td></td>
			</tr>
			<tr style="height:38px;">
				<td colspan="2" align="center"><textarea name="groupDesc"
						id="keyword_id_id_groupAdd_groupDesc" class="div_font_textarea"
						placeholder="请给此小排一个描述信息呗。。。">
					</textarea>
				</td>
			</tr>
			<tr style="height:10px;">
				<td colspan="2"></td>
			</tr>
			<tr style="height:50px;">
				<td colspan="2" style="border-top:1px solid gainsboro;">
					<div
						style="text-align:center;padding-top: 7px;padding-bottom: 7px;">
						<input type="button" class="div_button_cancel div_button_cancel_2"
							value="取 消" onclick="javascript:groupAddCancel();" /> <input
							type="button" class="div_button_submit div_button_submit_2"
							value="提 交" onclick="javascript:groupAddCommit();" />
					</div>
				</td>
			</tr>
		</table>
	</div>

	<!-- 编辑小排数据 -->
	<div id="keyword_id_group_divEditBack" class="div_background"></div>
	<div id="keyword_id_group_divEditFront" class="div_front">
		<table border="0" cellpadding="0" cellspacing="0" width="450"
			height="550">
			<tr style="height:40px;">
				<td colspan="2"
					style="border-bottom:1px solid gainsboro;padding-top: 10px;"><h1
						class="h1">编辑小排</h1></td>
			</tr>
			<tr style="height:10px;">
				<td colspan="2"></td>
			</tr>
			<tr style="height:35px;">
				<td class="div_font_left_word"><span class="div_front_prompt">*</span>小排名称：</td>
				<td><input type="text" id="keyword_id_groupEdit_groupName"
					class="div_font_right_input" placeholder="请输入小排名称" />
				</td>
			</tr>
			<tr style="height:35px;">
				<td class="div_font_left_word"><span class="div_front_prompt">*</span>所属分区：</td>
				<td><select id="keyword_id_groupEdit_districtName"
					class="select_keyword">
						<option value="-1">-请选择所属分区-</option>
				</select>
				</td>
			</tr>
			<tr style="height:20px;">
				<td class="div_font_left_word">小排描述：</td>
				<td></td>
			</tr>
			<tr style="height:38px;">
				<td colspan="2" align="center"><textarea name="groupDesc"
						id="keyword_id_groupEdit_groupDesc" class="div_font_textarea"
						placeholder="请给此小排一个描述信息呗。。。">
					</textarea>
				</td>
			</tr>
			<tr style="height:10px;">
				<td colspan="2"></td>
			</tr>
			<tr style="height:50px;">
				<td colspan="2" style="border-top:1px solid gainsboro;">
					<div
						style="text-align:center;padding-top: 7px;padding-bottom: 7px;">
						<input type="button" class="div_button_cancel div_button_cancel_2"
							value="取 消" onclick="javascript:groupEditCancel();" /> <input
							type="button" class="div_button_submit div_button_submit_2"
							value="修 改" onclick="javascript:groupEditCommit();" />
					</div>
				</td>
			</tr>
		</table>
	</div>

</body>
</html>

<script language="javascript">
$(function() {
		//获取会所四级
		$.ajax({
			type : "POST",
			url : "${ctx}//UserInfo/getChurchInfo.do",
			data : {},
			async : false,
			cache : false,
			success : function(data) {
				var errorMsg = data.errorMsg;
				if ("" != errorMsg) {
					$.messager.alert("错误提示", errorMsg, "error");
				}
			
				var dList = data.districtList;
				
				var dstr = "";
				for ( var u = 0; u < dList.length; u++) {
					dstr += "<option value="+dList[u].id+">"
							+ dList[u].districtname + "</option>";

				}
				$("#keyword_id_group_districtName").append(dstr);
				$("#keyword_id_groupEdit_districtName").append(dstr);
				$("#keyword_id_groupAdd_districtName").append(dstr);

			},
			error : function(data) {

			}

		});

		$("#keyword_id_addInfo_district").change(function() {
			var orgSel_id = "#keyword_id_addInfo_district";
			var sel_groupid = "#keyword_id_addInfo_group";
			var sel_homeid = "#keyword_id_addInfo_home";
			sel_districtAndGroup(orgSel_id, sel_groupid);

			sel_GroupAndHome(orgSel_id, sel_homeid);

		});

	});



	// 页面初始化
	$(document).ready(function(){
		// 解决jquery 1.9版本未定义msie的问题
		$.browser={};
		$.browser.msie=false; 
		$.browser.version=0;
		if(navigator.userAgent.match(/MSIE ([0-9]+)./)){ 
			$.browser.msie=true;
			$.browser.version=RegExp.$1;
		}
	});
	
	// 添加小排
	function addGroup()
	{
		// 初始化添加小排界面
		$("#keyword_id_group_divAddBack").css("display", "block");
		$("#keyword_id_group_divAddFront").css("display", "block");
		
		$("#keyword_id_id_groupAdd_groupName").val('');
		$("#keyword_id_id_groupAdd_groupDesc").val('');
		
	}
	
	// 添加小排提交
	function groupAddCommit()
	{
		// 检查是否有必填项未填
		var groupName = $("#keyword_id_id_groupAdd_groupName").val();
		var groupDesc= $("#keyword_id_id_groupAdd_groupDesc").val();
		
		var districtId= $("#keyword_id_groupAdd_districtName").val();
		
		if(undefined == districtId || "-1" == districtId)
		{
			$.messager.alert("错误提示","请选择所属分区","error");
			return ;
		}
		
		if(undefined == groupName || "" == groupName || groupName.trim().length==0)
		{
			alert("小排名称不能为空");
			return ;	
		}
	
		// 向后台提交数据
		$.ajax({
			type : "POST",
			url: "${ctx}/Group/addGroup.do",
			data : {
				groupName : groupName,
				groupDesc: groupDesc,
				districtId : districtId	
			},
			async: false,
      		cache:false,
			success: function (data) {
				var errorMsg = data.errorMsg;
				if("" != errorMsg)
				{
					alert(errorMsg);
					return ;	
				}else{
				alert("添加成功");
				}
								
				// 获取后台id数据及界面数据
				var dataId = data.groupId;
				var groupName = $("#keyword_id_id_groupAdd_groupName").val();
				var groupDesc= $("#keyword_id_id_groupAdd_groupDesc").val();
				var districtId= $("#keyword_id_groupAdd_districtName").val();
				var districtName= $("#keyword_id_groupAdd_districtName").find("option:selected").text(); 
				// 界面表格中填充一条记录在第一条
				var thisData = {
					id : dataId,
					groupName : groupName,
					groupDesc: groupDesc,
					districtId : districtId,
					districtName : districtName
					
				};
				$("#keyword_id_tab_groupList").jqGrid("addRowData", dataId, thisData, "first");
				
				// 判断界面中的记录数是否超过每页显示最大值，如超过删除最后一条
				var tableRowCount = $('#keyword_id_tab_groupList').jqGrid('getRowData').length;
				var pageNums = $('#keyword_id_tab_groupList').jqGrid('getGridParam', 'rowNum');
				if(tableRowCount > pageNums)
				{
					// 删除最后一条记录
					var lastRowId = $('#keyword_id_tab_groupList').jqGrid('getRowData')[tableRowCount - 1].id;
					if(undefined != lastRowId)
					{
						$("#keyword_id_tab_groupList").jqGrid("delRowData", lastRowId);
					}
				}
				
				// 隐藏添加数据界面
				$("#keyword_id_id_groupAdd_groupName").val();
				$("#keyword_id_id_groupAdd_groupDesc").val();
				$("#keyword_id_group_divAddBack").css("display", "none");
				$("#keyword_id_group_divAddFront").css("display", "none");
			},
			error : function (data) {
				alert("后台通讯故障");
			}	
		});
		
	}
	
	// 取消小排添加
	function groupAddCancel()
	{
		$("#keyword_id_group_divAddBack").css("display", "none");
		$("#keyword_id_group_divAddFront").css("display", "none");
		$("#keyword_id_groupAdd_districtName").val(-1);
		$("#keyword_id_id_group_groupName").val();
		$("#keyword_id_id_group_groupDesc").val();
	}
	
	

	// 条件查询用户列表
	function queryAreastypeclassify()
	{
		var groupName = $("#keyword_id_group_groupName").val();//小排名称
		var districtId= $("#keyword_id_group_districtName").val();
		
		var pageIndex = $('#keyword_id_div_groupListPage').getGridParam('page');   //第X页
		var pageNums = $('#keyword_id_div_groupListPage').getGridParam('pageNums');//总页数
		
		if(undefined == pageIndex || "" == pageIndex)
		{
			pageIndex = 1;	
		}
		else
		{
			pageIndex ++;	
		}
		if(undefined == pageNums || "" == pageNums)
		{
			pageNums = 20;	
		}
		// 先清空列表
	    $("#keyword_id_tab_groupList").jqGrid("GridUnload");
		// 生成列表
		$("#keyword_id_tab_groupList").jqGrid({
			url : "${ctx}/Group/queryGroup.do",
			datatype : "json",
			postData : {
				groupName : groupName,
				pageIndex : pageIndex,
				districtId : districtId,
				pageNums : pageNums
			},
			//height :  document.body.clientHeight - 165,
			colNames : ['序号','id','召会ID','所属分区名称','小排名称','小排描述'],
			colModel:[
			    {name:'num',index:'num', align:'center', sortable:false},
				{name:'id',index:'id', align:'center', sortable:false, key : true,hidden:true},
				{name:'districtId',index:'districtId',  align:'center', sortable:false,hidden:true},	
				{name:'districtName',index:'districtName',  align:'center', sortable:false},
				{name:'groupName',index:'groupName',  align:'center', sortable:false},
				{name:'groupDesc',index:'groupDesc' , align:'center', sortable:false},				
			],
			rowNum : pageNums,														// 每页显示数量
			rowList:[10,20,30],														// 可选择每页显示数量
			pager: '#keyword_id_div_groupListPage',							// 分页显示位置
			pgtext : "{0} 共 {1} 页",												// 自定义格式的分页显示
			recordtext: " {0} - {1} 共 {2} 条",									// 自定义格式的记录总数
      		viewrecords: true, 														// 是否显示行数
      		pginput : true,															// 显示跳转输入框
      		height : "auto",
			autowidth : true,
       		jsonReader : {  														//后台参数返回前台
			  root: "rows",  												//包含实际数据的数组
			  page: "page",  												//当前页	
			  total: "total",												//总页数
			  records: "records",											//查询出的记录数		
			  repeatitems : false											//每行数据不可重复
			},	
			onPaging : function(pgButton) {

				if(pgButton == "next_keyword_id_div_groupListPage")
				{
					// 下一页
				 groupName = $("#keyword_id_group_groupName").val();//小排名称
					
					pageIndex = $('#keyword_id_tab_groupList').jqGrid('getGridParam', 'page');
					pageIndex ++;
					pageNums = $('#keyword_id_tab_groupList').jqGrid('getGridParam', 'rowNum');
				}
				else if(pgButton == "last_keyword_id_div_groupListPage")
				{
					// 最后一页
					 groupName = $("#keyword_id_group_groupName").val();//小排名称
					
					pageIndex = $('#keyword_id_tab_groupList').jqGrid('getGridParam', 'lastpage');
					pageNums = $('#keyword_id_tab_groupList').jqGrid('getGridParam', 'rowNum');
				}
				else if(pgButton == "prev_keyword_id_div_groupListPage")
				{
					// 上一页
					 groupName = $("#keyword_id_group_groupName").val();//小排名称
					
					pageIndex = $('#keyword_id_tab_groupList').jqGrid('getGridParam', 'page');
					pageIndex --;
					pageNums = $('#keyword_id_tab_groupList').jqGrid('getGridParam', 'rowNum');
				}
				else if(pgButton == "first_keyword_id_div_groupListPage")
				{
					// 首页
					 groupName = $("#keyword_id_group_groupName").val();//小排名称
					
					pageIndex = 1;
					pageNums = $('#keyword_id_tab_groupList').jqGrid('getGridParam', 'rowNum');
				}
				else if(pgButton == "user")
				{
					// 页码跳转事件
					 groupName = $("#keyword_id_group_groupName").val();//小排名称
					
					var lastPageNum = $('#keyword_id_tab_groupList').jqGrid('getGridParam', 'lastpage');
					pageIndex = $('#keyword_id_tab_groupList').jqGrid('getGridParam', 'page');
					if(pageIndex < 1 || pageIndex > lastPageNum)
					{
						alert("页码输入不正确");
						return ;	
					}
					pageNums = $('#keyword_id_tab_groupList').jqGrid('getGridParam', 'rowNum');
				}
				
				$("#keyword_id_tab_groupList").jqGrid('setGridParam',{  
            	datatype:'json',  
            	postData:{
            				groupName : groupName,
							pageNums : pageNums,
							pageIndex : pageIndex	
         }, //发送数据      
        }).trigger("reloadGrid");  		//重新载入  
		},
			gridComplete : function(){
			}
		});

	}
	
	// 更新小排
	function editGroup()
	{
		var selectId = $("#keyword_id_tab_groupList").jqGrid('getGridParam','selrow');
		if(undefined == selectId || 0 > selectId)
		{
			$.messager.alert("操作提示","请选择需要编辑的行，再点击编辑按钮","info")
			return ;	
		}
		// 显示编辑窗口，并填充原数据
		var rowData =  $("#keyword_id_tab_groupList").jqGrid('getRowData',selectId);
		if(undefined != rowData && null != rowData)
		{
			var editId = rowData.id;   //选中的id
			var groupName = rowData.groupName;  //小排名称
			var groupDesc= rowData.groupDesc;   
			var districtId= rowData.districtId;  
		
			$("#keyword_id_groupEdit_groupName").val(groupName);
			$("#keyword_id_groupEdit_groupDesc").val(groupDesc);
			$("#keyword_id_groupEdit_districtName").val(districtId);
			
			$("#keyword_id_group_divEditBack").css("display", "block");
			$("#keyword_id_group_divEditFront").css("display", "block");
		}
		else
		{
			$.messager.alert("操作提示","未获取到编辑数据","error");	
			return ;
		}
	}
	
	// 更新小排提交
	function groupEditCommit()
	{
	    var selectId = $("#keyword_id_tab_groupList").jqGrid('getGridParam','selrow');
		// 检查是否有必填项未填		
		var groupName = $("#keyword_id_groupEdit_groupName").val();
		var groupDesc= $("#keyword_id_groupEdit_groupDesc").val();
		var districtId= $("#keyword_id_groupEdit_districtName").val();
		
		if(undefined == groupName || "" == groupName || groupName.trim().length==0)
		{
			$.messager.alert("错误提示","小排名称不能为空","error");
			return ;
		}
		if(undefined == districtId || "-1" == districtId)
		{
			$.messager.alert("错误提示","请选择所属分区","error");
			return ;
		}
		// 向后台提交数据
		$.ajax({
			type : "POST",
			url: "${ctx}/Group/updateGroup.do",
			data : {
				id : selectId,
				groupName : groupName,
				groupDesc: groupDesc,
				districtId : districtId
			},
			async: false,
            cache:false,
			success: function (data) {
				var errorMsg = data.errorMsg;
				if("" != errorMsg)
				{
					alert(errorMsg);
					return ;	
				}
				
				var districtId= $("#keyword_id_groupEdit_districtName").val();
				var districtName= $("#keyword_id_groupEdit_districtName").find("option:selected").text(); 
				var thisData = {
					id : selectId,
					groupName : groupName,
					groupDesc: groupDesc,
					districtId : districtId,
					districtName : districtName
				};
				$("#keyword_id_tab_groupList").jqGrid("setRowData", selectId , thisData);
				
				// 隐藏添加数据界面
				$("#keyword_id_groupEdit_groupName").val();
				$("#keyword_id_groupEdit_groupDesc").val();
				$("#keyword_id_group_divEditBack").css("display", "none");
				$("#keyword_id_group_divEditFront").css("display", "none");
				
				// 提示数据修改成功
				$.messager.alert("操作提醒", "数据修改成功", "info");
			},
			error : function (data) {
				alert("后台通讯故障");
			}	
		});		
	}
	
	function groupEditCancel()
	{
		$("#keyword_id_group_divEditBack").css("display", "none");
		$("#keyword_id_group_divEditFront").css("display", "none");
		$("#keyword_id_areasTypeEdit_areasTypeCode").val();
		$("#keyword_id_areasTypeEdit_areasTypeId").val(0);
		$("#keyword_id_areasTypeEdit_groupName").val();
		$("#keyword_id_areasTypeEdit_groupDesc").val();
	}
	
	// 删除小排
	function delGroup()
	{
		// 判断是否有选中记录，如没有则直接退出
		var selectId = $("#keyword_id_tab_groupList").jqGrid('getGridParam','selrow');
		if(undefined == selectId || 0 > selectId)
		{
			$.messager.alert("操作提示","请选择需要删除的行，再点击删除按钮","info");	
			return ;
		}
		//获取页面参数
		var rowData =  $("#keyword_id_tab_groupList").jqGrid('getRowData',selectId);
		if(undefined != rowData && null != rowData)
		{		
			var editId = rowData.id;
			var groupName=rowData.groupName;
			var groupDesc=rowData.groupDesc;		
			}
		// 弹出确认删除对话框，提醒用户是否删除该条记录
		$.messager.defaults = { ok: "确定", cancel: "取消" };
		
		
		$.messager.confirm("操作提示", "您确定要删除本条记录吗?", function (data){
      if (data) {
      	// 向后台发送ajax请求
      	$.ajax({
      		type : "POST",
					url: "${ctx}/Group/deleteGroup.do",
					data : {
						id : selectId,
						groupName:groupName,
						groupDesc:groupDesc
					},
					async: false,
		      cache:false,
					success: function (data) {
						var errorMsg = data.errorMsg;
						if("" != errorMsg)
						{
							$.messager.alert("错误提示",errorMsg, "error");
							return ;	
						}
						
						// 在jqGrid表中删除选中数据
						$("#keyword_id_tab_groupList").jqGrid("delRowData", selectId);
						
						// 提示数据删除成功
						$.messager.alert("操作提示", "数据删除成功", "info");
						
					},
					error: function(data) {
						$.messager.alert("错误提示","后台服务通讯故障", "error");	
					}
      	});
      }
      else {
    	}
		});
	}
	
</script>
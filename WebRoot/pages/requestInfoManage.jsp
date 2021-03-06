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
							align="absmiddle" style="margin-bottom: 2px;"> 其他设置&nbsp;<img
							src="../images/common/rightArrow.png" width="8" height="14"
							align="absmiddle" style="margin-bottom: 2px;"> 服侍审核</td>
						<td align="right" class="white" style="padding-right:20px"><a
							href="#" class="barBtn" id="keyword_id_areasType_addBtn"
							onclick="addHome();"> <img src="../images/btn_add.gif"
								width="18" height="18" align="absmiddle" /> 新增 </a> <a href="#"
							class="barBtn" onclick="javascript:editHome();"> <img
								src="../images/btn_edit.gif" width="18" height="18"
								align="absmiddle" /> 编辑 </a> <a href="#" class="barBtn"
							onclick="javascript:delHome();"> <img
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
								align="absmiddle"> 刷新 </a></td>
					</tr>
				</table></td>
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
										<div class="div_keyword_prompt">姓名</div></td>
									<td width="20%"><input class="input_keyword" type="text"
										id="keyword_id_requestInfo_userName"
										placeholder="请输入姓名" /></td>
									<td width="10%" align="right" style="padding-right: 20px;">
										<a href="#" class="query"
										onclick="javascript:queryAreastypeclassify();"> <img
											src="../images/common/query_logo.png" width="18" height="18"
											align="absmiddle">查询 </a></td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td valign="top">
							<div style="overflow:auto;height:100%; width:100%;">
								<table width="100%" border="0" cellpadding="0" cellspacing="0"
									id="keyword_id_tab_requestInfoList">
								</table>
							</div>
							<div style="overflow:auto;height:40px; width:100%;"
								id="keyword_id_div_requestInfoListPage"></div></td>
					</tr>
				</table></td>
		</tr>
	</table>
	<!-- 编辑小排数据 -->
	<div id="keyword_id_requestInfo_divEditBack" class="div_background"></div>
	<div id="keyword_id_requestInfo_divEditFront" class="div_front">
		<table border="0" cellpadding="0" cellspacing="0" width="450"
			height="550">
			<tr style="height:40px;">
				<td colspan="2"
					style="border-bottom:1px solid gainsboro;padding-top: 10px;"><h1
						class="h1">编辑请求</h1>
				</td>
			</tr>
			<tr style="height:10px;">
				<td colspan="2"></td>
			</tr>
			<tr style="height:35px;">
				<td class="div_font_left_word"><span class="div_front_prompt">*</span>姓名：</td>
				<td><input type="text"
					id="keyword_id_requestInfoEdit_userName"
					class="div_font_right_input" /></td>
			</tr>
			<tr style="height:35px;">
				<td class="div_font_left_word"><span class="div_front_prompt">*</span>状态：</td>
				<td><select id="keyword_id_requestInfoEdit_status"
					class="select_keyword">
						<option value="0">申请中</option>
						<option value="1">服侍者</option>
				</select></td>
			</tr>
			<tr style="height:20px;">
				<td class="div_font_left_word">申请理由：</td>
				<td></td>
			</tr>
			<tr style="height:38px;">
				<td colspan="2" align="center"><textarea name="requestInfoDesc"
						id="keyword_id_requestInfoEdit_requestInfoDesc"
						class="div_font_textarea" placeholder="请给此小排一个描述信息呗。。。">
					</textarea></td>
			</tr>
			<tr style="height:10px;">
				<td colspan="2"></td>
			</tr>
			<tr style="height:50px;">
				<td colspan="2" style="border-top:1px solid gainsboro;">
					<div
						style="text-align:center;padding-top: 7px;padding-bottom: 7px;">
						<input type="button" class="div_button_cancel div_button_cancel_2"
							value="取 消" onclick="javascript:requestInfoEditCancel();" /> <input
							type="button" class="div_button_submit div_button_submit_2"
							value="修 改" onclick="javascript:requestInfoEditCommit();" />
					</div></td>
			</tr>
		</table>
	</div>

</body>
</html>

<script language="javascript">

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
	

	// 条件查询用户列表
	function queryAreastypeclassify()
	{
		var userName = $("#keyword_id_requestInfo_userName").val();//名称
		
		var pageIndex = $('#keyword_id_div_requestInfoListPage').getGridParam('page');   //第X页
		var pageNums = $('#keyword_id_div_requestInfoListPage').getGridParam('pageNums');//总页数
		
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
	    $("#keyword_id_tab_requestInfoList").jqGrid("GridUnload");
		// 生成列表
		$("#keyword_id_tab_requestInfoList").jqGrid({
			url : "${ctx}/RequestInfo/queryRequestInfo.do",
			datatype : "json",
			postData : {
				userName : userName,
				pageIndex : pageIndex,
				pageNums : pageNums
			},
			//height :  document.body.clientHeight - 165,
			colNames : ['序号','id','召会ID','所属小排','所属家','姓名','身份','申请缘由','状态id','状态'],
			colModel:[
			    {name:'num',index:'num', align:'center', sortable:false},
				{name:'id',index:'id', align:'center', sortable:false, key : true,hidden:true},
				{name:'UserId',index:'UserId',  align:'center', sortable:false,hidden:true},
				{name:'groupName',index:'groupName',  align:'center', sortable:false},
				{name:'homeName',index:'homeName' , align:'center', sortable:false},	
				{name:'userName',index:'userName',  align:'center', sortable:false},
				{name:'sex',index:'sex',  align:'center', sortable:false},
				{name:'info',index:'info' , align:'center', sortable:false},	
				{name:'statusinfo',index:'statusinfo' , align:'center', sortable:false,hidden:true},
				{name:'statusinfoName',index:'statusinfoName' , align:'center', sortable:false},	
			],
			rowNum : pageNums,														// 每页显示数量
			rowList:[10,20,30],														// 可选择每页显示数量
			pager: '#keyword_id_div_requestInfoListPage',							// 分页显示位置
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

				if(pgButton == "next_keyword_id_div_requestInfoListPage")
				{
					// 下一页
				 userName = $("#keyword_id_requestInfo_userName").val();//名称
					
					pageIndex = $('#keyword_id_tab_requestInfoList').jqGrid('getGridParam', 'page');
					pageIndex ++;
					pageNums = $('#keyword_id_tab_requestInfoList').jqGrid('getGridParam', 'rowNum');
				}
				else if(pgButton == "last_keyword_id_div_requestInfoListPage")
				{
					// 最后一页
					userName = $("#keyword_id_requestInfo_userName").val();//名称
					
					pageIndex = $('#keyword_id_tab_requestInfoList').jqGrid('getGridParam', 'lastpage');
					pageNums = $('#keyword_id_tab_requestInfoList').jqGrid('getGridParam', 'rowNum');
				}
				else if(pgButton == "prev_keyword_id_div_requestInfoListPage")
				{
					// 上一页
					userName = $("#keyword_id_requestInfo_userName").val();//名称
					
					pageIndex = $('#keyword_id_tab_requestInfoList').jqGrid('getGridParam', 'page');
					pageIndex --;
					pageNums = $('#keyword_id_tab_requestInfoList').jqGrid('getGridParam', 'rowNum');
				}
				else if(pgButton == "first_keyword_id_div_requestInfoListPage")
				{
					// 首页
					userName = $("#keyword_id_requestInfo_userName").val();//名称
					
					pageIndex = 1;
					pageNums = $('#keyword_id_tab_requestInfoList').jqGrid('getGridParam', 'rowNum');
				}
				else if(pgButton == "user")
				{
					// 页码跳转事件
					userName = $("#keyword_id_requestInfo_userName").val();//名称
					
					var lastPageNum = $('#keyword_id_tab_requestInfoList').jqGrid('getGridParam', 'lastpage');
					pageIndex = $('#keyword_id_tab_requestInfoList').jqGrid('getGridParam', 'page');
					if(pageIndex < 1 || pageIndex > lastPageNum)
					{
						alert("页码输入不正确");
						return ;	
					}
					pageNums = $('#keyword_id_tab_requestInfoList').jqGrid('getGridParam', 'rowNum');
				}
				
				$("#keyword_id_tab_requestInfoList").jqGrid('setGridParam',{  
            	datatype:'json',  
            	postData:{
            				userName : userName,
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
	function editHome()
	{
		var selectId = $("#keyword_id_tab_requestInfoList").jqGrid('getGridParam','selrow');
		if(undefined == selectId || 0 > selectId)
		{
			$.messager.alert("操作提示","请选择需要编辑的行，再点击编辑按钮","info")
			return ;	
		}
		// 显示编辑窗口，并填充原数据
		var rowData =  $("#keyword_id_tab_requestInfoList").jqGrid('getRowData',selectId);
		if(undefined != rowData && null != rowData)
		{
			var editId = rowData.id;   //选中的id
			
			var UserId = rowData.UserId;  //用户ID
			
			var userName= rowData.userName;   
			
			var status= rowData.statusinfo;  
			
			var info= rowData.info; 
		
			$("#keyword_id_requestInfoEdit_userName").val(userName);
			$("#keyword_id_requestInfoEdit_requestInfoDesc").val(info);
			$("#keyword_id_requestInfoEdit_status").val(status);
			
			
			
			
			
			
			$("#keyword_id_requestInfo_divEditBack").css("display", "block");
			$("#keyword_id_requestInfo_divEditFront").css("display", "block");
		}
		else
		{
			$.messager.alert("操作提示","未获取到编辑数据","error");	
			return ;
		}
	}
	
	// 更新小排提交
	function requestInfoEditCommit()
	{
	    var selectId = $("#keyword_id_tab_requestInfoList").jqGrid('getGridParam','selrow');
	    if(undefined == selectId || 0 > selectId)
		{
			$.messager.alert("操作提示","请选择需要编辑的行，再点击编辑按钮","info")
			return ;	
		}
		var rowData =  $("#keyword_id_tab_requestInfoList").jqGrid('getRowData',selectId);
		
		
		var editId = rowData.id;   //选中的id
			
		var UserId = rowData.UserId;  //用户ID
			
	    var status= $("#keyword_id_requestInfoEdit_status").val();
		
		if(undefined == status || "-1" == status)
		{
			$.messager.alert("错误提示","请选择","error");
			return ;
		}
		// 向后台提交数据
		$.ajax({
			type : "POST",
			url: "${ctx}/RequestInfo/updateRequestInfo.do",
			data : {
				id : selectId,
				UserId : UserId,
				status: status
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
				
				var statusinfo= $("#keyword_id_requestInfoEdit_status").val();
				var statusinfoName= $("#keyword_id_requestInfoEdit_status").find("option:selected").text(); 
				var thisData = {
					id : selectId,
					statusinfo : statusinfo,
					statusinfoName : statusinfoName
				};
				$("#keyword_id_tab_requestInfoList").jqGrid("setRowData", selectId , thisData);
				
				$("#keyword_id_requestInfo_divEditBack").css("display", "none");
				$("#keyword_id_requestInfo_divEditFront").css("display", "none");
				
				// 提示数据修改成功
				$.messager.alert("操作提醒", "数据修改成功", "info");
			},
			error : function (data) {
				alert("后台通讯故障");
			}	
		});		
	}
	
	function requestInfoEditCancel()
	{
		$("#keyword_id_requestInfo_divEditBack").css("display", "none");
		$("#keyword_id_requestInfo_divEditFront").css("display", "none");
		$("#keyword_id_areasTypeEdit_areasTypeCode").val();
		$("#keyword_id_areasTypeEdit_areasTypeId").val(0);
		$("#keyword_id_areasTypeEdit_requestInfoName").val();
		$("#keyword_id_areasTypeEdit_requestInfoDesc").val();
	}
	
	
	
	
</script>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/pages/commons/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>江苏云道仓储管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/style.css" rel="stylesheet" type="text/css">
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
							src="/StoreManagement/images/icon_card.gif" width="16"
							height="16" align="absmiddle" style="margin-bottom: 4px;">
							当前位置&nbsp;<img
							src="/StoreManagement/images/common/rightArrow.png" width="8"
							height="14" align="absmiddle" style="margin-bottom: 2px;">
							基础数据配置&nbsp;<img
							src="/StoreManagement/images/common/rightArrow.png" width="8"
							height="14" align="absmiddle" style="margin-bottom: 2px;">
							区域类型管理</td>
						<td align="right" class="white" style="padding-right:20px">
					
							
							
							<a href="#"
							class="barBtn" onclick="javascript:editAlarmInfo();"> <img
								src="../images/btn_edit.gif" width="18" height="18"
								align="absmiddle" />编辑状态</a>
								 <a href="#" class="barBtn"
							onclick="javascript:delAlarmInfo();"> <img
								src="../images/delete.gif" width="18" height="18"
								align="absmiddle" /> 删除 </a> <a href="#" class="barBtn"
							onClick="javascript:history.go(-1);"> <img
								src="/StoreManagement/images/btn_left.gif" width="18"
								height="18" align="absmiddle"> 后退 </a> <a href="#"
							class="barBtn" onClick="javascript:history.go(+1);"> <img
								src="/StoreManagement/images/btn_right.gif" width="18"
								height="18" align="absmiddle"> 前进 </a> <a href="#"
							class="barBtn" onclick="javascript:location.reload();"> <img
								src="/StoreManagement/images/btn_refresh.gif" width="18"
								height="18" align="absmiddle"> 刷新 </a></td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td
				style="background-color:#bddbff; border-bottom:1px solid #cfd8e0;"
				valign="top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="table1">
					<tr>
						<td
							style="height:30px; width:100%; background-color:#bddbff; border-bottom:1px solid #cfd8e0;">
							<table width="100%" border="0" cellpadding="3" cellspacing="1"
								class="table1">
								<tr>
									<th width="10%" align="center">报警类型</th>
									<td width="20%" class="BGCgray"><select id="keyword_id_alarmInfo_alarmType">
											<option value="-1">-请选择-</option>
											<option value="1">采购告警</option>
											<option value="2">出库告警</option>
											<option value="3">入库告警</option>
											<option value="4">库内告警</option>
									</select>
									</td>
									<th width="10%" align="center">读取状态:</th>
									<td width="20%" class="BGCgray">
										<select id="keyword_id_alarmInfo_readFlag">
											<option value="-1">-请选择-</option>
											<option value="0">未读</option>
											<option value="1">已读</option>
									</select></td>
									<th width="10%" align="center">
										<BUTTON style="HEIGHT:25px"
											onClick="javascript:queryAreastypeclassify();">
											<img src="../images/btn_search.gif" width="16" height="16"
												align="absmiddle">查询
										</BUTTON></th>
								</tr>
								<tr>
									<th width="10%" align="center">处理状态:</th>
									<td width="20%" class="BGCgray"><select id="keyword_id_alarmInfo_dealFlag">
											<option value="-1">-请选择-</option>
											<option value="0">未处理</option>
											<option value="1">已处理</option>
									</select>
									</td>
									<th width="10%" align="center"></th>
									<td width="20%" class="BGCgray"></td>
									<th width="10%" align="center"></th>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td valign="top">
							<div
								style="overflow:auto;height:100%; width:100%; background-color:#bddbff;">
								<table width="100%" border="0" cellpadding="0" cellspacing="0"
									class="table1" id="keyword_id_tab_alarmInfoList">
								</table>
							</div>
							<div
								style="overflow:auto;height:40px; width:100%; background-color:#bddbff;"
								id="keyword_id_div_alarmInfoListPage"></div></td>
					</tr>
				</table></td>
		</tr>
	</table>

	<!-- 添加区域类型数据 -->
	<div id="keyword_id_alarmInfo_divAddBack" class="div_background">
	</div>
	<div id="keyword_id_alarmInfo_divAddFront" class="div_front">
		<table width="100%" border="0" cellpadding="0" cellspacing="0"
			class="table1">
			<tr>
				<td colspan="2" height="50"><input type="text"
					class="div_text_title" value="添加区域类型" /></td>
			</tr>
			<tr>
				<td height="25" colspan="2"></td>
			</tr>
			<tr>
				<td width="30%" height="40"><input type="text"
					class="div_text_label" readonly="readonly" value="*区域类型名称:" /></td>
				<td width="70%" height="40"></td>
			</tr>
			<tr>
				<td height="40"><input type="text" class="div_text_label"
					readonly="readonly" value="区域类型描述:" /></td>
				<td height="40"><input type="text" class="div_text_content"
					id="keyword_id_id_alarmInfoAdd_areasTypeDesc" /></td>
			</tr>

			<td colspan="25"></td>
			</tr>
			<tr>
				<td height="40" align="right" style="padding-right:20px;"><input
					type="button" class="div_button"
					id="keyword_id_alarmInfoAdd_alarmInfoAddCommit" value="提交"
					onclick="javascript:alarmInfoAddCommit();" /></td>
				<td height="40" align="left" style="padding-left:20px;"><input
					type="button" class="div_button"
					id="keyword_id_alarmInfoAdd_alarmInfoAddCancel" value="取消"
					onclick="javascript:alarmInfoAddCancel();" /></td>
			</tr>
		</table>
	</div>

	<!-- 编辑区域类型数据 -->
	<div id="keyword_id_alarmInfo_divEditBack" class="div_background">
	</div>
	<div id="keyword_id_alarmInfo_divEditFront" class="div_front">
		<table width="100%" border="0" cellpadding="0" cellspacing="0"
			class="table1">
			<tr>
				<td colspan="2" height="50"><input type="text"
					class="div_text_title" value="编辑区域类型" /></td>
			</tr>
			<tr>
				<td height="25" colspan="2"></td>
			</tr>
			<tr>
				<td height="40"><input type="text" class="div_text_label"
					readonly="readonly" value="*读取状态:" /></td>
				<td height="40"><select id="keyword_id_alarmInfoEdit_readFlag">
											<option value="-1">-请选择-</option>
											<option value="0">未读</option>
											<option value="1">已读</option>
									</select>
				</td>
			</tr>
			<tr>
				<td height="40"><input type="text" class="div_text_label"
					readonly="readonly" value="*处理状态:" /></td>
				<td height="40"><select id="keyword_id_alarmInfoEdit_dealFlag">
											<option value="-1">-请选择-</option>
											<option value="0">未处理</option>
											<option value="1">已处理</option>
									</select>
				</td>
			</tr>
			<tr>
				<td colspan="25"></td>
			</tr>
			<tr>
				<td height="40" align="right" style="padding-right:20px;"><input
					type="button" class="div_button"
					id="keyword_id_alarmInfoAdd_alarmInfoEditCommit" value="修改"
					onclick="javascript:alarmInfoEditCommit();" /></td>
				<td height="40" align="left" style="padding-left:20px;"><input
					type="button" class="div_button"
					id="keyword_id_alarmInfoAdd_alarmInfoEditCancel" value="取消"
					onclick="javascript:alarmInfoEditCancel();" /></td>
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
	
	// 添加区域类型
	function addAlarmInfo()
	{
		// 初始化添加区域类型界面
		$("#keyword_id_alarmInfo_divAddBack").css("display", "block");
		$("#keyword_id_alarmInfo_divAddFront").css("display", "block");
		
		$("#keyword_id_id_alarmInfoAdd_areasTypeName").val('');
		$("#keyword_id_id_alarmInfoAdd_areasTypeDesc").val('');
		
	}
	
	// 添加区域类型提交
	function alarmInfoAddCommit()
	{
		// 检查是否有必填项未填
		var areasTypeName = $("#keyword_id_id_alarmInfoAdd_areasTypeName").val();
		var areasTypeDesc = $("#keyword_id_id_alarmInfoAdd_areasTypeDesc").val();
		
		if(undefined == areasTypeName || "" == areasTypeName || areasTypeName.trim().length==0)
		{
			alert("区域类型名称不能为空");
			return ;	
		}
	
		// 向后台提交数据
		$.ajax({
			type : "POST",
			url: "${ctx}/AlarmInfo/addAlarmInfo.do",
			data : {
				areasTypeName : areasTypeName,
				areasTypeDesc : areasTypeDesc	
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
				var dataId = data.alarmInfoId;
				var areasTypeName = $("#keyword_id_id_alarmInfoAdd_areasTypeName").val();
				var areasTypeDesc = $("#keyword_id_id_alarmInfoAdd_areasTypeDesc").val();
				// 界面表格中填充一条记录在第一条
				var thisData = {
					id : dataId,
					areasTypeName : areasTypeName,
					areasTypeDesc : areasTypeDesc
				};
				$("#keyword_id_tab_alarmInfoList").jqGrid("addRowData", dataId, thisData, "first");
				
				// 判断界面中的记录数是否超过每页显示最大值，如超过删除最后一条
				var tableRowCount = $('#keyword_id_tab_alarmInfoList').jqGrid('getRowData').length;
				var pageNums = $('#keyword_id_tab_alarmInfoList').jqGrid('getGridParam', 'rowNum');
				if(tableRowCount > pageNums)
				{
					// 删除最后一条记录
					var lastRowId = $('#keyword_id_tab_alarmInfoList').jqGrid('getRowData')[tableRowCount - 1].id;
					if(undefined != lastRowId)
					{
						$("#keyword_id_tab_alarmInfoList").jqGrid("delRowData", lastRowId);
					}
				}
				
				// 隐藏添加数据界面
				$("#keyword_id_id_alarmInfoAdd_areasTypeName").val();
				$("#keyword_id_id_alarmInfoAdd_areasTypeDesc").val();
				$("#keyword_id_alarmInfo_divAddBack").css("display", "none");
				$("#keyword_id_alarmInfo_divAddFront").css("display", "none");
			},
			error : function (data) {
				alert("后台通讯故障");
			}	
		});
		
	}
	
	// 取消区域类型添加
	function alarmInfoAddCancel()
	{
		$("#keyword_id_alarmInfo_divAddBack").css("display", "none");
		$("#keyword_id_alarmInfo_divAddFront").css("display", "none");
		
		$("#keyword_id_id_alarmInfo_areasTypeName").val();
		$("#keyword_id_id_alarmInfo_areasTypeDesc").val();
	}
	
	

	// 条件查询用户列表
	function queryAreastypeclassify()
	{
		var alarmType = $("#keyword_id_alarmInfo_alarmType").val();//类型                
		var readFlag = $("#keyword_id_alarmInfo_readFlag").val();//读
		var dealFlag = $("#keyword_id_alarmInfo_dealFlag").val();//处理
		
		var pageIndex = $('#keyword_id_div_alarmInfoListPage').getGridParam('page');   //第X页
		var pageNums = $('#keyword_id_div_alarmInfoListPage').getGridParam('pageNums');//总页数
		
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
	    $("#keyword_id_tab_alarmInfoList").jqGrid("GridUnload");
		// 生成列表
		$("#keyword_id_tab_alarmInfoList").jqGrid({
			url : "${ctx}/AlarmInfo/queryAlarmInfo.do",
			datatype : "json",
			postData : {
				alarmType : alarmType,
				readFlag : readFlag,
				dealFlag : dealFlag,
				pageIndex : pageIndex,
				pageNums : pageNums
			},
			height :  document.body.clientHeight - 165,
			colNames : ['记录序号','报警消息类型ID（）','报警消息类型','报警消息标题','报警消息时间','报警消息内容','接受用户名称','已读状态ID','已读状态'
			,'处理状态ID','处理状态'],
			colModel:[
				{name:'id',index:'id', align:'center', sortable:false, key : true},
				{name:'alarmType',index:'alarmType',  align:'center', sortable:false,hidden:true},
				{name:'alarmTypeName',index:'alarmTypeName',  align:'center', sortable:false},
				{name:'alarmtitle',index:'alarmtitle',  align:'center', sortable:false},
				{name:'alarmTime',index:'alarmTime',  align:'center', sortable:false},
				{name:'alarmContent',index:'alarmContent',  align:'center', sortable:false},
				{name:'alarmUserName',index:'alarmUserName',  align:'center', sortable:false},
				{name:'readFlag',index:'readFlag',  align:'center', sortable:false,hidden:true},
				{name:'readFlagName',index:'readFlagName' , align:'center', sortable:false},
				{name:'dealFlag',index:'dealFlag',  align:'center', sortable:false ,hidden:true},
				{name:'dealFlagName',index:'dealFlagName' , align:'center', sortable:false},				
			],
			rowNum : pageNums,														// 每页显示数量
			rowList:[10,20,30],														// 可选择每页显示数量
			pager: '#keyword_id_div_alarmInfoListPage',							// 分页显示位置
			pgtext : "{0} 共 {1} 页",												// 自定义格式的分页显示
			recordtext: " {0} - {1} 共 {2} 条",									// 自定义格式的记录总数
      viewrecords: true, 														// 是否显示行数
      pginput : true,															// 显示跳转输入框
       jsonReader : {  														//后台参数返回前台
			  root: "rows",  												//包含实际数据的数组
			  page: "page",  												//当前页	
			  total: "total",												//总页数
			  records: "records",											//查询出的记录数		
			  repeatitems : false											//每行数据不可重复
			},	
			onPaging : function(pgButton) {

				if(pgButton == "next_keyword_id_div_alarmInfoListPage")
				{
					// 下一页
				 areasTypeName = $("#keyword_id_alarmInfo_areasTypeName").val();//区域类型名称
					
					pageIndex = $('#keyword_id_tab_alarmInfoList').jqGrid('getGridParam', 'page');
					pageIndex ++;
					pageNums = $('#keyword_id_tab_alarmInfoList').jqGrid('getGridParam', 'rowNum');
				}
				else if(pgButton == "last_keyword_id_div_alarmInfoListPage")
				{
					// 最后一页
					 areasTypeName = $("#keyword_id_alarmInfo_areasTypeName").val();//区域类型名称
					
					pageIndex = $('#keyword_id_tab_alarmInfoList').jqGrid('getGridParam', 'lastpage');
					pageNums = $('#keyword_id_tab_alarmInfoList').jqGrid('getGridParam', 'rowNum');
				}
				else if(pgButton == "prev_keyword_id_div_alarmInfoListPage")
				{
					// 上一页
					 areasTypeName = $("#keyword_id_alarmInfo_areasTypeName").val();//区域类型名称
					
					pageIndex = $('#keyword_id_tab_alarmInfoList').jqGrid('getGridParam', 'page');
					pageIndex --;
					pageNums = $('#keyword_id_tab_alarmInfoList').jqGrid('getGridParam', 'rowNum');
				}
				else if(pgButton == "first_keyword_id_div_alarmInfoListPage")
				{
					// 首页
					 areasTypeName = $("#keyword_id_alarmInfo_areasTypeName").val();//区域类型名称
					
					pageIndex = 1;
					pageNums = $('#keyword_id_tab_alarmInfoList').jqGrid('getGridParam', 'rowNum');
				}
				else if(pgButton == "user")
				{
					// 页码跳转事件
					 areasTypeName = $("#keyword_id_alarmInfo_areasTypeName").val();//区域类型名称
					
					var lastPageNum = $('#keyword_id_tab_alarmInfoList').jqGrid('getGridParam', 'lastpage');
					pageIndex = $('#keyword_id_tab_alarmInfoList').jqGrid('getGridParam', 'page');
					if(pageIndex < 1 || pageIndex > lastPageNum)
					{
						alert("页码输入不正确");
						return ;	
					}
					pageNums = $('#keyword_id_tab_alarmInfoList').jqGrid('getGridParam', 'rowNum');
				}
				
				$("#keyword_id_tab_alarmInfoList").jqGrid('setGridParam',{  
            	datatype:'json',  
            	postData:{
            				areasTypeName : areasTypeName,
							pageNums : pageNums,
							pageIndex : pageIndex	
         }, //发送数据      
        }).trigger("reloadGrid");  		//重新载入  
		},
			gridComplete : function(){
			}
		});

	}
	
	// 更新区域类型
	function editAlarmInfo()
	{
		var selectId = $("#keyword_id_tab_alarmInfoList").jqGrid('getGridParam','selrow');
		if(undefined == selectId || 0 > selectId)
		{
			$.messager.alert("操作提示","请选择需要编辑的行，再点击编辑按钮","info")
			return ;	
		}
		// 显示编辑窗口，并填充原数据
		var rowData =  $("#keyword_id_tab_alarmInfoList").jqGrid('getRowData',selectId);
		if(undefined != rowData && null != rowData)
		{
			var editId = rowData.id;   //选中的id
			var readFlag = rowData.readFlag;  //区域类型名称
			var dealFlag = rowData.dealFlag;
			
		
			$("#keyword_id_alarmInfoEdit_readFlag").val(readFlag);
			$("#keyword_id_alarmInfoEdit_dealFlag").val(dealFlag);
			
			$("#keyword_id_alarmInfo_divEditBack").css("display", "block");
			$("#keyword_id_alarmInfo_divEditFront").css("display", "block");
		}
		else
		{
			$.messager.alert("操作提示","未获取到编辑数据","error");	
			return ;
		}
	}
	
	// 更新区域类型提交
	function alarmInfoEditCommit()
	{
	var selectId = $("#keyword_id_tab_alarmInfoList").jqGrid('getGridParam','selrow');
		// 检查是否有必填项未填		
		var readFlag = $("#keyword_id_alarmInfoEdit_readFlag").val();
		var dealFlag = $("#keyword_id_alarmInfoEdit_dealFlag").val();
		
		if(undefined == readFlag || "" == readFlag || readFlag.trim().length==0)
		{
			$.messager.alert("错误提示","读取状态不能为空","error");
			return ;
		}
		if(undefined == dealFlag || "" == dealFlag || dealFlag.trim().length==0)
		{
			$.messager.alert("错误提示","处理状态不能为空","error");
			return ;
		}
		// 向后台提交数据
		$.ajax({
			type : "POST",
			url: "${ctx}/AlarmInfo/updateAlarmInfo.do",
			data : {
				id : selectId,
				readFlag : readFlag,
				dealFlag : dealFlag
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
				var thisData = {
					id : selectId,
					readFlag : data.readFlag,
					readFlagName : data.readFlagName,
					dealFlagName : data.dealFlagName,
					dealFlag : data.dealFlag
				};
				$("#keyword_id_tab_alarmInfoList").jqGrid("setRowData", selectId , thisData);
				
				// 隐藏添加数据界面
				$("#keyword_id_alarmInfoEdit_areasTypeName").val();
				$("#keyword_id_alarmInfoEdit_areasTypeDesc").val();
				$("#keyword_id_alarmInfo_divEditBack").css("display", "none");
				$("#keyword_id_alarmInfo_divEditFront").css("display", "none");
				
				// 提示数据修改成功
				$.messager.alert("操作提醒", "数据修改成功", "info");
			},
			error : function (data) {
				alert("后台通讯故障");
			}	
		});		
	}
	
	function alarmInfoEditCancel()
	{
		$("#keyword_id_alarmInfo_divEditBack").css("display", "none");
		$("#keyword_id_alarmInfo_divEditFront").css("display", "none");
		$("#keyword_id_areasTypeEdit_areasTypeCode").val();
		$("#keyword_id_areasTypeEdit_areasTypeId").val(0);
		$("#keyword_id_areasTypeEdit_areasTypeName").val();
		$("#keyword_id_areasTypeEdit_areasTypeDesc").val();
	}
	
	// 删除区域类型
	function delAlarmInfo()
	{
		// 判断是否有选中记录，如没有则直接退出
		var selectId = $("#keyword_id_tab_alarmInfoList").jqGrid('getGridParam','selrow');
		if(undefined == selectId || 0 > selectId)
		{
			$.messager.alert("操作提示","请选择需要删除的行，再点击删除按钮","info");	
			return ;
		}
		//获取页面参数
		var rowData =  $("#keyword_id_tab_alarmInfoList").jqGrid('getRowData',selectId);
		if(undefined != rowData && null != rowData)
		{		
			var editId = rowData.id;
			//var areasTypeName=rowData.areasTypeName;
			//var areasTypeDesc=rowData.areasTypeDesc;		
			}
		// 弹出确认删除对话框，提醒用户是否删除该条记录
		$.messager.defaults = { ok: "确定", cancel: "取消" };
		
		
		$.messager.confirm("操作提示", "您确定要删除本条记录吗?", function (data){
      if (data) {
      	// 向后台发送ajax请求
      	$.ajax({
      		type : "POST",
					url: "${ctx}/AlarmInfo/deleteAlarmInfo.do",
					data : {
						id : selectId,
						//areasTypeName:areasTypeName,
						//areasTypeDesc:areasTypeDesc
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
						$("#keyword_id_tab_alarmInfoList").jqGrid("delRowData", selectId);
						
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
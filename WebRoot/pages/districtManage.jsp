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
							align="absmiddle" style="margin-bottom: 2px;"> 基础数据配置&nbsp;<img
							src="../images/common/rightArrow.png" width="8" height="14"
							align="absmiddle" style="margin-bottom: 2px;"> 分区类型管理</td>
						<td align="right" class="white" style="padding-right:20px"><a
							href="#" class="barBtn" id="keyword_id_areasType_addBtn"
							onclick="addDistrict();"> <img src="../images/btn_add.gif"
								width="18" height="18" align="absmiddle" /> 新增 </a> <a href="#"
							class="barBtn" onclick="javascript:editDistrict();"> <img
								src="../images/btn_edit.gif" width="18" height="18"
								align="absmiddle" /> 编辑 </a> <a href="#" class="barBtn"
							onclick="javascript:delDistrict();"> <img
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
										<div class="div_keyword_prompt">所属召会</div>
									</td>
									<td width="20%"><select
										id="keyword_id_district_churchName" class="select_keyword">
											<option value="1">南京召会</option>
									</td>
									<td width="10%" align="center" style="margin-left: 20px;">
										<div class="div_keyword_prompt">分区名称</div>
									</td>
									<td width="20%"><input class="input_keyword" type="text"
										id="keyword_id_district_districtName" placeholder="请输入分区类型名称" />
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
									id="keyword_id_tab_districtList">
								</table>
							</div>
							<div style="overflow:auto;height:40px; width:100%;"
								id="keyword_id_div_districtListPage"></div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<!-- 添加分区类型数据 -->
	<div id="keyword_id_district_divAddBack" class="div_background">
	</div>
	<div id="keyword_id_district_divAddFront" class="div_front">
		<table border="0" cellpadding="0" cellspacing="0" width="450"
			height="550">
			<tr style="height:40px;">
				<td colspan="2"
					style="border-bottom:1px solid gainsboro;padding-top: 10px;"><h1
						class="h1">添加分区类型</h1></td>
			</tr>
			<tr style="height:10px;">
				<td colspan="2"></td>
			</tr>
			<tr style="height:35px;">
				<td class="div_font_left_word"><span class="div_front_prompt">*</span>分区类型名称：</td>
				<td><input type="text"
					id="keyword_id_id_districtAdd_districtName"
					class="div_font_right_input" placeholder="请输入分区类型名称" />
				</td>
			</tr>
			<tr style="height:20px;">
				<td class="div_font_left_word">分区类型描述：</td>
				<td></td>
			</tr>
			<tr style="height:38px;">
				<td colspan="2" align="center"><textarea name="groupDesc"
						id="keyword_id_id_districtAdd_districtDesc"
						class="div_font_textarea" placeholder="请给此分区类型一个描述信息呗。。。">
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
							value="取 消" onclick="javascript:districtAddCancel();" /> <input
							type="button" class="div_button_submit div_button_submit_2"
							value="提 交" onclick="javascript:districtAddCommit();" />
					</div>
				</td>
			</tr>
		</table>
	</div>

	<!-- 编辑分区类型数据 -->
	<div id="keyword_id_district_divEditBack" class="div_background">
	</div>
	<div id="keyword_id_district_divEditFront" class="div_front">
		<table border="0" cellpadding="0" cellspacing="0" width="450"
			height="550">
			<tr style="height:40px;">
				<td colspan="2"
					style="border-bottom:1px solid gainsboro;padding-top: 10px;"><h1
						class="h1">编辑分区类型</h1></td>
			</tr>
			<tr style="height:10px;">
				<td colspan="2"></td>
			</tr>
			<tr style="height:35px;">
				<td class="div_font_left_word"><span class="div_front_prompt">*</span>分区类型名称：</td>
				<td><input type="text"
					id="keyword_id_districtEdit_districtName"
					class="div_font_right_input" placeholder="请输入分区类型名称" />
				</td>
			</tr>
			<tr style="height:20px;">
				<td class="div_font_left_word">分区类型描述：</td>
				<td></td>
			</tr>
			<tr style="height:38px;">
				<td colspan="2" align="center"><textarea name="groupDesc"
						id="keyword_id_districtEdit_districtDesc"
						class="div_font_textarea" placeholder="请给此分区类型一个描述信息呗。。。">
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
							value="取 消" onclick="javascript:districtEditCancel();" /> <input
							type="button" class="div_button_submit div_button_submit_2"
							value="修 改" onclick="javascript:districtEditCommit();" />
					</div>
				</td>
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
	
	// 添加分区类型
	function addDistrict()
	{
		// 初始化添加分区类型界面
		$("#keyword_id_district_divAddBack").css("display", "block");
		$("#keyword_id_district_divAddFront").css("display", "block");
		
		$("#keyword_id_id_districtAdd_districtName").val('');
		$("#keyword_id_id_districtAdd_districtDesc").val('');
		
	}
	
	// 添加分区类型提交
	function districtAddCommit()
	{
		// 检查是否有必填项未填
		var districtName = $("#keyword_id_id_districtAdd_districtName").val();
		var districtDesc= $("#keyword_id_id_districtAdd_districtDesc").val();
		
		
		if(undefined == districtName || "" == districtName || districtName.trim().length==0)
		{
			alert("分区类型名称不能为空");
			return ;	
		}
	
		// 向后台提交数据
		$.ajax({
			type : "POST",
			url: "${ctx}/District/addDistrict.do",
			data : {
				districtName : districtName,
				districtDesc: districtDesc	
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
				var dataId = data.districtId;
				var districtName = $("#keyword_id_id_districtAdd_districtName").val();
				var districtDesc= $("#keyword_id_id_districtAdd_districtDesc").val();
				// 界面表格中填充一条记录在第一条
				var thisData = {
					id : dataId,
					districtName : districtName,
					districtDesc: districtDesc
				};
				$("#keyword_id_tab_districtList").jqGrid("addRowData", dataId, thisData, "first");
				
				// 判断界面中的记录数是否超过每页显示最大值，如超过删除最后一条
				var tableRowCount = $('#keyword_id_tab_districtList').jqGrid('getRowData').length;
				var pageNums = $('#keyword_id_tab_districtList').jqGrid('getGridParam', 'rowNum');
				if(tableRowCount > pageNums)
				{
					// 删除最后一条记录
					var lastRowId = $('#keyword_id_tab_districtList').jqGrid('getRowData')[tableRowCount - 1].id;
					if(undefined != lastRowId)
					{
						$("#keyword_id_tab_districtList").jqGrid("delRowData", lastRowId);
					}
				}
				
				// 隐藏添加数据界面
				$("#keyword_id_id_districtAdd_districtName").val();
				$("#keyword_id_id_districtAdd_districtDesc").val();
				$("#keyword_id_district_divAddBack").css("display", "none");
				$("#keyword_id_district_divAddFront").css("display", "none");
			},
			error : function (data) {
				alert("后台通讯故障");
			}	
		});
		
	}
	
	// 取消分区类型添加
	function districtAddCancel()
	{
		$("#keyword_id_district_divAddBack").css("display", "none");
		$("#keyword_id_district_divAddFront").css("display", "none");
		
		$("#keyword_id_id_district_districtName").val();
		$("#keyword_id_id_district_districtDesc").val();
	}
	
	

	// 条件查询用户列表
	function queryAreastypeclassify()
	{
		var districtName = $("#keyword_id_district_districtName").val();//分区类型名称
		
		var pageIndex = $('#keyword_id_div_districtListPage').getGridParam('page');   //第X页
		var pageNums = $('#keyword_id_div_districtListPage').getGridParam('pageNums');//总页数
		
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
	    $("#keyword_id_tab_districtList").jqGrid("GridUnload");
		// 生成列表
		$("#keyword_id_tab_districtList").jqGrid({
			url : "${ctx}/District/queryDistrict.do",
			datatype : "json",
			postData : {
				districtName : districtName,
				pageIndex : pageIndex,
				pageNums : pageNums
			},
			//height :  document.body.clientHeight - 165,
			colNames : ['序号','召会ID','所属召会名称','分区类型名称','分区类型描述'],
			colModel:[
				{name:'id',index:'id', align:'center', sortable:false, key : true},
				{name:'churchId',index:'churchId',  align:'center', sortable:false,hidden:true},	
				{name:'churchName',index:'churchName',  align:'center', sortable:false},
				{name:'districtName',index:'districtName',  align:'center', sortable:false},
				{name:'districtDesc',index:'districtDesc' , align:'center', sortable:false},				
			],
			rowNum : pageNums,														// 每页显示数量
			rowList:[10,20,30],														// 可选择每页显示数量
			pager: '#keyword_id_div_districtListPage',							// 分页显示位置
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

				if(pgButton == "next_keyword_id_div_districtListPage")
				{
					// 下一页
				 districtName = $("#keyword_id_district_districtName").val();//分区类型名称
					
					pageIndex = $('#keyword_id_tab_districtList').jqGrid('getGridParam', 'page');
					pageIndex ++;
					pageNums = $('#keyword_id_tab_districtList').jqGrid('getGridParam', 'rowNum');
				}
				else if(pgButton == "last_keyword_id_div_districtListPage")
				{
					// 最后一页
					 districtName = $("#keyword_id_district_districtName").val();//分区类型名称
					
					pageIndex = $('#keyword_id_tab_districtList').jqGrid('getGridParam', 'lastpage');
					pageNums = $('#keyword_id_tab_districtList').jqGrid('getGridParam', 'rowNum');
				}
				else if(pgButton == "prev_keyword_id_div_districtListPage")
				{
					// 上一页
					 districtName = $("#keyword_id_district_districtName").val();//分区类型名称
					
					pageIndex = $('#keyword_id_tab_districtList').jqGrid('getGridParam', 'page');
					pageIndex --;
					pageNums = $('#keyword_id_tab_districtList').jqGrid('getGridParam', 'rowNum');
				}
				else if(pgButton == "first_keyword_id_div_districtListPage")
				{
					// 首页
					 districtName = $("#keyword_id_district_districtName").val();//分区类型名称
					
					pageIndex = 1;
					pageNums = $('#keyword_id_tab_districtList').jqGrid('getGridParam', 'rowNum');
				}
				else if(pgButton == "user")
				{
					// 页码跳转事件
					 districtName = $("#keyword_id_district_districtName").val();//分区类型名称
					
					var lastPageNum = $('#keyword_id_tab_districtList').jqGrid('getGridParam', 'lastpage');
					pageIndex = $('#keyword_id_tab_districtList').jqGrid('getGridParam', 'page');
					if(pageIndex < 1 || pageIndex > lastPageNum)
					{
						alert("页码输入不正确");
						return ;	
					}
					pageNums = $('#keyword_id_tab_districtList').jqGrid('getGridParam', 'rowNum');
				}
				
				$("#keyword_id_tab_districtList").jqGrid('setGridParam',{  
            	datatype:'json',  
            	postData:{
            				districtName : districtName,
							pageNums : pageNums,
							pageIndex : pageIndex	
         }, //发送数据      
        }).trigger("reloadGrid");  		//重新载入  
		},
			gridComplete : function(){
			}
		});

	}
	
	// 更新分区类型
	function editDistrict()
	{
		var selectId = $("#keyword_id_tab_districtList").jqGrid('getGridParam','selrow');
		if(undefined == selectId || 0 > selectId)
		{
			$.messager.alert("操作提示","请选择需要编辑的行，再点击编辑按钮","info")
			return ;	
		}
		// 显示编辑窗口，并填充原数据
		var rowData =  $("#keyword_id_tab_districtList").jqGrid('getRowData',selectId);
		if(undefined != rowData && null != rowData)
		{
			var editId = rowData.id;   //选中的id
			var districtName = rowData.districtName;  //分区类型名称
			var districtDesc= rowData.districtDesc;
			
		
			$("#keyword_id_districtEdit_districtName").val(districtName);
			$("#keyword_id_districtEdit_districtDesc").val(districtDesc);
			
			$("#keyword_id_district_divEditBack").css("display", "block");
			$("#keyword_id_district_divEditFront").css("display", "block");
		}
		else
		{
			$.messager.alert("操作提示","未获取到编辑数据","error");	
			return ;
		}
	}
	
	// 更新分区类型提交
	function districtEditCommit()
	{
	var selectId = $("#keyword_id_tab_districtList").jqGrid('getGridParam','selrow');
		// 检查是否有必填项未填		
		var districtName = $("#keyword_id_districtEdit_districtName").val();
		var districtDesc= $("#keyword_id_districtEdit_districtDesc").val();
		
		
		if(undefined == districtName || "" == districtName || districtName.trim().length==0)
		{
			$.messager.alert("错误提示","分区名称不能为空","error");
			return ;
		}
		// 向后台提交数据
		$.ajax({
			type : "POST",
			url: "${ctx}/District/updateDistrict.do",
			data : {
				id : selectId,
				districtName : districtName,
				districtDesc: districtDesc
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
					districtName : districtName,
					districtDesc: districtDesc
				};
				$("#keyword_id_tab_districtList").jqGrid("setRowData", selectId , thisData);
				
				// 隐藏添加数据界面
				$("#keyword_id_districtEdit_districtName").val();
				$("#keyword_id_districtEdit_districtDesc").val();
				$("#keyword_id_district_divEditBack").css("display", "none");
				$("#keyword_id_district_divEditFront").css("display", "none");
				
				// 提示数据修改成功
				$.messager.alert("操作提醒", "数据修改成功", "info");
			},
			error : function (data) {
				alert("后台通讯故障");
			}	
		});		
	}
	
	function districtEditCancel()
	{
		$("#keyword_id_district_divEditBack").css("display", "none");
		$("#keyword_id_district_divEditFront").css("display", "none");
		$("#keyword_id_areasTypeEdit_areasTypeCode").val();
		$("#keyword_id_areasTypeEdit_areasTypeId").val(0);
		$("#keyword_id_areasTypeEdit_districtName").val();
		$("#keyword_id_areasTypeEdit_districtDesc").val();
	}
	
	// 删除分区类型
	function delDistrict()
	{
		// 判断是否有选中记录，如没有则直接退出
		var selectId = $("#keyword_id_tab_districtList").jqGrid('getGridParam','selrow');
		if(undefined == selectId || 0 > selectId)
		{
			$.messager.alert("操作提示","请选择需要删除的行，再点击删除按钮","info");	
			return ;
		}
		//获取页面参数
		var rowData =  $("#keyword_id_tab_districtList").jqGrid('getRowData',selectId);
		if(undefined != rowData && null != rowData)
		{		
			var editId = rowData.id;
			var districtName=rowData.districtName;
			var districtDesc=rowData.districtDesc;		
			}
		// 弹出确认删除对话框，提醒用户是否删除该条记录
		$.messager.defaults = { ok: "确定", cancel: "取消" };
		
		
		$.messager.confirm("操作提示", "您确定要删除本条记录吗?", function (data){
      if (data) {
      	// 向后台发送ajax请求
      	$.ajax({
      		type : "POST",
					url: "${ctx}/District/deleteDistrict.do",
					data : {
						id : selectId,
						districtName:districtName,
						districtDesc:districtDesc
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
						$("#keyword_id_tab_districtList").jqGrid("delRowData", selectId);
						
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
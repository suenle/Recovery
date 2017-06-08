<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/pages/commons/taglibs.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/beforestyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" media="screen"
	href="../css/ui.jqgrid.css" />
<script src="../js/jquery-1.9.1.min.js"></script>
<script src="../js/jqGrid/i18n/grid.locale-en.js" type="text/javascript"></script>
<script src="../js/jqGrid/jquery.jqGrid.min.js" type="text/javascript"></script>
<!-- 	<script src="../js/jquery-1.3.2-vsdoc2.js" type="text/javascript" ></script> -->
<!-- 	<script src="../js/mycommon.js" type="text/javascript"></script> -->
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
	<input type="hidden" id="keyword_id_addInfo_churchList" value="" />
	<input type="hidden" id="keyword_id_addInfo_districtList" value="" />
	<input type="hidden" id="keyword_id_addInfo_groupList" value="" />
	<input type="hidden" id="keyword_id_addInfo_homeList" value="" />
	<table width="100%" height="100%" border="0" cellspacing="0"
		cellpadding="3">
		<tr>
			<td height="34" width="100%" style="padding:0px;">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					style="line-height: 34px;height: 34px;">
					<tr>
						<td class="barWord">&nbsp;&nbsp;<img
							src="/Recovery/images/icon_card.gif" width="16" height="16"
							align="absmiddle" style="margin-bottom: 4px;"> 当前位置&nbsp;<img
							src="/Recovery/images/common/rightArrow.png" width="8"
							height="14" align="absmiddle" style="margin-bottom: 2px;">
							操练查询&nbsp;<img src="/Recovery/images/common/rightArrow.png"
							width="8" height="14" align="absmiddle"
							style="margin-bottom: 2px;"> 操练分数查询</td>
						<td align="right" class="white" style="padding-right:20px"><a
							href="#" class="barBtn" onClick="javascript:history.go(-1);">
								<img src="../images/btn_left.gif" width="18" height="18"
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
							style="height:30px; width:100%;border-bottom:1px solid #cfd8e0;">
							<table width="100%" border="0" cellpadding="3" cellspacing="1">
								<tr>
									<td width="10%" align="center" style="margin-left: 20px;">
										<div class="div_keyword_prompt">所属分区</div></td>
									<td width="20%"><select class="select_keyword"
										id="keyword_id_addInfo_district">
											<option value="-1">-请选择-</option>
									</select></td>
									<td width="10%" align="center" style="margin-left: 20px;">
										<div class="div_keyword_prompt">所属小排</div></td>
									<td width="20%"><select class="select_keyword"
										name="groupId" id="keyword_id_addInfo_group">
											<option value="-1">-请先选择分区-</option>
									</select> <datalist id="orderTypeList"></datalist></td>
								</tr>
								<!-- 第二行 -->
								<tr>
									<td width="10%" align="center" style="margin-left: 20px;">
										<div class="div_keyword_prompt">所属家</div></td>
									<td width="20%"><select class="select_keyword"
										name="homeID" id="keyword_id_addInfo_home">
											<option value="-1">-请先选择分区-</option>
									</select></td>
									<td width="10%" align="center" style="margin-left: 20px;">
										<div class="div_keyword_prompt">姓名</div></td>
									<td width="20%"><input accept="middle"
										class="input_keyword" type="text" id="keyword_id_addInfo_name"
										name="userName" placeholder="请输入弟兄/姊妹的姓名" />
									</td>
									<td width="10%" align="right" style="padding-right: 20px;">
										<a href="#" class="query"
										onclick="javascript:queryInfoList();"> <img
											src="../images/common/query_logo.png" width="18" height="18"
											align="absmiddle">查询 </a></td>
								</tr>
								<!-- 第三行 -->
								<!-- <tr>
				    				<td width="10%" align="center" style="margin-left: 20px;">
							        	<div class="div_keyword_prompt">
							        		开始日期
							        	</div>
							        </td>
							        <td width="20%">
							        	<input class="input_keyword" type="text" id="keyword_id_purchaseOrder_startPurchaseTime" placeholder="请输入开始日期" />
							        </td>
							        <td width="10%" align="center" style="margin-left: 20px;">
							        	<div class="div_keyword_prompt">
							        		结束日期
							        	</div>
							        </td>
							        <td width="20%">
							        	<input class="input_keyword" type="text" id="keyword_id_purchaseOrder_endPurchaseTime" placeholder="请输入结束日期" />
							        </td>
						    	</tr> -->
								<!-- 第四行 -->
							</table></td>
					</tr>
					<tr>
						<td valign="top">
							<div style="overflow:auto;height:100%; width:100%;">
								<table width="100%" border="0" cellpadding="0" cellspacing="0"
									id="keyword_id_tab_purchaseOrderList">
								</table>
							</div></td>
					</tr>
					<tr>
						<td>
							<div style="overflow:auto;height:40px; width:100%;"
								id="keyword_id_div_purchaseOrderListPage"></div></td>
					</tr>
				</table></td>
		</tr>
	</table>

	<!-- 绑定商品数据界面 -->
	<div id="keyword_id_purchaseGoodsInfos_divBack" class="div_background">
	</div>
	<div id="keyword_id_purchaseGoodsInfos_divFront"
		style="display: none;position: absolute;top: 16%;left: 2%; width: 90%;
	height: auto;padding: 6px;border: 2px solid #E8E9F7;background-color: #ffffff;z-index: 1003;overflow: auto;">

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
								align="absmiddle" style="margin-bottom: 2px;"> 操练查询&nbsp;<img
								src="../images/common/rightArrow.png" width="8" height="14"
								align="absmiddle" style="margin-bottom: 2px;"> 详细信息查询</td>
							<td align="right" class="white" style="padding-right:20px">
								<a href="#" class="barBtn"
								onclick="javascript:location.reload();"> <img
									src="../images/btn_refresh.gif" width="18" height="18"
									align="absmiddle"> 刷新 </a> <a href="#" class="barBtn"
								onclick="javascript:outPurchaseGoodsInfos();"> <img
									src="../images/mainpage/out_timg.png" width="18" height="18"
									align="absmiddle"> 退出 </a>
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
								style="height:30px; width:100%;border-bottom:1px solid #cfd8e0;">
								<table width="100%" border="0" cellpadding="3" cellspacing="1">
									<tr>
										<td width="10%" align="center" style="margin-left: 20px;">
											<div class="div_keyword_prompt">开始日期</div></td>
										<td width="20%"><input class="input_keyword" type="text"
											id="keyword_id_purchaseOrder_startPurchaseTime"
											placeholder="请输入开始日期" /></td>
										<td width="10%" align="center" style="margin-left: 20px;">
											<div class="div_keyword_prompt">结束日期</div></td>
										<td width="20%"><input class="input_keyword" type="text"
											id="keyword_id_purchaseOrder_endPurchaseTime"
											placeholder="请输入结束日期" /></td>
										<td width="10%" align="right" style="padding-right: 20px;">
											<a href="#" class="query"
											onclick="javascript:queryPurchaseGoodsInfos();"> <img
												src="../images/common/query_logo.png" width="18" height="18"
												align="absmiddle">查询 </a></td>
									</tr>

								</table></td>
						</tr>
						<tr>
							<td valign="top">
								<div style="overflow:auto;height:100%; width:100%;">
									<table width="100%" border="0" cellpadding="0" cellspacing="0"
										id="keyword_id_tab_purchaseGoodsInfosList">
									</table>
								</div>
								<div style="overflow:auto;height:40px; width:100%;"
									id="keyword_id_div_purchaseGoodsInfosListPage"></div></td>
						</tr>
					</table></td>
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
				var cList = data.churchList;
				var dList = data.districtList;
				var gList = data.groupList;
				var hList = data.homeList;
				$("#keyword_id_addInfo_churchList").val(JSON.stringify(cList));
				$("#keyword_id_addInfo_districtList")
						.val(JSON.stringify(dList));
				$("#keyword_id_addInfo_groupList").val(JSON.stringify(gList));
				$("#keyword_id_addInfo_homeList").val(JSON.stringify(hList));
				var str = "";
				for ( var i = 0; i < cList.length; i++) {
					str += "<option value="+cList[i].id+">"
							+ cList[i].churchname + "</option>";

				}
				$("#keyword_id_addInfo_church").append(str);
				var dstr = "";
				for ( var u = 0; u < dList.length; u++) {
					dstr += "<option value="+dList[u].id+">"
							+ dList[u].districtname + "</option>";

				}
				$("#keyword_id_addInfo_district").append(dstr);

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

	//区对应的排联动
	function sel_districtAndGroup(orgSel_id, sel_id) {

		var dList = $("#keyword_id_addInfo_districtList").val();
		var gList = $("#keyword_id_addInfo_groupList").val();
		var did = $(orgSel_id).val();
		var jsongList = eval('(' + gList + ')');
		$(sel_id).empty();
		var gstr = "<option value='-1'>-请选择-</option>";
		for ( var i = 0; i < jsongList.length; i++) {
			if (jsongList[i].districtid == did) {
				gstr += "<option value="+jsongList[i].id+">"
						+ jsongList[i].groupname + "</option>";
			}
		}
		$(sel_id).append(gstr);

	}
	//区对应的家联动（改）
	function sel_GroupAndHome(orgSel_id, sel_id) {

		var gList = $("#keyword_id_addInfo_districtList").val();
		var dList = $("#keyword_id_addInfo_homeList").val();

		var did = $(orgSel_id).val();
		var jsongList = eval('(' + dList + ')');
		$(sel_id).empty();
		var gstr = "<option value='-1'>-请选择-</option>";
		for ( var i = 0; i < jsongList.length; i++) {
			if (jsongList[i].groupid == did) {
				gstr += "<option value="+jsongList[i].id+">"
						+ jsongList[i].homename + "</option>";
			}
		}
		$(sel_id).append(gstr);

	}


//查询个人信息
	function queryInfoList()
	{
			
			
		var churchId = $("#keyword_id_addInfo_church").val();
		var districtId = $("#keyword_id_addInfo_district").val();
		var groupId = $("#keyword_id_addInfo_group").val();
		var homeId = $("#keyword_id_addInfo_home").val();
		var userName = $("#keyword_id_addInfo_name").val();
		var pageIndex = $('#keyword_id_div_purchaseOrderListPage').getGridParam('page');   								//第X页
		var pageNums = $('#keyword_id_div_purchaseOrderListPage').getGridParam('pageNums');								//总页数	
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
	    $("#keyword_id_tab_purchaseOrderList").jqGrid("GridUnload");
		// 生成列表
		$("#keyword_id_tab_purchaseOrderList").jqGrid({
		url : "${ctx}//RecoveryLife/queryInfoList.do",
			datatype : "json",
			postData : {
					churchId : churchId,
						districtId : districtId,
						groupId : groupId,
						homeId : homeId,
						userName : userName,
						pageIndex : pageIndex,
						pageNums :pageNums
			},
			//height :  document.body.clientHeight - 165,
			colNames : ['序号','主键id#','用戶ID#','召會ID','召会名称','分区ID#','分区名称','小排ID','小排名称','家ID',
			'家名称','姓名','性別','操作'],
			colModel:[
			    {name:'num',index:'num', align:'center', sortable:false},
				{name:'id',index:'id', align:'center', sortable:false, key : true,width:80 ,hidden:true},
				{name:'userId',index:'userId',  align:'center', sortable:false,width:80,hidden:true},
				{name:'churchId',index:'churchId' , align:'center', sortable:false,width:80,hidden:true},	
				{name:'churchName',index:'churchName' , align:'center', sortable:false,width:80},	
				{name:'groupId',index:'groupId' , align:'center', sortable:false,width:100,hidden:true },
				{name:'groupName',index:'groupName' , align:'center', sortable:false,width:80},				
				{name:'districtId',index:'districtId' , align:'center', sortable:false,width:80,hidden:true},	
				{name:'districtName',index:'districtName' , align:'center', sortable:false,width:80},
				{name:'homeId',index:'homeId' , align:'center', sortable:false,width:80,hidden:true},
				{name:'homeName',index:'homeName' , align:'center', sortable:false,width:80},
				{name:'userName',index:'userName' , align:'center', sortable:false,width:80},
				{name:'sex',index:'sex' , align:'center', sortable:false,width:80},
				{name:'operator',index:'operator' , align:'center', sortable:false,width:80}
				
			],
			rowNum : pageNums,														// 每页显示数量
			rowList:[10,20,30],														// 可选择每页显示数量
			pager: '#keyword_id_div_purchaseOrderListPage',							// 分页显示位置
			pgtext : "{0} 共 {1} 页",													// 自定义格式的分页显示
			recordtext: " {0} - {1} 共 {2} 条",										// 自定义格式的记录总数
      		viewrecords: true, 															// 是否显示行数
      		pginput : true,																// 显示跳转输入框
      		height : "auto",
			autowidth : true,
       		jsonReader : {  																//后台参数返回前台
			  root: "rows",  														//包含实际数据的数组
			  page: "page",  														//当前页	
			  total: "total",														//总页数
			  records: "records",													//查询出的记录数		
			  repeatitems : false													//每行数据不可重复
			},	
			onPaging : function(pgButton) {

				if(pgButton == "next_keyword_id_div_purchaseOrderListPage")
				{
					// 下一页
				 churchId = $("#keyword_id_addInfo_church").val();
		 districtId = $("#keyword_id_addInfo_district").val();
		 groupId = $("#keyword_id_addInfo_group").val();
		 homeId = $("#keyword_id_addInfo_home").val();
		userName = $("#keyword_id_addInfo_name").val();
 								
					pageIndex = $('#keyword_id_tab_purchaseOrderList').jqGrid('getGridParam', 'page');
					pageIndex ++;
					pageNums = $('#keyword_id_tab_purchaseOrderList').jqGrid('getGridParam', 'rowNum');
				}
				else if(pgButton == "last_keyword_id_div_purchaseOrderListPage")
				{
					// 最后一页
						 churchId = $("#keyword_id_addInfo_church").val();
		 districtId = $("#keyword_id_addInfo_district").val();
		 groupId = $("#keyword_id_addInfo_group").val();
		 homeId = $("#keyword_id_addInfo_home").val();
		userName = $("#keyword_id_addInfo_name").val();
 						
					pageIndex = $('#keyword_id_tab_purchaseOrderList').jqGrid('getGridParam', 'lastpage');
					pageNums = $('#keyword_id_tab_purchaseOrderList').jqGrid('getGridParam', 'rowNum');
				}
				else if(pgButton == "prev_keyword_id_div_purchaseOrderListPage")
				{
					// 上一页
				 churchId = $("#keyword_id_addInfo_church").val();
		 districtId = $("#keyword_id_addInfo_district").val();
		 groupId = $("#keyword_id_addInfo_group").val();
		 homeId = $("#keyword_id_addInfo_home").val();
		userName = $("#keyword_id_addInfo_name").val();
 					
					pageIndex = $('#keyword_id_tab_purchaseOrderList').jqGrid('getGridParam', 'page');
					pageIndex --;
					pageNums = $('#keyword_id_tab_purchaseOrderList').jqGrid('getGridParam', 'rowNum');
				}
				else if(pgButton == "first_keyword_id_div_purchaseOrderListPage")
				{
						 churchId = $("#keyword_id_addInfo_church").val();
		 districtId = $("#keyword_id_addInfo_district").val();
		 groupId = $("#keyword_id_addInfo_group").val();
		 homeId = $("#keyword_id_addInfo_home").val();
		userName = $("#keyword_id_addInfo_name").val();
 					
					pageIndex = 1;
					pageNums = $('#keyword_id_tab_purchaseOrderList').jqGrid('getGridParam', 'rowNum');
				}
				else if(pgButton == "user")
				{
					// 页码跳转事件
							 churchId = $("#keyword_id_addInfo_church").val();
		 districtId = $("#keyword_id_addInfo_district").val();
		 groupId = $("#keyword_id_addInfo_group").val();
		 homeId = $("#keyword_id_addInfo_home").val();
		userName = $("#keyword_id_addInfo_name").val();
 					
					var lastPageNum = $('#keyword_id_tab_purchaseOrderList').jqGrid('getGridParam', 'lastpage');
					pageIndex = $('#keyword_id_tab_purchaseOrderList').jqGrid('getGridParam', 'page');
					if(pageIndex < 1 || pageIndex > lastPageNum)
					{
						alert("页码输入不正确");
						return ;	
					}
					pageNums = $('#keyword_id_tab_purchaseOrderList').jqGrid('getGridParam', 'rowNum');
				}
				
				$("#keyword_id_tab_purchaseOrderList").jqGrid('setGridParam',{  
            	datatype:'json',  
            	postData:{
            		churchId : churchId,
						districtId : districtId,
						groupId : groupId,
						homeId : homeId,
						userName : userName,
						pageIndex : pageIndex,
						pageNums :pageNums
         }, //发送数据      
        }).trigger("reloadGrid");  		//重新载入  
		},
			gridComplete : function(){
			var ids = $("#keyword_id_tab_purchaseOrderList").jqGrid('getDataIDs');
				for(var nloop = 0; nloop < ids.length; nloop ++)
				{
					var editBtn = '<button class="table_button_edit" value='+ids[nloop]+' onClick="javascript:queryGoodsInfos(this);" title="详情">';
					editBtn += '<img alt="" src="../images/common/show.png" width="11" height="11" align="absmiddle" style="padding-right:3px;" />详情</button>';
					//var editBtn = '<BUTTON style="height:21px; font-size:12px" value='+ids[nloop]+' onClick="javascript:queryGoodsInfos(this);">详情</BUTTON>';
					
					jQuery("#keyword_id_tab_purchaseOrderList").jqGrid('setRowData', ids[nloop],
					{
						operator : editBtn
					});
				}
			}
		});

	}






























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
	//绑定时间插件
	//查询页面
		$('#keyword_id_purchaseOrder_startPurchaseTime').datetimepicker();
		$('#keyword_id_purchaseOrder_startPurchaseTime').datetimepicker({value:'',step:10});
		$('#keyword_id_purchaseOrder_endPurchaseTime').datetimepicker();
		$('#keyword_id_purchaseOrder_endPurchaseTime').datetimepicker({value:'',step:10});
	//添加页面
		$('#keyword_id_purchaseOrderAdd_purchaseTime').datetimepicker();
		$('#keyword_id_purchaseOrderAdd_purchaseTime').datetimepicker({value:'',step:10});
	//编辑页面
		$('#keyword_id_purchaseOrderEdit_purchaseTime').datetimepicker();
		$('#keyword_id_purchaseOrderEdit_purchaseTime').datetimepicker({value:'',step:10});
	
	//1.获取所有订单类型(datalist)
	function getOrderTypeList(orderTypeId,orderTypeList){
   	$("#" + orderTypeId).bind("input propertychange", function(){
  	 var orderTypeName=$("#" + orderTypeId).val();    //订单类型名称
   		$.ajax({
				type:"POST",
				url:"${ctx}/OrderType/getAllOrderTypeSelectByOut.do",
				data:
					{
					orderTypeName:orderTypeName
					},
				async:false,
				cache:false,
				success:function(data){			
				var orderTypeInfos=data.orderTypeInfos;	
					var str="";
					$("#" + orderTypeList).html("");						//清空datalist数据
					for(var i=0;i<orderTypeInfos.length;i++){
						str+="<option value="+orderTypeInfos[i].orderTypeName+" data-id="+orderTypeInfos[i].id+">"+orderTypeInfos[i].id+"</option>";
					}					
					$("#" + orderTypeList).append(str);
				},
				error : function (data) {
					$.messager.alert("后台通讯故障");
				}
			});
   });	
	}

	
	$(document).ready(function(){
	//查询
	var customerOrderId="keyword_id_purchaseOrder_customerOrderId";
	var customerOrderList="customerOrderList";	
  	getCustomerOrderList(customerOrderId,customerOrderList);
	});
	//**************************************************************
	//4.获取制单人工号(datalist)
	function getOperatorList(operatorId,operatorList){
   	$("#" + operatorId).bind("input propertychange", function(){
  	 var userName=$("#" + operatorId).val();    //制单人员名称
   		$.ajax({
				type:"POST",
				url:"${ctx}/User/getAllUserSelect.do",
				data:
					{
					userName:userName
					},
				async:false,
				cache:false,
				success:function(data){			
				var userInfos=data.userInfos;	
					var str="";
					$("#" + operatorList).html("");						//清空datalist数据
					for(var i=0;i<userInfos.length;i++){
						str+="<option value="+userInfos[i].userName+" data-id="+userInfos[i].id+">"+userInfos[i].id+"</option>";
					}						
					$("#" + operatorList).append(str);
				},
				error : function (data) {
					$.messager.alert("后台通讯故障");
				}
			});
   });	
	}
	$(document).ready(function(){
	//查询
	var operatorId="keyword_id_purchaseOrder_operatorId";
	var operatorList="operatorList";	
  	getOperatorList(operatorId,operatorList);
	});

	//**************************************************************************************
	
	
	
	


	//*******************************************************************************
	//以下为绑定商品数据操作
	//2.条件查询列表
	function queryPurchaseGoodsInfos()
	{
	//获取商品名称的值
	var filter = $("#keyword_id_purchaseGoodsInfos_goodsName").val();
	queryGoodsInfos(null,filter);
	}
	//1.详情查询
	function queryGoodsInfos(data,filter){
	$("#keyword_id_purchaseOrder_divAddFront").css("display", "none");	
	$("#keyword_id_purchaseGoodsInfos_divBack").show();
	$("#keyword_id_purchaseGoodsInfos_divFront").show(200);
	//***********************************************************
	var goodsName=filter;
	if(data==null){
	var selectId = $("#keyword_id_tab_purchaseOrderList").jqGrid('getGridParam','selrow');												// 序号
		var rowData =  $("#keyword_id_tab_purchaseOrderList").jqGrid('getRowData',selectId);
		if(undefined != rowData && "" != rowData)
		{
			var editId = rowData.id;   		 //选中的id
			var userId=rowData.userId;     //选中的id
			}
	}else{
	var selectId = $(data).val();												// 序号
		var rowData =  $("#keyword_id_tab_purchaseOrderList").jqGrid('getRowData',selectId);
		if(undefined != rowData && "" != rowData)
		{
			var editId = rowData.id;   		 //选中的id
			var userId=rowData.userId;     //选中的id
			
			}
			}			

var startPurchaseTime = $("#keyword_id_purchaseOrder_startPurchaseTime").val();								//开始日期
 		var endPurchaseTime = $("#keyword_id_purchaseOrder_endPurchaseTime").val();									//结束日期
	    
	//分页查询									                                       		
		var pageIndex = $('#keyword_id_div_purchaseGoodsInfosListPage').getGridParam('page');   //第X页
		var pageNums = $('#keyword_id_div_purchaseGoodsInfosListPage').getGridParam('pageNums');//总页数
		
		
		
		//判断开始时间不得大于结束时间
		if((undefined != startPurchaseTime || "" != startPurchaseTime) && (undefined != endPurchaseTime || "" != endPurchaseTime))
		{	
		var newStartTime=new Date(startPurchaseTime);//开始时间对象
		var newEndTime=new Date(endPurchaseTime);    //结束时间对象
			if(newStartTime.getTime()>newEndTime.getTime()){
			$.messager.alert("错误提示","结束日期不能小于开始日期","error");	
			return ;
			}
		}
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
	    $("#keyword_id_tab_purchaseGoodsInfosList").jqGrid("GridUnload");
		// 生成列表
		$("#keyword_id_tab_purchaseGoodsInfosList").jqGrid({
			url : "${ctx}/RecoveryLife/queryRecoveryLife.do",
			datatype : "json",
			postData : {
				userId : userId,
				startPurchaseTime:startPurchaseTime,
				endPurchaseTime:endPurchaseTime,
				pageIndex : pageIndex,
				pageNums : pageNums
			},
			//height :  document.body.clientHeight - 165,
			colNames : ['序号','主键id#','用户id','周','晨兴（同伴）20’','两坛祷告（同伴）30’','祷言背讲','三章旧约','一章新约','个人祷告15’',		
			'传福音（同伴）时数','牧养、看望、爱筵（同伴）','聚会','迟到','申言/分享'],
			colModel:[
			    {name:'num',index:'num', align:'center', sortable:false,hidden:true},
				{name:'id',index:'id', align:'center', sortable:false, key : true,hidden:true},
				{name:'userId',index:'userId',  align:'center', sortable:false,hidden:true},
				{name:'time',index:'time',  align:'center', sortable:false,width:120},
				{name:'morningrevial',index:'morningrevial' , align:'center', sortable:false,width:100},
				{name:'twoaltarpray',index:'twoaltarpray' , align:'center', sortable:false,width:100},				
				{name:'psrp',index:'psrp',  align:'center', sortable:false,width:100},
				{name:'threeold',index:'threeold' , align:'center', sortable:false,width:100},
				{name:'onenew',index:'onenew',  align:'center', sortable:false,width:100},
				{name:'personalpray',index:'personalpray' , align:'center', sortable:false,width:100},				
				{name:'shepherd',index:'shepherd' , align:'center', sortable:false,width:100},
				{name:'gospel',index:'gospel', align:'center', sortable:false,width:100},							
				{name:'meeting',index:'meeting',  align:'center', sortable:false,width:100},
			    {name:'meetingtype',index:'meetingtype' , align:'center', sortable:false,width:100},
				{name:'prophesy',index:'prophesy',  align:'center', sortable:false,width:100},
			],
			rowNum : pageNums,														// 每页显示数量
			rowList:[10,20,30],														// 可选择每页显示数量
			pager: '#keyword_id_div_purchaseGoodsInfosListPage',					// 分页显示位置
			pgtext : "{0} 共 {1} 页",													// 自定义格式的分页显示
			recordtext: " {0} - {1} 共 {2} 条",										// 自定义格式的记录总数
      		viewrecords: true, 															// 是否显示行数
      		pginput : true,																// 显示跳转输入框
      		height : "auto",
			autowidth : false,
       		jsonReader : {  																//后台参数返回前台
			  root: "rows",  														//包含实际数据的数组
			  page: "page",  														//当前页	
			  total: "total",														//总页数
			  records: "records",													//查询出的记录数		
			  repeatitems : false													//每行数据不可重复
			},	
			onPaging : function(pgButton) {

				if(pgButton == "next_keyword_id_div_purchaseGoodsInfosListPage")
				{
				userId=rowData.userId;     //选中的id
			startPurchaseTime = $("#keyword_id_purchaseOrder_startPurchaseTime").val();								//开始日期
 	endPurchaseTime = $("#keyword_id_purchaseOrder_endPurchaseTime").val();									//结束日期
					// 下一页
					pageIndex = $('#keyword_id_tab_purchaseGoodsInfosList').jqGrid('getGridParam', 'page');
					pageIndex ++;
					pageNums = $('#keyword_id_tab_purchaseGoodsInfosList').jqGrid('getGridParam', 'rowNum');
				}
				else if(pgButton == "last_keyword_id_div_purchaseGoodsInfosListPage")
				{
				userId=rowData.userId;     //选中的id
							startPurchaseTime = $("#keyword_id_purchaseOrder_startPurchaseTime").val();								//开始日期
 	endPurchaseTime = $("#keyword_id_purchaseOrder_endPurchaseTime").val();									//结束日期
					// 最后一页
					pageIndex = $('#keyword_id_tab_purchaseGoodsInfosList').jqGrid('getGridParam', 'lastpage');
					pageNums = $('#keyword_id_tab_purchaseGoodsInfosList').jqGrid('getGridParam', 'rowNum');
				}
				else if(pgButton == "prev_keyword_id_div_purchaseGoodsInfosListPage")
				{
					// 上一页
		         userId=rowData.userId;     //选中的id
		         			startPurchaseTime = $("#keyword_id_purchaseOrder_startPurchaseTime").val();								//开始日期
 	endPurchaseTime = $("#keyword_id_purchaseOrder_endPurchaseTime").val();									//结束日期
					pageIndex = $('#keyword_id_tab_purchaseGoodsInfosList').jqGrid('getGridParam', 'page');
					pageIndex --;
					pageNums = $('#keyword_id_tab_purchaseGoodsInfosList').jqGrid('getGridParam', 'rowNum');
				}
				else if(pgButton == "first_keyword_id_div_purchaseGoodsInfosListPage")
				{
					// 首页
					userId=rowData.userId;     //选中的id
								startPurchaseTime = $("#keyword_id_purchaseOrder_startPurchaseTime").val();								//开始日期
 	endPurchaseTime = $("#keyword_id_purchaseOrder_endPurchaseTime").val();									//结束日期
					pageIndex = 1;
					pageNums = $('#keyword_id_tab_purchaseGoodsInfosList').jqGrid('getGridParam', 'rowNum');
				}
				else if(pgButton == "user")
				{
					// 页码跳转事件
					userId=rowData.userId;     //选中的id
								startPurchaseTime = $("#keyword_id_purchaseOrder_startPurchaseTime").val();								//开始日期
 	endPurchaseTime = $("#keyword_id_purchaseOrder_endPurchaseTime").val();									//结束日期
					var lastPageNum = $('#keyword_id_tab_purchaseGoodsInfosList').jqGrid('getGridParam', 'lastpage');
					pageIndex = $('#keyword_id_tab_purchaseGoodsInfosList').jqGrid('getGridParam', 'page');
					if(pageIndex < 1 || pageIndex > lastPageNum)
					{
						alert("页码输入不正确");
						return ;	
					}
					pageNums = $('#keyword_id_tab_purchaseGoodsInfosList').jqGrid('getGridParam', 'rowNum');
				}
				
				$("#keyword_id_tab_purchaseGoodsInfosList").jqGrid('setGridParam',{  
            	datatype:'json',  
            	postData:{
            				userId:userId,
							pageNums : pageNums,
							pageIndex : pageIndex	
         }, //发送数据      
        }).trigger("reloadGrid");  		//重新载入  
		},
			gridComplete : function(){
			}
		});
	
			
	}
	//2.点击详情后，退出按钮
	function outPurchaseGoodsInfos(){
	$("#keyword_id_purchaseOrder_divAddFront").css("display", "none");//添加订单界面
	$("#keyword_id_purchaseOrder_divAddBack").css("display", "none");
	$("#keyword_id_purchaseGoodsInfos_divBack").css("display", "none");
	$("#keyword_id_purchaseGoodsInfos_divFront").css("display", "none");
	}
	//********************************************************************************

  	
	
	
	
	
  	
	




	

	

</script>
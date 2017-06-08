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
<script src="../js/jquery.jqprint-0.3.js"></script>
<script src="../js/jqGrid/i18n/grid.locale-en.js" type="text/javascript"></script>
<script src="../js/jqGrid/jquery.jqGrid.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" media="print"
	href="../css/print.css">
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
	<input type="hidden" id="keyword_id_recordrScore_churchList" value="" />
	<input type="hidden" id="keyword_id_recordrScore_districtList" value="" />
	<input type="hidden" id="keyword_id_recordrScore_groupList" value="" />
	<input type="hidden" id="keyword_id_recordrScore_homeList" value="" />
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
							style="margin-bottom: 2px;">操练记录查询</td>
						<td align="right" class="white" style="padding-right:20px"><a
							href="#" class="barBtn" onclick="javascript:doPrint();"> <img
								src="../images/btn_edit.gif" width="18" height="18"
								align="absmiddle" /> 打印 </a> <a href="#" class="barBtn"
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
							style="height:30px; width:100%;border-bottom:1px solid #cfd8e0;">
							<table width="100%" border="0" cellpadding="3" cellspacing="1">
								<tr>
									<td width="10%" align="center" style="margin-left: 20px;">
										<div class="div_keyword_prompt">所属分区</div></td>
									<td width="20%"><select class="select_keyword"
										id="keyword_id_recordrScore_district">
											<option value="-1">-请选择所属分区-</option>
									</select></td>
									<td width="10%" align="center" style="margin-left: 20px;">
										<div class="div_keyword_prompt">所属小排</div></td>
									<td width="20%"><select class="select_keyword"
										name="groupId" id="keyword_id_recordrScore_group">
											<option value="-1">-请选择所属排-</option>
									</select> <datalist id="orderTypeList"></datalist></td>
									<td width="10%" align="center" style="margin-left: 20px;">
										<div class="div_keyword_prompt">所属家</div></td>
									<td width="20%"><select class="select_keyword"
										name="homeID" id="keyword_id_recordrScore_home">
											<option value="-1">-请选择所属家-</option>
									</select></td>
									<td width="10%" align="center" style="margin-left: 20px;">
										<div class="div_keyword_prompt">内容选择</div></td>
									<td width="10%"><select class="select_keyword"
										id="keyword_id_recordrScore_scoreType">
											<option value="-1">详细统计表</option>
											<option value="2">四周专项及各项总积分表</option>
									</select></td>
								</tr>
								<!-- 第二行 -->
								<tr>
									<td width="10%" align="center" style="margin-left: 20px;">
										<div class="div_keyword_prompt">姓名</div></td>
									<td width="20%"><input accept="middle"
										class="input_keyword" type="text"
										id="keyword_id_recordrScore_name" name="userName"
										placeholder="请输入弟兄/姊妹的姓名" />
									</td>
									<td width="10%" align="center"
										style="margin-left: 20px; display: none"
										class="class_choice_time">
										<div class="div_keyword_prompt">开始日期</div></td>
									<td width="20%" class="class_choice_time" style="display: none"><input
										class="input_keyword" type="text"
										id="keyword_id_purchaseOrder_startTime" placeholder="请输入开始日期" />
									</td>
									<td width="10%" align="center"
										style="margin-left: 20px;display: none"
										class="class_choice_time">
										<div class="div_keyword_prompt">结束日期</div></td>
									<td width="20%" class="class_choice_time" style="display: none"><input
										class="input_keyword" type="text"
										id="keyword_id_purchaseOrder_endTime" placeholder="请输入结束日期" />
									</td>
									<td width="10%" align="center" style="margin-left: 20px;"
										class="class_choice_quick">
										<div class="div_keyword_prompt">快捷选择</div></td>
									<td width="20%" class="class_choice_quick"><select
										class="select_keyword"
										id="keyword_id_recordrScore_quickChoice">
											<option value="1">前一次</option>
											<option value="2">前二次</option>
											<option value="3">前三次</option>
											<option value="4">前四次</option>
											<option value="5">前五次</option>
									</select></td>
									<td width="10%" align="center" style="margin-left: 20px;"
										class="class_choice_quick"></td>
									<td width="20%" class="class_choice_quick"></td>
									<td width="10%" align="center" style="margin-left: 20px;">
									</td>
									<td width="10%" align="right" style="padding-right: 20px;">
										<a href="#" class="query"
										onclick="javascript:queryInfoList();"> <img
											src="../images/common/query_logo.png" width="18" height="18"
											align="absmiddle">查询 </a></td>
								</tr>

								<tr>
								</tr>

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
					<tr>
						<td>
							<div style="overflow:auto;height:100%; width:100%; display: none"
								id="keyword_id_div_print">
								<!-- 打印存数据所在地 -->
							</div></td>
					</tr>
				</table></td>
		</tr>
	</table>


</body>
</html>

<script language="javascript">

 //打印
   function doPrint(){
     $("#keyword_id_div_print").jqprint({
    // debug: false, //如果是true则可以显示iframe查看效果（iframe默认高和宽都很小，可以再源码中调大），默认是false
     importCSS: true, //true表示引进原来的页面的css，默认是true。（如果是true，先会找$("link[media=print]")，若没有会去找$("link")中的css文件）
     printContainer: false, //表示如果原来选择的对象必须被纳入打印（注意：设置为false可能会打破你的CSS规则）。
    // operaSupport: true//表示如果插件也必须支持歌opera浏览器，在这种情况下，它提供了建立一个临时的打印选项卡。默认是true
       });
    
}

$(function() {

      	$("#keyword_id_recordrScore_scoreType").change(function() {
           var type=$("#keyword_id_recordrScore_scoreType").val();
           if(type==2){
              $(".class_choice_time").show();
              $(".class_choice_quick").hide();  
           }else{
              $(".class_choice_quick").show();
              $(".class_choice_time").hide();
              $("#keyword_id_purchaseOrder_startTime").val("");
              $("#keyword_id_purchaseOrder_endTime").val("");
           }
           
            
            })



})



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
				$("#keyword_id_recordrScore_churchList").val(JSON.stringify(cList));
				$("#keyword_id_recordrScore_districtList")
						.val(JSON.stringify(dList));
				$("#keyword_id_recordrScore_groupList").val(JSON.stringify(gList));
				$("#keyword_id_recordrScore_homeList").val(JSON.stringify(hList));
				var str = "";
				for ( var i = 0; i < cList.length; i++) {
					str += "<option value="+cList[i].id+">"
							+ cList[i].churchname + "</option>";

				}
				$("#keyword_id_recordrScore_church").append(str);
				var dstr = "";
				for ( var u = 0; u < dList.length; u++) {
					dstr += "<option value="+dList[u].id+">"
							+ dList[u].districtname + "</option>";

				}
				$("#keyword_id_recordrScore_district").append(dstr);

			},
			error : function(data) {

			}

		});

		$("#keyword_id_recordrScore_district").change(function() {
			var orgSel_id = "#keyword_id_recordrScore_district";
			var sel_groupid = "#keyword_id_recordrScore_group";
			var sel_homeid = "#keyword_id_recordrScore_home";
			sel_districtAndGroup(orgSel_id, sel_groupid);

			sel_GroupAndHome(orgSel_id, sel_homeid);

		});

	});

	//区对应的排联动
	function sel_districtAndGroup(orgSel_id, sel_id) {

		var dList = $("#keyword_id_recordrScore_districtList").val();
		var gList = $("#keyword_id_recordrScore_groupList").val();
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

		var gList = $("#keyword_id_recordrScore_districtList").val();
		var dList = $("#keyword_id_recordrScore_homeList").val();

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



    function printlist(){
    	var districtId = $("#keyword_id_recordrScore_district").val();
		var groupId = $("#keyword_id_recordrScore_group").val();
		var homeId = $("#keyword_id_recordrScore_home").val();
		var userName = $("#keyword_id_recordrScore_name").val();
		var scoreType = $("#keyword_id_recordrScore_scoreType").val();
		var startTime=$("#keyword_id_purchaseOrder_startTime").val();
		var endTime=$("#keyword_id_purchaseOrder_endTime").val();
		var quickChoice=$("#keyword_id_recordrScore_quickChoice").val();
		$.ajax({
			type : "POST",
			url : "${ctx}/LifeScore/queryLifeScorePrint.do",
			data : {    scoreType : scoreType,
						districtId : districtId,
						groupId : groupId,
						homeId : homeId,
						startTime : startTime,
						quickChoice :quickChoice,
						endTime : endTime,
						userName : userName},
			async : false,
			cache : false,
			success : function(data) {
		    	var jsongList = eval('(' + data + ')');
				var errorMsg = jsongList.errorMsg;
				if ("" != errorMsg) {
					alert(errorMsg);
					return ;	
				}
			
				$("#keyword_id_div_print").html("");
				var str = "";
					str += "<table><tr>"
										+"<td width='8%'>排</td>"
										+"<td width='8%'>姓名</td>"
										+"<td width='5%'>晨兴（同伴）20’</td>"
										+"<td width='5%'>两坛祷告（同伴）30’</td>"
										+"<td width='5%'>祷言背讲</td>"
										+"<td width='5%'>三章旧约</td>"
										+"<td width='5%'>一章新约</td>"
										+"<td width='5%' >个人祷告15’</td>"
										+"<td width='5%' >传福音（同伴）时数</td>"
										+"<td width='5%' >牧养、看望、爱筵（同伴）</td>"
										+"<td width='5%'>主日聚会：到会</td>"
										+"<td width='5%'>主日聚会：申言</td>"
										+"<td width='5%'>周初PSRP追求聚会：到会</td>"
										+"<td width='5%'>祷告聚会：到会</td>"
										+"<td width='5%'>小排聚会：到会</td>"
										+"<td width='5%' >小排聚会：分享</td>"
										+"<td width='5%'>脱稿鸟瞰展览</td>"
										+"<td width='5%'>分数类型</td>"
										+"<td width='5%'>四周各项总积分</td>"
									+"</tr>";
			 	for ( var i = 0; i < jsongList.rows.length; i++) {
				     str +="<tr>"
										+"<td>"+jsongList.rows[i].groupname+"</td>"
										+"<td>"+jsongList.rows[i].userName+"</td>"
										+"<td>"+jsongList.rows[i].morningrevialscore+"</td>"
										+"<td>"+jsongList.rows[i].twoaltarprayscore+"</td>"
										+"<td>"+jsongList.rows[i].psrpscore+"</td>"
										+"<td>"+jsongList.rows[i].threeoldscore+"</td>"
										+"<td>"+jsongList.rows[i].onenewscore+"</td>"
										+"<td>"+jsongList.rows[i].personalprayscore+"</td>"
										+"<td>"+jsongList.rows[i].shepherdscore+"</td>"
										+"<td>"+jsongList.rows[i].gospelscore+"</td>"
										+"<td>"+jsongList.rows[i].sundayscore+"</td>"
										+"<td>"+jsongList.rows[i].sundayprophesy+"</td>"
										+"<td>"+jsongList.rows[i].praymeeting+"</td>"
										+"<td>"+jsongList.rows[i].groupmeeting+"</td>"
										+"<td>"+jsongList.rows[i].groupshare+"</td>"
										+"<td>"+jsongList.rows[i].psrpmeeting+"</td>"
										+"<td>"+jsongList.rows[i].birdseyemeeting+"</td>"
										+"<td>"+jsongList.rows[i].scoretype+"</td>"
									    +"<td>"+jsongList.rows[i].totalscore+"</td>"
									+"</tr>";
				} 
				$("#keyword_id_div_print").append(str);

			},
			error : function(data) {

			}

		});


    
    }


//查询个人信息
	function queryInfoList()
	{
			
			printlist();
		//var churchId = $("#keyword_id_recordrScore_church").val();
		var districtId = $("#keyword_id_recordrScore_district").val();
		var groupId = $("#keyword_id_recordrScore_group").val();
		var homeId = $("#keyword_id_recordrScore_home").val();
		var userName = $("#keyword_id_recordrScore_name").val();
		var scoreType = $("#keyword_id_recordrScore_scoreType").val();
		var startTime=$("#keyword_id_purchaseOrder_startTime").val();
		var endTime=$("#keyword_id_purchaseOrder_endTime").val();  
		var quickChoice=$("#keyword_id_recordrScore_quickChoice").val();
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
		url : "${ctx}//LifeScore/queryLifeScore.do",
			datatype : "json",
			postData : {
					    scoreType : scoreType,
						districtId : districtId,
						groupId : groupId,
						homeId : homeId,
						userName : userName,
						startTime : startTime,
						endTime : endTime,
						quickChoice :quickChoice,
						pageIndex : pageIndex,
						pageNums :pageNums
			},
			height :  document.body.clientHeight - 165,
				colNames : ['序号','主键id#','用户id','排id','排','姓名','晨兴（同伴）20’','两坛祷告（同伴）30’','祷言背讲','三章旧约','一章新约','个人祷告15’',		
			'传福音（同伴）时数','牧养、看望、爱筵（同伴）','主日聚会：到会','主日聚会：申言','周初PSRP追求聚会：到会','祷告聚会：到会','小排聚会：到会','小排聚会：分享','脱稿鸟瞰展览','分数类型'
			,'四周各项总积分','开始时间','结束时间'],
			colModel:[
			    {name:'num',index:'num', align:'center', sortable:false,hidden:true},
				{name:'id',index:'id', align:'center', sortable:false, key : true,width:20 ,hidden:true},
				{name:'userId',index:'userId',  align:'center', sortable:false,width:20,hidden:true},
				
				{name:'groupid',index:'groupid' , align:'center', sortable:false,width:80,hidden:true},	
				
				{name:'groupname',index:'groupname' , align:'center', sortable:false,width:75},	
				
				{name:'userName',index:'userName' , align:'center', sortable:false,width:70},	
				{name:'morningrevialscore',index:'morningrevialscore' , align:'center', sortable:false,width:60 },
				{name:'twoaltarprayscore',index:'twoaltarprayscore' , align:'center', sortable:false,width:60},				
				{name:'psrpscore',index:'psrpscore' , align:'center', sortable:false,width:60},	
				
				{name:'threeoldscore',index:'threeoldscore' , align:'center', sortable:false,width:60},
				{name:'onenewscore',index:'onenewscore' , align:'center', sortable:false,width:60},
				
				{name:'personalprayscore',index:'personalprayscore' , align:'center', sortable:false,width:60},
				{name:'shepherdscore',index:'shepherdscore' , align:'center', sortable:false,width:60},
				{name:'gospelscore',index:'gospelscore' , align:'center', sortable:false,width:60},
				{name:'sundayscore',index:'sundayscore' , align:'center', sortable:false,width:60},
				{name:'sundayprophesy',index:'sundayprophesy' , align:'center', sortable:false,width:60},
				{name:'praymeeting',index:'praymeeting' , align:'center', sortable:false,width:60},
				{name:'groupmeeting',index:'groupmeeting' , align:'center', sortable:false,width:60},
				{name:'groupshare',index:'groupshare' , align:'center', sortable:false,width:60},
				{name:'psrpmeeting',index:'psrpmeeting' , align:'center', sortable:false,width:60},
				{name:'birdseyemeeting',index:'birdseyemeeting' , align:'center', sortable:false,width:60},
				{name:'scoretype',index:'scoretype' , align:'center', sortable:false,width:60},
				{name:'totalscore',index:'totalscore' , align:'center', sortable:false,width:120},
				{name:'starttime',index:'starttime' , align:'center', sortable:false,width:120},
				{name:'endtime',index:'endtime' , align:'center', sortable:false,width:120}
			],
			rowNum : pageNums,														// 每页显示数量
			rowList:[10,20],														// 可选择每页显示数量
			pager: '#keyword_id_div_purchaseOrderListPage',							// 分页显示位置
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

				if(pgButton == "next_keyword_id_div_purchaseOrderListPage")
				{
					// 下一页
			 districtId = $("#keyword_id_recordrScore_district").val();
		     groupId = $("#keyword_id_recordrScore_group").val();
		 homeId = $("#keyword_id_recordrScore_home").val();
		 userName = $("#keyword_id_recordrScore_name").val();
		 scoreType = $("#keyword_id_recordrScore_scoreType").val();
		 startTime=$("#keyword_id_purchaseOrder_startTime").val();
		 endTime=$("#keyword_id_purchaseOrder_endTime").val();
 			quickChoice=$("#keyword_id_recordrScore_quickChoice").val();					
					pageIndex = $('#keyword_id_tab_purchaseOrderList').jqGrid('getGridParam', 'page');
					pageIndex ++;
					pageNums = $('#keyword_id_tab_purchaseOrderList').jqGrid('getGridParam', 'rowNum');
				}
				else if(pgButton == "last_keyword_id_div_purchaseOrderListPage")
				{
					// 最后一页
						 districtId = $("#keyword_id_recordrScore_district").val();
		     groupId = $("#keyword_id_recordrScore_group").val();
		 homeId = $("#keyword_id_recordrScore_home").val();
		 userName = $("#keyword_id_recordrScore_name").val();
		 scoreType = $("#keyword_id_recordrScore_scoreType").val();
		 startTime=$("#keyword_id_purchaseOrder_startTime").val();
		 endTime=$("#keyword_id_purchaseOrder_endTime").val();
 						quickChoice=$("#keyword_id_recordrScore_quickChoice").val();
					pageIndex = $('#keyword_id_tab_purchaseOrderList').jqGrid('getGridParam', 'lastpage');
					pageNums = $('#keyword_id_tab_purchaseOrderList').jqGrid('getGridParam', 'rowNum');
				}
				else if(pgButton == "prev_keyword_id_div_purchaseOrderListPage")
				{
					// 上一页
						 districtId = $("#keyword_id_recordrScore_district").val();
		     groupId = $("#keyword_id_recordrScore_group").val();
		 homeId = $("#keyword_id_recordrScore_home").val();
		 userName = $("#keyword_id_recordrScore_name").val();
		 scoreType = $("#keyword_id_recordrScore_scoreType").val();
		 startTime=$("#keyword_id_purchaseOrder_startTime").val();
		 endTime=$("#keyword_id_purchaseOrder_endTime").val();
 			quickChoice=$("#keyword_id_recordrScore_quickChoice").val();		
					pageIndex = $('#keyword_id_tab_purchaseOrderList').jqGrid('getGridParam', 'page');
					pageIndex --;
					pageNums = $('#keyword_id_tab_purchaseOrderList').jqGrid('getGridParam', 'rowNum');
				}
				else if(pgButton == "first_keyword_id_div_purchaseOrderListPage")
				{
			 districtId = $("#keyword_id_recordrScore_district").val();
		     groupId = $("#keyword_id_recordrScore_group").val();
		 homeId = $("#keyword_id_recordrScore_home").val();
		 userName = $("#keyword_id_recordrScore_name").val();
		 scoreType = $("#keyword_id_recordrScore_scoreType").val();
		 startTime=$("#keyword_id_purchaseOrder_startTime").val();
		 endTime=$("#keyword_id_purchaseOrder_endTime").val();
 			quickChoice=$("#keyword_id_recordrScore_quickChoice").val();		
					pageIndex = 1;
					pageNums = $('#keyword_id_tab_purchaseOrderList').jqGrid('getGridParam', 'rowNum');
				}
				else if(pgButton == "user")
				{
					// 页码跳转事件
							 districtId = $("#keyword_id_recordrScore_district").val();
		     groupId = $("#keyword_id_recordrScore_group").val();
		 homeId = $("#keyword_id_recordrScore_home").val();
		 userName = $("#keyword_id_recordrScore_name").val();
		 scoreType = $("#keyword_id_recordrScore_scoreType").val();
		 startTime=$("#keyword_id_purchaseOrder_startTime").val();
		 endTime=$("#keyword_id_purchaseOrder_endTime").val();
 				quickChoice=$("#keyword_id_recordrScore_quickChoice").val();	
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
            		 scoreType : scoreType,
						districtId : districtId,
						groupId : groupId,
						homeId : homeId,
						userName : userName,
						startTime : startTime,
						endTime : endTime,
						quickChoice :quickChoice,
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
		$('#keyword_id_purchaseOrder_startTime').datetimepicker();
		$('#keyword_id_purchaseOrder_startTime').datetimepicker({value:'',step:10});
		$('#keyword_id_purchaseOrder_endTime').datetimepicker();
		$('#keyword_id_purchaseOrder_endTime').datetimepicker({value:'',step:10});
	
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

	
	
	
	//3.点击新增按钮，增加商品详情数据
	
		//截取[]里的字符串
	function Substr(obj){
	var str=obj.substring(obj.indexOf("[")+1,obj.indexOf("]"));
	return str;
	};



	

	

</script>
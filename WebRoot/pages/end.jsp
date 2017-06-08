<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/pages/commons/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>神人生活操练</title>

<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<!-- <link href="/Recovery/css/style.css" rel="stylesheet" type="text/css"
	charset="utf-8"> -->

<script src="/Recovery/js/jquery-1.9.1.min.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<!-- <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm.css">
<script type='text/javascript'
	src='//g.alicdn.com/sj/lib/zepto/zepto.js' charset='utf-8'></script>
<script type='text/javascript'
	src='//g.alicdn.com/msui/sm/0.6.2/js/sm.js' charset='utf-8'></script> -->
<link href="https://cdn.bootcss.com/light7/0.4.3/css/light7.css"
	rel="stylesheet">
<script src="https://cdn.bootcss.com/light7/0.4.3/js/light7.js"></script>
</head>

<body>
	<input type="hidden" id="keyword_id_addInfo_churchList" value="" />
	<input type="hidden" id="keyword_id_addInfo_districtList" value="" />
	<input type="hidden" id="keyword_id_addInfo_groupList" value="" />
	<input type="hidden" id="keyword_id_addInfo_homeList" value="" />
	<div class="page-group">
		<!-- 单个page ,第一个.page默认被展示-->
		<div class="page" style="background-color:#fbf9f3">
			<!-- 标题栏 -->
			<header class="bar bar-nav">
			<h1 class="title"></h1>
			</header>
			<!-- 工具栏 -->
			<nav class="bar bar-tab"> <a class="tab-item external"
				href="${ctx}/RecoveryLife/recoveryLifeInfo.do"> <span
				class="icon icon-star"></span> <span class="tab-label">生活操练</span> </a>
			<a class="tab-item external" href="${ctx}/pages/meun.jsp"> <span
				class="icon icon-me"></span> <span class="tab-label">我的</span> </a> </nav>
			<div class="content" style="margin-top: 3rem">
				<div class="card" style="margin: .9rem">
					<div class="card-header">提交成功</div>
					<div class="card-content">
						<div class="card-content-inner">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;但那等候耶和华的必重新得力；他们必如鹰展翅上腾；他们奔跑却不困倦，行走却不疲乏。
						</div>
							 <div class="card-footer"><span style="width: 50%"></span>---&nbsp;以赛亚书 40章31节</div></div>
					</div>
				</div>


			</div>
		</div>
	</div>

</body>

</html>
<script language="javascript">
	$(document).ready(
			function() {
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
						$("#keyword_id_addInfo_churchList").val(
								JSON.stringify(cList));
						$("#keyword_id_addInfo_districtList").val(
								JSON.stringify(dList));
						$("#keyword_id_addInfo_groupList").val(
								JSON.stringify(gList));
						$("#keyword_id_addInfo_homeList").val(
								JSON.stringify(hList));
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
	function check() {
		var church = $("#keyword_id_addInfo_church").val();
		var district = $("#keyword_id_addInfo_district").val();
		var group = $("#keyword_id_addInfo_group").val();
		var home = $("#keyword_id_addInfo_home").val();
		var name = $("#keyword_id_addInfo_name").val();
		var sex = $("#keyword_id_addInfo_sex").val();

		$("#keyword_id_addInfo_alarm_church").text("");
		$("#keyword_id_addInfo_alarm_district").text("");
		$("#keyword_id_addInfo_alarm_group").text("");
		$("#keyword_id_addInfo_alarm_home").text("");
		$("#keyword_id_addInfo_alarm_name").text("");
		$("#keyword_id_addInfo_alarm_sex").text("");
		if (undefined == church || "" == church || "-1" == church) {
			$.toast("请选择所属召会");
			//	$("#keyword_id_addInfo_alarm_church").text("请选择所属召会");
			return false;
		}
		if (undefined == district || "" == district || "-1" == district) {
			$.toast("请选择所属分区");
			//$("#keyword_id_addInfo_alarm_district").text("请选择所属分区");
			return false;
		}
		if (undefined == group || "" == group || "-1" == group) {
			$.toast("请选择所属小排");
			//$("#keyword_id_addInfo_alarm_group").text("请选择所属小排");
			return false;
		}

		if (undefined == name || "" == name) {
			$.toast("请輸入姓名");
			//$("#keyword_id_addInfo_alarm_name").text("请輸入姓名");
			return false;
		}

		if (undefined == sex || "" == sex || "-1" == sex) {
			$.toast("请选择性别");
			$("#keyword_id_addInfo_alarm_sex").text("请选择性别");
			return false;
		}

		return true;
	}
</script>



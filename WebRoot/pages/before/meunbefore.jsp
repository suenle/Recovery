<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/pages/commons/taglibs.jsp"%>
<html>
<head>
<title>神人生活操练--菜单</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<link href="/Recovery/css/style.css" rel="stylesheet" type="text/css"
	charset="utf-8">
<script src="/Recovery/js/jquery-1.9.1.min.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

</head>

<body>
	<input type="hidden" id="keyword_id_addInfo_churchList" valu e="" />
	<input type="hidden" id="keyword_id_addInfo_districtList" value="" />
	<input type="hidden" id="keyword_id_addInfo_groupList" value="" />
	<input type="hidden" id="keyword_id_addInfo_homeList" value="" />

	<header class="text-center"
		style="border-bottom:1px solid gainsboro;padding-top: 5px;">
		<span id="keyword_id_meun_myinfo">正在获取数据....</span>
	</header>
	<div id="keyword_id_areasTypeClassify_divAddFront"
		style="width: 85%; margin:0 auto;">
		<form method="post" action="${ctx}/UserInfo/addInfo.do"
			onsubmit="return check()">
			<table border="0" cellpadding="0" cellspacing="0" width="100%"
				height="auto" style="text-align: center;">
				<tr style="height:30px;" class="tr_height">
				</tr>
				<tr style="height:20px;" class="tr_height">
				</tr>
				<tr style="height:20px;">
					<td colspan="2" class=""><span class="div_front_prompt"></span><a
						href="${ctx}/pages/myInfo.jsp"><input type="button"
							class="div_button_meun" value="个人信息修改"
							onclick="javascript:areasTypeClassifyAddCommit();" /> </a>
					</td>
				</tr>
				<tr style="height:20px; display: none;" class="class_display_query">
				</tr>
				<tr style="height:20px;display: none;" class="class_display_query">
					<td colspan="2" class=""><span class="div_front_prompt"></span><a
						href="${ctx}/pages/queryInfo.jsp"><input type="button"
							class="div_button_meun" value="操练查询"
							onclick="javascript:areasTypeClassifyAddCommit();" /> </a>
					</td>
				</tr>
				<tr style="height:20px;display: none;" class="class_display_add">
				</tr>
				<tr style="height:20px;display: none;" class="class_display_add">
					<td colspan="2" class=""><span class="div_front_prompt"></span><a
						href="${ctx}/pages/Addhomeorgroup.jsp"><input type="button"
							class="div_button_meun" value="增排增家"
							onclick="javascript:areasTypeClassifyAddCommit();" /> </a>
					</td>
				</tr>
				<tr style="height:20px;display: none;" class="class_display_care">
				</tr>
				<tr style="height:20px;display: none;" class="class_display_care">
					<td colspan="2" class=""><span class="div_front_prompt"></span><a
						href="${ctx}/pages/requestCareInfo.jsp"><input type="button"
							class="div_button_meun" value="申请服侍者"
							onclick="javascript:areasTypeClassifyAddCommit();" /> </a>
					</td>
				</tr>
				<tr style="height:20px;" class="tr_height">
				</tr>
				<tr style="height:20px;" class="tr_height">
				</tr>
				<tr style="height:10px;" class="tr_height">
					<td class="" width="40%"></td>
					<td width="60%"><span id="keyword_id_addInfo_alarm_sex"
						class="div_front_prompt"></span></td>
				</tr>
				<tr style="height:20px;" class="tr_height">
				</tr>
				<tr style="height:10px;">
					<td colspan="2"></td>
				</tr>
				<tr style="height:30px;">
				</tr>
				<tr style="">
					<td colspan="2"></td>
				</tr>
			</table>
		</form>
	</div>
		<!--bottom-->
	<div id="menu" class="menu">
		<a href="${ctx}/RecoveryLife/recoveryLifeInfo.do"><div id="one"
				class="subMenu text-center">
				<img src="../images/frame1.png" width="23" height="23" style="margin-top: 3px">
				<div class="menu_name">
					<span style="color: black">神人生活操练</span>
				</div>
			</div> </a> <a href="${ctx}/pages/meun.jsp"><div id="two"
				class="subMenu text-center">
				<img src="../images/frame1.png" width="23" height="23" style="margin-top: 3px">
				<div class="menu_name">
					<span style="color: black">我的</span>
				</div>
			</div> </a>
	</div>
	</div>

</body>
</html>
<script language="javascript">
	$(document).ready(function() {
		//获取会所四级
		$.ajax({
			type : "POST",
			url : "${ctx}//User/getMeun.do",
			data : {},
			async : false,
			cache : false,
			success : function(data) {
				var errorMsg = data.errorMsg;
				if ("" != errorMsg) {
					alert(errorMsg);
				}
				var userName = data.userName;

				var sex = data.sex;

				$("#keyword_id_meun_myinfo").text(userName + sex + "的菜单");

				var userGroup = data.userGroup;
				if (userGroup == "0") {
					$(".class_display_care").show();
				} else if (userGroup == "1") {
					$(".class_display_query").show();
					$(".class_display_add").show();

				} else if (userGroup == "2") {
					$(".class_display_query").show();
					$(".class_display_add").show();
					$(".class_display_care").show();
				}

			},
			error : function(data) {

			}

		});

	});
</script>

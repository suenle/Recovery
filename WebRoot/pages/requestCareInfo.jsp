<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/pages/commons/taglibs.jsp"%>
<html>
<head>
<title>神人生活操练--个人信息修改</title>
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
	<div id="keyword_id_areasTypeClassify_divAddFront"
		style="width: 85%; margin:0 auto;">
		<form method="post" action="${ctx}/RecoveryLife/requestCarer.do">
			<table border="0" cellpadding="0" cellspacing="0" width="100%"
				height="auto" style="text-align: center;">
				<tr style="height:80px;">
					<td colspan="2"
						style="border-bottom:1px solid gainsboro;padding-top: 5px;"><h3
							textareaclass="h1">申请服侍者表</h3></td>
				</tr>
				<tr style="height:20px;" class="tr_height">
				</tr>
				<tr style="height:20px;">
					<td   colspan="2" class=""><textarea style="width: 90%;height: 250px"  placeholder="请填写理由  例如：“我是咏梅弟兄之家家长” " name="info" ></textarea></td>
				</tr>
				<tr style="height:10px;">
					<td colspan="2"></td>
				</tr>
				<tr style="height:30px;">
					<td colspan="2" style="border-top:1px solid gainsboro;"></td>
				</tr>
				<tr style="">
					<td colspan="2">
						<div>
							<input type="submit"
								class="div_button_submit div_button_submit_2" value="提交"
								style="width: 90%;height: 45px" />

						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div style="height: 50px"></div>
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
			$("#keyword_id_addInfo_alarm_church").text("请选择所属召会");
			return false;
		}
		if (undefined == district || "" == district || "-1" == district) {
			$("#keyword_id_addInfo_alarm_district").text("请选择所属分区");
			return false;
		}
		if (undefined == group || "" == group || "-1" == group) {
			$("#keyword_id_addInfo_alarm_group").text("请选择所属小排");
			return false;
		}

		if (undefined == name || "" == name) {
			$("#keyword_id_addInfo_alarm_name").text("请輸入姓名");
			return false;
		}

		if (undefined == sex || "" == sex || "-1" == sex) {
			$("#keyword_id_addInfo_alarm_sex").text("请选择性别");
			return false;
		}

		return true;
	}
</script>

<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/pages/commons/taglibs.jsp"%>
<html>
<head>
<title>神人生活操练--操练查询</title>
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
	<input type="hidden" id="keyword_id_addInfo_churchList" value="" />
	<input type="hidden" id="keyword_id_addInfo_districtList" value="" />
	<input type="hidden" id="keyword_id_addInfo_groupList" value="" />
	<input type="hidden" id="keyword_id_addInfo_homeList" value="" />

	<div id="keyword_id_div_queryInfo_query"
		style="width: 85%; margin:0 auto;">
		<form method="post" action="${ctx}/Church/addGroupOrHome.do"
			onsubmit="return check()">
			<table border="0" cellpadding="0" cellspacing="0" width="100%"
				height="auto" style="text-align: center;">
				<tr style="height:30px;" class="tr_height">
				</tr>
				<tr style="height:20px;">
					<td class="" width="40%"><span class="div_front_prompt">*</span>所属召会：
					</td>
					<td width="60%"><select class="input_class"
						id="keyword_id_addInfo_church">
					</select>
					</td>
				</tr>
				<tr style="height:10px;" class="tr_height">
					<td class="" width="40%"></td>
					<td width="60%"><span id="keyword_id_addInfo_alarm_church"
						class="div_front_prompt"></span>
					</td>
				</tr>
				<tr style="height:20px;" class="tr_height">
				</tr>
				<tr style="height:20px;">
					<td class=""><span class="div_front_prompt">*</span>所属分区：</td>

					<td><select class="input_class"
						id="keyword_id_addInfo_district" name="districtId">
							<option value="-1">-请选择-</option>
					</select>
					</td>
				</tr>
				<tr style="height:10px;" class="tr_height">
					<td class="" width="40%"></td>
					<td width="60%"><span id="keyword_id_addInfo_alarm_district"
						class="div_front_prompt"></span>
					</td>
				</tr>
				<tr style="height:20px;" class="tr_height">
				</tr>
				<tr style="height:20px;">
					<td class=""><span class="div_front_prompt">*</span>新增排/家：</td>
					<td><div style="margin-right: 5px">
							<select class="input_class" name="addType"
								id="keyword_id_addInfo_group">
								<option value="0">-排-</option>
								<option value="1">-家-</option>
							</select>
						</div>
					</td>
				</tr>
				<tr style="height:10px;" class="tr_height">
					<td class="" width="40%"></td>
					<td width="60%"><span id="keyword_id_addInfo_alarm_group"
						class="div_front_prompt"></span>
					</td>
				</tr>
				<tr style="height:10px;" class="tr_height">
					<td class="" width="40%"></td>
					<td width="60%"><span id="keyword_id_addInfo_alarm_home"
						class="div_front_prompt"></span></td>
				</tr>
				<tr style="height:20px;" class="tr_height">
				</tr>
				<tr style="height:20px;">
					<td class=""><span class="div_front_prompt">*</span>名
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</td>
					<td><input accept="middle" class="input_class" type="text"
						id="keyword_id_addInfo_name" name="userName"
						placeholder="请输入排/家名称" /></td>

				</tr>
				<tr style="height:10px;" class="tr_height">
					<td class="" width="40%"></td>
					<td width="60%"><span id="keyword_id_addInfo_alarm_name"
						class="div_front_prompt"></span></td>
				</tr>
				<tr style="height:20px;" class="tr_height">
				</tr>
				<tr style="height:10px;">
					<td colspan="2"><span id="keyword_id_login_alarm_info"
						class="div_front_prompt"></span>
					</td>
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
								class="div_button_submit div_button_submit_2" value="新增"
								onclick="javascript:areasTypeClassifyAddCommit();"
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
				<img class="menu_img" style="margin-top: 3px" />
				<div class="menu_name">
					<span style="color: black">神人生活操练</span>
				</div>
			</div> </a> <a href="../pages/meun.jsp"><div id="two"
				class="subMenu text-center">
				<img class="menu_img" style="margin-top: 3px" />
				<div class="menu_name">
					<span style="color: black">我的</span>
				</div>
			</div> </a>
	</div>
	</div>
</body>
</html>
<script language="javascript">
	// 页面初始化检查
	$(document)
			.ready(
					function(data) {
						if (undefined != data && "" != data
								&& "undefined" != data.errorMsg
								&& "" != data.errorMsg) {
							$("#keyword_id_login_alarm_info")
									.val(data.errorMsg);
						}
					});

	//后他验证登陆错误提示信息
	$(function() {
		var v = "${GSON_RESULT_OBJECT}";
		var loginTip = v.substring(v.indexOf("=") + 1, v.indexOf("}"));
		if (undefined != v && "" != v && undefined != loginTip
				&& "" != loginTip) {
			$("#keyword_id_login_alarm_info").text(loginTip);
			return;
		}
	});

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
						$("#keyword_id_addInfo_churchList").val(
								JSON.stringify(cList));
						$("#keyword_id_addInfo_districtList").val(
								JSON.stringify(dList));
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

			});

	// 登录提交检查
	function check() {
		$("#keyword_id_login_alarm_info").val("");
		var district = $("#keyword_id_addInfo_district").val();
		var userName = $("#keyword_id_addInfo_name").val();
		if (undefined == district || "" == district || "-1" == district) {
			$("#keyword_id_login_alarm_info").text("请选择所属区");
			return false;
		} else {
			$("#keyword_id_login_alarm_info").text("");
		}

		if (undefined == userName || "" == userName) {
			$("#keyword_id_login_alarm_info").text("请输入名称");
			return false;
		} else {
			$("#keyword_id_login_alarm_info").text("");
		}

		return true;

	}
</script>

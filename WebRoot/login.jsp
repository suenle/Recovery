<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/pages/commons/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>神人生活操练--登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<link href="/Recovery/css/style.css" rel="stylesheet" type="text/css"
	charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script src="/Recovery/js/jquery-1.9.1.min.js"></script>
<!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

</head>
<body>
	<div id="keyword_id_areasTypeClassify_divAddFront"
		style="width: 85%; margin:0 auto;">
		<form method="post" action="login.do" name="loginForm"
			onsubmit="return check()" theme="simple">
			<table border="0" cellpadding="0" cellspacing="0" width="100%"
				style="text-align: center;">
				<tr style="height:20px;" class="tr_height">
				</tr>
				<tr style="height:80px;">
					<td colspan="2"
						style="border-bottom:1px solid gainsboro;padding-top: 5px;"><h3
							class="h1">登录</h3></td>
				</tr>
				<tr style="height:30px;" class="tr_height">
				</tr>
				<tr style="height:20px;">
					<td class=""><span class="div_front_prompt">*</span>用&nbsp;户
						&nbsp;名：</td>
					<td><input accept="middle" class="input_class" type="text"
						id="keyword_id_login_account" name="account" placeholder="请输入账号" />
					</td>
				</tr>
				<tr style="height:10px;" class="tr_height">
					<td class="" width="40%"></td>
					<td width="60%"><span id="keyword_id_login_alarm_account"
						class="div_front_prompt"></span>
					</td>
				</tr>
				<tr style="height:30px;" class="tr_height">
				</tr>
				<tr style="height:20px;">
					<td class=""><span class="div_front_prompt">*</span>密
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
					<td><input accept="middle" class="input_class" type="password"
						name="password" id="keyword_id_login_password" placeholder="请输入密码" />
					</td>
				</tr>
				<tr style="height:10px;" class="tr_height">
					<td class="" width="40%"></td>
					<td width="60%"><span id="keyword_id_login_alarm_password"
						class="div_front_prompt"></span>
					</td>
				</tr>

				<tr style="height:30px;" class="tr_height">
				</tr>
				<tr style="height:10px;">
					<td colspan="2"><span id="keyword_id_login_alarm_info"
						class="div_front_prompt"></span></td>
				</tr>
				<tr style="height:50px;">
					<td colspan="2" style="border-top:1px solid gainsboro;">
						<div
							style="text-align:center;padding-top: 7px;padding-bottom: 7px;">
							<input type="submit"
								class="div_button_submit div_button_submit_2" value="登 录"
								onclick="javascript:areasTypeClassifyAddCommit();" /> <a
								href="pages/register.jsp"><input type="button"
								class="div_button_cancel div_button_cancel_2" value="注 册"
								onclick="javascript:areasTypeClassifyAddCancel();" /> </a>

						</div>
					</td>
				</tr>
			</table>
		</form>
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

	// 登录提交检查
	function check() {
		$("#keyword_id_login_alarm_info").val("");
		var userName = $("#keyword_id_login_account").val();
		var password = $("#keyword_id_login_password").val();
		if (undefined == userName || "" == userName) {
			$("#keyword_id_login_alarm_account").text("请输入用户名");
			return false;
		} else {
			$("#keyword_id_login_alarm_account").text("");
		}
		if (userName.length < 6) {
			$("#keyword_id_login_alarm_account").text("用户名至少要6位以上");
			return false;
		} else {
			$("#keyword_id_login_alarm_account").text("");
		}

		if (undefined == password || "" == password) {
			$("#keyword_id_login_alarm_password").text("请输入密码");
			return false;
		} else {
			$("#keyword_id_login_alarm_password").text("");
		}
		if (password.length < 6) {
			$("#keyword_id_login_alarm_password").text("密码至少要6位以上");
			return false;
		} else {
			$("#keyword_id_login_alarm_password").text("");
		}

		return true;

	}


	// 按钮重置
	function reset() {
		$("#keyword_id_loginName").val("");
		$("#keyword_id_loginPassword").val("");
		$("#keyword_id_loginTip").val("");

	}
</script>

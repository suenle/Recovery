<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/pages/commons/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
	<head>
		<title>云道仓储管理系统 —— 登 录</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="css/style.css" rel="stylesheet" type="text/css">
		<script src="js/jquery-1.9.1.min.js"></script>
		<style type="text/css">
			.inputbox:-webkit-autofill {
					 -webkit-box-shadow: 0 0 0px 1000px #0a79d0 inset !important;
					 -webkit-text-fill-color: white;
				}
			::-webkit-input-placeholder{color:#ffffff;font-family: 微软雅黑;}
			::-moz-placeholder{color:#ffffff;font-family: 微软雅黑;}	/* Mozilla Firefox 19+ */
			:-moz-placeholder{color:#ffffff;font-family: 微软雅黑;}		/* Mozilla Firefox 4-18 */
		</style>
	</head>
	<!-- background-color: #0978CA; -->
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll="no" style="background-image: url('images/store/bg_back.png');background-repeat: no-repeat;background-size: 100%;">
	<div style="background-repeat: no-repeat;background-image: url('images/store/loginBg2.png');background-position: center;width: 100%;height: 100%;">
		<table width="100%" height="100%" border="0" bordercolor="red" cellspacing="0" cellpadding="0">
	  		<tr height="60%">
	    		<td height="100%" align="center">
	    		<img src="images/store/userlogin.png" width="300" height="120" style="position: relative;float: left;left: 6%;">
	    			<form method="post" action="login.do" name="loginForm" onsubmit="return check()" theme="simple">
		    			<table width="620" height="435" border="0" bordercolor="blue" cellpadding="0" cellspacing="0" style="margin-right: 24px;margin-top: 180px;">
			      			<tr>
			        			<td>
			        				<table width="500" height="200" border="0" bordercolor="gold" align="center" cellpadding="0" cellspacing="0" style="margin-top: 0px;">
				          				<tr style="height: 80px;">
				          					<td colspan="2" align="center" style="font-family: 微软雅黑;color: #ffffff;font-size: 36px;" >
				          						江苏云道仓储管理系统
				          					</td>
				          				</tr>
				          				<!-- 用户框 -->
				          				<tr style="height: 90px;">
				            				<td colspan="2" align="center" >
				            				<div style="position:relative;background:url(images/store/bg_input.png) no-repeat; width:300px; height:40px;">
				            					<img alt="" src="images/store/bg_user.png" width="19" height="19" style="position:absolute;z-index: 2;margin-left: 13px;margin-top: 11px;margin-left: -137px;" />
				            					<input class="inputbox" id="keyword_id_loginName" name="account" type="text" autocomplete="off" placeholder="请输入用户名" style="border:none; outline:none;position:absolute;z-index: 1;margin-left: -106px;font-size: 14px;color: white;margin-top: 7px;width: 240px;height: 26px;background-color:#0a79d0;" />
				            				</div>
				            				</td>
				           	 			</tr>
				           	 			<!-- 密码框 -->
				          				<tr style="height: 75px;">
				            				<td colspan="2" align="center" valign="top">
				            				<div style="position:relative;background:url(images/store/bg_input.png) no-repeat; width:300px; height:40px;">
				            					<img alt="" src="images/store/bg_pass.png" width="19" height="19" style="position:absolute;z-index: 2;margin-left: 13px;margin-top: 11px;margin-left: -137px;" />
				            					<input class="inputbox" id="keyword_id_loginPassword" name="password" type="password" autocomplete="off"placeholder="请输入密码" style="border:none; outline:none;position:absolute;z-index: 1;margin-left: -106px;font-size: 14px;color: white;margin-top: 7px;width: 240px;height: 26px;background-color:#0a79d0;" />
				            				</div>
				            				</td>
				            			</tr>
				            			<!-- 按钮 -->
				            			<tr style="height: 50px;">
				            				<td colspan="2" valign="top">
				            					<table border="0" align="center" cellpadding="0" cellspacing="5">
				              					<tr>
				                					<td align="center">
				                						<input type="submit" id="keyword_id_submit" style="background:url(images/store/bg_submit.png) no-repeat; width:94px; height:42px;border:none; outline:none; margin-right: 38px;" value=" " />
				                						<input type="button" onclick="javascript:reset()" style="background:url(images/store/bg_reset.png) no-repeat; width:94px; height:42px;border:none; outline:none;" value=" " />
				                					</td>
				                				</tr>
				                				</table>
				                			</td>
				            			</tr>
				            			<!-- 提示信息 -->
				          				<tr style="height: 60px;">
				            				<td align="center" colspan="2">
				            					<div id="keyword_id_div_loginTip">
					            					<img alt="" src="images/store/bg_prompt.png" width="19" height="19" align="absmiddle" />
					            					<input type="text" id="keyword_id_loginTip" name="loginTip" style="border:0px; color:red;width: 120px;height: 21px;" readonly="readonly" value="" />
				            					</div>
				            				</td>
				                		</tr>
	            					</table>
			        			</td>
			        		</tr>
		          		</table>
		          	</form>
	    		</td>
	    	</tr>
    	</table>
	</div>
		 
	</body>
</html>

<script language="javascript">
	// 页面初始化检查
	$(document).ready(function(data){
		if(undefined != data && "" != data && "undefined" != data.errorMsg && "" != data.errorMsg)
		{
			$("#keyword_id_loginTip").val(data.errorMsg);
		}
	});
	
	
	//后他验证登陆错误提示信息
	$(function(){
		var v = "${GSON_RESULT_OBJECT}";
		var loginTip = v.substring(v.indexOf("=")+1, v.indexOf("}"));
		if(undefined != v && "" != v && undefined != loginTip && "" != loginTip){
			$("#keyword_id_loginTip").val(loginTip);
			return ;
		}
	});
	
	// 登录提交检查
	function check()
	{
		var userCode = $("#keyword_id_loginName").val();
		var password = $("#keyword_id_loginPassword").val();
		if(undefined == userCode || "" == userCode)
		{
			$("#keyword_id_loginTip").val("请输入用户名");
			document.loginForm.userCode.focus();
			return false;
		}
		else if(undefined == password || "" == password)
		{
		    $("#keyword_id_loginTip").val("请输入密码");
		    document.loginForm.password.focus();
		    return false;
		}
		else 
		{
			User.userCode = userCode;
			return true;
		}
	}
	
	// 按钮重置
	function reset()
	{
		$("#keyword_id_loginName").val("");	
		$("#keyword_id_loginPassword").val("");	
		$("#keyword_id_loginTip").val("");
		
	}
</script>
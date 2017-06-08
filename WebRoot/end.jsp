<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/pages/commons/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
  <head>
    <title>登录页面</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
	<link href="/Recovery/css/style.css" rel="stylesheet" type="text/css" charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

  </head>
 <body >
	<div id="keyword_id_areasTypeClassify_divAddFront" style="width: 85%; margin:0 auto;"  >
<form method="post" action="login.do" name="loginForm" onsubmit="return check()" theme="simple">
		<table  border="0" cellpadding="0" cellspacing="0" width="100%"
			height="400px" style="text-align: center;">
			<tr style="height:20px;">
				<td colspan="2"
					style="border-bottom:1px solid gainsboro;padding-top: 5px;"><h1
						class="h1"></h1></td>
			</tr>
		   
			<tr style="height:20px;">
				<td colspan="2"><h1 class="h1">提交成功</h1></td>
			</tr>
			
			
			<tr style="height:10px;">
				<td colspan="2"></td>
			</tr>
			<tr style="height:50px;">
				<td colspan="2" style="border-top:1px solid gainsboro;">
				</td>
			</tr>
		</table>
		</form>
	</div>
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
</body>
 
</html>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/pages/commons/taglibs.jsp" %>
<head>
    <link rel="stylesheet" type="text/css" href="css/yundaocp.css" />
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<meta http-equiv="Cache-Control" content="no-store" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="0" />
    <title><s:text name="system.base.systemName"/>-<s:text name="system.base.systemHomePage"/></title>
    <link href="./loop.css" rel="stylesheet" type="text/css" />
</head>

<body>

<%@ include file="indexTop.jsp" %>

<div id="body">
    <div id="login-background">
        <div id="login-box">
            <h2 id="login-title"><s:text name="云道仓储系统登录"/></h2>
            <form  id="loginForm" action="${ctx}/User/login.do" onsubmit="return checkForm();" method="post">
            	<c:if test="${!empty requestScope.errorMessage}">
            		<div style="background-color:#ffdbc9;width:220px;height:23px"><img src="images/xx.png"><span style="font-size:12px;color:#9b3604">${requestScope.errorMessage}</span></div>
            	</c:if>
              <label><span id="icon-username"><s:text name="用户名"/>:</span></label>
              <input type="text" name="userCode" id="username-input" autofocus placeholder="<s:text name="用户名"/>"  /><br />
            	<label><span id="icon-password"><s:text name="密码"/>:</span></label>
            	<input type="password" id="password-input" name="password" placeholder="<s:text name="密码"/>" /></input>
            	<button id="sign-in" type="submit" class="button btn btn-primary btn-large"><s:text name="登录"/></button>
						</form>			
				</div>
    </div>
</div>


<%@ include file="indexBottom.jsp" %>

<div id="bottom-bar">
</div>
</body>
</html>
<script src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/global_cn.index.js"></script>
<script type="text/javascript">
	  $(document).ready(function() {
	    $("input").bind('blur',function(){
	            this.value = $.trim(this.value);
	        });

	        $("#username-input").bind('change',function(){
	            $("#password-input").val("");
	        });

	    });
		function checkForm(){
			if($("#username-input").val()=="" || $("#password-input").val()==""){
				return false;
			}
			return true;
		}
</script>
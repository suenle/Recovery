<%@ page contentType="text/html;charset=UTF-8" %>
<script src="${basePath}/js/jquery-1.9.1.min.js"></script>
<style>
 #top-bar {font-family:tahoma,arial,"Microsoft Yahei";}
</style>
<div id="head" class="full-width">
	<div id="top-bar" class="full-width">
    	<div class="grid-990">
        	<div id="login-div" class="rt">
				<a class="topbar-link" href="${ctx}"><s:text name="用户登录"/></a></div>
        </div>
        <form id="loc" action="language.do" method="post" style='margin: 0px;'>
			<input type="hidden" id="request_locale" name="request_locale" />
			<input type="hidden" id="basePath" name="basePath" value="${basePath}" />
			<input type="hidden" id="location" name="location" />
		</form>
    </div>
    <div id="nav-bar">
    	<div class="grid-990">
        	<div id="yundao-img-logo"><a href="#"><img src="images/logo.png" /></a></div>
            <div id="navigation"> 
            <a class="nav-link" href="http://www.yundaotech.com/products?ltId=78"><s:text name="关于我们"/></a>	
 	        </div>
 	        <div style="clear:both;"></div>
        </div>
    </div>
</div>

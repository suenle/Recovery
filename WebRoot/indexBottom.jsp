<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<div id="foot" class="full-width" >
    <div id="rights-info" class="grid-990">
        	Copyright 2013 Jiangsu Yundao Technology Co.,Ltd. All Rights Reserved　<br />
			<s:text name="system.base.companyName"/>&nbsp;<a href="http://www.miitbeian.gov.cn/"><s:text name="system.login.sign"/><a/>&nbsp;
			<a target="_blank" href="${ctx}/licence.do"><s:text name="system.page.licence" /></a>
    </div>
</div>
<script type="text/javascript">
	var i18n_sLocale = "${session.request_locale}";
	var Locales = new Array("en_US","zh_CN");
		jQuery(function($){
			if (i18n_sLocale != undefined && Locales != undefined) {
				if (i18n_sLocale == Locales[0])
					$('a.language:contains("English")').addClass("loc");
				else if (i18n_sLocale == Locales[1]) {
					$('a.language:contains("中文")').addClass("loc");
				}
			}
			$("#login-div a.language").each(function(){
				$(this).click(function(){
					var loc = $(this).text();
					var basePath = $("#basePath").val();
					$("a").removeClass("loc");
					$(this).addClass("loc");
					if(location.href.substring(location.href.length-3)==".do"){
						$("#location").val(location.href);
					}
					if(loc=="English"){
						$("#request_locale").val("en_US");
					}else{
						$("#request_locale").val("zh_CN");
					}
					$("#loc").submit();
				});
			});
      	});
</script>
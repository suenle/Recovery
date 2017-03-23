<%@ page language="java" import="com.huifu.entity.Users"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/pages/commons/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%
	String userId = String.valueOf(request.getAttribute("userId"));
	String userCode = (String) request.getAttribute("userCode");
	String userName = (String) request.getAttribute("userName");
%>
<html>
<head>
<title>江苏云道仓储管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/StoreManagement/css/style.css" rel="stylesheet" type="text/css">
<link rel="StyleSheet" href="/StoreManagement/css/dtree.css" type="text/css" />
<script src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/dtree.js"></script>
<script type="text/javascript" src="js/comet4j.js"></script>
<script src="js/date.js"></script>
<style type="text/css">
	::-webkit-scrollbar{width:0px;}
	.nav{
		font-size: 16px;
		font-family:"微软雅黑";
		width: 100%;
		margin-left: -60px;
		padding-top: 20px;
		padding-left: 50px;
	}
	.nav > li > a:hover,
	.nav > li > a:focus {
		text-decoration: none;
		background-color: transparent;
	}
	.nav-parent{
		cursor: pointer;
	}
	.nav-children,.nav-children li{
		padding: 5px;
	}
	.nav-children li{
		width: 100%;
	}
	.nav-children > li > a:hover,
	.nav-children > li > a:focus{
		height:100%;
		text-decoration: none;
		background-image: url("images/menuTree/selected.png");
		background-repeat: no-repeat;
	}
	li{
		list-style: none;
	}
	.parentMenuName{
		padding-left: 40px;
		color: white;
	}
	.style{
		height:100%;
		width:100%;
		background-image: url("images/menuTree/selected.png");
		background-repeat: no-repeat;
		color: gold;
	}
</style>
</head>
<body scroll="no">
	<input type="hidden" id="contentPath" value="${ctx}" />
	<input type="hidden" id="requestData" value=<%request.getAttribute("GSON_RESULT_OBJECT");%> />
	<input type="hidden" id="savedUserId" value='<%=userId%>' />
	<input type="hidden" id="savedUserCode" value="<%=userCode%>" />
	<input type="hidden" id="savedUserName" value="<%=userName%>" />
	<input type="hidden" id="allUserGroup" value="" />
	<input type="hidden" id="userMenuList" value="" />
	<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td height="60"  background="images/mainpage/top_bg_60.png" style="background-repeat: no-repeat;">
				<table width="100%" border="0" bordercolor="gold" cellspacing="0" cellpadding="0">
					<tr>
						<td width="460">
							<span style="display: block;width: 460px;padding-left: 30px;">
								<img alt="" src="images/mainpage/logo_60.png" align="absmiddle">
								<span style="font-size: 24px;color: #ffffff;font-family: 微软雅黑;padding-left: 15px;padding-top: 8px;position: absolute;">江苏云道仓储管理系统</span>
							</span>
						</td>
						<td width="700" height="60">
							<table width="100%" border="0" bordercolor="red" cellspacing="0" cellpadding="0">
								<tr>
									<td width="700" height="26"></td>
								</tr>
								<tr>
									<td>
										<table width="700" border="0" bordercolor="blue" cellspacing="0" cellpadding="0" align="right">
											<tr>
												<td align="right" height="34" class="white" style="font-size: 18px;font-family: 微软雅黑;">
													<span id="today"></span>
													<img src="images/mainpage/top_right_line.png" height="18px;" style="margin-left: 10px;margin-right: 10px;margin-bottom: -4px;">
													<img src="images/mainpage/user_logo.png" height="20" width="20" align="absmiddle" />
													欢迎您，<span style="color: gold"><%=userName%></span><a href="pages/alarmInfo.jsp"><span style="color: gold" id="alarmInfoNum">(0)</span></a>
													<a style="margin-right: 24px;text-decoration: none;" href="javascript:if(confirm('确定退出吗？'))location.href='${ctx }/User/logout.do?userCode=<%=userCode %>'">
														<img src="images/mainpage/top_right_line.png" height="18px;" style="margin-left: 10px;margin-right: 10px;margin-bottom: -4px;">
														<img src="images/mainpage/exit_logo.png" height="20" width="20" border="0" align="absmiddle">&nbsp;退出系统
													</a>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="100%">
				<table width="100%" height="100%" border="0" bordercolor="red" cellspacing="0" cellpadding="0" style="background-repeat: repeat-x;">
					<tr>
						<td width="230" height="100%" valign="top" id="menuTree">
							<!-- 左侧生成树 -->
							<table width="230" height="100%" border="0" bordercolor="blue" cellspacing="0" cellpadding="0">
								<tr>
									<td height="100%" valign="top" style="background-image: url('images/menuTree/menuTreeBg.png');background-repeat: no-repeat;background-size: 100%;">
										<!-- 目录树 --><!--  margin-left: -20px; -->
										<div id="menu_tree_div" style="height: 100%;width: 100%;overflow-y:scroll;overflow-x:hidden;"></div>
									</td>
								</tr>
							</table>
						</td>
						<td width="0" style="background-color: transparent;">
							<a href="javascript:void(0)" onclick="javascript:stretch();">
								<img class="menuTreeImg" alt="隐藏菜单" src="images/mainpage/stretch_left.png" title="隐藏菜单" width="10" height="119" style="position: fixed;top: 45%;">
							</a>
						</td>
						<td>
							<iframe src="pages/welcome.html" width="100%" height="100%" frameborder="0" scrolling="auto" name="page" >
							</iframe>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>

<script language="javascript">
	$(document).ready(function() {
		
		var userCode = $("#savedUserCode").val();
		var userName = $("#savedUserCode").val();
		if (undefined == userCode || "" == userCode) {
			alert("用户名为空");
		}
		var menuArray;
		var errorMsg;
		
		// 获取用户名对应的权限范围内可见菜单数据
		$.ajax({
			type : "POST",
			url : "${ctx}/Menu/getMenu.do",
			data : {
				userCode : userCode
			},
			async : false,
			cache : false,
			success : function(data) {
				errorMsg = data.errorMsg;
				if ("" != errorMsg) {
					// 获取菜单失败
					alert(errorMsg);
					return;
				}
				menuArray = data.menuList;
				if (undefined != menuArray && 0 < menuArray.length) {
					// 生成菜单树
					createMenuTree(menuArray);
				}
			},
			error : function(data) {

			}
		});

		// 获取用户组Action
		$.ajax({
			type : "POST",
			url : "${ctx}/UserGroup/getAllUserGroup.do",
			data : {},
			async : false,
			cache : false,
			success : function(data) {
				errorMsg = data.errorMsg;
				if ("" != errorMsg) {
					alert(errorMsg);
					return;
				}
				userGroupArray = data.userGroupInfo;
				var txt_userGroup = JSON.stringify(userGroupArray); // JSON.stringify() 方法用于将 JavaScript 值转换为 JSON 字符串
				$("#allUserGroup").val(txt_userGroup);
			},
			error : function(data) {
				alert("与后台服务通讯失败");
			}
		});
		
	});
	
	// 菜单生成树
	function createMenuTree(menuArray) {
		if (null == menuArray || 0 >= menuArray.length) {
			alert("后台通讯故障，请联系管理员！");
			return;
		}
		var menuTree = '<ul class="nav">';
		for(var nloop = 0; nloop < menuArray.length; nloop++){
			var parentMenuNode = menuArray[nloop];			//父节点
			var subMenuArray = parentMenuNode.children;		//子节点集合
			menuTree += '<li class="nav-parent"><a class="parentMenu" style="width:100%;height:41px;line-height:41px;display:block;"><span class="parentMenuName"><img class="parentImg" src="images/menuTree/fold.png" height="18" width="18" align="absmiddle" style="float: center;padding-bottom:4px;" />&nbsp;&nbsp;'+parentMenuNode.menuName+'</span></a>';
			if(undefined != subMenuArray && 0 < subMenuArray.length){
				menuTree += '<ul class="nav-children" style="display: none;">';
				for ( var jloop = 0; jloop < subMenuArray.length; jloop++) {
					var subMenuNode = subMenuArray[jloop];
					menuTree += '<li><a class="childrenMenu" href="'+subMenuNode.menuUrl+'" target="page" style="width:100%;height:41px;line-height:41px;display:block;padding-left: 45px;padding-right: 0px;outline:none;"><img src="images/menuTree/arrow.png" height="8" width="8" align="absmiddle" />&nbsp;&nbsp;<span class="text">'+subMenuNode.menuName+'</span></a></li>';
				}
				menuTree += '</ul>';
			}
			menuTree += '</li>';
		}
		menuTree += "</ul>";
		$("#menu_tree_div").html(menuTree);
	}
	
	//隐藏菜单栏
	function stretch(){
		if($("#menuTree").is(":hidden")){
			$(".menuTreeImg").attr({"src":"images/mainpage/stretch_left.png","alt":"隐藏菜单","title":"隐藏菜单"});
		}
		if($("#menuTree").is(":visible")){
			$(".menuTreeImg").attr({"src":"images/mainpage/stretch_right.png","alt":"显示菜单","title":"显示菜单"});
		}
		$("#menuTree").toggle(150);// fadeToggle slideToggle
	}
</script>
<script type="text/javascript" defer="defer">
$(function(){
	// 点击菜单实现下拉效果
	$(".nav-parent").on("click",function(){
		var prev = $(this).prevAll();
		var next = $(this).nextAll();
		
		/*if($(this).children("ul .nav-children").is(":visible")){
			$(this).children("ul .nav-children").hide(200);
			$(this).find(".parentImg").attr({"src":"images/menuTree/fold.png","height":"18"});
		}*/
		if($(this).children("ul .nav-children").is(":hidden")){
 			$(this).children("ul .nav-children").show(200);
			$(this).find(".parentImg").attr({"src":"images/menuTree/unfold.png","height":"4"});
			
			$(prev).each(function(i){
				$(prev[i]).children("ul .nav-children").hide(200);
				$(prev[i]).find(".parentImg").attr({"src":"images/menuTree/fold.png","height":"18"});
			});
			$(next).each(function(i){
				$(next[i]).children("ul .nav-children").hide(200);
				$(next[i]).find(".parentImg").attr({"src":"images/menuTree/fold.png","height":"18"});
			});
		}
		/*if(($(this).is(":invisible"))){
			$(this).children("ul .nav-children").hide(200);
		}*/
	});
	/*$(".nav-parent .nav-children").on("click",function(){
		alert(3);
		if(($(this).is(":invisible"))){
			$(this).hide(200);
		}
	});*/
	// 点击操作菜单实现样式效果
	$(".nav-children li").on("click",function(){
		
		// 移除同级元素下其他元素的样式
		var prev = $(this).prevAll();
		var next = $(this).nextAll();
		$(prev).each(function(i){
			$(prev[i]).children("a").removeClass("style").css({"color":"white"});
		});
		$(next).each(function(i){
			$(next[i]).children("a").removeClass("style").css({"color":"white"});
		});
		// 移除祖父级元素下子元素的样式
		var pre = $(this).parent().parent().prevAll();
		var nex = $(this).parent().parent().nextAll();
		$(pre).each(function(i){
			$(pre[i]).find(".nav-children li a").removeClass("style").css({"color":"white"});
		});
		$(nex).each(function(i){
			$(nex[i]).find(".nav-children li a").removeClass("style").css({"color":"white"});
		});
		// 给当前子元素添加样式(最后加)
		$(this).children("a").addClass("style").css({"color":"gold"});
	});
});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		// 建立连接，conn 即web.xml中 CometServlet的<url-pattern>
		JS.Engine.start('conn');
		// 监听后台某个频道
		JS.Engine.on({
			start : function(cId, channelList, engine) {
				$.ajax({
					type : "POST",
					url : "${ctx}/AlarmInfo/getCid.do",
				    data:"cId="+cId,
					async : false,
					cache : false,
					success : function(msg) {
					}
				});
			},
			// 对应服务端 “频道1” 
			OnlineBoard : function(data) {
			 $("#alarmInfoNum").text("("+data+")");
			// alert(00);
			},
			// 对应服务端 “频道2” 
			OtherChannel : function(num) {
			
			 $("#alarmInfoNum").text("("+num+")");
			},
			stop : function(cause, cId, url, engine) {
			 // alert("提示断开");
			   
			},
		});
	});
</script>
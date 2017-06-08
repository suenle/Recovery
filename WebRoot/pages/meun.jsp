<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/pages/commons/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>神人生活操练</title>

<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<!-- <link href="/Recovery/css/style.css" rel="stylesheet" type="text/css"
	charset="utf-8"> -->

<script src="/Recovery/js/jquery-1.9.1.min.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<!-- <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm.css">
<script type='text/javascript'
	src='//g.alicdn.com/sj/lib/zepto/zepto.js' charset='utf-8'></script>
<script type='text/javascript'
	src='//g.alicdn.com/msui/sm/0.6.2/js/sm.js' charset='utf-8'></script> -->
<link href="https://cdn.bootcss.com/light7/0.4.3/css/light7.css"
	rel="stylesheet">
<script src="https://cdn.bootcss.com/light7/0.4.3/js/light7.js"></script>
</head>

<body>
	<div class="page-group">
		<!-- 单个page ,第一个.page默认被展示-->
		<div class="page" style="background-color:#fbf9f3">
			<!-- 标题栏 -->
			<header class="bar bar-nav">
			<h1 class="title" id="keyword_id_meun_myinfo">正在获取数据....</h1>
			</header>
			<!-- 工具栏 -->
			<nav class="bar bar-tab"> <a class="tab-item external"
				href="${ctx}/RecoveryLife/recoveryLifeInfo.do"> <span
				class="icon icon-star"></span> <span class="tab-label">生活操练</span> </a> <a
				class="tab-item external active" href="${ctx}/pages/meun.jsp"> <span
				class="icon icon-me"></span> <span class="tab-label">我的</span>
			</a> </nav>

			<div class="content">
				<div class="content-block-title"></div>
				<div class="card" style="margin: 1rem 2rem 1rem 2rem">
				<div class="list-block">
					<ul>
						<a class="external"
						href="${ctx}/pages/myInfo.jsp"><li class="item-content item-link">
							<div class="item-media">
								<i class="icon icon-card"></i>
							</div>
							<div class="item-inner">
								<div class="item-title">个人信息修改</div>
							</div></li></a>
					</ul>
				</div>
				</div>
					<%-- <div class="card" style="margin:1rem 2rem 1rem 2rem">
				<div class="list-block">
					<ul>
						<a href="${ctx}/pages/requestCareInfo.jsp"><li class="item-content item-link">
							<div class="item-media">
								<i class="icon icon-edit"></i>
							</div>
							<div class="item-inner">
								<div class="item-title">申请服侍者</div>
							</div></li></a>
					</ul>
				</div>
				</div> --%>
			</div>
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


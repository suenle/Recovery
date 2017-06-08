<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/pages/commons/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>江苏云道仓储管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/beforestyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" media="screen"
	href="../css/ui.jqgrid.css" />
<script src="../js/jquery-1.9.1.min.js"></script>
<script src="../js/jqGrid/i18n/grid.locale-en.js" type="text/javascript"></script>
<script src="../js/jqGrid/jquery.jqGrid.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="../css/jquery-ui.min.css" />
<!-- link 日历资源 -->
<link rel="stylesheet" type="text/css"
	href="../css/jquery.datetimepicker.css" />
<script src="../js/jquery.datetimepicker.js"></script>
<!-- jquery对话框资源 -->
<script src="../js/jqEasyui/jquery.easyui.min.js" type="text/javascript"></script>
<script src="../js/jqEasyui/locale/easyui-lang-zh_CN.js"
	type="text/javascript"></script>
<link href="../css/jqEasyui/themes/gray/easyui.css" rel="stylesheet"
	type="text/css" />
<link href="../css/jqEasyui/icon.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<table width="100%" height="100%" border="0" cellspacing="0"
		cellpadding="3">
		<tr>
			<td height="34" width="100%" style="padding:0px;">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					style="line-height: 34px;height: 34px;">
					<tr>
						<td class="barWord">&nbsp;&nbsp;<img
							src="../images/icon_card.gif" width="16" height="16"
							align="absmiddle" style="margin-bottom: 4px;"> 当前位置&nbsp;<img
							src="../images/common/rightArrow.png" width="8" height="14"
							align="absmiddle" style="margin-bottom: 2px;"> 其他设置&nbsp;<img
							src="../images/common/rightArrow.png" width="8" height="14"
							align="absmiddle" style="margin-bottom: 2px;"> 下载地址管理</td>
						<td align="right" class="white" style="padding-right:20px"> <a href="#" class="barBtn"
							onClick="javascript:history.go(-1);"> <img
								src="../images/btn_left.gif" width="18" height="18"
								align="absmiddle"> 后退 </a> <a href="#" class="barBtn"
							onClick="javascript:history.go(+1);"> <img
								src="../images/btn_right.gif" width="18" height="18"
								align="absmiddle"> 前进 </a> <a href="#" class="barBtn"
							onclick="javascript:location.reload();"> <img
								src="../images/btn_refresh.gif" width="18" height="18"
								align="absmiddle"> 刷新 </a></td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td valign="top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
					</tr>
					<tr>
						<td valign="top">
							<div style="overflow:auto;height:100%; width:100%;">
								<div id="keyword_id_home_divEditFront" align="center">
									<table border="0" cellpadding="0" cellspacing="0" width="450"
										height="550">
										<tr style="height:40px;">
											<td colspan="2"
												style="border-bottom:1px solid gainsboro;padding-top: 10px;"><h1
													class="h1">下载地址</h1>
											</td>
										</tr>
										<tr style="height:10px;">
											<td colspan="2"></td>
										</tr>
										<tr style="height:35px;">
											<td class="div_font_left_word"><span
												class="div_front_prompt">*</span>晨兴信息地址：</td>
											<td><input type="text" id="keyword_id_linkEdit_cx"
												class="div_font_right_input" /></td>
										</tr>
										<tr style="height:35px;">
											<td class="div_font_left_word"><span
												class="div_front_prompt">*</span>晨兴信息密码：</td>
											<td><input type="text" id="keyword_id_linkEdit_cxp"
												class="div_font_right_input" /></td>
										</tr>
										<tr style="height:35px;">
											<td class="div_font_left_word"><span
												class="div_front_prompt">*</span>小排信息地址：</td>
											<td><input type="text" id="keyword_id_linkEdit_xp"
												class="div_font_right_input" /></td>
										</tr>
										<tr style="height:35px;">
											<td class="div_font_left_word"><span
												class="div_front_prompt">*</span>小排信息密码：</td>
											<td><input type="text" id="keyword_id_linkEdit_xpp"
												class="div_font_right_input" /></td>
										</tr>
										<tr style="height:35px;">
											<td class="div_font_left_word"><span
												class="div_front_prompt">*</span>其他信息地址：</td>
											<td><input type="text" id="keyword_id_linkEdit_qt"
												class="div_font_right_input" /></td>
										</tr>
										<tr style="height:35px;">
											<td class="div_font_left_word"><span
												class="div_front_prompt">*</span>其他信息密码：</td>
											<td><input type="text" id="keyword_id_linkEdit_qtp"
												class="div_font_right_input" /></td>
										</tr>

										<tr style="height:10px;">
											<td colspan="2"></td>
										</tr>
										<tr style="height:50px;">
											<td colspan="2" style="border-top:1px solid gainsboro;">
												<div
													style="text-align:center;padding-top: 7px;padding-bottom: 7px;">
													<input type="button"
														class="div_button_submit div_button_submit_2" value="修 改"
														style="width: 80%" onclick="javascript:linkEditCommit();" />
												</div></td>
										</tr>
									</table>
								</div>
							</div>
							<div style="overflow:auto;height:40px; width:100%;"
								id="keyword_id_div_homeListPage"></div></td>
					</tr>
				</table></td>
		</tr>
	</table>
</body>
</html>

<script language="javascript">
	$(function() {
		//获取会所四级

		$.ajax({
			type : "POST",
			url : "${ctx}/Other/getLink.do",
			data : {},
			async : false,
			cache : false,
			success : function(data) {
				var errorMsg = data.errorMsg;
				if ("" != errorMsg) {
					$.messager.alert("错误提示", errorMsg, "error");
				}

				$("#keyword_id_linkEdit_cx").val(data.cx);
				$("#keyword_id_linkEdit_cxp").val(data.cxp);
				$("#keyword_id_linkEdit_xp").val(data.xp);
				$("#keyword_id_linkEdit_xpp").val(data.xpp);
				$("#keyword_id_linkEdit_qt").val(data.qt);
				$("#keyword_id_linkEdit_qtp").val(data.qtp);

			},
			error : function(data) {

			}

		});

	});

	// 页面初始化
	$(document).ready(function() {
		// 解决jquery 1.9版本未定义msie的问题
		$.browser = {};
		$.browser.msie = false;
		$.browser.version = 0;
		if (navigator.userAgent.match(/MSIE ([0-9]+)./)) {
			$.browser.msie = true;
			$.browser.version = RegExp.$1;
		}
	});

	// 更新小排提交
	function linkEditCommit() {
		var cx = $("#keyword_id_linkEdit_cx").val();
		var cxp = $("#keyword_id_linkEdit_cxp").val();
		var xp = $("#keyword_id_linkEdit_xp").val();
		var xpp = $("#keyword_id_linkEdit_xpp").val();
		var qt = $("#keyword_id_linkEdit_qt").val();
		var qtp = $("#keyword_id_linkEdit_qtp").val();
		// 向后台提交数据
		$.ajax({
			type : "POST",
			url : "${ctx}/Other/updateLink.do",
			data : {
				cx : cx,
				cxp : cxp,
				xp : xp,
				xpp : xpp,
				qt : qt,
				qtp : qtp
			},
			async : false,
			cache : false,
			success : function(data) {
				var errorMsg = data.errorMsg;
				if ("" != errorMsg) {
					alert(errorMsg);
					return;
				}
				// 提示数据修改成功
				$.messager.alert("操作提醒", "数据修改成功", "info");
			},
			error : function(data) {
				alert("后台通讯故障");
			}
		});
	}
</script>
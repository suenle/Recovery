﻿﻿﻿﻿﻿﻿<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/pages/commons/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>云道仓储管理系统 —— 登 录</TITLE>
		<LINK href="css/global.css" type=text/css rel=STYLESHEET>
		<LINK href="css/yundaocp.css" type=text/css rel=STYLESHEET>
		<style type="text/css">
			<!--
			.STYLE1 {
				color: #000000;
				font-weight: bold;
			}
			-->
		</style>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<script src="js/jquery-1.9.1.min.js"></script>
	</HEAD>
	
	<BODY bgColor=#ffffff leftMargin=0 topMargin=0 rightMargin=0
		marginheight="0" marginwidth="0">
		<CENTER>
			<DIV style="WIDTH: 100%; BACKGROUND-COLOR: #ffffff">
				<IMG height=3 src="images/spacer.gif" width=1>
				<BR>
				<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
					<TBODY>
						<TR>
							<TD vAlign=top align=middle>
								<TABLE id=mouseovers cellSpacing=0 cellPadding=0 width="776"
									border=0>
									<TBODY>
										<TR>
											<TD vAlign=top noWrap align=center height=60></TD>
										</TR>
									</TBODY>
								</TABLE>
							</TD>
						</TR>
						<TR>
							<TD align=middle bgColor=#ffffff colSpan=4 height=3>
								<IMG height=10 src="images/spacer.gif" width=1>
							</TD>
						</TR>
					</TBODY>
				</TABLE>
			</DIV>
			<DIV id=content>
				<DIV class=module_darkgray>
					<DIV class=bottomedge_darkgray>
						<DIV class=topleft_darkgray></DIV>
						<DIV class=topright_darkgray></DIV>
						<DIV class=moduleborder>
							<DIV class=module_inset_darkgray>
								<DIV class=bottomedge_inset_darkgray>
									<DIV class=topleft_inset_darkgray></DIV>
									<DIV class=topright_inset_darkgray></DIV>
									<DIV style="LEFT: 735px; PADDING-TOP: 5px; POSITION: absolute">
										<IMG height=20 src="images/white_lock.gif" width=14 border=0>
									</DIV>
									<DIV
										style="PADDING-LEFT: 35px; PADDING-BOTTOM: 20px; PADDING-TOP: 40px; align: left">
										<IMG src="images/text_dotmaclogin.gif" border=0>
									</DIV>
									<DIV style="PADDING-RIGHT: 15px; PADDING-LEFT: 35px">
										<TABLE cellSpacing=0 cellPadding=0 width=689 border=0>
											<TBODY>
												<TR>
													<TD style="PADDING-RIGHT: 20px" width=318>
														<TABLE cellSpacing=0 cellPadding=0 border=0>
															<TBODY>
																<TR>
																	<TD style="MARGIN-BOTTOM: 10px" vAlign=top>
																		<strong>用户登录</strong>
																	</TD>
																</TR>
																<TR>
																	<TD class=content_gray_bold>
																		请输入您的用户名和密码登录系统。
																	</TD>
																</TR>
															</TBODY>
														</TABLE>
														<!-- Begin Form -->
														<s:form>
															<TABLE cellSpacing=0 cellPadding=0 width=318 border=0>
																<TBODY>
																	<TR>
																		<TD height=15>
																		</TD>
																	</TR>
																	<TR>
																		<TD align=left>
																			<SPAN class=content_black_bold>用户名</SPAN>
																			<BR>
																			<FONT class=form><INPUT class=form id="keyword_id_loginName" value="<s:property value="userCode" />"
																					autocomplete="off" style="WIDTH: 250px"
																					maxLength=28 name=userCode> </FONT>
																			<!--
																			<input type="checkbox" name="manager" value="true">管理员
																			-->
																			
																		</TD>
																	</TR>
																	<TR>
																		<TD height=8>
																		</TD>
																	</TR>
																	<TR>
																		<TD align=left>
																			<SPAN class=content_black_bold>密码</SPAN>
																			<BR>
																			<FONT class=form><INPUT class=form id="keyword_id_loginPassword" value="<s:property value="password" />"
																					style="WIDTH: 250px" type="password" maxLength=32
																					name="password" minlength="6"> </FONT>
																		</TD>
																	</TR>
																	<TR>
																		<TD height=10>
																			<IMG height=10 alt=""
																				src="images/spacer.gif"
																				width=1 border=0>
																		</TD>
																	</TR>
																	<TR>
																		<TD noWrap align=left>
																			<input type="text" id="keyword_id_loginTip" style="border:0px; color:red" readonly="readonly" />
																			<!--
																			<A  href="javascript:;">忘记密码?</A>
																			-->
																		</TD>
																	</TR>
																	<TR>
																		<TD noWrap align=right>
																			<span style="padding-right: 20px;"><input type="button" value="登  录" onclick="javascript:login()"/></span>
																		</TD>
																	</TR>
																</TBODY>
															</TABLE>
														</s:form>
													</TD>
													<!-- End Form -->
													<TD vAlign=top>
														<TABLE cellSpacing=0 cellPadding=0 border=0>
															<TBODY>
																<TR>
																	<TD style="BACKGROUND-COLOR: #e3e3e3" width=2
																		height=200></TD>
																</TR>
															</TBODY>
														</TABLE>
													</TD>
													<TD style="PADDING-LEFT: 30px" vAlign=top width=318>
														<!-- Message 2 -->
														<TABLE cellSpacing=0 cellPadding=0 border=0>
															<TBODY>
																<TR>
																	<TD class=content_gray vAlign=top>
																		<image width="330" height="152" src="images/banner.gif" menu="false" />
																	</TD>
																</TR>
															</TBODY>
														</TABLE>
													</TD>
												</TR>
											</TBODY>
										</TABLE>
									</DIV>
								</DIV>
							</DIV>
						</DIV>
					</DIV>
				</DIV>
			</DIV>
			<DIV>
				<TABLE cellSpacing=0 cellPadding=0 width=776 align=center border=0>
					<TBODY>
						<TR>
							<TD vAlign=top align=middle width=776>
								江苏云道仓储管理系统
							</TD>
						</TR>
					</TBODY>
				</TABLE>
			</DIV>
			<!-- END content_gray -->
			<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
				<TBODY>
					<TR>
						<TD align=middle>
							<FONT class=disclaimer face="Geneva, Verdana, Arial, Helvetica"
								color=#999999 size=1>©&nbsp;Copyright 2016 Jiangsu Yundao Tech Inc.
								All rights reserved.</FONT>
							<BR>
							<BR>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</CENTER>
	</BODY>
</HTML>

<script language="javascript">
	function login()
	{
		$("#keyword_id_loginTip").val("");
		var userCode = $("#keyword_id_loginName").val();
		var password = $("#keyword_id_loginPassword").val();
		if("undefined" == userCode || "" == userCode)
		{
			$("#keyword_id_loginTip").val("请输入用户名");
			return ;
		}
		if("undefined" == password || "" == password)
		{
			$("#keyword_id_loginTip").val("请输入密码");	
			return ;
		}
		$.ajax({
			type : "POST",
			url: "${ctx}/User/login.do",
		  data: {
		  	userCode : userCode,
		  	password : password	
		  },
      async: false,
      cache:false,
			success: function (data) {
				var errorMsg = "";
				if("undefined" != data && "" != data )
				{
					errorMsg = data.errorMsg;
					$("#keyword_id_loginTip").val(errorMsg);
				}
			},
			error: function () {
				$("#keyword_id_loginTip").val("向后台提交数据失败");
	    }
		});
	}
</script>

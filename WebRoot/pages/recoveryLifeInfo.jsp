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
<link href="/Recovery/css/style.css" rel="stylesheet" type="text/css"
	charset="utf-8">
<script src="/Recovery/js/jquery-1.9.1.min.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

</head>

<body>
	<header class="text-center"
		style="border-bottom:1px solid gainsboro;padding-top: 5px;">神人生活操练</header>
	<!--content-->
	<div id="content">
		<input type="hidden" id="keyword_id_addInfo_oldBook" value="" /> <input
			type="hidden" id="keyword_id_addInfo_newBook" value="" /> <input
			type="hidden" id="keyword_id_addInfo_oldBookNum" value="" /> <input
			type="hidden" id="keyword_id_addInfo_newBookNum" value="" />
		<div style="width: 90%; margin:0 auto;">
			<form method="post" action="${ctx}/RecoveryLife/addLifeInfo.do"
				onsubmit="return check()">
				<table border="0" cellpadding="0" cellspacing="0" width="100%"
					height="650px" style="text-align: center;">
					<tr style="height:20px;">
						<td class="" width="40%"><span class="div_front_prompt">*</span>晨兴（同伴）
							<br>20’：</td>
						<td width="30%"><input type="checkbox" class="chk_3"
							style="display:none" id="keyword_id_recoveryLife_morningRevial"
							name="morningRevial" /><label
							for="keyword_id_recoveryLife_morningRevial"></label></td>
						<td width="30%"><input class="input_class_re" type="text"
							id="keyword_id_recoveryLife_morningRevialNum" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onafterpaste="this.value=this.value.replace(/[^0-9]/g,'')"
							name="morningRevialNum" placeholder=" 时间/分钟" />
						<td></td>
					</tr>
					<tr style="height:20px;">
						<td class=""><span class="div_front_prompt">*</span>两坛祷告 <br>（同伴）30’：</td>
						<td><input type="checkbox" class="chk_3" style="display:none"
							id="keyword_id_recoveryLife_twoAltarPray" name="twoAltarPray" /><label
							for="keyword_id_recoveryLife_twoAltarPray"></label></td>
						<td><input class="input_class_re" type="text"
							name="twoAltarPrayNum"  onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onafterpaste="this.value=this.value.replace(/[^0-9]/g,'')"
							id="keyword_id_recoveryLife_twoAltarPrayNum" placeholder=" 时间/分钟" />
						</td>
					</tr>
					<tr style="height:20px;">
						<td class=""><span class="div_front_prompt">*</span>祷研背讲<br>默想主话：</td>
						<td><input type="checkbox" class="chk_3" style="display:none"
							id="keyword_id_recoveryLife_psrp" name="psrp" /><label
							for="keyword_id_recoveryLife_psrp"></label></td>

					</tr>
					<tr style="height:20px;">
						<td class=""><span class="div_front_prompt">*</span>三章旧约：</td>
						<td><div style="margin-right: 5px">
								<select class="input_class_re" name="threeOld"
									id="keyword_id_recoveryLife_threeOld">
								</select>
							</div></td>
						<td><select class="input_class_re" name="threeOldNum"
							id="keyword_id_recoveryLife_threeOldNum">
						</select></td>
					</tr>
					<tr style="height:20px;">
						<td class=""><span class="div_front_prompt">*</span>一章新约：</td>
						<td><div style="margin-right: 5px">
								<select class="input_class_re" name="oneNew"
									id="keyword_id_recoveryLife_oneNew">
								</select>
							</div></td>
						<td><select class="input_class_re" name="oneNewNum"
							id="keyword_id_recoveryLife_oneNewNum">
						</select></td>
					</tr>
					<tr style="height:20px;">
						<td class=""><span class="div_front_prompt">*</span>个人祷告 <br>15’：</td>
						<td><input type="checkbox" class="chk_3" style="display:none"
							name="personalPray" id="keyword_id_recoveryLife_personalPray" /><label
							for="keyword_id_recoveryLife_personalPray"></label></td>
						<td><input accept="middle" class="input_class_re" type="text"
							id="keyword_id_recoveryLife_personalPrayNum"  onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onafterpaste="this.value=this.value.replace(/[^0-9]/g,'')"
							name="personalPrayNum" placeholder=" 时间/分钟" /></td>
					</tr>
					<tr style="height:20px;">
						<td class=""><span class="div_front_prompt">*</span>传福音时数 <br>（同伴）：</td>
						<td><input class="input_class_re" type="text"
							name="gospelNum" id="keyword_id_recoveryLife_gospelNum"  onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')"  onafterpaste="this.value=this.value.replace(/[^0-9.]/g,'')"
							placeholder=" 时间/小时" />
						</td>
						<td></td>
					</tr>
					<tr style="height:20px;">
						<td class=""><span class="div_front_prompt">*</span>牧养、看望、 <br>爱筵（同伴）：</td>
						<td><input class="input_class_re" type="text"
							id="keyword_id_recoveryLife_shepherdNum" name="shepherdNum"  onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')"  onafterpaste="this.value=this.value.replace(/[^0-9.]/g,'')"
							placeholder=" 时间/小时" />
						</td>
						<td></td>

					</tr>
					<tr style="height:20px;">
						<td class=""><span class="div_front_prompt">*</span>聚会到会:</td>
						<td><select class="input_class_re" name="meeting"
							id="keyword_id_recoveryLife_meeting">
								<option value="-1">-请选择-</option>
								<option value="7">主日聚会</option>
								<option value="2">祷告聚会</option>
								<option value="5">小排聚会</option>
								<option value="1">周初PSRP追求聚会</option>
								<option value="6">脱稿鸟瞰展览</option>
						</select></td>
						<td><select class="input_class_re" name="meetingType"
							id="keyword_id_recoveryLife_meetingType">
								<option value="1">准时</option>
								<option value="2">迟到</option>
						</select></td>
					</tr>
					<tr style="height:20px; display: none"
						id="keyword_id_recoveryLife_tr_prophesy">
						<td class=""><span class="div_front_prompt">*</span><span
							id="keyword_id_recoveryLife_prophesyType">主日聚会 <br>申言：</span>
						</td>
						<td><input type="checkbox" class="chk_3" style="display:none"
							name="prophesy" id="keyword_id_recoveryLife_prophesy" value="1" /><label
							for="keyword_id_recoveryLife_prophesy"></label>
						</td>

					</tr>
					<tr style="height:10px;">
						<td colspan="3"></td>
					</tr>
					<tr style="height:50px;">
						<td colspan="3">
							<div>
								<input type="submit"
									class="div_button_submit div_button_submit_2" value="提交"
									onclick="javascript:areasTypeClassifyAddCommit();"
									style="width: 90%;height: 45px" />

							</div></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div style="height: 50px"></div>
	<!--bottom-->
	<div id="menu" class="menu">
		<a href="${ctx}/RecoveryLife/recoveryLifeInfo.do"><div id="one"
				class="subMenu text-center">
				<img class="menu_img" style="margin-top: 3px" />
				<div class="menu_name">
					<span style="color: black">神人生活操练</span>
				</div>
			</div> </a> <a href="${ctx}/pages/meun.jsp"><div id="two"
				class="subMenu text-center">
				<img class="menu_img" style="margin-top: 3px" />
				<div class="menu_name">
					<span style="color: black">我的</span>
				</div>
			</div> </a>
	</div>

</body>

</html>

<script language="javascript">
	$(document)
			.ready(
					function() {
						//获取新旧约
						$
								.ajax({
									type : "POST",
									url : "${ctx}//RecoveryLife/getBook.do",
									data : {},
									async : false,
									cache : false,
									success : function(data) {
										var errorMsg = data.errorMsg;
										if ("" != errorMsg) {
											$.messager.alert("错误提示", errorMsg,
													"error");
										}
										var oldBook = data.OldBook;
										var newBook = data.NewBook;
										var oldBookNum = data.OldBookNum;
										var newBookNum = data.NewBookNum;
										$("#keyword_id_addInfo_oldBook").val(
												JSON.stringify(oldBook));
										$("#keyword_id_addInfo_newBook").val(
												JSON.stringify(newBook));
										$("#keyword_id_addInfo_oldBookNum")
												.val(JSON.stringify(oldBookNum));
										$("#keyword_id_addInfo_newBookNum")
												.val(JSON.stringify(newBookNum));
										//卷
										var str = "";
										for ( var i = 0; i < oldBook.length; i++) {
											str += "<option value="+i+">"
													+ oldBook[i] + "</option>";

										}
										$("#keyword_id_recoveryLife_threeOld")
												.append(str);
										//章
										var strnum = "";
										for ( var a = 1; a <= oldBookNum[0]; a++) {
											strnum += "<option value="+a+">第"
													+ a + "章" + "</option>";

										}
										$(
												"#keyword_id_recoveryLife_threeOldNum")
												.append(strnum);

										//卷
										var dstr = "";
										for ( var u = 0; u < newBook.length; u++) {
											dstr += "<option value="+u+">"
													+ newBook[u] + "</option>";

										}
										$("#keyword_id_recoveryLife_oneNew")
												.append(dstr);
										//章
										var dstrnum = "";
										for ( var i = 1; i <= newBookNum[0]; i++) {
											dstrnum += "<option value="+i+">第"
													+ i + "章" + "</option>";
										}
										$("#keyword_id_recoveryLife_oneNewNum")
												.append(dstrnum);

										getTodayInfo();

									},
									error : function(data) {

									}

								});

						//旧约
						$("#keyword_id_recoveryLife_threeOld")
								.change(
										function() {
											$(
													"#keyword_id_recoveryLife_threeOldNum")
													.empty();
											var oldBookNum = $(
													"#keyword_id_addInfo_oldBookNum")
													.val();

											var oldid = $(
													"#keyword_id_recoveryLife_threeOld")
													.val();
											var jsongoldBookNum = eval('('
													+ oldBookNum + ')');
											var oldBookHaveNum = jsongoldBookNum[oldid];
											var str = "";
											for ( var i = 1; i <= oldBookHaveNum; i++) {
												str += "<option value="+i+">第"
														+ i + "章" + "</option>";
											}
											$(
													"#keyword_id_recoveryLife_threeOldNum")
													.append(str);
										});
						//新约
						$("#keyword_id_recoveryLife_oneNew")
								.change(
										function() {

											$(
													"#keyword_id_recoveryLife_oneNewNum")
													.empty();
											var newBookNum = $(
													"#keyword_id_addInfo_newBookNum")
													.val();

											var newid = $(
													"#keyword_id_recoveryLife_oneNew")
													.val();
											var jsongnewBookNum = eval('('
													+ newBookNum + ')');
											var oldBookHaveNum = jsongnewBookNum[newid];
											var str = "";
											for ( var i = 1; i <= oldBookHaveNum; i++) {
												str += "<option value="+i+">第"
														+ i + "章" + "</option>";
											}
											$(
													"#keyword_id_recoveryLife_oneNewNum")
													.append(str);
										});

						$("#keyword_id_recoveryLife_meeting")
								.change(
										function() {
											var meeting = $(
													"#keyword_id_recoveryLife_meeting")
													.val();
											if (meeting == 7) {
												$(
														"#keyword_id_recoveryLife_tr_prophesy")
														.show();
												$(
														"#keyword_id_recoveryLife_prophesyType")
														.html("主日聚会 <br>申言：");
											} else if (meeting == 5) {
												$(
														"#keyword_id_recoveryLife_tr_prophesy")
														.show();
												$(
														"#keyword_id_recoveryLife_prophesyType")
														.html("小排聚会 <br>申言：");
											} else {
												$(
														"#keyword_id_recoveryLife_tr_prophesy")
														.hide();

											}

										})

					})
	function getTodayInfo() {
		$
				.ajax({
					type : "POST",
					url : "${ctx}//RecoveryLife/getTodayDate.do",
					data : {},
					async : false,
					cache : false,
					success : function(data) {
						var errorMsg = data.errorMsg;
						if ("" != errorMsg) {
							$.messager.alert("错误提示", errorMsg, "error");
						}
						var recoveryLife = data.recoveryLife;
						if ("" != recoveryLife) {
							var morningrevial = recoveryLife.morningrevial;
							var twoaltarpray = recoveryLife.twoaltarpray;
							var psrp = recoveryLife.psrp;
							var threeold = recoveryLife.threeold;
							var threeoldnum = recoveryLife.threeoldnum;
							var onenew = recoveryLife.onenew;
							var onenewnum = recoveryLife.onenewnum;
							var personalpray = recoveryLife.personalpray;
							var shepherd = recoveryLife.shepherd;
							var gospel = recoveryLife.gospel;
							var meeting = recoveryLife.meeting;
							var meetingtype = recoveryLife.meetingtype;
							var prophesy = recoveryLife.prophesy;

							if ((morningrevial != null || undefined != morningrevial)
									&& 0 < morningrevial) {

								$("#keyword_id_recoveryLife_morningRevial")
										.attr("checked", "true");
								$("#keyword_id_recoveryLife_morningRevialNum")
										.val(morningrevial);
							}
							if ((twoaltarpray != null || undefined != twoaltarpray)
									&& 0 < twoaltarpray) {
								$("#keyword_id_recoveryLife_twoAltarPray")
										.attr("checked", "true");
								$("#keyword_id_recoveryLife_twoAltarPrayNum")
										.val(twoaltarpray);
							}
							if ((psrp != null || undefined != psrp) && 0 < psrp) {
								$("#keyword_id_recoveryLife_psrp").attr(
										"checked", "true");
							}
							if (threeold != null || undefined != threeold) {
								$("#keyword_id_recoveryLife_threeOld").val(
										threeold);
							}
							if (threeoldnum != null || undefined != threeoldnum) {
								$("#keyword_id_recoveryLife_threeOldNum").val(
										threeoldnum);
							}
							if (onenew != null || undefined != onenew) {
								$("#keyword_id_recoveryLife_oneNew")
										.val(onenew);
							}
							if (onenewnum != null || undefined != onenewnum) {
								$("#keyword_id_recoveryLife_oneNewNum").val(
										onenewnum);
							}
							if ((personalpray != null || undefined != personalpray)
									&& 0 < personalpray) {
								$("#keyword_id_recoveryLife_personalPray")
										.attr("checked", "true");
								$("#keyword_id_recoveryLife_personalPrayNum")
										.val(personalpray);
							}
							if (shepherd != null || undefined != shepherd) {
								$("#keyword_id_recoveryLife_shepherdNum").val(
										shepherd);
							}
							if (gospel != null || undefined != gospel) {
								$("#keyword_id_recoveryLife_gospelNum").val(
										gospel);
							}
							if (meeting != null || undefined != meeting) {
								$("#keyword_id_recoveryLife_meeting").val(
										meeting);
							}
							if (meetingtype != null || undefined != meetingtype) {
								$("#keyword_id_recoveryLife_meetingtype").val(
										meetingtype);
							}
							if (prophesy != null || undefined != prophesy) {
								if (meeting == 7) {
									$("#keyword_id_recoveryLife_tr_prophesy")
											.show();
									$("#keyword_id_recoveryLife_prophesyType")
											.html("主日聚会 <br>申言：");
								} else if (meeting == 5) {
									$("#keyword_id_recoveryLife_tr_prophesy")
											.show();
									$("#keyword_id_recoveryLife_prophesyType")
											.html("小排聚会 <br>申言：");
								} else {
									$("#keyword_id_recoveryLife_tr_prophesy")
											.hide();

								}
								$("#keyword_id_recoveryLife_prophesy").attr(
										"checked", "true");

							}
						}

					},
					error : function(data) {

					}

				});

	}
</script>

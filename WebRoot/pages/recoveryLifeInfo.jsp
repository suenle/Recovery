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
			<h1 class="title">神人生活操练</h1>
			</header>
			<!-- 工具栏 -->
					<nav class="bar bar-tab"> <a class="tab-item external active"
				href="${ctx}/RecoveryLife/recoveryLifeInfo.do"> <span
				class="icon icon-star"></span> <span class="tab-label">生活操练</span> </a> <a
				class="tab-item external" href="${ctx}/pages/meun.jsp"> <span
				class="icon icon-me"></span> <span class="tab-label">我的</span>
			</a> </nav>
			<form method="post" action="${ctx}/RecoveryLife/addLifeInfo.do"
				onsubmit="return check()">
				<!-- 这里是页面内容区 -->
				<div class="content" style="top: 2rem">
					<div class="content-block-title" style="margin: 0.7rem 0.75rem 0.3rem">团体操练</div>
					<div class="card" style="margin: .9rem">
						<div class="card-content">
							<div class="card-content-inner">
								<div class="list-block" style="font-size: 0.75rem">
									<ul>
										<!-- Text inputs -->
										<li>
											<div class="item-content">

												<div class="item-inner">
													<div class="item-title label">晨兴 20’</div>
													<div class="item-input">
														<label class="label-switch"> <input
															type="checkbox"
															id="keyword_id_recoveryLife_morningRevial"
															name="morningRevial">
															<div class="checkbox"></div> </label>
													</div>
													<div class="item-input">
														<input type="text" placeholder="时间/分钟"
															id="keyword_id_recoveryLife_morningRevialNum"
															onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"
															onafterpaste="this.value=this.value.replace(/[^0-9]/g,'')"
															name="morningRevialNum">
													</div>
												</div>
											</div></li>
										<li>
											<div class="item-content">
												<div class="item-inner">
													<div class="item-title label">两坛祷告 30’</div>
													<div class="item-input">
														<label class="label-switch"> <input
															type="checkbox" id="keyword_id_recoveryLife_twoAltarPray"
															name="twoAltarPray">
															<div class="checkbox"></div> </label>
													</div>
													<div class="item-input">
														<input type="text" placeholder="时间/分钟"
															name="twoAltarPrayNum"
															onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"
															onafterpaste="this.value=this.value.replace(/[^0-9]/g,'')"
															id="keyword_id_recoveryLife_twoAltarPrayNum">
													</div>
												</div>
											</div>
										</li>
										<li>
											<div class="item-content">

												<div class="item-inner">
													<div class="item-title label">传福音</div>
													<div class="item-input">
														<input type="text" placeholder="时间/分钟" name="gospelNum"
															id="keyword_id_recoveryLife_gospelNum"
															onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')"
															onafterpaste="this.value=this.value.replace(/[^0-9.]/g,'')"
															placeholder=" 时间/小时">
													</div>
												</div>
											</div>
										</li>
										<li>
											<div class="item-content">

												<div class="item-inner">
													<div class="item-title label">看望牧养</div>
													<div class="item-input">
														<input type="text" placeholder="时间/分钟"
															id="keyword_id_recoveryLife_shepherdNum"
															name="shepherdNum"
															onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')"
															onafterpaste="this.value=this.value.replace(/[^0-9.]/g,'')" />
													</div>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>

					<div class="content-block-title" style="margin: 0.7rem 0.75rem 0.3rem">个人操练</div>
					<div class="card" style="margin: .9rem">
						<div class="card-content">
							<div class="card-content-inner">
								<div class="list-block" style="font-size: 0.75rem">
									<ul>
										<!-- Text inputs -->
										<li>
											<div class="item-content">

												<div class="item-inner">
													<div class="item-title label">三旧:</div>
													<div class="item-input">
														<label class="label-switch"> <input
															type="checkbox"
															id="keyword_id_recoveryLife_threeOldRecord"
															name="threeOldRecord" value="1">
															<div class="checkbox"></div> </label>
													</div>
												</div>
											</div>
										</li>
										<li style="display: none" id="keyword_id_recoveryLife_threeOld_li">
											<div class="item-content">

												<div class="item-inner">
													<div class="item-title label">三章旧约：</div>
													<div class="item-input">
														<select name="threeOld"
															id="keyword_id_recoveryLife_threeOld">
														</select>
													</div>
													<div class="item-input">
														<select name="threeOldNum"
															id="keyword_id_recoveryLife_threeOldNum">
														</select>
													</div>
												</div>
											</div>
										</li>
										<li>
										<li>
											<div class="item-content">

												<div class="item-inner">
													<div class="item-title label">一新:</div>
													<div class="item-input">
														<label class="label-switch"> <input
															type="checkbox" id="keyword_id_recoveryLife_oneNewRecord"
															name="oneNewRecord" value="1">
															<div class="checkbox"></div> </label>
													</div>
												</div>
											</div>
										</li>
										<li style="display: none" id="keyword_id_recoveryLife_oneNew_li">
											<div class="item-content">

												<div class="item-inner">
													<div class="item-title label">一章新约：</div>
													<div class="item-input">
														<select name="oneNew" id="keyword_id_recoveryLife_oneNew">
														</select>
													</div>
													<div class="item-input">
														<select name="oneNewNum"
															id="keyword_id_recoveryLife_oneNewNum">
														</select>
													</div>
												</div>
											</div>
										</li>
										<li>
											<div class="item-content">
												<div class="item-inner">
													<div class="item-title label">个人祷告 15’</div>
													<div class="item-input">
														<label class="label-switch"> <input
															type="checkbox" name="personalPray"
															id="keyword_id_recoveryLife_personalPray">
															<div class="checkbox"></div> </label>
													</div>
													<div class="item-input">
														<input type="text" placeholder="时间/分钟"
															id="keyword_id_recoveryLife_personalPrayNum"
															onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"
															onafterpaste="this.value=this.value.replace(/[^0-9]/g,'')"
															name="personalPrayNum" />
													</div>
												</div>
											</div>
										</li>
										<li>
											<div class="item-content">
												<div class="item-inner">
													<div class="item-title label">祷研背讲</div>
													<div class="item-input">
														<label class="label-switch"> <input
															type="checkbox" id="keyword_id_recoveryLife_psrp"
															name="psrp" value="1">
															<div class="checkbox"></div> </label>
													</div>
												</div>
											</div>
										</li>

									</ul>
								</div>

							</div>
						</div>
					</div>

					<div class="content-block-title" style="margin: 0.7rem 0.75rem 0.3rem">聚会参与</div>
					<div class="card" style="margin: .9rem">
						<div class="card-content">
							<div class="card-content-inner">
								<div class="list-block" style="font-size: 0.75rem">
									<ul>
										<!-- Text inputs -->
										<li>
											<div class="item-content">

												<div class="item-inner">
													<div class="item-title label">聚会到会：</div>
													<div class="item-input">
														<select name="meeting"
															id="keyword_id_recoveryLife_meeting">
															<option value="-1">请选择</option>
															<option value="7">主日聚会</option>
															<option value="2">祷告聚会</option>
															<option value="5">小排聚会</option>
															<option value="1">周初PSRP追求聚会</option>
															<option value="6">脱稿鸟瞰展览</option>
														</select>
													</div>
													<div class="item-input">
														<select name="meetingType"
															id="keyword_id_recoveryLife_meetingType">
															<option value="1">准时</option>
															<option value="2">迟到</option>
														</select>
													</div>
												</div>
											</div>
										</li>
										<li>
										<li style="display: none" id="keyword_id_recoveryLife_tr_prophesy">
											<div class="item-content">
												<div class="item-inner">
													<div class="item-title label" id="keyword_id_recoveryLife_prophesyType">分享/申言：</div>
													<div class="item-input">
														<label class="label-switch"> <input
															type="checkbox" name="prophesy"
															id="keyword_id_recoveryLife_prophesy" value="1">
															<div class="checkbox"></div> </label>
													</div>
												</div>
											</div>
										</li>
									</ul>
								</div>

							</div>
						</div>
					</div>

					<div class="content-block" style="height: 4.0rem">
						<div class="row">
							<div class="col-50" style="width: 85%;margin-left: 9%">
								<input type="submit"
									class="button button-big button-fill button-success"
									value="提交 " />
							</div>
						</div>
					</div>

				</div>
			</form>
		</div>
	</div>

	<!-- popup, panel 等放在这里 -->
	<!-- <div class="panel-overlay"></div>
	Left Panel with Reveal effect
	<div class="panel panel-left panel-reveal">
		<div class="content-block">
			<p>这是一个侧栏</p>
			<p></p>
			Click on link with "close-panel" class will close panel
			<p>
				<a href="#" class="close-panel">关闭</a>
			</p>
		</div>
	</div> -->



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
														.show('slow');
												$(
														"#keyword_id_recoveryLife_prophesyType")
														.html("主日申言：");
											} else if (meeting == 5) {
												$(
														"#keyword_id_recoveryLife_tr_prophesy")
														.show();
												$(
														"#keyword_id_recoveryLife_prophesyType")
														.html("小排分享：");
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
						var status = data.status;
						if ("" != recoveryLife  && null != recoveryLife) {
							var morningrevial = recoveryLife.morningrevial;
							var twoaltarpray = recoveryLife.twoaltarpray;
							var psrp = recoveryLife.psrp;
							var threeold = recoveryLife.threeold;
							var threeoldnum = recoveryLife.threeoldnum;
							var onenew = recoveryLife.onenew;
							var arrthreeoldnum = threeoldnum.split(",");
							var onenewnum = recoveryLife.onenewnum;
							var arronenewnum = onenewnum.split(",");
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
							if (onenew == 1) {
								if (status == 1) {
									$("#keyword_id_recoveryLife_oneNewRecord")
											.attr("checked", "true");
								}
							}
							if (threeold == 1) {
								if (status == 1) {
									$("#keyword_id_recoveryLife_threeOldRecord")
											.attr("checked", "true");
								}
							}

							if (threeoldnum != null || undefined != threeoldnum) {
								$("#keyword_id_recoveryLife_threeOld").val(
										arrthreeoldnum[0]);
								$("#keyword_id_recoveryLife_threeOldNum").val(
										arrthreeoldnum[1]);
							}
							if (onenewnum != null || undefined != onenewnum) {
								$("#keyword_id_recoveryLife_oneNew").val(
										arronenewnum[0]);
								$("#keyword_id_recoveryLife_oneNewNum").val(
										arronenewnum[1]);
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
	//checkbox 与 其值得联系
	$(function() {
	
		$("#keyword_id_recoveryLife_morningRevial").click(function() {
			if (!$("#keyword_id_recoveryLife_morningRevial").is(':checked')) {
				$("#keyword_id_recoveryLife_morningRevialNum").val("");
			}
		})

		$("#keyword_id_recoveryLife_twoAltarPray").click(function() {
			if (!$("#keyword_id_recoveryLife_twoAltarPray").is(':checked')) {
				$("#keyword_id_recoveryLife_twoAltarPrayNum").val("");
			}
		})

		$("#keyword_id_recoveryLife_personalPray").click(function() {
			if (!$("#keyword_id_recoveryLife_personalPray").is(':checked')) {
				$("#keyword_id_recoveryLife_personalPrayNum").val("");
			}
		})
		
		$("#keyword_id_recoveryLife_threeOldRecord").click(function() {
			if (!$("#keyword_id_recoveryLife_threeOldRecord").is(':checked')) {
				$("#keyword_id_recoveryLife_threeOld_li").hide();
			}else{
			$("#keyword_id_recoveryLife_threeOld_li").show();
			}
		})
		
		$("#keyword_id_recoveryLife_oneNewRecord").click(function() {
			if (!$("#keyword_id_recoveryLife_oneNewRecord").is(':checked')) {
				$("#keyword_id_recoveryLife_oneNew_li").hide();
			}else{
			$("#keyword_id_recoveryLife_oneNew_li").show();
			}
		})
	})
</script>


<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/pages/commons/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html >
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
<!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<!-- <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link href="https://cdn.bootcss.com/ratchet/2.0.2/css/ratchet.min.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/ratchet/2.0.2/js/ratchet.js"></script> -->

<link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm.css">
<script type='text/javascript'
	src='//g.alicdn.com/sj/lib/zepto/zepto.js' charset='utf-8'></script>
<script type='text/javascript'
	src='//g.alicdn.com/msui/sm/0.6.2/js/sm.js' charset='utf-8'></script>
</head>

<body >
	<div class="page-group">
		<!-- 单个page ,第一个.page默认被展示-->
		<div class="page">
			<!-- 标题栏 -->
			<!-- <header class="bar bar-nav"> <a
				class="icon icon-me pull-left open-panel"></a>
			<h1 class="title">神人生活操练</h1>
			</header> -->

			<!-- 工具栏 -->
		 	<nav class="bar bar-tab"> <a class="tab-item external active"
				href="#"> <span class="icon icon-home"></span> <span
				class="tab-label">首页</span> </a>  <a class="tab-item external" href="#"> <span
				class="icon icon-settings"></span> <span class="tab-label">我的</span>
			</a> </nav> 

			<!-- 这里是页面内容区 -->
			<div class="content" style="top: -35px">
  <div class="content-block-title"></div>
  <div class="card">
    <div class="card-content">
      <div class="card-content-inner"></div>
    </div>
				<div class="list-block">
					<ul>
						<!-- Text inputs -->
						<li>
							<div class="item-content">
								<div class="item-media">
									<i class="icon icon-form-name"></i>
								</div>
								<div class="item-inner">
									<div class="item-title label">晨兴</div>
									<div class="item-input">
										<label class="label-switch"> <input type="checkbox">
											<div class="checkbox"></div> </label>
									</div>
									<div class="item-input">
										<input type="text" placeholder="时间/分钟">
									</div>
								</div>
							</div></li>
								<li>
							<div class="item-content">
								<div class="item-media">
									<i class="icon icon-form-name"></i>
								</div>
								<div class="item-inner">
									<div class="item-title label">两坛祷告</div>
									<div class="item-input">
										<label class="label-switch"> <input type="checkbox">
											<div class="checkbox"></div> </label>
									</div>
									<div class="item-input">
										<input type="text" placeholder="时间/分钟">
									</div>
								</div>
							</div></li>
								<li>
							<div class="item-content">
								<div class="item-media">
									<i class="icon icon-form-name"></i>
								</div>
								<div class="item-inner">
									<div class="item-title label">祷研背讲</div>
									<div class="item-input">
										<label class="label-switch"> <input type="checkbox">
											<div class="checkbox"></div> </label>
									</div>
									<div class="item-input">
										<input type="text" placeholder="时间/分钟">
									</div>
								</div>
							</div></li>
								<li>
							<div class="item-content">
								<div class="item-media">
									<i class="icon icon-form-name"></i>
								</div>
								<div class="item-inner">
									<div class="item-title label">三旧:</div>
									<div class="item-input">
										<label class="label-switch"> <input type="checkbox">
											<div class="checkbox"></div> </label>
									</div>
								</div>
							</div></li>
								<li>
							<div class="item-content">
								<div class="item-media">
									<i class="icon icon-form-name"></i>
								</div>
								<div class="item-inner">
									<div class="item-title label">三章旧约：</div>
									<div class="item-input">
										<select>
											<option>Male</option>
											<option>Female</option>
										</select>
									</div>
								<div class="item-input">
										<select>
											<option>Male</option>
											<option>Female</option>
										</select>
									</div>
								</div>
							</div></li>
								<li>
									<li>
							<div class="item-content">
								<div class="item-media">
									<i class="icon icon-form-name"></i>
								</div>
								<div class="item-inner">
									<div class="item-title label">一新:</div>
									<div class="item-input">
										<label class="label-switch"> <input type="checkbox">
											<div class="checkbox"></div> </label>
									</div>
								</div>
							</div></li>
								<li>
							<div class="item-content">
								<div class="item-media">
									<i class="icon icon-form-name"></i>
								</div>
								<div class="item-inner">
									<div class="item-title label">一章新约：</div>
									<div class="item-input">
										<select>
											<option>Male</option>
											<option>Female</option>
										</select>
									</div>
								<div class="item-input">
										<select>
											<option>Male</option>
											<option>Female</option>
										</select>
									</div>
								</div>
							</div></li>
								<li>
							<div class="item-content">
								<div class="item-media">
									<i class="icon icon-form-name"></i>
								</div>
								<div class="item-inner">
									<div class="item-title label">个人祷告</div>
									<div class="item-input">
										<label class="label-switch"> <input type="checkbox">
											<div class="checkbox"></div> </label>
									</div>
								</div>
							</div></li>
								<li>
							<div class="item-content">
								<div class="item-media">
									<i class="icon icon-form-name"></i>
								</div>
								<div class="item-inner">
									<div class="item-title label">传福音</div>
									<div class="item-input">
										<input type="text" placeholder="时间/分钟">
									</div>
								</div>
							</div></li>
								<li>
							<div class="item-content">
								<div class="item-media">
									<i class="icon icon-form-name"></i>
								</div>
								<div class="item-inner">
									<div class="item-title label">看望牧养</div>
									<div class="item-input">
										<input type="text" placeholder="时间/分钟">
									</div>
								</div>
							</div></li>
								<li>
							<div class="item-content">
								<div class="item-media">
									<i class="icon icon-form-name"></i>
								</div>
								<div class="item-inner">
									<div class="item-title label">聚会到会:</div>
									<div class="item-input">
										<select>
											<option>Male</option>
											<option>Female</option>
										</select>
									</div>
									<div class="item-input">
										<select>
											<option>Male</option>
											<option>Female</option>
										</select>
									</div>
								</div>
							</div></li>
								<li>
							<div class="item-content">
								<div class="item-media">
									<i class="icon icon-form-name"></i>
								</div>
								<div class="item-inner">
									<div class="item-title label">主日聚会申言</div>
									<div class="item-input">
										<label class="label-switch"> <input type="checkbox">
											<div class="checkbox"></div> </label>
									</div>
								</div>
							</div></li>
							
					
					</ul>
				</div>
				<div class="content-block">
					<div class="row">
						<div>
							<a href="#" class="button button-big button-fill button-success">提交</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 其他的单个page内联页（如果有） -->
		<div class="page">...</div>
	</div>

	<!-- popup, panel 等放在这里 -->
	<div class="panel-overlay"></div>
	<!-- Left Panel with Reveal effect -->
	<div class="panel panel-left panel-reveal">
		<div class="content-block">
			<p>这是一个侧栏</p>
			<p></p>
			<!-- Click on link with "close-panel" class will close panel -->
			<p>
				<a href="#" class="close-panel">关闭</a>
			</p>
		</div>
	</div>


	<!-- 默认必须要执行$.init(),实际业务里一般不会在HTML文档里执行，通常是在业务页面代码的最后执行 -->
	<script>
		$.init()
	</script>

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
						var status = data.status;
						if ("" != recoveryLife) {
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
	})
</script>

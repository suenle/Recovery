<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/pages/commons/taglibs.jsp"%>
<html>
<head>
<title>神人生活操练--操练查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<link href="/Recovery/css/style.css" rel="stylesheet" type="text/css"
	charset="utf-8">
<script src="/Recovery/js/jquery-1.9.1.min.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

</head>

<body>
	<input type="hidden" id="keyword_id_addInfo_churchList" value="" />
	<input type="hidden" id="keyword_id_addInfo_districtList" value="" />
	<input type="hidden" id="keyword_id_addInfo_groupList" value="" />
	<input type="hidden" id="keyword_id_addInfo_homeList" value="" />

	<div id="keyword_id_div_queryInfo_query"
		style="width: 85%; margin:0 auto;">
		<table border="0" cellpadding="0" cellspacing="0" width="100%"
			height="auto" style="text-align: center;">
			<tr style="height:30px;" class="tr_height">
			</tr>
			<tr style="height:20px;">
				<td class="" width="40%"><span class="div_front_prompt">*</span>所属召会：
				</td>
				<td width="60%"><select class="input_class"
					id="keyword_id_addInfo_church">
				</select>
				</td>
			</tr>
			<tr style="height:10px;" class="tr_height">
				<td class="" width="40%"></td>
				<td width="60%"><span id="keyword_id_addInfo_alarm_church"
					class="div_front_prompt"></span>
				</td>
			</tr>
			<tr style="height:20px;" class="tr_height">
			</tr>
			<tr style="height:20px;">
				<td class=""><span class="div_front_prompt">*</span>所属分区：</td>

				<td><select class="input_class"
					id="keyword_id_addInfo_district">
						<option value="-1">-请选择-</option>
				</select>
				</td>
			</tr>
			<tr style="height:10px;" class="tr_height">
				<td class="" width="40%"></td>
				<td width="60%"><span id="keyword_id_addInfo_alarm_district"
					class="div_front_prompt"></span>
				</td>
			</tr>
			<tr style="height:20px;" class="tr_height">
			</tr>
			<tr style="height:20px;">
				<td class=""><span class="div_front_prompt">*</span>所属小排：</td>
				<td><div style="margin-right: 5px">
						<select class="input_class" name="groupId"
							id="keyword_id_addInfo_group">
							<option value="-1">-请先选择分区-</option>
						</select>
					</div>
				</td>
			</tr>
			<tr style="height:10px;" class="tr_height">
				<td class="" width="40%"></td>
				<td width="60%"><span id="keyword_id_addInfo_alarm_group"
					class="div_front_prompt"></span>
				</td>
			</tr>
			<tr style="height:20px;" class="tr_height">
			</tr>
			<tr style="height:20px;">
				<td class=""><span class="div_front_prompt"></span>所&nbsp;&nbsp;属&nbsp;&nbsp;家：</td>
				<td><div style="margin-right: 5px">
						<select class="input_class" name="homeID"
							id="keyword_id_addInfo_home">
							<option value="-1">-请先选择分区-</option>
						</select>
					</div>
				</td>

			</tr>
			<tr style="height:10px;" class="tr_height">
				<td class="" width="40%"></td>
				<td width="60%"><span id="keyword_id_addInfo_alarm_home"
					class="div_front_prompt"></span></td>
			</tr>
			<tr style="height:20px;" class="tr_height">
			</tr>
			<tr style="height:20px;">
				<td class=""><span class="div_front_prompt">*</span>姓
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
				<td><input accept="middle" class="input_class" type="text"
					id="keyword_id_addInfo_name" name="userName" placeholder="请输入姓名" />
				</td>

			</tr>
			<tr style="height:10px;" class="tr_height">
				<td class="" width="40%"></td>
				<td width="60%"><span id="keyword_id_addInfo_alarm_name"
					class="div_front_prompt"></span></td>
			</tr>
			<tr style="height:20px;" class="tr_height">
			</tr>
			<tr style="height:20px;">
				<td class=""><span class="div_front_prompt">*</span>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
				<td><select class="input_class" name="sex"
					id="keyword_id_addInfo_sex">
						<option value="0">弟兄</option>
						<option value="1">姊妹</option>
				</select>
				</td>
			</tr>
			<tr style="height:10px;" class="tr_height">
				<td class="" width="40%"></td>
				<td width="60%"><span id="keyword_id_addInfo_alarm_sex"
					class="div_front_prompt"></span>
				</td>
			</tr>
			<tr style="height:20px;" class="tr_height">
			</tr>
			<tr style="height:10px;">
				<td colspan="2"></td>
			</tr>
			<tr style="height:30px;">
				<td colspan="2" style="border-top:1px solid gainsboro;"></td>
			</tr>
			<tr style="">
				<td colspan="2">
					<div style="text-align:center;">
						<input type="button" class="div_button_submit div_button_submit_2"
							value="查询" onclick="javascript:getInfoList();" />
					</div></td>
			</tr>
		</table>
	</div>


	<div id="keyword_id_div_queryInfo_queryInfoList"
		style="width: 85%; margin:10px auto; display: none">
		<div style="text-align:center; height:50px">
			<input type="submit" class="div_button_submit div_button_submit_2"
				value="重新查询" onclick="javascript:requery();" />
		</div>
		<table border="0" cellpadding="0" cellspacing="0" width="100%"
			height="auto" style="text-align: center;"
			id="keyword_id_queryInfo_userList">
			<tr style='height:20px;'>
				<td class='' width='25%'>姓名</td>
				<td class='' width='25%'>所属小排</td>
				<td class='' width='25%'>所属家</td>
				<td class='' width='25%'><input type="hidden"
					id="keyword_id_addInfo_districtList" value="1" /><a
					name="name_queryInfo_a_click">点击详情</a></td>
			</tr>
		</table>
	</div>


	<div id="keyword_id_div_queryInfo_lifeInfo"
		style="width: 85% ; margin:10px auto;display: none"">
		<div style="text-align:center; height:50px">
			<input type="submit" class="div_button_submit div_button_submit_2"
				value="返回上一级" onclick="javascript:beforeButton();" />
		</div>
		<div style="text-align: center; height: 30px">
			<span style="font-size: 18px" id="keyword_id_queryInfo_namesex"></span>
		</div>
		<table border="0" cellpadding="0" cellspacing="0" width="100%"
			height="auto" style="text-align: center;"
			id="keyword_id_queryInfo_info">
		</table>
	</div>
	<div style="height: 50px"></div>
	<!--bottom-->
	<div id="menu" class="menu">
		<a href="${ctx}/RecoveryLife/recoveryLifeInfo.do"><div id="one"
				class="subMenu text-center">
				<img src="../images/frame1.png" width="23" height="23" style="margin-top: 3px">
				<div class="menu_name">
					<span style="color: black">神人生活操练</span>
				</div>
			</div> </a> <a href="../pages/meun.jsp"><div id="two"
				class="subMenu text-center">
				<img src="../images/frame1.png" width="23" height="23" style="margin-top: 3px">
				<div class="menu_name">
					<span style="color: black">我的</span>
				</div>
			</div> </a>
	</div>
	</div>
</body>
</html>
<script language="javascript">
	$(document).ready(
			function() {
				//获取会所四级
				$.ajax({
					type : "POST",
					url : "${ctx}//UserInfo/getChurchInfo.do",
					data : {},
					async : false,
					cache : false,
					success : function(data) {
						var errorMsg = data.errorMsg;
						if ("" != errorMsg) {
							$.messager.alert("错误提示", errorMsg, "error");
						}
						var cList = data.churchList;
						var dList = data.districtList;
						var gList = data.groupList;
						var hList = data.homeList;
						$("#keyword_id_addInfo_churchList").val(
								JSON.stringify(cList));
						$("#keyword_id_addInfo_districtList").val(
								JSON.stringify(dList));
						$("#keyword_id_addInfo_groupList").val(
								JSON.stringify(gList));
						$("#keyword_id_addInfo_homeList").val(
								JSON.stringify(hList));
						var str = "";
						for ( var i = 0; i < cList.length; i++) {
							str += "<option value="+cList[i].id+">"
									+ cList[i].churchname + "</option>";

						}
						$("#keyword_id_addInfo_church").append(str);
						var dstr = "";
						for ( var u = 0; u < dList.length; u++) {
							dstr += "<option value="+dList[u].id+">"
									+ dList[u].districtname + "</option>";

						}
						$("#keyword_id_addInfo_district").append(dstr);

					},
					error : function(data) {

					}

				});

				$("#keyword_id_addInfo_district").change(function() {
					var orgSel_id = "#keyword_id_addInfo_district";
					var sel_groupid = "#keyword_id_addInfo_group";
					var sel_homeid = "#keyword_id_addInfo_home";
					sel_districtAndGroup(orgSel_id, sel_groupid);

					sel_GroupAndHome(orgSel_id, sel_homeid);

				});

			});

	//区对应的排联动
	function sel_districtAndGroup(orgSel_id, sel_id) {
		var dList = $("#keyword_id_addInfo_districtList").val();
		var gList = $("#keyword_id_addInfo_groupList").val();
		var did = $(orgSel_id).val();
		var jsongList = eval('(' + gList + ')');
		$(sel_id).empty();
		var gstr = "<option value='-1'>-请选择-</option>";
		for ( var i = 0; i < jsongList.length; i++) {
			if (jsongList[i].districtid == did) {
				gstr += "<option value="+jsongList[i].id+">"
						+ jsongList[i].groupname + "</option>";
			}
		}
		$(sel_id).append(gstr);

	}
	//区对应的家联动（改）
	function sel_GroupAndHome(orgSel_id, sel_id) {

		var gList = $("#keyword_id_addInfo_districtList").val();
		var dList = $("#keyword_id_addInfo_homeList").val();

		var did = $(orgSel_id).val();
		var jsongList = eval('(' + dList + ')');
		$(sel_id).empty();
		var gstr = "<option value='-1'>-请选择-</option>";
		for ( var i = 0; i < jsongList.length; i++) {
			if (jsongList[i].groupid == did) {
				gstr += "<option value="+jsongList[i].id+">"
						+ jsongList[i].homename + "</option>";
			}
		}
		$(sel_id).append(gstr);

	}

	//获取查询结果列表
	function getInfoList() {
		var churchId = $("#keyword_id_addInfo_church").val();
		var districtId = $("#keyword_id_addInfo_district").val();
		var groupId = $("#keyword_id_addInfo_group").val();
		var homeId = $("#keyword_id_addInfo_home").val();
		var userName = $("#keyword_id_addInfo_name").val();

		$
				.ajax({
					type : "POST",
					url : "${ctx}//RecoveryLife/getInfoList.do",
					data : {
						churchId : churchId,
						districtId : districtId,
						groupId : groupId,
						homeId : homeId,
						userName : userName
					},
					async : false,
					cache : false,
					success : function(data) {
						var jsonObj = eval("(" + data + ")");
						var errorMsg = jsonObj.errorMsg;
						if ("" != errorMsg) {
							//alert("错误提示", errorMsg, "error");
						}
						$("#keyword_id_queryInfo_userList").text("");

						var str = "<tr style='height:20px;'><td class='' width='25%'>姓名</td>"
								+ "<td class='' width='25%'>所属小排</td>"
								+ "<td class='' width='25%'>所属家</td>"
								+ "<td class='' width='25%'>点击详情</td></tr>";
						for ( var i = 0; i < jsonObj.rows.length; i++) {
							str += "<tr style='height:20px;'><td class='' width='25%'>"
									+ jsonObj.rows[i].userName
									+ "</td>"
									+ "<td class='' width='25%'>"
									+ jsonObj.rows[i].groupName
									+ "</td>"
									+ "<td class='' width='25%'>"
									+ jsonObj.rows[i].homeName
									+ "</td>"
									+ "<td class='' width='25%'><input type='hidden' value='"+jsonObj.rows[i].userId+"' /><a name='name_queryInfo_a_click'>点击详情</a></td></tr>";
						}

						$("#keyword_id_queryInfo_userList").append(str);

						$("#keyword_id_div_queryInfo_query").hide();

						$("#keyword_id_div_queryInfo_queryInfoList").show();

						$("[name='name_queryInfo_a_click']").click(function() {
							var userid = $(this).prev().val();
							getLifeInfo(userid);

						})

					},
					error : function(data) {

					}

				});

	}

	//重新查询按钮
	function requery() {

		$("#keyword_id_div_queryInfo_query").show();

		$("#keyword_id_div_queryInfo_queryInfoList").hide();

	}

	//重新查询按钮
	function beforeButton() {

		$("#keyword_id_div_queryInfo_queryInfoList").show();

		$("#keyword_id_div_queryInfo_lifeInfo").hide();

	}

	//获取个人操练信息 现在默认是一周
	function getLifeInfo(userid) {
		$.ajax({
			type : "POST",
			url : "${ctx}//RecoveryLife/getRecoveryLife.do",
			data : {
				userId : userid
			},
			async : false,
			cache : false,
			success : function(data) {
				var jsonObj = eval("(" + data + ")");
				var errorMsg = jsonObj.errorMsg;
				if ("" != errorMsg) {
					alert(errorMsg);
				}

				$("#keyword_id_queryInfo_info").text("");

				var username = jsonObj.userName;

				var sex = jsonObj.sex;
				$("#keyword_id_queryInfo_namesex").html(
						username + "&nbsp;" + sex);

				var str = "<tr style='height:20px;'><td class=''>周</td>"
						+ "<td class='' >晨兴</td>" + "<td class=''>两坛祷告</td>"
						+ "<td class='' >祷言背讲</td>" + "<td class='' >三旧</td>"
						+ "<td class='' >一新</td>" + "<td class='' >个祷</td>"
						+ "<td class='' >传福音</td>" + "<td class='' >牧养</td>"
						+ "<td class='' >聚会</td>"
						+ "<td class='' >申/分</td></tr>";

				for ( var i = 0; i < jsonObj.rows.length; i++) {
					str += "<tr style='height:20px;'><td class='' >"
							+ jsonObj.rows[i].time + "</td>" + "<td class='' >"
							+ jsonObj.rows[i].morningrevial + "</td>"
							+ "<td class='' >" + jsonObj.rows[i].twoaltarpray
							+ "</td>" + "<td class='' >" + jsonObj.rows[i].psrp
							+ "</td>" + "<td class='' >"
							+ jsonObj.rows[i].threeold + "</td>"
							+ "<td class='' >" + jsonObj.rows[i].onenew
							+ "</td>" + "<td class='' >"
							+ jsonObj.rows[i].personalpray + "</td>"
							+ "<td class='' >" + jsonObj.rows[i].gospel
							+ "</td>" + "<td class='' >"
							+ jsonObj.rows[i].shepherd + "</td>"
							+ "<td class='' >" + jsonObj.rows[i].meeting
							+ "</td>" + "<td class='' w>"
							+ jsonObj.rows[i].prophesy + "</td></tr>";
				}

				$("#keyword_id_queryInfo_info").append(str);

				$("#keyword_id_div_queryInfo_lifeInfo").show();

				$("#keyword_id_div_queryInfo_queryInfoList").hide();

			},
			error : function(data) {

			}

		});

	}
</script>

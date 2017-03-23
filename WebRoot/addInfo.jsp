<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/pages/commons/taglibs.jsp"%>
<html>
<head>
<title>MyHtml.html</title>
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


	<div id="keyword_id_areasTypeClassify_divAddFront"
		style="width: 85%; margin:0 auto;">
		<form method="post" action="${ctx}/UserInfo/addInfo.do"
			onsubmit="return check()">
			<table border="0" cellpadding="0" cellspacing="0" width="100%"
				height="auto" style="text-align: center;">
				<tr style="height:80px;">
					<td colspan="2"
						style="border-bottom:1px solid gainsboro;padding-top: 5px;"><h3
							class="h1">个人信息</h3>
					</td>
				</tr>
				<tr style="height:30px;" class="tr_height">
				</tr>
				<tr style="height:20px;">
					<td class="" width="40%"><span class="div_front_prompt">*</span>所属召会：
					</td>
					<td width="60%"><select class="input_class"
						id="keyword_id_addInfo_church">
					</select></td>
				</tr>
				<tr style="height:10px;" class="tr_height">
					<td class="" width="40%"></td>
					<td width="60%"><span id="keyword_id_addInfo_alarm_church"
						class="div_front_prompt"></span></td>
				</tr>
				<tr style="height:20px;" class="tr_height">
				</tr>
				<tr style="height:20px;">
					<td class=""><span class="div_front_prompt">*</span>所属分区：</td>

					<td><select class="input_class"
						id="keyword_id_addInfo_district">
							<option value="-1">-请选择-</option>
					</select></td>
				</tr>
				<tr style="height:10px;" class="tr_height">
					<td class="" width="40%"></td>
					<td width="60%"><span id="keyword_id_addInfo_alarm_district"
						class="div_front_prompt"></span></td>
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
						</div></td>
				</tr>
				<tr style="height:10px;" class="tr_height">
					<td class="" width="40%"></td>
					<td width="60%"><span id="keyword_id_addInfo_alarm_group"
						class="div_front_prompt"></span></td>
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
						</div></td>

				</tr>
				<tr style="height:10px;" class="tr_height">
					<td class="" width="40%"></td>
					<td width="60%"><span id="keyword_id_addInfo_alarm_home"
						class="div_front_prompt"></span>
					</td>
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
						class="div_front_prompt"></span>
					</td>
				</tr>
				<tr style="height:20px;" class="tr_height">
				</tr>
				<tr style="height:20px;">
					<td class=""><span class="div_front_prompt">*</span>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>

					<td><select class="input_class" name="sex"
						id="keyword_id_addInfo_sex">
							<option value="0">弟兄</option>
							<option value="1">姊妹</option>
					</select></td>
				</tr>
				<tr style="height:10px;" class="tr_height">
					<td class="" width="40%"></td>
					<td width="60%"><span id="keyword_id_addInfo_alarm_sex"
						class="div_front_prompt"></span></td>
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
							<input type="submit"
								class="div_button_submit div_button_submit_2" value="提 交"
								onclick="javascript:areasTypeClassifyAddCommit();" /> <input
								type="button" class="div_button_cancel div_button_cancel_2"
								value="取 消" onclick="javascript:reset();" />

						</div>
					</td>
				</tr>
			</table>
		</form>
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
	function check() {
		var church = $("#keyword_id_addInfo_church").val();
		var district = $("#keyword_id_addInfo_district").val();
		var group = $("#keyword_id_addInfo_group").val();
		var home = $("#keyword_id_addInfo_home").val();
		var name = $("#keyword_id_addInfo_name").val();
		var sex = $("#keyword_id_addInfo_sex").val();

		$("#keyword_id_addInfo_alarm_church").text("");
		$("#keyword_id_addInfo_alarm_district").text("");
		$("#keyword_id_addInfo_alarm_group").text("");
		$("#keyword_id_addInfo_alarm_home").text("");
		$("#keyword_id_addInfo_alarm_name").text("");
		$("#keyword_id_addInfo_alarm_sex").text("");
		if (undefined == church || "" == church || "-1" == church) {
			$("#keyword_id_addInfo_alarm_church").text("请选择所属召会");
			return false;
		}
		if (undefined == district || "" == district || "-1" == district) {
			$("#keyword_id_addInfo_alarm_district").text("请选择所属分区");
			return false;
		}
		if (undefined == group || "" == group || "-1" == group) {
			$("#keyword_id_addInfo_alarm_group").text("请选择所属小排");
			return false;
		}

		if (undefined == name || "" == name) {
			$("#keyword_id_addInfo_alarm_name").text("请輸入姓名");
			return false;
		}

		if (undefined == sex || "" == sex || "-1" == sex) {
		$("#keyword_id_addInfo_alarm_sex").text("请选择性别");
			return false;
		}

		return true;
	}
</script>

$.ajax({
	type : "post",
	url : $("#contentPath").val()+ "/bns/companyAjax/StaffEvaluate/setStaffEvaluationInfo.do",
	dataType : "json", async : false, cache : false,
	success : function(data) {
		var e = data.staffEvaluate;
		var we = data.staffWeight;
		var serverType = data.serverType;
		if (serverType != true) {
			$("#serverType").hide();
		} else {
			$("#serverType").show();
		}
		styleHtml = "<tr><td><table class='tableset' style='width: 360px;'><tr><th colspan='2' class='titleTh' style='padding: 3px;background-color: #fff;border: 0px;'><s:text name='system.StaffEvaluate.scoreWeightSetting' /></th></tr>";
		styleHtml += "<tr><td colspan='2'><s:text name='system.StaffEvaluate.staffEvaluateWeight' /></td></tr>";
		if (we[0] == undefined || we[0] == '') {
			styleHtml += '<tr><td><s:text name="system.StaffEvaluate.timeWeight" /></td><td>' + 0 + '</td></tr>';
			styleHtml += '<tr><td><s:text name="system.StaffEvaluate.effWeight" /></td><td>' + 0 + '</td></tr>';
			styleHtml += '<tr><td><s:text name="system.StaffEvaluate.skillWeight" /></td><td>' + 0 + '</td></tr>';
			styleHtml += '<tr><td><s:text name="system.StaffEvaluate.qualityWeight" /></td><td>' + 0 + '</td></tr>';
			styleHtml += '<tr><td><s:text name="system.StaffEvaluate.worktimeWeight" /></td><td>' + 0 + '</td></tr>';
		} else {
			for ( var i = 0; i < 5; i++) {
				if (we[i].indicatior == 1)
					styleHtml += '<tr><td><s:text name="system.StaffEvaluate.timeWeight" /></td><td>' + we[i].weight + '%</td></tr>';
				if (we[i].indicatior == 2)
					styleHtml += '<tr><td><s:text name="system.StaffEvaluate.effWeight" /></td><td>' + we[i].weight + '%</td></tr>';
				if (we[i].indicatior == 3)
					styleHtml += '<tr><td><s:text name="system.StaffEvaluate.skillWeight" /></td><td>' + we[i].weight + '%</td></tr>';
				if (we[i].indicatior == 4)
					styleHtml += '<tr><td><s:text name="system.StaffEvaluate.qualityWeight" /></td><td>' + we[i].weight + '%</td></tr>';
				if (we[i].indicatior == 5)
					styleHtml += '<tr><td><s:text name="system.StaffEvaluate.worktimeWeight" /></td><td>' + we[i].weight + '%</td></tr>';
			}
		}

		styleHtml += "</table><table class='tableset' style='width: 360px;'><tr><th colspan='2'class='titleTh' style='padding: 3px;background-color: #fff;border: 0px;'><s:text name='system.StaffEvaluate.quality' /></th></tr><tr><td colspan='2'><s:text name='system.StaffEvaluate.staffEvaluateEligibility-rate' /></td></tr><tr><th><s:text name='system.StaffEvaluate.qualifiedRange' /></th><th><s:text name='system.StaffEvaluate.score' /></th></tr>";

		for ( var i = 0; i < 5; i++) {
			if (e[1] == 'undefined' || e[1] == '') {
				styleHtml += '<tr><td> </td><td>' + (i + 1) + '</td></tr>';
			} else {
				if (i != 4)
					styleHtml += '<tr><td>' + e[3][i].criticalValue + '% ≤ N < ' + e[3][i + 1].criticalValue + '%</td><td>' + e[3][i].score + '</td></tr>';
				else
					styleHtml += '<tr><td>' + e[3][i].criticalValue + '% ≤ N</td><td>' + e[3][i].score + '</td></tr>';
			}
		}
		styleHtml += "</table></td><td><table class='tableset' style='width: 360px;'><tr><th colspan='2' class='titleTh' style='padding: 3px;background-color: #fff;border: 0px;'><s:text name='system.StaffEvaluate.skills' /></th></tr><tr><td colspan='2'><s:text name='system.StaffEvaluate.staffEvaluateExpertise' /></td></tr>";
		styleHtml += '<tr><th><s:text name="system.StaffEvaluate.onWorktypesNum" /></th><th><s:text name="system.StaffEvaluate.score" /></th></tr>';
		for ( var i = 0; i < 5; i++) {
			if (e[1] == 'undefined' || e[1] == '') {
				styleHtml += '<tr><td> </td><td>' + (i + 1) + '</td></tr>';
			} else {
				if (i != 4)
					styleHtml += '<tr><td>' + e[1][i].criticalValue + ' ≤ N < ' + e[1][i + 1].criticalValue + '</td><td>' + e[1][i].score + '</td></tr>';
				else
					styleHtml += '<tr><td>' + e[1][i].criticalValue  + ' ≤ N</td><td>' + e[1][i].score + '</td></tr>';
			}
		}
		styleHtml += "</table><table class='tableset' style='width: 360px;'><tr><th colspan='2' class='titleTh' style='padding: 3px;background-color: #fff;border: 0px;'><s:text name='system.StaffEvaluate.seniority' /></th></tr><tr><td colspan='2'><s:text name='system.StaffEvaluate.staffEvaluateSeniority' /></td></tr><tr><th><s:text name='system.StaffEvaluate.serviceMonth' /></th><th><s:text name='system.StaffEvaluate.score' /></th></tr>";
		for ( var i = 0; i < 5; i++) {
			if (e[5] == 'undefined' || e[5] == '') {
				styleHtml += '<tr><td> </td><td>' + (i + 1) + '</td></tr>';
			} else {
				if (i != 4)
					styleHtml += '<tr><td>' + e[5][i].criticalValue + ' ≤ N < ' + e[5][i + 1].criticalValue + '</td><td>' + e[5][i].score + '</td></tr>';
				else
					styleHtml += '<tr><td>' + e[5][i].criticalValue + ' ≤ N</td><td>' + e[5][i].score + '</td></tr>';
			}
		}
		styleHtml = styleHtml + "</table></td></tr>";
		$("#deviceTable").append(styleHtml);
	},
	error : function() {
		alert("<s:text name='system.requestOfOrderDataFailed' />");
	}
});
$('#showStateModal').modal('show');}
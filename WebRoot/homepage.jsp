<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/commons/taglibs.jsp" %>
<rapid:override name="content">
 <input type="hidden" id="contentPath" value="${ctx}"/>
	<div id="content">
        <div class="container">
        	<div class="span12">
        	
	        	<%--新功能模态框 --%>
	        	<div class="modal" id="isNewModal" style="overflow: visible; width:507px; border: 3px solid #2291d6; display:none;">
	        		<div style="margin:5px 0 0 -18px; width:520px; background-image: url('styles/img/new-function-header.png'); background-repeat: no-repeat;">
	        			<button type="button" class="close" data-dismiss="modal"><span style="color:#2291d6;">×</span></button>
						<h3 style="margin:0 0 0 25px; line-height:60px; color:#fff;">新功能提示</h3>
	        		</div>
					<div class="modal-body">
						<div id="insDetail">
						  
						</div>
						<hr style="margin:0;border-top: 1px solid #2291d6;">
						<%-- 分页  --%>
						<div id="listT_paginate" style="text-align: center;">
							<a class="paginate_button previous" id="listT_previous">上一条</a>
							<a class="paginate_button next" id="listT_next">下一条</a>
						</div>
					</div>
				</div>
        		
        		<%-- 今日加工款式进度  --%>
        		<div class="row" style="margin-bottom:10px;">
        			<div class="span12 container-box">
        				<div style="margin-left: 30px">
        					<h5 class="container-tit" style="margin-bottom:0"><s:text name="system.homepage.todayStyleProgress"/><i class="ydicons ydicons-hand"></i></h5>
        				</div>
        				<svg class="chart" id="svgElement"></svg>
        			</div>
        		</div>
        		
	        	<%-- 效率情况  --%>
	        	<div id="efficiencyZone">
		            <div class="row" id="dataIndexForNine">
		                <div class="span12 container-box">
		                	<div class="row ydspan">
		                		<div class="span8 ydspan">
		                			<div class="container-con margin-left3">
	
			                			<h5 class="container-tit"><s:text name="system.homepage.efficiencySituation"/> <i class="ydicons ydicons-hand"></i></h5>
			                			<div id="dataIndex" class="vertical-line margin-left1" style="height:230px; width:100%;">
			                			</div>
		                			</div>
		                		</div>
		                		<div class="span4 ydspan" style='display:none' id='effIndexForRight'>
	
		                			<h5 class="container-tit"><s:text name="system.homepage.efficiencyDetails"/></h5>
		                			<div class="efficiency-detail margin-left3 cross-line">
		                				<dl>
											<dt><s:text name="system.homepage.orderCode"/>:</dt><dd id='effOrderCode'></dd><a id= "orderCodeA" title="<s:text name="system.order.clientCom.orderManager" />"><i class='ydicons ydicons-serch'></i></a>
		                					<dt><s:text name="system.homepage.styleName"/>:</dt><dd id="effStyleName"></dd><a id= "styleCodeA"><i class='ydicons ydicons-N-' title="<s:text name="system.processiongDetail" />"></i></a><a id="styleIDA"><i class='ydicons ydicons-N' title="<s:text name="system.homepage.efficiencyDetails"/>"></i></a>
		                					<dt><s:text name="system.homepage.clientName"/>:</dt><dd id="effClientName"></dd>
		                					<dt>步骤名称:</dt><dd id="effStepName"></dd>
		                					<dt></dt><dt id="effPlanNum" style="width:70%;color:#12a9f4" ></dt>
		                					<dt><s:text name="system.homepage.progress"/>:</dt>
		                			<dd id="effProgressS" class="progress" style="margin-bottom:5px;height:15px;line-height:15px;" title="">
								      <div id="effProgressI" class="bar" style="height:15px;line-height:15px;"></div>
								      <span class="barVal" id="effProgressIVal"></span>
								  	</dd>
	
								  	<dt></dt><dt id="effDeliveryTime" style="width:70%;color:#398502"></dt>
	
		                					<dt><s:text name="system.homepage.timeProgress"/>:</dt>
		                			<dd id="effTimeProgressS" class="progress" style="margin-bottom:5px;height:15px;line-height:15px; " title="">
								      <div id="effTimeProgressI" class="indexbar" style="height:15px;line-height:15px; background-image:linear-gradient(to bottom, #c9dfa8, #398502);background-color:#398502;color:#398502"></div>
								      <div id="effTimeProgressRed" class="indexRedbar" style="height:15px;line-height:15px;disable:true"></div>
								      <span class="barVal" id="effTimeProgressIVal"></span>
								      </dd>
								      
		                				</dl>
		                			</div>
		                			<div class="efficiency-detail margin-left3 margin-top2">
		                				<dl>
	
		                					<dt><span class="font-blod"><s:text name="system.homepage.efficiencyThatDay"/></span></dt>
		                					
		                					<dd style="width:250px">
	
		                						<i class="block-num-green"  id ="newEfficiency1">0</i><i class="font-black" id ="newEfficiency2"></i><span class="font-black">&nbsp;<s:text name="system.homepage.peopleOneHour"/></span>
	
		                						<div class="container-block margin-left1"  id="oldEfficiencyShow">
	
			                						<i class="ydicons ydicons-down" id='effShowDown' style='display:none'></i>
			                						<i class="ydicons ydicons-up" id='effShowUp'></i>
				                					<div class="block-text">
				                						<span class="font-black" id= "oldEfficiency">0</span><span class="font-black">&nbsp;<s:text name="system.homepage.peopleOneHour"/></span><br/>
	
				                						<span class="font-black" id= "effpecent">+0%</span>
				                					</div>
		                						</div>
		                					</dd>
	
	
		                					<dt style="margin-top:15px;"><s:text name="system.homepage.numberOfCumulativeWork"/>:</dt><dd style="margin-top:15px;"><i class="block-num-blue" id="duration">0</i> <span class="font-black"><s:text name="system.homepage.manHour"/></span></dd>
		                				</dl>
		                			</div>
		                		</div>
		                	</div>
		                </div>
		            </div>
		            <div class="row" id="dataIndexForThree"></div>
	           	</div>
	            
	            <%-- 运营成本分析  --%>
	            <div class="row" id= "costServiceI">
	                <div class="span12 container-box">
	                	<div class="row ydspan">
	                		<div class="span8 ydspan" >
	                			<div class="container-con margin-left3">

		                			<h5 class="container-tit"><s:text name="system.homepage.operationCostAnalysis"/> <i class="ydicons ydicons-hand"></i></h5>
		                			<div id="costAndIncome" class="vertical-line margin-left1" style="height:230px; width:100%;">
		                				
		                			</div>
	                			</div>
	                		</div>
	                		<div class="span4 ydspan">

	                			<h5 class="container-tit"><s:text name="system.costAnalysisCircumstances"/></h5>
	                			<div class="ydcenter">
	                				<div class="margin-top1">
	                					<div class="container-block">
	                						<i class="ydicons ydicons-money"></i>
		                					<div class="block-text" style="vertical-align:15px;">

		                						<s:text name="system.homepage.totalIncomingThatDay"/><br/>
		                						<i id="incomeNum" class="block-num-yellow1" >0.00</i>
		                					</div>
		                				</div>
	                				</div>
	                				<div class="margin-top1">

	                					<div class="container-block margin-left1" style="width:40%;">
	                						<i class="ydicons ydicons-precen2"></i>
		                					<div class="block-text">

		                						<s:text name="system.homepage.grossProfitMargin" /><br/>
		                						<i id="grossMarginTime" class="block-num-yellow2" >0</i>
		                					</div>

		                				</div>

		                				<div class="container-block margin-left3" style="width:40%;">

		                					<i class="ydicons ydicons-incomepoint"></i>
		                					<div class="block-text">

		                						<s:text name="system.homepage.earningPointThatDay"/><br/>

		                						<i id="incomePoint" class="block-num-yellow2">0</i>
		                					</div>
		                				</div>
	                				</div>
	                				<div class="margin-top1">

	                					<div class="container-block margin-left1" style="width:40%;">
	    		                		<i class="ydicons ydicons-c"></i>
		                					<div class="block-text">

		                						<s:text name="system.homepage.totalCostThatDay"/><br/>
		                						<i id="costNum" class="block-num-yellow2">0</i>
		                					</div>
		                					
		                				</div>

		                				<div class="container-block margin-left3" style="width:40%;">
											<i class="ydicons ydicons-product"></i>
		                					<div class="block-text">

		                						<s:text name="system.homepage.totalProducts"/>&nbsp;&nbsp;&nbsp;<br/>

		                						<i id="productNum" class="block-num-yellow2">0</i>
		                					</div>
		                				</div>
	                				</div>
	                				<div class="margin-top1">

	                					<div class="container-block margin-left1" style="width:40%;">
	                						<i class="ydicons ydicons-precen1"></i>
		                					<div class="block-text">

		                						<s:text name="system.homepage.estimatedGrossProfitMargin" />&nbsp;&nbsp;&nbsp;<br/>

		                						<i id="grossMargin" class="block-num-yellow2">0</i>
		                					</div>
		                					
		                				</div>

		                				<div class="container-block margin-left3" style="width:40%;">
											<i class="ydicons ydicons-precentime"></i>
		                					<div class="block-text">

		                						<s:text name="system.homepage.estimatedAchieveTime" />&nbsp;&nbsp;<br/>

		                						<i id="grossHours" class="block-num-yellow2">0</i>
		                					</div>
		                				</div>
	                				</div>
	                			</div>
	                		</div>
	                	</div>
	                </div>
	            </div>
	            
	            <%-- 智能调度、智能IE、生产系统监控  --%>
	            <div class="row">
                	<div class="span12 container-box">
	                	<div class="row ydspan">
	                		<div class="span4" id="scheduleBox">

	                			<h5 class="container-tit"><i class="ydicons ydicons-dot-black"></i> <s:text name="system.homePage.intelligentDispatch"/></h5>
	                			<div class="container-con vertical-line" id="scheduleContent1">
	                				<div class="container-emphasis">
										<i class="ydicons ydicons-hanger"></i>

										<div class="inner-text"><s:text name="system.homepage.upToNow"/><br/><s:text name="system.home.dispatchNumberHanger"/></div>
										<div id="scheduleNum" class="inner-num"></div>
	                				</div>
	                				<div class="container-under">
		                				<div class="item1">
		                					<i class="ydicons ydicons-style"></i>
		                					<div class="item-txt">

		                						<s:text name="system.homepage.numberStyleInvolved"/><br/>
		                						<i id="scheduleStyleNum" class="emphasis-num"></i>
		                					</div>
		                				</div>
		                				<div class="item1">
		                					<i class="ydicons ydicons-efficiency"></i>
		                					<div class="item-txt">

		                						<s:text name="system.homepage.efficiencyGains"/><br/>
		                						<i id="scheduleEfficiencyNum" class="emphasis-num"></i>
		                					</div>
		                				</div>
	                				</div>
	                			</div>
	                			<div class="container-con vertical-line ydnone" id="scheduleContent2">
	                				<div class="ydcenter">
	                					<i class="ydicons ydicons-subscription"></i>


	                					<h6><a href="${ctx}/bns/company/Serve/servicelist.do"><s:text name="system.homepage.notSubscribed"/></a></h6>
	                				</div>
	                			</div>
	                			<div class="container-con vertical-line ydnone" id="scheduleContent3">
	                				<div class="ydcenter">
	                					<i class="ydicons ydicons-noprivilege"></i>

	                					<h6><s:text name="system.homepage.noPermissionToView"/></h6>
	                				</div>
	                			</div>
	                		</div>
	                		<div class="span4 ydspan" id="ieadviceBox">

	                			<h5 class="container-tit"><i class="ydicons ydicons-dot-black"></i> <s:text name="system.homePage.IntelligentIE"/></h5>
	                			<div class="container-con vertical-line" id="ieadviceContent1">
	                				<div class="container-emphasis">
										<i class="ydicons ydicons-ie"></i>

										<div class="inner-text"><s:text name="system.homepage.upToNow"/><br/><s:text name="system.homepage.sendNumberOfOptimizationSuggestion"/></div>
										<div id="ieAdviceNum" class="inner-num"></div>
	                				</div>
	                				<div class="container-under">
		                				<div class="item2">
		                					<i class="ydicons ydicons-saboteur"></i>
		                					<div class="item-txt">

		                						<s:text name="system.homepage.sabotageStaff"/><br/>
		                						<i id="weakStaffNum" class="emphasis-num"></i>
		                					</div>
		                				</div>
		                				<div class="item2">
		                					<i class="ydicons ydicons-bottleneck"></i>
		                					<div class="item-txt">

		                						<s:text name="system.homepage.bottleneckOperation"/><br/>
		                						<i id="slowProcessNum" class="emphasis-num"></i>
		                					</div>
		                				</div>
		                				<div class="item2">
		                					<i class="ydicons ydicons-adjust"></i>
		                					<div class="item-txt">

		                						<s:text name="system.homepage.schedulingStaff"/><br/>
		                						<i id="adjustStaffNum" class="emphasis-num"></i>
		                					</div>
		                				</div>
	                				</div>
	                			</div>
	                			<div class="container-con vertical-line ydnone" id="ieadviceContent2">
	                				<div class="ydcenter">
	                					<i class="ydicons ydicons-subscription"></i>


	                					<h6><a href="${ctx}/bns/company/Serve/servicelist.do"><s:text name="system.homepage.notSubscribed"/></a></h6>
	                				</div>
	                			</div>
	                			<div class="container-con vertical-line ydnone" id="ieadviceContent3">
	                				<div class="ydcenter">
	                					<i class="ydicons ydicons-noprivilege"></i>

	                					<h6><s:text name="system.homepage.noPermissionToView"/></h6>
	                				</div>
	                			</div>
	                		</div>
	                		<div class="span4 ydspan" id="monitorBox">

	                			<h5 class="container-tit"><i class="ydicons ydicons-dot-black"></i> <s:text name="system.homepage.productionMonitoringSystem"/></h5>
	                			<div class="container-con" id="monitorContent1">
	                				<div class="container-emphasis">
										<i class="ydicons ydicons-monitoring"></i>

										<div class="inner-text"><s:text name="system.homepage.systemNumber"/></div>
										<div id="systemNum" class="inner-num"></div>
	                				</div>
	                				<div class="container-under">
		                				<div class="item1">
		                					<i class="ydicons ydicons-runsys"></i>
		                					<div class="item-txt">

		                						<s:text name="system.homepage.runningSystemNumber"/><br/>
		                						<i id="runSystemNum" class="emphasis-num"></i>
		                					</div>
		                				</div>
		                				<div class="item1">
		                					<i class="ydicons ydicons-faultsys"></i>
		                					<div class="item-txt">

		                						<s:text name="system.homepage.totalFaultSystem"/><br/>
		                						<i id="faultSystemNum" class="emphasis-num-red"></i>
		                					</div>
		                				</div>
	                				</div>
	                			</div>
	                			<div class="container-con vertical-line ydnone" id="monitorContent2">
	                				<div class="ydcenter">
	                					<i class="ydicons ydicons-subscription"></i>


	                					<h6><a href="${ctx}/bns/company/Serve/servicelist.do"><s:text name="system.homepage.notSubscribed"/></a></h6>
	                				</div>
	                			</div>
	                			<div class="container-con vertical-line ydnone" id="monitorContent3">
	                				<div class="ydcenter">
	                					<i class="ydicons ydicons-noprivilege"></i>

	                					<h6><s:text name="system.homepage.noPermissionToView"/></h6>
	                				</div>
	                			</div>
	                		</div>
	                	</div>
	                </div>
            	</div>
        	</div>
        </div>
    </div>
    <%-- 页面底部介绍  --%>
    <div class="footer-nav">
        <div class="container">
            <div class="row">
                <div class="span7">
            		<h5 class="title"><s:text name="system.homePage.companyIntroduction"/></h5>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:text name="system.homePage.companyIntroduction1"/></p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:text name="system.homePage.companyIntroduction2"/></p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:text name="system.homePage.companyIntroduction3"/></p>
                </div>
                <div class="span2" style="margin-left:15px;">
            		<h5 class="title"><s:text name="system.homePage.serviceList"/></h5>
                    <ol>
                    	<li><s:text name="system.homePage.basedOnProductionDataCloudStorage"/></li>
                        <li><s:text name="system.homePage.cloudManagementBusinessOrder"/></li>
                    	<li><s:text name="system.homePage.enterpriseProductionInformationCloudAnalysis"/></li>
                    	<li><s:text name="system.homePage.cloudAnalysisEnterpriseProductionEfficiency"/></li>
                    	<li><s:text name="system.homePage.IntelligentIE"/></li>
                        <li><s:text name="system.homePage.intelligentDispatch"/></li>
                        <li><s:text name="system.homePage.localMonitoringSystemStatusCloud"/></li>
                        <li><s:text name="system.homePage.enterpriseOperatingCostsCloudAnalysis"/></li>
                    </ol>
                </div>
                <div class="span3" style="width:280px;margin-left:15px;">
            		<h5 class="title"><s:text name="system.homePage.contactUs"/></h5>
                    <address id="address">  
                        <strong><s:text name="system.homePage.contactMean"/></strong><br>
                        <s:text name="system.homePage.addressValue1"/>
                        <s:text name="system.homePage.addressValue2"/>
                        <s:text name="system.homePage.addressValue3"/>
                        <s:text name="system.homePage.addressValue4"/>
                        <abbr title="<s:text name="system.homePage.thePhone"/>"><s:text name="system.homePage.thePhone"/>:</abbr> 025-85897650<br>
                        <abbr title="<s:text name="system.homePage.fax"/>"><s:text name="system.homePage.fax"/>:</abbr> 025-85897665<br>
                        <abbr title="<s:text name="system.homePage.email"/>"><s:text name="system.homePage.email"/>:</abbr>
                        <a href="mailto:info@yundaotech.com">info@yundaotech.com</a>
                    </address>
                </div>
            </div>
        </div>
    </div>
    
	<!-- 隐藏域，存放服务到期信息 -->
	<c:forEach items="${popupText}" var="text" varStatus="s">
		<input type="hidden" class="popupText" value="${text}">
	</c:forEach>
</rapid:override>
<rapid:override name="script">
    <style type="text/css">
    	#listT_paginate a {display: inline-block;cursor: pointer;text-align: center;}
		.paginate_button {padding: 8px 12px;color:#2291d6;}
	</style>
	<link rel="stylesheet" href="styles/index.css" type="text/css">
    <script type="text/javascript" src="scripts/bootstrap/plugins/flot/jquery.flot.navigate.js"></script>
    <script type="text/javascript" src="scripts/core/homepage/progress.js"></script>
    <script type="text/javascript">
	$(document).ready(function(){
		loadProgressData("#svgElement"); //加载进度图表
		//初始化新功能提示
		var startPage = 1;
		var detailData = "";
		$.ajax({
	        type:"post",
	        url: $("#contentPath").val()+"/framework/instructionAjax/Instruction/ajaxIsNew.do",
	        dataType:"json",
	        data: params,
	        async: false,
	        cache:false,
	        success: function (data) {
	        	if (data!="undefined" && data!=null && data!="" && data.detail.length>0) {
	        		detailData = data;
	        		$('#isNewModal').modal('show');
	        		showDetail(startPage);
	        	}
			},
	        error: function () {
	        	alert("Ajax请求数据失败!");
	        }
		});
		function showDetail(startPage){
			var newInstruction = "";
			if(detailData!= null){
				for(var i= startPage-1; i<startPage; i++){
					newInstruction += "<span style='font-size:14px; font-weight:bold;color:#2291d6;'>"+detailData.instruction[i].name+"</span><br>"+detailData.detail[i].detail;
				}
			}
			$("#insDetail").html(newInstruction);
			if(startPage == 1){
				$("#listT_previous").attr('disabled','disabled');
			}else if(startPage == detailData.instruction.length){
				$("#listT_next").attr('disabled','disabled');
			}else{
				$("#listT_previous").attr('disabled',false);
				$("#listT_next").attr('disabled',false);
			}
			if(startPage != 1){
				$("#listT_previous").bind("click", function(){
					showDetail(startPage-1);
				});
			}
			if(startPage != detailData.instruction.length){
				$("#listT_next").bind("click", function(){
					showDetail(startPage+1);
				});
			}
		} 
		
		
		//初始化公司信息
		var params = {"locationCode":"BT_CNNUS"};
		var address = "";
		$.ajax({
	        type:"post", dataType:"json", async: false, cache: false,
	        url: $("#contentPath").val()+"/framework/aboutUsAjax/AboutUs/ajaxInfo.do",
	        data: params,
	        success: function (data) {
				if(data!= null) {
					for(var i= 0; i<data.length; i++){
						address += data[i].detail;
					}
				}
				$("#address").html(address);
			},
	        error: function () {
	        	alert("Ajax请求数据失败!");
	        }
		});
		
		$.ajax({
		        type:"post", dataType:"json", async:false, cache:false,
		        url:"${ctx}/bns/statAjax/StyleD/systemMonitor.do",
		        error:function(){},
		        success:function(data) {
					if (data && data.code==1 && data.result) {
						var ret=data.result;
						if(ret.hasSchedule){/*调度分析*/
							var scheduleTotalNum=0, stylesNum=0, efficiency="0.00%";
							if(ret.schedule){
								var json=eval('('+ret.schedule+')');
								scheduleTotalNum=json.scheduleTotalNum;
								stylesNum=json.styles.length;
								efficiency=json.efficiency;
							}
							$("#scheduleBox h5").removeClass("font-gray"); $("#scheduleBox h5 i").removeClass("ydicons-dot-gray"); $("#scheduleBox h5 i").addClass("ydicons-dot-black");
							$("#scheduleNum").text(scheduleTotalNum);
							$("#scheduleStyleNum").text(stylesNum);
							$("#scheduleEfficiencyNum").text(efficiency);
						}else{
							if(ret.isSuper){//公司超级用户
								$("#scheduleBox h5").addClass("font-gray"); $("#scheduleBox h6").addClass("font-blue"); $("#scheduleBox h5 i").addClass("ydicons-dot-gray"); $("#scheduleBox h5 i").removeClass("ydicons-dot-black");
								$("#scheduleContent1").addClass("ydnone");
								$("#scheduleContent2").removeClass("ydnone");
								$("#scheduleContent3").addClass("ydnone");
							}else{//公司生产线用户
								$("#scheduleBox h5").addClass("font-gray"); $("#scheduleBox h6").addClass("font-gray"); $("#scheduleBox h5 i").addClass("ydicons-dot-gray"); $("#scheduleBox h5 i").removeClass("ydicons-dot-black");
								$("#scheduleContent1").addClass("ydnone");
								$("#scheduleContent2").addClass("ydnone");
								$("#scheduleContent3").removeClass("ydnone");
							}
						}
						if (ret.hasIEAdvice){/*IE建议分析*/
							var adviceTotalNum=0, weakStaffNum=0, changeStaffNum=0, preProNum=0;
							if(ret.ieAdvice){
								var json=eval('('+ret.ieAdvice+')');
								adviceTotalNum=json.adviceTotalNum;
								$.each(json.types, function(i,e){
									if(e==0){weakStaffNum+=json.typeNums[i];}//怠工
									else if(e==4){preProNum+=json.typeNums[i];}//前一环节慢
									else{changeStaffNum+=json.typeNums[i];}//
								});
							}
							$("#ieadviceBox h5").removeClass("font-gray"); $("#ieadviceBox h5 i").removeClass("ydicons-dot-gray"); $("#ieadviceBox h5 i").addClass("ydicons-dot-black");
							$("#ieAdviceNum").text(adviceTotalNum);
							$("#weakStaffNum").text(weakStaffNum);
							$("#slowProcessNum").text(preProNum);
							$("#adjustStaffNum").text(changeStaffNum);
						}else{
							if(ret.isSuper){//公司超级用户
								$("#ieadviceBox h5").addClass("font-gray"); $("#ieadviceBox h6").addClass("font-blue"); $("#ieadviceBox h5 i").addClass("ydicons-dot-gray"); $("#ieadviceBox h5 i").removeClass("ydicons-dot-black");
								$("#ieadviceContent1").addClass("ydnone");
								$("#ieadviceContent2").removeClass("ydnone");
								$("#ieadviceContent3").addClass("ydnone");
							}else{//公司生产线用户
								$("#ieadviceBox h5").addClass("font-gray"); $("#ieadviceBox h6").addClass("font-gray"); $("#ieadviceBox h5 i").addClass("ydicons-dot-gray"); $("#ieadviceBox h5 i").removeClass("ydicons-dot-black");
								$("#ieadviceContent1").addClass("ydnone");
								$("#ieadviceContent2").addClass("ydnone");
								$("#ieadviceContent3").removeClass("ydnone");
							}
						}
						
    
						if (ret.hasMonitor){/*监控*/
							var sysTotalNum=0, sysRunNum=0, sysFaultNum=0;
							if(ret.sysTotalNum){sysTotalNum=ret.sysTotalNum;}
							if(ret.sysRunNum){sysRunNum=ret.sysRunNum;}
							if(ret.sysFaultNum){sysFaultNum=ret.sysFaultNum;}
							$("#monitorBox h5").removeClass("font-gray"); $("#monitorBox h5 i").removeClass("ydicons-dot-gray"); $("#monitorBox h5 i").addClass("ydicons-dot-black");
							$("#systemNum").text(sysTotalNum);
							$("#runSystemNum").text(sysRunNum);
							$("#faultSystemNum").text(sysFaultNum);
						}else{
							if(ret.isSuper){//公司超级用户
								$("#monitorBox h5").addClass("font-gray"); $("#monitorBox h6").addClass("font-blue"); $("#monitorBox h5 i").addClass("ydicons-dot-gray"); $("#monitorBox h5 i").removeClass("ydicons-dot-black");
								$("#monitorContent1").addClass("ydnone");
								$("#monitorContent2").removeClass("ydnone");
								$("#monitorContent3").addClass("ydnone");
							}else{//公司生产线用户
								$("#monitorBox h5").addClass("font-gray"); $("#monitorBox h6").addClass("font-gray"); $("#monitorBox h5 i").addClass("ydicons-dot-gray"); $("#monitorBox h5 i").removeClass("ydicons-dot-black");
								$("#monitorContent1").addClass("ydnone");
								$("#monitorContent2").addClass("ydnone");
								$("#monitorContent3").removeClass("ydnone");
							}
						}
			        }else{}
				}
			});
	});
	</script>
    <script type="text/javascript">
	<s:if test="@com.yundao.framework.util.ServiceOpPrivilege@hasProductionService()">
		setInterval(setEffIndex, 120000);
     	setEffIndex();
	</s:if>
	<s:else>buyTip('efficiency');</s:else>
	<s:if test="@com.yundao.framework.util.ServiceOpPrivilege@hasCostService()">
     	setInterval(setCostIndex, 120000); 
     	setCostIndex();
	</s:if><s:else>buyTip('cost');</s:else>
    function setCostIndex(){
     		$("#costAndIncome").unbind();
    		var productNum = [], expense = [];
    		var ticksArr1 = new Array();
    		
			var colors = Theme.chartColors;
			var showType = 1;
			var margin1 = 24;
  				$.ajax({
			        type:"post",
			        url: $("#contentPath").val()+"/basic/login/UserLogin/setCostIndexAjax.do",
			        dataType:"json",
			        async: false,
                    cache: false,
			        success: function (data) {
			        if(data.costService==true){
			        if(data.message =="success"){
			        if(data!=null && data != '' && data != 'undefined'){
			        	var d = eval ('('+data.incomeCost+')');
			        	$("#styles").text(d.styles.length);
			        	$("#grossHours").text(d.grossHours);
			        	var ghs = d.grossHours+"";
			        	var ghsArry = ghs.split('.');
			        	if(ghsArry==undefined||ghsArry.length<2){
			        	$("#grossHours").text(d.grossHours);
			        	}else{
			        	$("#grossHours").text(ghsArry[0]+':'+Math.floor(ghsArry[1]*0.6));  
			        	}
			        	$("#grossMarginTime").text(d.grossMarginTime);
			        	$("#grossMargin").text(d.grossMargin);
			        	if(d.grossHours>24||d.grossHours<0){
			        	$("#grossHours").text("今日无法达到");
			        	}
			        	var anum = d.incomeTime+"";
			        	var anumArry = anum.split('.');
			        	if(anumArry==undefined||anumArry.length<2){
			        	$("#incomePoint").text(d.incomeTime);
			        	}else{
			        	$("#incomePoint").text(anumArry[0]+':'+anumArry[1]);  
			        	}
			        	
			        	var pNum = 0;
			        	for(var i=0;i<d.productNum.length;i++){
			        		pNum+=d.productNum[i];
			        	}
			        	if(pNum==0){
			        	$("#grossMarginTime").text(0);
			        	}
			        	$("#productNum").text(pNum);
			        	
			        	$("#styleNum").show();
			        	$("#plotCharts").hide();
			        	margin1 = parseFloat(margin1)/parseFloat(d.hourIncome.length)/(d.hourIncome.length/margin1+1);
			        	for(var i=0;i<d.hourIncome.length;i++){
			        	
			        			productNum.push([i, d.incomeAll[i]]);
			        			expense.push([i, d.costOtherAll[i]]);
			        			ticksArr1[i] = new Array();
			        			ticksArr1[i][0] = i;
			        			if(d.hours[i]==0){
			        				ticksArr1[i][1] = '0';
			        			}else{
			        				ticksArr1[i][1] = d.hours[i];
			        			}
			        			if(i==d.hourIncome.length-1){
			        			$("#costNum").text(d.costOtherAll[i]);
			        			$("#incomeNum").text(Math.round((d.income-d.costOtherAll[i])*100)/100.0);
			        			}else{
			        			$("#costNum").text('0');
			        			$("#incomeNum").text(d.income);
			        			}
		        			}
		  
			        
			        }
			        }
			        else{		        
			        }
			        }
			        else{
			      		$("#costServiceI").hide();
			        }
			        }
			        })
		var data = productNum;
		var data2 = expense;
		var data3 = expense;
		
		var dataset = [
	   {label:"<s:text name="system.homepage.incoming" />", data: data,lines:{fill: true}},
	   {label:"<s:text name="system.homepage.cost" />", data: data2,color:'#b63232'}]  
		var option3 ={
				colors: colors,
				series: {
//					points: { radius: 3, show: true },
			 		lines: {
						show: true
//						fillColor: { colors: [ { opacity: 1 }, { opacity: 0.5 } ] }
					}
					}
				,
				xaxis: {
					mode: "categories",
					tickLength: 0,
					ticks: ticksArr1
				},
				grid: {
					hoverable: true,
					borderWidth: 1
				},
				legend: {
					show: true
				},
				tooltip: true,
				tooltipOpts: {
					//content: '%y(件)--%x时'
					content: '%y'
				}
		}

	   
	   $.plot('#costAndIncome', dataset, option3);
	   $("#costAndIncome .legend").css({top:'0px',bottom:'auto'});
	}	    
	
	
function setEffIndex() {
	$("#dataIndex").unbind();
	$("#dataIndexH").remove();
	$("#effIndexForRight").show();
    var planPercent1=[], planPercent2=[], finishedPercent=[], deliveryTimePercent=[], createTimePercent=[], predictFinishedTimePercent=[], efficiency=[];
	var dfT1=[], dfT2=[];
	var ticksArr2 = new Array();
	var d;
	var effService;
	$.ajax({
		type:"post", dataType:"json", async: false, cache: false,
		url: $("#contentPath").val()+"/basic/login/UserLogin/setData.do",
		success: function (data) {
			if (data != null && data != "" && data != "undefined") {
        		d = eval ('('+data.dataindex+')');
        		if (d.orderStyleId.length > 0)
        			setRightFrame(0, d);
        	}
		}
	});
	
	var dataIndexHtml="<div class='span12 container-box' id='dataIndexH'><div class='row ydspan'>";
	if (d.orderStyleId.length<4 || d.effService==false) {
		$("#dataIndexForNine").hide();
		if (d.effService==false) {
			var numForStyle =  3;
		 	for (var t = 0; t<numForStyle; t++) {
				if (numForStyle==3 && t==0) {
					dataIndexHtml += "<div class='span4'>";
					dataIndexHtml+="<h5 class='container-tit'><s:text name='system.homepage.efficiencySituation'/> <i class='ydicons ydicons-hand'></i></h5>"
				} else {
					dataIndexHtml+="<div class='span4 ydspan' >";
					dataIndexHtml+="<h5 class='container-tit'>&nbsp;</h5>";
				}
				if ((t+1)!=numForStyle)
					dataIndexHtml+="<div class='ydcenter vertical-line' style='padding:100px;'>";
				else
					dataIndexHtml+="<div class='ydcenter' style='padding:100px;'>";
				
	            dataIndexHtml+="<i class='ydicons ydicons-nostyle'></i></br>"
	                		 +"<span><s:text name="system.homepage.noPermission" /></span>"
							 +"</div></div>";
			}
		} else {
			for(var i = 0;i<d.orderStyleId.length;i++) {
					var anum = d.newEfficiency[i];
		        	var anumArry = anum.split(".");
		        	var numPrecent = (d.finishedNum[i]/d.planNum[i])*100;
		        	var timePrecent = (d.predictFinishedTimePercent[i]-d.createTimePercent[i])/(d.deliveryTimePercent[i] -d.createTimePercent[i])*100;
		        	var timeFlag = 0;
		        	if(d.deliveryTimePercent[i]>d.predictFinishedTimePercent[i]){
		        		timeFlag = 0;
		        	} else {
		        		timeFlag = 1;
		        	}
		        	
					if(i==0) {
						dataIndexHtml 	+="<div class='span4'>";
						dataIndexHtml	+="<h5 class='container-tit'><s:text name='system.homepage.efficiencySituation'/> <i class='ydicons ydicons-hand'></i></h5>";
					}else{
				  		dataIndexHtml	+="<div class='span4 ydspan'>";
				  		dataIndexHtml	+="<h5 class='container-tit'>&nbsp;</h5>";
				  	}
				  	
				  	if(i!=2){	
				  		dataIndexHtml	+="<div class='vertical-line margin-left1'>";
				  	}
				  	else{
				  		dataIndexHtml	+="<div class=' margin-left1'>";
				  	}
								
				  	dataIndexHtml	+="<div class='efficiency-detail margin-left3 cross-line'>"
									+"<dl>"
									+"<dt><s:text name="system.homepage.orderCode"/>:</dt><dd id='effOrderCode'>"
									+ d.orderCode[i]
									+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='${ctx}/bns/core/YDOrder/list.do?orderId="
									+d.parentOrderID[i]
									+"'><i class='ydicons ydicons-serch' title='<s:text name="system.order.clientCom.orderManager" />'></i></a></dd>";
				if (d.ostate[i]!='8') {	
					dataIndexHtml	+="<dt><s:text name="system.homepage.styleName"/>:</dt><dd id='effStyleName'>"
									+ d.styleName[i]
									+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='${ctx}/bns/stat/StyleD/list.do?linkOrderId="
									+d.parentOrderID[i]
									+"'><i class='ydicons ydicons-N-' title='<s:text name="system.processiongDetail" />'></i></a>"
									+"&nbsp;<a href='${ctx}/bns/stat/StyleProD/list.do?linkStyleId="
									+d.styleId[i]
									+"'><i class='ydicons ydicons-N' title='<s:text name="system.homepage.efficiencyDetails"/>'></i></a>"
									+"</dd>"
									+"<dt><s:text name="system.homepage.clientName"/>:</dt><dd id='effClientName'>"
									+ d.clientName[i]
									+"</dd>"
									+"<dt>步骤名称:</dt><dd id='effStepName'>"
									+ d.stepName[i]
									+"</dd>";
					
				}else{
					dataIndexHtml	+="<dt><s:text name="system.homepage.styleName"/>:</dt><dd id='effStyleName'>"
									+ d.styleName[i]
									+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='${ctx}/bns/stat/StyleM/show.do?orderId="
									+d.orderId[i]
									+"'><i class='ydicons ydicons-N-' title='<s:text name="system.processiongDetail" />'></i></a>"
									+"&nbsp;<a href='${ctx}/bns/stat/StyleProY/show.do?orderStyleId="
									+d.orderStyleId[i]
									+"'><i class='ydicons ydicons-N' title='<s:text name="system.homepage.efficiencyDetails"/>'></i></a>"
									+"</dd>"
									+"<dt><s:text name="system.homepage.clientName"/>:</dt><dd id='effClientName'>"
									+ d.clientName[i]
									+"</dd>"
									+"<dt>步骤名称:</dt><dd id='effStepName'>"
									+ d.stepName[i]
									+"</dd>";
					
				}					

					dataIndexHtml	+="<dt></dt><dt style='width:70%;color:#12a9f4'>"
									+ d.planNum[i]
									+"</dt>"
									+"<dt><s:text name="system.homepage.progress"/>:</dt>"
									
									+"<dd id='effProgressS' class='progress' style='margin-bottom:5px;height:15px;line-height:15px;' title='"+d.finishedNum[i]+"'>"
									+"<div id='effProgressI' class='bar' style='width:" + numPrecent + "%'></div>"
									+"<span class='barVal' id='effTimeProgressIVal'>"
							
									+ d.finishedNum[i]
									+ "</span>"
									+"<dt></dt><dt style='width:70%;color:#398502'>"
									+ d.deliveryTime[i]
									+"</dt>"

									+"<dt><s:text name="system.homepage.timeProgress"/>:</dt>"
									
									+"<dd id='effTimeProgressS' class='progress' style='margin-bottom:5px;height:15px;line-height:15px;' title='"+d.predictFinishedTime[i]+"'>";
									
								if(timeFlag == 0){		
								//alert(2);
							      
								dataIndexHtml+="<div id='effTimeProgressI' class='indexbar' style='height:15px;line-height:15px; width:" + timePrecent+ "%'></div>";
								}else{
								dataIndexHtml+="<div id='effTimeProgressI' class='indexRedbar' style='height:15px;line-height:15px;color:#b63232;width:" + timePrecent+ "%'></div>";
								}
									
					   dataIndexHtml+="<span class='barVal' id='effTimeProgressIVal'>"
									+ d.predictFinishedTime[i]
									+"</span>"
									+"</dd>"

									+"</dl>"
									+"</div>"
									+"<div class='efficiency-detail margin-left3 margin-top2'>"
									+"<dl>"

									+"<dt ><span class='font-blod'><s:text name="system.homepage.efficiencyThatDay"/></span></dt>"
									+"<dd style='width:220px'>"
									+"<i class='block-num-green' id ='newEfficiency'>"
									+ anumArry[0]
									+"</i>"
									+"<span class='font-black'>."
									+ anumArry[1]
									+"</span>"
									+"<span class='font-black'>&nbsp;<s:text name="system.homepage.peopleOneHour"/></span>";									+"<span class='font-black'>&nbsp;<s:text name="system.homepage.peopleOneHour"/></span>";
					   
					   if(d.oldEfficiency[i]!= undefined ){
					   var effpecent=0;
					   var effflag = 0;
					   var oldEff = parseFloat(d.oldEfficiency[i]);
					   var newEff = parseFloat(d.newEfficiency[i]);
					   
					   if(oldEff>newEff){
					   effflag = 0;

					   effpecent = Math.round(((newEff - oldEff)/oldEff)*10000)/100;
					   }else{
					   
					   effflag = 1;
						if(oldEff==0){
						effpecent = 0;
						}else
					   effpecent = Math.round(((newEff - oldEff)/oldEff)*10000)/100;
					   }
					   //effpercent +='%';
					   dataIndexHtml+="<div class='container-block margin-left1'>"
					   
					  if(effflag == 0){
					  dataIndexHtml+="<i class='ydicons ydicons-down'></i>"
					  }else{
					  dataIndexHtml+="<i class='ydicons ydicons-up'></i>"
					  }
					 dataIndexHtml+="<div class='block-text'>"
									+"<span class='font-black' id= 'oldEfficiency'>"
									+d.oldEfficiency[i]
									
									
									+"</span><span class='font-black'>&nbsp;<s:text name="system.homepage.peopleOneHour"/></span><br/>"
									+"<span class='font-black'>"+effpecent+"%</span>"


									+"</div>"
							
									+"</div>";
									}
					   dataIndexHtml+="</dd>"
									+"<dt><s:text name="system.homepage.numberOfCumulativeWork"/>:</dt><dd><i class='emphasis-num' style='font-weight:bolder;font-style:normal' id='duration'>"



									+d.duration[i]

									+"</i> <span class='font-black'><s:text name="system.homepage.manHour"/></span></dd>"
									+"</dl>"
									+"</div>"
									+"</div>"
									+"</div>" ;
									

					}
					var numForStyle = (3- d.orderStyleId.length);
					if(numForStyle>0){
									
						for(var t = 0;t<numForStyle;t++){
						if(numForStyle==3&&t==0){
						dataIndexHtml += "<div class='span4'>";
						dataIndexHtml+="<h5 class='container-tit'><s:text name='system.homepage.efficiencySituation'/> <i class='ydicons ydicons-hand'></i></h5>"
						}
						else{
						dataIndexHtml+="<div class='span4 ydspan' >";
						dataIndexHtml+="<h5 class='container-tit'>&nbsp;</h5>"
						}
						if((t+1)!=numForStyle)
						dataIndexHtml+="<div class='ydcenter vertical-line' style='padding:100px;' >";
						else
						dataIndexHtml+="<div class='ydcenter' style='padding:100px;' >";
						
			            dataIndexHtml+="<i class='ydicons ydicons-nostyle'></i></br>"
			                		 +"<span><s:text name="system.homepage.noStyle"/></span>"
									 +"</div></div>"
						}
					}}
					dataIndexHtml+="</div></div>";
					$("#dataIndexForThree").show();
					$("#dataIndexForThree").append(dataIndexHtml);
					
					
				}
				else{
					$("#dataIndexForThree").hide();
					var colors = Theme.chartColors;
				var showType = 1;

				var margin2 =0.3;
				
				var maxefficiency=0;
			
			  	$("#styleNum").show();
			 	$("#plotCharts").hide();

			 	//margin2 = parseFloat(margin2)/parseFloat(d.orderStyleId.length)/(d.orderStyleId.length/margin2+1);
			 	//alert(margin2);
     			var a = 1;
     			a=d.orderStyleId.length*3;
	        	for(var i=0;i<a;i++){
	        	//	alert(data.currentStyleD.finishedNumList[i]);
	        	ticksArr2[i] = new Array();
	        	ticksArr2[i][0] = i;
	        	
	        	if(i%3==1){
	        	
	          		if(d.deliveryTimePercent[Math.floor(i/3)]>d.predictFinishedTimePercent[Math.floor(i/3)])
	        		{
	        		
	        		dfT1.push([i, 0]);
	        		dfT2.push([i,d.predictFinishedTimePercent[Math.floor(i/3)]]);
	        		}else{
	        		dfT1.push([i,d.predictFinishedTimePercent[Math.floor(i/3)]]);
	        		dfT2.push([i, 0]);
	        		}
	        	
	        	    deliveryTimePercent.push([i, d.deliveryTimePercent[Math.floor(i/3)],'ddd']);
        			createTimePercent.push([i, d.createTimePercent[Math.floor(i/3)]]);
        			predictFinishedTimePercent.push([i,d.predictFinishedTimePercent[Math.floor(i/3)]]);
        			efficiency.push([i, d.newEfficiency[Math.floor(i/3)]]);
        			

        			var styleLength = d.styleName[Math.floor(i/3)].replace(/[^\x00-\xff]/g,"aa").length;
					var styleName = d.styleName[Math.floor(i/3)];
        			if(styleLength>6){
        			styleName = SetString(styleName,6); 
        			}
        			
        			
        			if(d.orderStyleId[Math.floor(i/3)]==0){
        				ticksArr2[i][1] = '0';
        			}else{
        				ticksArr2[i][1] = styleName;
        			}
        			
        			
        			

        		}else if(i%3==2){

        			
        			if(d.clientName[Math.floor(i/3)]==0){
        				ticksArr2[i][1] = '';
        			}else{
        				ticksArr2[i][1] = '';// d.clientName[Math.floor(i/2)];
        			}
        		}else{
	        		if(d.planPercent[Math.floor(i/3)]>d.finishedPercent[Math.floor(i/3)])
	        		{
	        			planPercent1.push([i, d.planPercent[Math.floor(i/3)]]);
	        			planPercent2.push([i, 0,'ddd']);
	        		}
	        		else{
	        			planPercent1.push([i, 0,'ddd']);
	        			planPercent2.push([i, d.planPercent[Math.floor(i/3)]]);
	        		}
        			
        			finishedPercent.push([i, d.finishedPercent[Math.floor(i/3)]]);
					
					if(d.newEfficiency[Math.floor(i/3)]>maxefficiency){
					maxefficiency = d.newEfficiency[Math.floor(i/3)];
					}
					        		
        		     if(d.clientName[Math.floor(i/3)]==0){
        				ticksArr2[i][1] = '';
        			}else{
        				ticksArr2[i][1] = '';// d.clientName[Math.floor(i/2)];
        			}					
        		}
	        	}
			          
		var data31 = planPercent1;
		var data32 = planPercent2;
		var data4 = finishedPercent;
		var data5 = deliveryTimePercent;
		var data6 = createTimePercent;

		var data71 = dfT1;
		var data72 = dfT2;
		var data8 = efficiency;
		var num = 400;
		var dataset2 = [

	   {label:"<s:text name="system.order.outSourcingProcess.planNumber" />",bars: {show: true, align: "left", barWidth: 1.0},  data: data31,color:'#dbdfe0'},
	   {label:"<s:text name="system.homepage.completedQuantity" />",bars: {show: true, align: "left", barWidth: 1.0},  data: data4,color:'#27a9e2'},
	   {bars: {show: true, align: "left", barWidth: 1.0},  data: data32,color:'#dbdfe0'},



	   {label:"<s:text name="system.homepage.expectedTimeOut" />",bars: {show: true, align: "left", barWidth: 1.0},  data: data71,color:'#b63232'},
	   {label:"<s:text name="system.homepage.orderDeliveryTime" />",bars: {show: true, align: "left", barWidth: 1.0},  data: data5,color:'#c9dfa8'},
	   {label:"<s:text name="system.homepage.estimatedAccomplishTime" />",bars: {show: true, align: "left", barWidth: 1.0},  data: data72,color:'#84c718'},
	   {bars: {show: true, align: "left", barWidth: 1.0},  data: data6,color:'#dbdfe0'},

	   {label:"<s:text name="system.homepage.efficiencyThatDay" />",lines: {},data: data8,color:'#f4951d',yaxis: 2}
	   ]  	
	   var interactive = false;
	   		if(a>24){
			interactive = true;
			}
	   
			var options = {
				series: {
						stack: null,
						bars:{fillColor: { colors: [ { opacity: 0.85 }, { opacity: 0.85 } ] }}
				}, 
				xaxis: {
					mode: "categories",
					tickLength: 0,
					autoscaleMargin:margin2,
					ticks: ticksArr2,
					min:0,
					max:24,
					lableWidth:50,
					panRange: [0,a]
				},
				yaxes: [{show:false,
					panRange: [0, 100]
				},{max:maxefficiency, panRange: [0, maxefficiency]}],
				grid: {
					hoverable: true,
					borderWidth: 0,
					clickable: true
				},
				legend: {
					show: true,
					placement: 'outsideGrid'
				},
				pan: {
					interactive: interactive
				}
				
			};

	
			$.plot('#dataIndex', dataset2, options);
			$("#dataIndex .legend").css({top:'0px',bottom:'auto'});
	}		
			//$.jqplot('dataIndex', [data,data2,data3,data4], options1);
		     //显示数据点的提示信息   
		 function showTooltip(x, y, contents) {   
		       $('<div id="tooltip">' + contents + '</div>').css( {   
		           position: 'absolute',   
		           display: 'none',   
		           top: y + 5,   
		           left: x + 5,   
		        
		           border: '1px solid #98c1fa',   
		           'background-color':'#f4fbfe',
		           'font-size': '11px',   
		           'border-radius':'5px',
		           'width':'330px',
		           
					display: 'inline-block',
		           opacity: 1.0               
		       }).appendTo("body").fadeIn(200);   
		   } 
		     
		  $("#dataIndex").bind("plotpan", function (event, plot) {
			var axes = plot.getAxes();

		});
		   
		   
		    $("#dataIndex").bind("plothover", function (event, pos, item) { 
			    if (true) {
			   	 	if (item) {
			   	 	$("#tooltip").remove();   
			   	 	var x = item.datapoint[0].toFixed(2), 
			   	 		y = item.datapoint[1].toFixed(2);
			   	 		
			   	 		var num = (Math.floor((parseInt(x))/3));
			   	 		


			   	 		//var da = evaldataindex);
			   	 		if(x==0){
			   	 		num = 0;
			   	 		}
			   	 		setRightFrame(num,d);
			   	 		
			   	 		
			   	 		var context;
			   	 		if((parseInt(x))%3==1){
			   	 			if(item.series.color=='#c9dfa8')
			   	 		 	context = d.deliveryTime[num];
			   	 		
			   	 			if(item.series.color=='#dbdfe0')
			   	 		 	context = d.createTime[num];
			   	 		 	if(item.series.color=='#b63232')
			   	 		 	context = d.predictFinishedTime[num];
			   	 		 	if(item.series.color=='#84c718')
			   	 		 	context = d.predictFinishedTime[num];

			   	 		 	
			   	 		}
			   	 		if((parseInt(x))%3!=1){
			   	 			if(item.series.color=='#27a9e2')
			   	 		 	context = d.finishedNum[num];
			   	 		
			   	 			if(item.series.color=='#dbdfe0')
			   	 		 	context = d.planNum[num];
			   	 		 	if(item.series.color=='#f4951d')
			   	 		 	context = d.newEfficiency[num];
			   	 		
			   	 		}
			   	 		
			   	 		context = "<div  class='efficiency-chartTop'><span style='margin-left:5px;vertical-align:-5px;'>"+d.styleName[num]+"</span></div>"




			   	 	+ "<div  class='efficiency-chart' style='border-bottom:1px solid #cce2ff;'><dl ><dt style='color:#629e01;width:20%;'><s:text name="system.startTime" /> :</dt><dd style='width:20%'>"+d.createTime[num]+"</dd><span style='color:#629e01;'>|</span><dt style='color:#629e01;width:24%;'><s:text name="system.order.order.deliveryDate" />:</dt><dd style='width:20%;'>"+d.deliveryTime[num]+"</dd></div>"
			   	 	+ "<div  class='efficiency-chart'><dl><dt style='color:#0954a9;width:20%;'><s:text name="system.homePage.finishedNumToday" /> :</dt><dd>"+d.finishedNumToday[num]+"</dd><span style='color:#b96c0a;'>|</span><dt style='color:#b96c0a;'><s:text name="system.homepage.efficiencyThatDay" />:</dt><dd>"+d.newEfficiency[num]+"</dd></div>"
			   	 				+ "<div  class='efficiency-chart' style='border-bottom:1px solid #cce2ff;'><dl><dt style='color:#0954a9;width:20%;'><s:text name="system.homepage.processingProgress" /> :</dt><dd>"+d.finishedNum[num]+"/"+d.planNum[num]+"</dd></div>"
			   	 				+ "<div  class='efficiency-chart'><dl><dt style='color:#629e01;width:20%;'><s:text name="system.homepage.estimatedAccomplish" /> :</dt><dd style='width:60%'>"+d.predictFinishedTime[num]+"</dd></div>";
			   	 				

			   	 		//alert
			   	 		//alert(d.deliveryTimePercent[(Math.floor((parseInt(x))/2))]);
			   	 		 showTooltip(item.pageX, item.pageY,   
                                context);   
			   	 	}else{
			   	 	$("#tooltip").remove();  
			   	 	}
			    }
		    
		    });
				
}
				
				function setRightFrame(num,d){
				   	 	var numPrecent = (d.finishedNum[num]/d.planNum[num])*100;
			        	var timePrecent = (d.predictFinishedTimePercent[num]-d.createTimePercent[num])/(d.deliveryTimePercent[num] -d.createTimePercent[num])*100;
			        	var timeFlag = 0;
			        	if(d.deliveryTimePercent[num]>d.predictFinishedTimePercent[num]){
			        		timeFlag = 0;
			        		$("#effTimeProgressI").show()
			        		$("#effTimeProgressRed").hide();
			        	}else
			        	{
			        		timeFlag = 1;
			        		$("#effTimeProgressRed").show()
			        		$("#effTimeProgressI").hide();
			        	}


			   	 		$("#effOrderCode").text(d.orderCode[num])
			   	 		$("#effClientName").text(d.clientName[num])
			   	 		$("#effStepName").text(d.stepName[num])
				
				   	 	$("#effProgressS").attr("title",d.finishedNum[num]);
			        	$("#effProgressI").width(numPrecent+'%');
			        	$("#effProgressIVal").text(d.finishedNum[num]);
			        	$("#effTimeProgressS").attr("title",d.predictFinishedTime[num]);
			        	$("#effTimeProgressI").width(timePrecent+'%');
			        	$("#effTimeProgressRed").width(timePrecent+'%');
			        	
			        	$("#effTimeProgressIVal").text(d.predictFinishedTime[num]);
			        	$("#effStyleName").text(d.styleName[num])
			        	
			        	var anum = d.newEfficiency[num]
			        	var anumArry = anum.split(".");
			        	$("#newEfficiency1").text(anumArry[0])
			        	$("#newEfficiency2").text("."+anumArry[1])
			
			        	$("#oldEfficiency").text(d.oldEfficiency[num])
			        	if(d.oldEfficiency[num]!=undefined){
			        	$("#oldEfficiencyShow").show()
			        	$("#oldEfficiency").text(d.oldEfficiency[num])
			        	}else{
			        	$("#oldEfficiencyShow").hide()
			   	 		}
			   	 		
			   	 		$('#orderCodeA').attr('href','${ctx}/bns/core/YDOrder/list.do?orderId='+d.parentOrderID[num]+''); 
			   	 		if(d.ostate[num]!='8'){
			        	$('#styleCodeA').attr('href','${ctx}/bns/stat/StyleD/list.do?linkOrderId='+d.parentOrderID[num]+''); 
						$('#styleIDA').attr('href','${ctx}/bns/stat/StyleProD/list.do?linkStyleId='+d.styleId[num]+''); 
						} else{
						$('#styleCodeA').attr('href','${ctx}/bns/stat/StyleM/show.do?orderId='+d.orderId[num]+''); 
						$('#styleIDA').attr('href','${ctx}/bns/stat/StyleProY/show.do?orderStyleId='+d.orderStyleId[num]+''); 
						}
			        	$("#effPlanNum").text(d.planNum[num])
			        	$("#effDeliveryTime").text(d.deliveryTime[num])
			        	$("#duration").text(d.duration[num])
			        	
			           var effpecent=0;
					   var effflag = 0;
					   var oldEff = parseFloat(d.oldEfficiency[num]);
					   var newEff = parseFloat(d.newEfficiency[num]);
					   if(oldEff>newEff){
					   effflag = 0;
					   effpecent = Math.round(((newEff - oldEff)/oldEff)*10000)/100;
					   
					   $("#effShowDown").show()
					   $("#effShowUp").hide();
					   }else{
					   effflag = 1;
					   	if(oldEff==0){
						effpecent = 0;
						}else
					   effpecent = Math.round(((newEff - oldEff)/oldEff)*10000)/100;

					   $("#effShowDown").hide();
					   $("#effShowUp").show();
					   }
					   
					   
			          $("#effpecent").text(effpecent+"%");
			        	
			   	} 		
			   	 		
			function SetString(str,len) {  
					var strlen = 0;   
					var s = "";  
					for(var i = 0;i < str.length;i++)  {   
						if(str.charCodeAt(i) > 128){    
								strlen += 2;   
						}else{     
							strlen++;   
						}  
			 				s += str.charAt(i);  
			  			if(strlen >= len){     
			  				return s ;  
			  				 }  
			  			} 
			  		return s;
			  		 }
			  		 
			  		 $(".popupText").each(function (){
			  		 clientFunction($(this).val());
			  		 });

/**
*用户无权限提示
*/			  		 
function buyTip(type) {
	var html = "";
	if (type=='efficiency') {
		html += 
			"<div class='span12 container-box'>" +
				"<h5 class='container-tit'><s:text name='system.homepage.efficiencySituation'/> <i class='ydicons ydicons-hand'></i></h5>" +
				"<div class='container-con' id='scheduleContent2'>" +
        			"<div class='ydcenter'>" +
        				<s:if test='#session.user_view.userInfo.userType==1'>
        				"<i class='ydicons ydicons-subscription'></i>" +
        				"<h6 class='font-blue'><a href='${ctx}/bns/company/Serve/servicelist.do'><s:text name='system.homepage.notSubscribed'/></a></h6>" +
        				</s:if>
        				<s:else>
        				"<i class='ydicons ydicons-noprivilege'></i>" +
        				"<h6 class='font-blue'><s:text name='system.homepage.noPermissionToView'/></h6>" +
        				</s:else>
        			"</div>" +
        		"</div>" +
			"</div>";
		$("#efficiencyZone").html(html);
		$("#efficiencyZone").addClass("row");
	} else if (type=='cost') {
		html += 
			"<div class='span12 container-box'>" +
				"<h5 class='container-tit'><s:text name='system.homepage.operationCostAnalysis'/> <i class='ydicons ydicons-hand'></i></h5>" +
				"<div class='container-con' id='scheduleContent2'>" +
        			"<div class='ydcenter'>" +
        				<s:if test='#session.user_view.userInfo.userType==1'>
        				"<i class='ydicons ydicons-subscription'></i>" +
        				"<h6 class='font-blue'><a href='${ctx}/bns/company/Serve/servicelist.do'><s:text name='system.homepage.notSubscribed'/></a></h6>" +
        				</s:if>
        				<s:else>
        				"<i class='ydicons ydicons-noprivilege'></i>" +
        				"<h6 class='font-blue'><s:text name='system.homepage.noPermissionToView'/></h6>" +
        				</s:else>
        			"</div>" +
        		"</div>" +
			"</div>";
		$("#costServiceI").html(html);
	}
}	
</script>
			  		 
	<style>
		.chart {}
		.chart text {
		  fill: #313131;
		  font: 10px/1.7em "微软雅黑","雅黑","宋体",'Open Sans', arial, sans-serif;
		  text-anchor: start;
		}
		.chart .label {
		  fill: #313131;
		  text-shadow: 0 0 0 rgba(0, 0, 0, 0.25);
		  font: 10px/1.7em "微软雅黑","雅黑","宋体",'Open Sans', arial, sans-serif;
		  text-anchor: start;
		}
		.axis {
		  font: 10px/1.7em "微软雅黑","雅黑","宋体",'Open Sans', arial, sans-serif;
		}
		.axis path, .axis line {
		  fill: none;
		  stroke: #000;
		  shape-rendering: crispEdges;
		}
		.chart .legend {
			fill: #313131;
			font: 10px/1.7em "微软雅黑","雅黑","宋体",'Open Sans', arial, sans-serif;
			font-size: 10px;
		}
	</style>
</rapid:override>
<%@ include file="base.jsp" %>
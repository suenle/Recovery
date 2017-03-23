// JavaScript Document
window.onload=function(){
	var date=new Date();
	var y=date.getFullYear();	//获得年份
	var m=date.getMonth()+1;	//获得月份，0~11
	var d=date.getDate();		//获得日期
	var weekday=date.getDay();	//获得星期，0~6
	//对星期进行判断
	if(weekday==0){
		weekday="日";
	}
	if(weekday==1){
		weekday="一";
	}
	if(weekday==2){
		weekday="二";
	}
	if(weekday==3){
		weekday="三";
	}
	if(weekday==4){
		weekday="四";
	}
	if(weekday==5){
		weekday="五";
	}
	if(weekday==6){
		weekday="六";
	}
	
	var h=date.getHours();		//获得小时
	var mm=date.getMinutes();	//获得分
	var s=date.getSeconds();	//获得秒
	
	if(mm==0||mm==1||mm==2||mm==3||mm==4||mm==5||mm==6||mm==7||mm==8||mm==9){
		mm="0"+mm;
	}
	if(s==0||s==1||s==2||s==3||s==4||s==5||s==6||s==7||s==8||s==9){
		s="0"+s;
	}
	
	var obj=document.getElementById("today");
	obj.innerHTML="今天是"+y+"年"+m+"月"+d+"日"+"&nbsp;&nbsp;星期"+weekday;
	//obj.innerHTML="<h3>"+h+":"+mm+":"+s+" 星期"+weekday+" "+y+"/"+m+"/"+d+"</h3>";
	//obj.innerHTML="<h3>&nbsp;&nbsp;"+h+":"+mm+":"+s+"<br />"+y+"/"+m+"/"+d+" 星期"+weekday+"</h3>";
	//setInterval(this.onload,1000);	//1秒后自动调用方法
}
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
body {
	padding: 0px;
	margin: 0px;
}
#incret_user,#body{
width: 95%;
}

#total_user_div{
	position:absolute;
	font-family:"微软雅黑";
	width: 30%;
	margin-left:60%;
	margin-top:-2%;
}
#exportExcel{
	position:absolute;
	margin-left:81%;
	margin-top:-2%;
}
</style>
</head>
<body>
	<div id="body">
	  <div id="incret_user"></div>
	  <div id="total_user_div">当前注册总用户:<span id="total_user"></span></div>
	  <button id="exportExcel">导出excel</button>  
	</div>
<!-- 	<div id="incret_fuiou"></div> -->
	<script src="../../static/jquery-1.11.0.js"></script>
	<script src="../../static/highcharts-4.2.1/js/highcharts.js"></script>
	<script src="whole_user.js"></script>
	<script>
	$("#exportExcel").click(function(){
		 if(confirm("确定要导出excel吗?"))
		 {
		var listId = "WHOLE_USER_ANALYSIS.user_day_increment";
		var myDate = new Date();
		var mytime=myDate.toCNString();     //获取当前时间
		var excelname="每日新增注册用户"+mytime;
		var beginTimeStr = '';
		var endTimeStr = '';
		window.open("../exportexcel.htm?listId="+listId+"&excelname="+excelname
				+"&beginTimeStr="+beginTimeStr+"&endTimeStr="+endTimeStr);
		 }
		});
	</script>
</body>
</html>
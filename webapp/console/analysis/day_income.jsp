<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
body {
	padding: 0px;
	margin: 0px;
}
#incret_day_income,#body{
	width: 95%;
}
#totalMoneyDiv{
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
	<div id="incret_day_income"></div>
	<div id="totalMoneyDiv">当前购买总额:<span id="totalMoney"></span></div>
	<button id="exportExcel">导出excel</button>
	</div>
	<script src="../../static/jquery-1.11.0.js"></script>
	<script src="../../static/highcharts-4.2.1/js/highcharts.js"></script>
	<script src="day_income.js"></script>
</body>
</html>
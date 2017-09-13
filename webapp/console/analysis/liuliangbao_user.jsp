<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="http://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../static/jquery-easyui-1.4.4/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="../../static/jquery-easyui-1.4.4/themes/icon.css">
<style type="text/css">
body {
	padding: 0px;
	margin: 0px;
}

#incret_liuliangbao_user, #body {
	width: 95%;
}

#total_liuliangbao_user_div {
	position: absolute;
	font-family: "微软雅黑";
	width: 30%;
	margin-left: 60%;
	margin-top: -2%;
}

.yesterdayButtonDiv {
	width: 30%;
	height: auto;
}

.yesterdayButton {
	width: 70%;
	height: 30px;
	margin: 5px 30px;
}

.buttonDiv {
	width: 100%;
}

.somedayButtonDiv {
	margin-top: -14%;
	margin-left: 30%;
}

.times {
	padding: 10px;
	width: 50%;
}

.somedayButtonDiv2{
	margin-top: -10%;
	margin-left: 25%;
}

.somedayButton{
	width: 50%;
	height: 30px;
	margin: 5px 30px;
}
</style>
</head>
<body>
	<div id="body">
		<div id="incret_liuliangbao_user"></div>
		<div id="total_liuliangbao_user_div">
			当前新增流量宝注册用户:<span id="total_liuliangbao_user"></span>人
		</div>
	</div>

	<div class="yesterdayButtonDiv">
		<h3 class="yesterdayButton">导出昨日数据</h3>
		<button class="yesterdayButton" id="exportExcel">导出每日注册流量宝用户excel</button>
		<button class="yesterdayButton" id="exportExcel1">导出昨日流量宝注册用户excel</button>
		<button class="yesterdayButton" id="exportExcel3">导出至当前流量宝注册用户行为excel</button>
		<button class="yesterdayButton" id="exportExcel2">导出昨日用户交易行为excel</button>
	</div>

	<div class="somedayButtonDiv">
		<h3 class="somedayButtonTitle">导出指定日期数据数据</h3>
		<div class="times">
			<span>开始时间</span> <input class="easyui-datetimebox" id="beginTime"
				data-options="showSeconds:true" style="width: 150px; height: 30px;"><br>
			<br> <span>结束时间</span> <input class="easyui-datetimebox"
				id="endTime" data-options="showSeconds:true"
				style="width: 150px; height: 30px;">
		</div>
		<div class="somedayButtonDiv2">
			<button class="somedayButton" id="exportExcel4">导出该期间注册流量宝用户excel</button><br>
			<button class="somedayButton" id="exportExcel5">导出该期间流量宝注册用户交易行为excel</button><br>
			<button class="somedayButton" id="exportExcel6">导出该期间用户交易行为excel</button>
		</div>
	</div>
	<div style="height:80px;"></div>
<script src="../../static/jquery-1.11.0.js"></script>
<script src="../../static/bootstrap2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../static/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../static/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
<script src="../../static/highcharts-4.2.1/js/highcharts.js"></script>
<script src="liuliangbao_user.js"></script>
</body>
</html>
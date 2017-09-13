<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../../static/jquery-easyui-1.4.4/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="../../static/jquery-easyui-1.4.4/themes/icon.css">
<style type="text/css">
body {
	padding: 0px;
	margin: 0px;
}
#incret_order_user,#body{
width: 95%;
}

#total_order_user_div{
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
.remind{
	color:red;
	font-size:12px;
}
.export{
	width:90%;
	position:absolute;
	top:90%；
	left:10%;
	padding:3% 10% 15% 3%;
	float:left;
}

.export_class{
	width:20%;
	float:left;
}

.input_div{
	position:relative;
	padding:10% 0%;

}

.input{
	border-radius: 5px 5px 5px 5px;
	width: 150px; 
	height: 20px;
}

.button_div{
	position:relative;
	padding:5% 0%;
}
</style>
</head>
<body>
	<div id="body">
	<div id="incret_order_user"></div>
	<div id="total_order_user_div">当前新增交易用户共有:<span id="total_order_user"></span>人</div>
	<button id="exportExcel">导出excel</button>
	</div>
	<div class="export">
		<div class="regist_div export_class">
		<h3>注册时间<span class="remind">(可不填,默认为所有)</span></h3>
			<div class="times">
			<span>开始时间</span> <input class="easyui-datetimebox" id="beginTimeRegist"
				data-options="showSeconds:false" style="width: 150px; height: 30px;"><br>
			<br> <span>结束时间</span> <input class="easyui-datetimebox"
				id="endTimeRegist" data-options="showSeconds:false"
				style="width: 150px; height: 30px;">
		</div>
		</div>
		<div class="buy_div export_class">
		<h3>购买时间<span class="remind">(可不填,默认为所有)</span></h3>
			<div class="times">
			<span>开始时间</span> <input class="easyui-datetimebox" id="beginTimeBuy"
				data-options="showSeconds:false" style="width: 150px; height: 30px;"><br>
			<br> <span>结束时间</span> <input class="easyui-datetimebox"
				id="endTimeBuy" data-options="showSeconds:false"
				style="width: 150px; height: 30px;">
		</div>
		</div>
		<div class="regist_channel_div export_class">
			<h3>注册渠道<span class="remind">(可不填,默认为所有)</span></h3>
			<div class="input_div">输入渠道:<input class="regist_channel_input input"  placeholder="请输入注册渠道" /></div>
		</div>
		<div class="buy_channel_div export_class">
			<h3>购买渠道<span class="remind">(可不填,默认为所有)</span></h3>
			<div class="input_div">输入渠道:<input class="buy_channel_input input"  placeholder="请输入购买渠道" /></div>
		</div>
		<div class="button_div export_class">
		<button id="exportOrderInfoExcel">导出详情excel</button></br>
		<span class="remind">(导出的结果是该条件下的首次下单的用户的交易详情)</span>
		</div>
	</div>
	<script src="../../static/jquery-1.11.0.js"></script>
	<script src="../../static/highcharts-4.2.1/js/highcharts.js"></script>
	<script type="text/javascript" src="../../static/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../../static/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
	<script src="whole_order_user.js"></script>
</body>
</html>
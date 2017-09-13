<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="http://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../static/jquery-easyui-1.4.4/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="../../static/jquery-easyui-1.4.4/themes/icon.css">
<style>
.contain{
	width:1000px;
	height:auto;
	margin:0 auto;
	margin-top:50px;
}
.times {
	padding: 10px;
	width: 50%;
}
.buttonDiv{
	padding: 10px;
	position:relative;
	margin-top:-15%;
	margin-left:30%;
}
.button{
	margin:10px;
}

.channel{
	padding:10px;
}
.remind{
	color:red;
	font-size:12px;
}
</style>
</head>
<body>
	<div class="contain">
		<div class="times">
			<span>开始时间</span> <input class="easyui-datetimebox" id="beginTime"
				data-options="showSeconds:true" style="width: 150px; height: 30px;"><br>
			<br> <span>结束时间</span> <input class="easyui-datetimebox"
				id="endTime" data-options="showSeconds:true"
				style="width: 150px; height: 30px;">
		</div>
		<div class="channel">
			选择渠道类型
			<select id="channelType" style="margin-bottom: 0px;width: 130px;">
				<option value="">请选择类型</option>
				<option value="regist">注册渠道</option>
				<option value="deal">购买渠道</option>
			</select>
			<div style="margin:15px 0;">输入渠道<input id="channel"/></div>
			<span class="remind">(可不输入渠道,该情况导出的是微信端进行的或者丢失渠道的)</span>
		</div>
		<div class="buttonDiv">
		<button class="button" id="exportExcelRegist">导出该条件注册用户excel</button>
		<span class="remind">(可不选渠道类型)</span>
		</br>
		<button class="button" id="exportExcelDeal">导出该条件用户交易行为excel</button>
		<span class="remind">(必须选好渠道类型)</span>
		</div>
	</div>
	
	
<script src="../../static/jquery-1.11.0.js"></script>
<script src="../../static/bootstrap2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../static/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../static/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="export_data.js"></script>
</body>
</html>
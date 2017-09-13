<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta charset="utf-8">
<title>资产负责表!</title>
<style type="text/css">
.hr {
	width: 100%;
	border: 0px;
	border-top: 1px solid #ccc;
	clear: both;
}
</style>
</head>
<body style="">

	<div>
		<div id="platformAccountApie" style="width: 50%; height: 300px; float: left;"></div>
		<div id="platformAccountLpie" style="width: 50%; height: 300px; float: left;"></div>
	</div>
	<div id="balanceEqualDiv" style="width: 100px; height: 30px; position: absolute; z-index: 10; top: 130px; left: 50%; display: none;">
		<div class="Msg"></div>
		<div>
			<img class="safeIcon" src="../static/imgs/safe.png" height="30" title="账户整体安全" />
		</div>
	</div>
	<!-- 	<hr class="hr" /> -->
	<script src="../static/jquery-1.11.0.js"></script>
	<script src="../static/highcharts-4.2.1/js/highcharts.js"></script>
	<script src="balance_sheet.js"></script>
</body>
</html>
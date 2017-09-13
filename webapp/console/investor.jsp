<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta charset="utf-8">
<link href="https://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../static/jquery-easyui-1.4.4/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="../static/jquery-easyui-1.4.4/themes/icon.css">
<style type="text/css">
#searchBar {
	width: 100%;
	height: 100px;
	position: fixed;
	bottom: 0px;
	background-color: rgba(0, 0, 0, 0.8);
	position: fixed;
	bottom: 0px;
	bottom: 0px;
}
</style>
</head>
<body class="easyui-layout">
	<div data-options="region:'east',title:'投资额度漏斗模型',split:true" style="width: 400px">
		<div id="buyAmount"></div>

	</div>
	<div data-options="region:'center'" style="background-color: #eee;">
		<div class="easyui-layout" style="width: 100%; height: 100%;">
			<div data-options="region:'east',title:'投资人',split:true" style="width: 400px">

				<div style="width: 100%; height: 100%;" class="easyui-layout">
					<div data-options="region:'north'" style="height: 60px;"></div>
					<div data-options="region:'center'" style="background-color: #eee;"></div>
				</div>

			</div>
			<div data-options="region:'center'" style="background-color: #eee;"></div>
		</div>
	</div>


	<script src="../static/jquery-1.11.0.js"></script>
	<script src="../static/bootstrap2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../static/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
	<script src="../static/highcharts-4.2.1/js/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/funnel.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="investor.js"></script>
</body>
</html>
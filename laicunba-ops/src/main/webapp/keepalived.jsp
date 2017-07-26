<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="keepalived.js"></script>
<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
}

body {
	padding: 0px;
	margin: 0px;
	background-color: ##f0f0f0;
}

.checkPoint-en {
	font-size: 12px;
	color: gray;
}

.timestemp {
	text-align: right;
}

.level {
	text-align: center;
}

.btn_cicle {
	border-radius: 50%;
}

.btn_test {
	border: 1px solid red;
}

.interval {
	text-align: right;
}

td {
	vertical-align: top;
}

#rightTab {
	border-top: 0px;
}

#rightTab td {
	padding: 5px;
}

.no_test {
	background-color: #d8c058;
}

.tested_passed {
	background-color: #429142;
	color: white !important;
}

#AllTestedLayout {
	text-align: center; 
}

.tested_passed  .checkPoint-en {
	font-size: 12px; 
	color: white !important;
}
</style>
</head>
<body>
	<input type="hidden" id="envInput" value="${param.env }" />
	<div style="width: 50%; height: 100%; background-color: #f0f0f0; float: left; overflow: scroll;">
		<div id="AllTestedLayout" style="display: none;">
			<span style="line-height: 50px; font-size: 20px; color: green">恭喜!所有点都测试通过</span>
			<button id="btnClear">清除</button>
		</div>
		<table id="leftTab" border="1" style="width: 100%;">
			<tbody id="tbodyTestCase">
			</tbody>
		</table>

	</div>
	<div style="width: 50%; height: 100%; background-color: #f0f0f0; float: right; overflow: scroll;">

		<table id="rightTab" border="1" style="width: 100%;">
			<tbody id="tbody">
			</tbody>
		</table>
	</div>

	<table border="1" style="width: 100%; display: none;">

		<tbody id="leftTbodyTemplate">
			<tr>
				<td class="checkPoint">
					<div>
						<span class="timestemp"></span>【 <span class="user"></span>•<span class="level"></span>】<span class="checkPoint-cn"></span>
					</div>
					<div class="checkPoint-en"></div>
					<div style="font-size: 12px;">
						负责人: <span class="owner"></span> ,监测:<span class="interval"></span>
					</div>
				</td> 
			</tr>
		</tbody>
	</table>
	<table border="1" style="width: 100%; display: none;">

		<tbody id="tbodyTemplate">
			<tr>
				<td>
					<button class="btn_cicle btnSelectForTest">T</button>
				</td>
				<td class="checkPoint">
					<div>
						<span class="timestemp"></span>【 <span class="user"></span>•<span class="level"></span>】<span class="checkPoint-cn"></span>
					</div>
					<div class="checkPoint-en"></div>
					<div style="color: gray; font-size: 12px;">
						负责人: <span class="owner"></span> ,监测:<span class="interval"></span>
					</div>
				</td>
				<td>
					<button class="btn_cicle btnSetting">S</button>
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>
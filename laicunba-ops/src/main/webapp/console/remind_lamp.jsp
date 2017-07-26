<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="../js/jquery-1.11.0.js"></script>
<link rel="stylesheet" href="remind_lamp.css" media="screen" type="text/css" />

<title>环境心跳</title>
<style>
*{
	margin:0;
	padding:0;
	font-family: "微软雅黑"
}
body{
	background: -webkit-radial-gradient(rgba(57,60,76,1), rgba(36,36,46,1) 80%);
}

iframe{
	border-width:0;
	width:4%;
	height:60px;
	border:0;
	overflow-x : hidden;
    overflow-y : hidden;  
}

.remind{
	margin-top:3%;
	margin-right:2.4%;
	width:7%;
	float:right;
	height:auto;
	background:#ddd;
	text-align:center;
	padding:40px 0;
}

.iframe_div{
	width:90%;
	float:left;
}
</style>
</head>

<body>
	<div class="lamp_div">
		<div class="remind">
			<input type="hidden" id="envInput" value="${param.env }" />
			<h1>
				当</br>前</br>共</br>有</br>
				<span class="all_lamp" style="color: green; font-size: 1.5em;">0</span></br>盏</br>灯</br>
				<span class="red_lamp_num" style="color: #f00; font-size: 2em;">0</span></br>盏</br>红</br>灯
			</h1>
		</div>
		<div class="iframe_div" style="text-align: center; margin-top: 20px;">
			<iframe src="remind_lamp.html" class="red_div"></iframe>

			<script type="text/javascript" src="remind_lamp.js"></script>

		</div>
	</div>
	<div class="error_info"></div>
</body>
</html>
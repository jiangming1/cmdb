<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta itemprop="image" content="https://h5.laicunba.com/h5/activity/img/share-logo.png"><!-- 图片 -->
<meta charset="utf-8">
<title>分享红包</title>
<script src="../js/jquery.min.js"></script>
<style type="text/css">
body {
	background-image:
		url("http://laicunba.b0.upaiyun.com/lcb/activity/shared_packet/beijing1.png");
	background-size: 100%;
	margin: 0px;
	padding: 0px;
	background-repeat: no-repeat;
}

#box {
	width: 90%;
	margin: 0px auto;
	background-color: #fc7e60;
	border-radius: 5px; 
}

#icon1 {
	height: 80px;
}

#mobileInput {
	width: 80%;
	margin: 0px auto;
	height: 30px;
	line-height: 30px;
	border: 0px;
	border-radius: 3px;
	margin-top: 5px;
	text-align: center;
	padding: 3px;
	font-size: 20px;
}

#btnExtract {
	width: 90%;
	height: 40px;
	line-height: 40px;
	border-radius: 20px;
	background-color: #ffcc42;
	border: 0px;
	color: white;
	padding: 0px;
	font-size: 20px;
}

#btnExtract:HOVER {
	color: black;
}

#rule1 {
	color: white;
	list-style: decimal;
	font-size: 12px;
	margin-top: 20px;
	margin-bottom: 50px;
}
</style>
</head>
<body>
    <!--QQ/微信分享标题图-->
    <div style="width: 0px;height: 0px;overflow: hidden;"><img src="https://h5.laicunba.com/h5/activity/img/share-logo.png" /></div>
	<div style="width: 100%; height: 270px;"></div>
	<div id="box">
		<div style="position: relative; top: -50px;">
			<div style="text-align: right;">
				<img id="icon1" src="http://laicunba.b0.upaiyun.com/lcb/activity/shared_packet/1_03.png" />
			</div>
			<div style="width: 100%; text-align: center; color: white; font-size: 12px;">输入手机号领取红包</div>
			<div style="text-align: center;">
				<input id="mobileInput" type="number" placeholder="请输入手机号码" />
			</div>
			<div style="text-align: center; margin-top: 10px;">
				<button id="btnExtract">立即领取</button>
			</div>
		</div>
	</div>
	<div style="height: 30px;">&nbsp;</div>
	<script type="text/javascript">
		$(function() {
			$("#btnExtract").click(function() {
				var mobile = $("#mobileInput").val().trim();
				if (!mobile) {
					$("#mobileInput").focus();
					return;
				}
				if (!/^1[0-9]{10}$/.test(mobile)) {
					$("#mobileInput").focus();
					return;
				}
				var p = {
					mobile : mobile,
					id : "${param.id}"
				};

				//alert(JSON.stringify(p));
				$.post("do_extract.htm", p, function(data) {
					window.location = "shared_packet_item.htm?packet_id=${param.id}&mobile=" + $("#mobileInput").val().trim();

				}, "json");
			});
		});
	</script>
</body>
</html>
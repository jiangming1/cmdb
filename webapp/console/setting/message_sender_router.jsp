<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="../../static/jquery-1.11.0.js"></script>

<script type="text/javascript">
	$(function() {
		$.post("getVerifyCodeMsgSender.htm", {
			t : new Date()
		}, function(data) {
			$("#currentSender").html(data);
		}, "html");

		$("#btnAlidayu").click(function() {

			$.post("setVerifyCodeMsgSender.htm", {
				t : new Date(),
				sender : "alidayu"
			}, function(data) {
				$("#currentSender").html(data);
			}, "html");
		});
		
		
		$("#btnYunFen").click(function() {

			$.post("setVerifyCodeMsgSender.htm", {
				t : new Date(),
				sender : "YunFeng"
			}, function(data) {
				$("#currentSender").html(data);
			}, "html");
		});
		
	});
</script>
</head>
<body>

	<div style="font-size: 30px; line-height: 50px;">
		当前通道：<span id="currentSender"></span>
	</div>
	<button id="btnAlidayu">验证码短信设置为阿里大鱼</button>
	<button id="btnYunFen">验证码短信设置为云峰</button>
	<div style="color: red">因为是集群环境下的本地变量，因此需要多点几次，确保每一台机器都有改变,  重新发版后还原为阿里大鱼</div>


</body>
</html>
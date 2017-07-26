<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>测试环境Token</title>
<script type="text/javascript" src="../js/jquery-1.11.0.js"></script>
</head>
<body>
	<h4>测试环境ＴＯＫＥＮ获取</h4>

	<h4 style="color: red">注：需要手机app在测试环境登录</h4>
	<input id="uidMobile" placeholder="User Id" />
	<button id="btnQuery">获取</button>
	<div id="tokenDiv"></div>
</body>
<script type="text/javascript">
	$(function() {
		$("#btnQuery").click(function() {
			var p = {
				t : new Date(),
				uid : $("#uidMobile").val().trim()
			};
			if (!p.uid) {
				$("#uidMobile").focus();
				return;
			}

			$.post("getTestApiToken.htm", p, function(data) {
				$("#tokenDiv").html(data.token);

			}, "json");
		});
	});
</script>
</html>
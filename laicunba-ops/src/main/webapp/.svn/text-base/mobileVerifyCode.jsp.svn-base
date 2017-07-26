<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
</head>
<body>
	<input id="mobile" placeholder="请输入手机号码" />
	<button id="btnQuery">查询</button>
	<div id="mobileVerfiyCode"></div>
	<script type="text/javascript">
		$(function() {
			$("#btnQuery").click(function() {
				$.post("redisQuery.htm", {
					t : new Date(),
					key : "MOBILE_VERIFY_CODE_" + $("#mobile").val().trim() + "*"
				}, function(data) {
					$("#mobileVerfiyCode").html("");
					for ( var i in data) {
						var row = data[i];
						var code = row.split("_");
						$("#mobileVerfiyCode").append("<div>" + code[code.length-1] + "</div>")
					} 
				}, "json");
			});
		});
	</script>
</body>
</html>
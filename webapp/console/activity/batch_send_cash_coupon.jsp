<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>批量发送现金券</title>
<style type="text/css">
#progressBar {
	width: 40%;
	font-size: 0px;
	border-radius: 3px;
	height: 10px;
	background-image: linear-gradient(to right, #f3f3f3 0px, blue 100%);
}
</style>
</head>
<body style="padding: 10px;">
	<span id="countSpan">0</span>/
	<span title="用户总人数" id="userCount">${userCount }</span>
	<div style="width: 200px; height: 10px; background-color: #eee; font-size: 0px; border-radius: 3px;">
		<div id="progressBar"></div>
	</div>
	<br /> 用户:
	<select id="userType">
		<option value="WUXU_USER">无序所有用户</option>
		<option value="BUYER_USER">有过投资用户</option>
		<option value="NO_BID_USER">无投资用户</option>
	</select>
	现金券ID:
	<input type="text" id="couponDefId" /> 派发数量:
	<input type="text" style="width: 90px;" id="amount" />
	<br />
	<button style="margin-top: 30px;" id="btnStart">开始派发</button>
	<script src="../../static/jquery-1.11.0.js"></script>
	<script src="batch_send_cash_coupon.js"></script>
</body>
</html>
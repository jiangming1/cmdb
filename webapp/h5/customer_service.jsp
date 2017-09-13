<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>来存吧</title>
<style type="text/css">
.contact {
	background-color: white;
	width: 100%;
	border-bottom: 1px solid #ccc;
}

.contact .icon {
	width: 50px;
	text-align: center;
}

.contact .type {
	width: 100px;
	font-weight: bold;
}

.contact .icon img {
	height: 30px;
}

body {
	padding: 0px;
	margin: 0px;
	background-color: #eee;
}
</style>
</head>
<body>
	<table class="contact">
		<tr>
			<td class="icon"><img src="img/service_time.png" /></td>
			<td class="type">服务时间</td>
			<td class="content">9:00-21:00(节假日不休息)</td>
		</tr>
	</table>
	<table class="contact">
		<tr>
			<td class="icon"><img src="img/phone.png" /></td>
			<td class="type">客服电话</td>
			<td class="content">400-6191-520</td>
		</tr>
	</table>
	<table class="contact" style="margin-top: 30px; border-top: 1px solid #ccc;">
		<tr>
			<td class="icon"><img src="img/weixin.png" /></td>
			<td class="type">微信公众号</td>
			<td class="content">来存吧</td>
		</tr>
	</table>
	<table class="contact">
		<tr>
			<td class="icon"><img src="img/qq.png" /></td>
			<td class="type">QQ交流群</td>
			<td class="content">473119359</td>
		</tr>
	</table>
	<table class="contact">
		<tr>
			<td class="icon"><img src="img/sinaweibo.png" /></td>
			<td class="type">新浪微博</td>
			<td class="content">@来存吧</td>
		</tr>
	</table>
	<table class="contact">
		<tr>
			<td class="icon"><img src="img/email.png" /></td>
			<td class="type">客户邮箱</td>
			<td class="content">services@laicunba.com</td>
		</tr>
	</table>
</body>
</html>
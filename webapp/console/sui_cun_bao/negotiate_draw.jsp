<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta charset="utf-8">
<link href="https://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<title>洽谈提现</title>
</head>
<body style="margin: 10px;">
	<table>
		<tr>
			<td>手机号码</td>
			<td><input id="mobile" />
				<button id="btnQuery">查询</button></td>
		</tr>
		<tr>
			<td>可提现本金</td>
			<td><input id="principal" disabled="disabled" /></td>
		</tr>
		<tr>
			<td>可提现收益</td>
			<td><input id="totalProfit" disabled="disabled" /></td>
		</tr>
		<tr>
			<td>提现金额</td>
			<td><input id="withdrawAmount" /></td>
		</tr>
		<tr>
			<td>一起提现利息</td>
			<td><input disabled="disabled" /></td>
		</tr>
		<tr>
			<td></td>
			<td><button id="btnWithdraw">提现</button></td>
		</tr>
	</table>
	<script src="../../static/jquery-1.11.0.js"></script>
	<script src="../../static/bootstrap2/js/bootstrap.min.js"></script>
	<script src="../../static/md5.js"></script>
	<script src="negotiate_draw.js"></script>
</body>
</html>
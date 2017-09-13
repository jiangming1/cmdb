<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="zh-CN">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta charset="utf-8">
<link href="https://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<title>送体验金</title>
<style type="text/css">
input {
	height: 30px;
}

td {
	text-align: right;
	padding: 3px;
}

.notExit {
	color: red;
	text-decoration: underline;
}
</style>
</head>
<body style="padding: 10px;">
	<table>
		<tr>
			<td>体验金标的编号</td>
			<td><input id="targetCodeInput" /></td>
			<td><button id="btnQueryTarget">查询</button></td>
		</tr>
		<tr>
			<td>标的剩余金额</td>
			<td><input id="remainAmountInput" disabled="disabled" value="0" /></td>
			<td></td>
		</tr>
		<tr>
			<td>客户账户(手机号码)</td>
			<td><input id="buyerMobileInput" /></td>
			<td><button id="btnQueryUser">查询</button></td>
		</tr>
		<tr>
			<td>用户姓名</td>
			<td><input id="userNameInput" disabled="disabled" /></td>
			<td></td>
		</tr>

		<tr>
			<td>赠送本金金额</td>
			<td><input id="buyAmountInput" /></td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<td style="text-align: left;"><button id="btnBuy">赠送</button></td>
			<td></td>
		</tr>
	</table>
	<script src="../../static/jquery-1.11.0.js"></script>
	<script src="../../static/bootstrap2/js/bootstrap.min.js"></script>
	<script src="../../static/md5.js"></script> 
	<script src="give_experience_principal_form.js"></script> 
</body>
</html>
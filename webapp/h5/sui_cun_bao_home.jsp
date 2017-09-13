<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>来存吧-随存宝</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link type="text/css" rel="stylesheet" href="css/lcb_wx_common.css">
<style type="text/css">
* {
	font-size: 1em;
	font-family: "微软雅黑"
}

a {
	color: #000;
}

#tab1 td {
	line-height: 30px;
	color: white;
	font-size: 20px;
	padding-left: 10px;
	text-align: center;
    border-top: 1px solid #fc905f;
}

#bottomLayout {
	position: fixed;
	bottom: 0px;
	width: 100%;
	border-top: 0px;
}

#bottomLayout td {
	height: 50px;
	font-size: 20px;
}

#bottomLayout td a {
	display: inline-block;
	width: 100%;
	height: 100%;
	line-height: 50px;
	text-align: center;
}

.lineBtn {
	height: 50px;
	width: 100%;
	background-color: white;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.lineBtn:HOVER {
	background-color: #eee;
}

.lineBtn table {
	width: 100%;
	height: 100%;
}

.lineBtn table td {
	padding: 0px 5px 0px 5px;
}
</style>
</head>
<body style="background-color: #eee;">
	<div>
		<div style="width: 100%; height: 150px; background:url(img/topBg01.png); padding: 10px;background-size: cover; text-align:center;">
			<div style="line-height: 30px; color: white; font-size: 20px;">
				<span class="badge badge-warning" style="background-color: white; color: #e85156; margin-right: 10px;">￥</span>昨日收益
			</div>
			<div id="dayProfit" style="line-height: 100px; font-size: 50px; color: white;">#.##</div>
		</div>
		<div style="width: 100%; height: 80px;">
			<table id="tab1" style="width: 100%; height: 100%;">
				<tr>
					<td style="background:url(img/topBg02.png) no-repeat; background-size:contain; border-right:1px solid #fc905f; width:50%;">
						<div>本金(元)</div>
						<div id="principal">#.##</div>
					</td>
					<td style="background:url(img/topBg03.png) no-repeat; background-size:contain; border-left:1px solid #fc905f;">
						<div>当前收益(元)</div>
						<div id="totalProfit">#.##</div>
					</td>
				</tr>
			</table>
		</div>

		<div class="lineBtn" style="margin-top: 10px;">
			<a href="sui_cun_bao_balance_list.htm">
				<table>
					<tr>
						<td style="width: 50px; text-align: center;"><img src="img/list.png" height="30" /></td>
						<td style="width: 100px;">资金记录</td>
						<td></td>
						<td style="width: 50px; color: #ccc; padding: 0px; text-align: center;">〉</td>
					</tr>
				</table>
			</a>
		</div>
		<div id="bottomLayout" style="padding-top: 0px;">
			<table style="width: 100%;">
				<tr>
					<td style="border-top: 1px solid #888;"><a href="sui_cun_bao_withdraw_form.htm" style="background-color:#fff;">提现</a></td>
					<td style="border-top: 1px solid #555;"><a href="sui_cun_bao_detail.htm" style="background-color:#ff5a2c; color:#fff;">购买</a></td>
				</tr>
			</table>
		</div>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="sui_cun_bao_home.js"></script>

</body>
</html>
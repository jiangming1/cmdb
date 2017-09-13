<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>购买结果</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" href="css/bootstrap.min.css">
<style type="text/css">
#header {
	width: 100%;
	height: 50px;
	line-height: 50px;
	background-color: black;
	color: white;
	position: fixed;
	top: 0px;
	font-size: 2rem;
	text-align: center;
}

* {
	font-family: "微软雅黑";
	font-size: 1.6rem;
}

#tab1 {
	width: 100%;
	margin: 10px;
}

#tab1 td {
	padding: 5px;
}

.column {
	text-align: right;
	vertical-align: top;
}

#tabBtn {
	width: 100%;
}

#tabBtn td {
	text-align: center;
}

#tabBtn td a {
	width: 80%;
	font-size: 1em;
}
</style>
</head>
<body>

	<c:choose>
		<c:when test="${code=='SUCCESS' || code=='FINANCING_TARGET_BID_HAS_PAYED' }">
<!-- 			<div id="header">购买结果</div> -->
			<div style="width: 100%; padding: 50px 10px 10px 10px;">
				<div>
					<div style="text-align: center; width: 100%;">
						<img src="img/results.png" />
					</div>
					<div style="text-align: center; width: 100%;">购买成功</div>

				</div>

				<img src="img/results1.png" style="width: 100%;" />
				<table id="tab1" style="margin-top: 10px;">
					<tr>
						<td class="column">&nbsp;&nbsp;订单号：</td>
						<td>${certificateId}</td>
					</tr>
					<tr>
						<td class="column">购买金额：</td>
						<td style="color: #fe5c02;">￥${financingTargetBid.buyAmount }元</td>
					</tr>
					<tr>
						<td class="column">支付方式：</td>
						<td>${financingTargetBid.bankName }<c:if test="${not empty shortBankCardNo}">（尾号${shortBankCardNo }）</c:if></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
				</table>
				<div style="margin: 10px; text-align: center;">
					请在“
							<span style="color: #fe5c02;">我的账户-交易记录</span>
					”中查看订单详情，如有疑问 请致电<a href="tel:400-6191-520">400-6191-520</a>
				</div>

				<table id="tabBtn">
					<tr>
						<td><a class="btn btn-warning" href="financial_zone.htm?tab=zone&app_view=zone">继续理财</a></td>
						<td><c:choose>
								<c:when test="${financingTargetBid.type=='SCB' }">
									<a class="btn btn-success" href="sui_cun_bao_home.htm?app_view=scb">查看资产</a>
								</c:when>
								<c:otherwise>
									<a class="btn btn-success" href="my_account.htm?tab=account&app_view=acc">查看资产</a>
								</c:otherwise>
							</c:choose></td>
					</tr>
				</table>
			</div>
		</c:when>
		<c:otherwise>
			<div>下单失败</div>

			<div class="am-u-sm-6">
				<a href="financial_zone.htm?tab=zone&app_view=zone">
					<button class="am-btn am-radius whitecolor am-padding-horizontal-xl" style="background: #ff7532">继续理财</button>
				</a>
			</div>
		</c:otherwise>
	</c:choose>


	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>

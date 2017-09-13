<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<link rel="stylesheet" href="css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="css/lcb_wx_common.css?201602291" />
<title>来存吧-随存宝交易记录</title>
<style type="text/css">
* {
	font-size: 1em;
}

#listBox table {
	width: 100%;
	border-bottom: 1px solid #ccc;
}

#listBox table td {
	padding-left: 10px;
}

.line1 td {
	padding-top: 10px;
}

.line2 td {
	padding-bottom: 10px;
}

#listBox .title {
	font-weight: bold;
	font-size: 16px;
}

.money {
	color: #fa9f59;
	font-size: 16px;
	text-align: right;
}

.moneyWithdraw {
	color: green;
	font-size: 16px;
	text-align: right;
}

#listBox .success {
	color: #71c446;
	font-size: 16px;
	text-align: right;
}
</style>
</head>
<body style="background-color: #f2f2f2;">
	<c:if test="${param.device==null || param.device==''}">
		<div class="backBar">
			<table>
				<tr>
					<td style="width: 50px;"><a href="financial_zone.htm?tab=zone&tab1=current&t=<%=new Date()%>"><img src="img/icon_fanhui.png" style="height: 40px;"></a></td>
					<td>交易记录</td>
					<td style="width: 50px;"></td>
				</tr>
			</table>
		</div>
	</c:if>
	<div id="listBox">
		<table class="buy" style="display: none;">
			<tr class="line1">
				<td class="title">购买</td>
				<td class="money">0</td>
				<td rowspan="2" style="width: 30px; text-align: center; color: #ccc;"></td>
			</tr>
			<tr class="line2">
				<td class="buyTime">2016-01-17 14:15:39</td>
				<td class="success">交易成功</td>
			</tr>
		</table>
		<table class="withdraw" style="display: none;">
			<tr class="line1">
				<td class="title">提现</td>
				<td class="money moneyWithdraw">0</td>
				<td rowspan="2" style="width: 30px; text-align: center; color: #ccc;"></td>
			</tr>
			<tr class="line2">
				<td class="buyTime">2016-01-17 14:15:39</td>
				<td class="success" style="color: blue">未知</td>
			</tr>
		</table>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function() {
			var p = {
				t : new Date(),
				app_token:"${param.app_token}"
			}; 
			var buyTemplate = $("#listBox").find(".buy");
			var withdrawTemplate = $("#listBox").find(".withdraw");
			buyTemplate.remove();
			withdrawTemplate.remove();
			$.post("sui_cun_bao_balance_item.htm", p, function(data) {
				var listBox = $("#listBox");
				if (!data || data.length == 0) {
					var html = '<div style="text-align: center; margin-top: 40%;">'+
									'<img src="img/icon_wujilu.png" style="width: 40%;" />'+
									'<div style="margin-top: 6%; text-align: center; color: #808080; font-size: 16px;">暂无交易记录</div>'+
								'</div>';
					listBox.append(html);
					return;
				}
				for ( var i in data) {
					var row = data[i];
					if (row["subject"] == "buy_scb") {
						var newTable = buyTemplate.clone();
						newTable.find(".money").html(row["amount"]);
						newTable.find(".buyTime").html(row["date"] ? new Date(row["date"]).toCNString() : "缺少时间");
						listBox.append(newTable);
						newTable.show();
					} else {
						var newTable = withdrawTemplate.clone();
						if (row["status"] == "apply") {
							newTable.find(".success").html("等待回款");
						}else if (row["status"] == "send") {
							newTable.find(".success").html("已回款,等待到账");
						}else if (row["status"] == "transfered") {
							newTable.find(".success").html("已到账");
						}

						newTable.find(".moneyWithdraw").html("-" + row["amount"]);
						if(row["payMark"] == "DEMAND_2_FIX"){ 
							newTable.find(".title").html("购买银票宝"); 
							newTable.find(".success").html("交易成功"); 
							newTable.find(".success").css("color","#71c446");
							newTable.find(".moneyWithdraw").css("color","#fa9f59");
						}
						newTable.find(".buyTime").html(row["date"] ? new Date(row["date"]).toCNString() : "缺少时间");
						listBox.append(newTable);
						newTable.show();
					}

				}
			}, "json");
		});

		Date.prototype.toCNString = function() {
			return this.getFullYear() + "-" + (this.getMonth()>=9 ? this.getMonth() + 1 : "0" + (this.getMonth() + 1)) + "-" + (this.getDate()>9 ? this.getDate() : "0" + this.getDate()) + " " + (this.getHours()>9 ? this.getHours() : "0" + this.getHours()) + ":" + (this.getMinutes()>9 ? this.getMinutes() : "0" + this.getMinutes()) + ":" + (this.getSeconds()>9 ? this.getSeconds() : "0" + this.getSeconds());
		};
	</script>
</body>
</html>
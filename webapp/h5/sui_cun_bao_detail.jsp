<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>详情页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link type="text/css" rel="stylesheet" href="css/lcb_wx_common.css?201602011" />
<style type="text/css">
#saleOutLayout {
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.8);
	position: absolute;
	z-index: 10;
	text-align: center;
	line-height: 500px;
	color: white;
}

#topLayout {
	height: 50px;
	line-height: 50px;
	background-color: rgba(255, 102, 0, 0.6);
	text-align: center;
	position: fixed;
	top: 0px;
	width: 100%;
	color: white;
}

#bottomLayout {
	height: 50px;
	background-color: rgba(0, 0, 0, 0.6);
	text-align: center;
	position: fixed;
	bottom: 0px;
	width: 100%;
}

#bottomLayout button {
	width: 90%;
	height: 35px;
	margin: 6px 0px 6px 0px;
}

body {
	padding: 0px;
	margin: 0px;
}

#mainInfo {
	width: 300px;
	background: url('img/circle31.png') no-repeat;
	margin: 0px auto;
	margin-top: 80px;
}

#table1 {
	width: 100%;
	margin-top: 20px;
}

#table1 td {
	width: 33%;
	text-align: center;
}

#table1 td img{
	vertical-align: text-bottom;
}

.table2 {
	width: 100%;
	padding:5px 0;
}

.table2 td {
	width: 50%;
	text-align: center;
	vertical-align: top;
	padding: 5px;
}

#btnBuyNow {
	display: inline-block;
	line-height: 45px;
	width: 75%;
	background-color: #f37b1d;
	color: white;
	text-decoration: none;
	border-radius: 6px;
}

.money {
	color: #f37b1d;
}
.calculator-con{
	position:fixed;
	left:0;
	top:0;
	width:100%;
	 height:100%;
	background:rgba(0,0,0,0.6);
	z-index:998;
	display:none;
}
.table3{
	width:90%;
	height:30%;
	position:fixed;
	top:30%;
	left:5%;
	border:1px solid #fba325;
	background:#FFF;
	border-radius:5px;padding:5px;
	display:none;
	z-index:999;
}

.cantbuy{
	background-color: #ccc !important;
}
</style>
</head>
<body>
	<c:if test="${scb==null }">
		<div id="saleOutLayout">已售完,敬请期待下期</div>
	</c:if>
<%-- 	<div id="topLayout">${scb.name }</div> --%>
    <c:if test="${param.device==null||param.device=='' }">
			<div class="backBar backBar2">
				<table>
					<tbody>
						<tr>
							<td style="width: 50px;"><a href="sui_cun_bao_home.htm"><img src="img/icon_fanhui.png" style="height: 40px;"></a></td>
							<td>${scb.name }</td>
							<td style="width: 50px;"></td>
						</tr>
					</tbody>
				</table>
			</div>
	</c:if>
	<div id="bottomLayout" style="display: none;">
		<button>立即购买</button>
	</div>

	<div id="mainInfo">
		<div style="width: 60%; margin: 0px auto;">
			<div style="width: 100%; height: 50px;"></div>
			<c:if test="${scb.type=='CPB' }">
				<div style="text-align: center;">理财期限:${scb.period }天</div>
			</c:if>
			<c:if test="${scb.type=='SCB' }">
				<div style="text-align: center;">随存随取<span style="color:#FF7433;font-size:20px;margin: 0 5px;"></span></div>
			</c:if>
			<div style="text-align: center; line-height: 60px; font-size: 40px; color: #f37b1d">${scb.annualizedRates }%</div>
			<div style="text-align: center; width: 80%; border-bottom: 2px dashed blue; margin: 0px auto;"></div>
			<div style="text-align: center; line-height: 30px;">预计年化收益</div>
			<div style="text-align: center; line-height: 30px;">
				<span style="color: #f37b1d">${scb.minAmount }&nbsp;</span>起投
			</div>
		</div>
	</div>
	<c:if test="${scb.type=='CPB' }">
	<table id="table1">
		<tr>
			<td><img src="img/huoqi.png" style="height: 18px;" />定期理财</td>
			<td><img src="img/zdfk.png" style="height: 18px;" />自动返款</td>
			<td><img src="img/cnhg.png" style="height: 18px;" />承诺回购</td>
		</tr>
	</table>
	</c:if>
	<table id="table1">
		<tr>
			<td>
				<img src="img/benxi.png" style="height: 20px;" />
				<span style="padding-left:5px;">本息保障</span>
			</td>
			<c:if test="${scb.type=='CPB' }">
				<td>
					<img src="img/zdfk.png" style="height: 25px;" />
					<span style="padding-left:2px;">自动返款</span>
				</td>
			</c:if>
			<c:if test="${scb.type=='SCB' }">
				<td>
					<img src="img/hqlc.png" style="height: 25px;" />
					<span style="padding-left:2px;">活期理财</span>
				</td>
			</c:if>
			<td>
				<img src="img/cnhg.png" style="height: 25px;" />
				<span style="padding-left:2px;">承诺回购</span>
			</td>
		</tr>
	</table>
	<table class="table2" cellspacing="0" cellpadding="0" style="margin-top: 20px;">
		<tr>
			<td style="border-right: 1px solid #ccc;" class="money">￥${scb.collectAmount }元</td>
			<td class="money">￥${scb.collectAmount-scb.finishAmount }元</td>
		</tr>
		<tr>
			<td style="border-right: 1px solid #ccc;">募集规模</td>
			<td>剩余份额</td>
		</tr>
	</table>
	<div style="width: 100%; border-bottom: 1px solid #ccc; font-size: 0px; height: 2px;"></div>
	<table class="table2" cellspacing="0" cellpadding="0">
		<tr>
			<td><c:if test="${scb.type=='CPB' }">定期：当日起息</c:if> <c:if test="${scb.type=='SCB' }">活期：T(成交日)+1</c:if></td>
			<td>每人限购：${scb.limitAmount }元</td>
		</tr>
	</table>
	<div style="width: 100%; border-bottom: 1px solid #f37b1d; font-size: 0px; height: 2px;"></div>
	<table class="table2" cellspacing="0" cellpadding="0">
		<tr>
			<td style="border-right: 1px solid #f37b1d;height:30px;vertical-align: middle;"><a href="financial_description.htm?id=${scb.id }" style="color:#FF7433">项目描述</a></td>
			<td style="vertical-align: middle;"><a href="financial_buy_history.htm?id=${scb.id }" style="color:#FF7433">投资记录</a></td>
		</tr>
	</table>
	<div style="width: 100%; border-bottom: 1px solid #f37b1d; font-size: 0px; height: 2px;"></div>
	<div style="text-align: center; margin-top: 20px; margin-bottom: 10px; color: #188FFF">
		<img src="img/safe.png" style="height: 18px; margin-right: 10px;" />${scb.cashMark }
	</div>
	<div style="text-align: center;">
		<!--计算器的按钮-->
		<span class="calculator" style="display:block;float:left;padding-left:10px;">
			<img src="img/jsj.png" />
		</span>
		  <!--计算器弹出框-->
 		<table class="table3" cellspaceing="0" cellpadding="0">
			<tbody>
				<tr>
					<td colspan="2" style="text-align:center;">
						<span style="font-weight:bold; font-size:17px;">计算预期收益</span>
						<a class="close" style="display:inline-block;float:right;padding-right:5px;font-size:25px;font-family:'微软雅黑';margin-top:-15px;">&times;</a>
					</td>
				</tr>
				<tr>
					<td style="width:60%;">
						 <span style="color:#FF7433;inline-block;">￥</span>
						 <input type="text" id="investAmount" pattern="[0-9]*" style="line-height:20px;width:66%;" placeholder="投资金额"> 元
					</td>
					<td>
						<img src="img/rili.jpg" style="width:20px;margin-bottom:-4px;"/>
						<span>
							<c:if test="${scb.type=='CPB' }">${scb.period }<input type="hidden" id="period" value="${scb.period }" /></c:if>
							<c:if test="${scb.type=='SCB' }"><input type="text" id="period" maxLength="4" style='width:30px;' /></c:if>
						</span> 天
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:left;padding-left:10px;">
						产品预计收益：<span id="income" style="color:#FCAB38;margin-left:5px;">0.00</span>元
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;">
						<input type="hidden" id="interestRate" value="${scb.annualizedRates }" />
						<input type="hidden" id="minAmount" value="${scb.minAmount }" />
						<input type="hidden" id="collectAmount" value="${scb.collectAmount }" />
						<input type="hidden" id="finishAmount" value="${scb.finishAmount }" />
						<button type="button" id="computeIncome" style="border:1px solid #FF7433;border-radius:8px;padding:6px 40px;color:#FFF;background:#FF7433">计 算 收 益</button>
					</td>
				</tr>
			</tbody>
		</table>
		<c:choose>
			<c:when test="${scb.status!='onsale' }">
				<a id="btnBuyNow" class="cantbuy">售罄</a> 
			</c:when>
			<c:when test="${scb.finishAmount>=scb.collectAmount }">
				<a id="btnBuyNow" class="cantbuy">售罄</a>
			</c:when>
			<c:otherwise>
				<a id="btnBuyNow" href="bid_form.htm?id=${scb.id }">立即购买</a>
			</c:otherwise>
		</c:choose> 
		<div class="calculator-con"></div>
	</div>
	<div style="width: 100%; height: 50px;"></div>
	<script src="js/jquery.min.js"></script>
	<script>
	$(document).ready(function(e){
		$(".calculator").click(function(){
			$(".calculator-con,.table3").show();
			//$(".table3").addClass("show");
			return false;
		});
		$(".calculator-con,.close").bind("click",function(){
			$(".table3,.calculator-con").hide();
		})
		
		$("#computeIncome").click(function() {
			var investAmount=$("#investAmount").val();	//所有金额
			var period=$("#period").val();		//投资期限
			//收益比例
			var interestRate=Number($("#interestRate").val())/100;
			var incomeMoney = investAmount*interestRate/365*period;
			$("#income").text(incomeMoney.toFixed(2));
		});
	})
	</script>
</body>
</html>

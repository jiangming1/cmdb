<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link type="text/css" rel="stylesheet" href="css/lcb_wx_common.css?201602291" />
<title>详情页面</title>
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
	background-color: #FF7433;
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
	margin-top: 10px;
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
	background-color: #ff7433;
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

.title {
	margin-top: 55px;
	text-align: center;
	font-size: 22px;
}
</style>
</head>
<body>
	<c:if test="${financialTarget==null }">
		<div id="saleOutLayout">已售完,敬请期待下期</div>
	</c:if>
	<div class="backBar">
		 <table>
			<tr>
				<td style="width: 50px;"><a href="financial_zone.htm?tab=zone&t=<%=new Date()%>"><img src="img/icon_fanhui.png" style="height: 40px;"></a></td>
				<td>产品详情</td>
				<td style="width: 50px;"></td>
			</tr>
		 </table>
    </div>
	<div id="bottomLayout" style="display: none;">
		<button>立即购买</button>
	</div>

	<div class="title">${financialTarget.name }</div>
	<div id="mainInfo">
		<div style="width: 60%; margin: 0px auto;">
			<div style="width: 100%; height: 25px;"></div>
			<c:if test="${financialTarget.type=='CPB' }">
				<div style="text-align: center; font-size: 18px;">理财期限<span style="color:#FF7433;font-size:20px;margin: 0 5px;">${financialTarget.period }</span>天</div>
			</c:if>
			<c:if test="${financialTarget.type=='SCB' }">
				<div style="text-align: center; font-size: 18px;">随存随取<span style="color:#FF7433;font-size:20px;margin: 0 5px;"></span></div>
			</c:if>
			<c:choose>
				<c:when test="${financialTarget.incrRate > 0 }">
					<div style="text-align: center; line-height: 60px; font-size: 40px; color: #ff5a2c;margin-top: 30px;"><fmt:formatNumber value="${financialTarget.annualizedRates - financialTarget.incrRate}" pattern="##.##" minFractionDigits="1" />%</div>
					<div style="text-align: center; color: #fe7c4e; border-radius: 15px; border: 1px solid #fe885f; left:210px; font-size:12px;position: absolute; top:165px; padding: 1px 3px; vertical-align: middle;height: 12px;">加送<fmt:formatNumber value="${financialTarget.incrRate }" pattern="##.##" minFractionDigits="1" />%</div>
				</c:when>
				<c:otherwise>
					<div style="text-align: center; line-height: 60px; font-size: 40px; color: #ff5a2c;margin-top: 30px;"><fmt:formatNumber value="${financialTarget.annualizedRates }" pattern="##.##" minFractionDigits="1" />%</div>
				</c:otherwise>
			</c:choose>
			
			<div style="text-align: center; width: 100%; color:#feb381; margin-top: -25px; font-size: 28px;font-size: 28px; overflow: hidden;">........................................</div>
			<div style="text-align: center; line-height: 30px; font-size: 18px;">预计年化收益</div>
			<div style="text-align: center; line-height: 30px; font-size: 18px;"> 
			</div>
		</div>
	</div>
	<table id="table1" style="margin-top: 10px;">
		<tr>
			<td>
				<img src="img/benxi.png" style="height: 20px;" />
				<span style="padding-left:5px; color:#888;">本息保障</span>
			</td>
			<c:if test="${financialTarget.type=='CPB' }">
				<td>
					<img src="img/zdfk.png" style="height: 25px;" />
					<span style="padding-left:2px; color:#888;">自动返款</span>
				</td>
			</c:if>
			<c:if test="${financialTarget.type=='SCB' }">
				<td>
					<img src="img/hqlc.png" style="height: 25px;" />
					<span style="padding-left:2px; color:#888;">活期理财</span>
				</td>
			</c:if>
			<td>
				<img src="img/cnhg.png" style="height: 25px;" />
				<span style="padding-left:2px; color:#888;">承诺回购</span>
			</td>
		</tr>
	</table>
	<table class="table2" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
		<tr>
			<td style="border-right: 1px solid #ccc;" class="money">￥${financialTarget.minAmount }元</td>
			<td class="money">￥${financialTarget.collectAmount-financialTarget.finishAmount }元</td>
		</tr>
		<tr>
			<td style="border-right: 1px solid #ccc; font-size:18px;">起投金额</td>
			<td style="font-size:18px;">剩余份额</td>
		</tr>
	</table>
	<div style="width: 100%; border-bottom: 1px solid #ccc; font-size: 0px; height: 2px;"></div>
	<table class="table2" cellspacing="0" cellpadding="0">
		<tr>
			<td><c:if test="${financialTarget.type=='CPB' }">起息时间：当日起息</c:if> <c:if test="${financialTarget.type=='SCB' }">起息时间：T(成交日)+1</c:if></td>
			<td>每人限购：${financialTarget.limitAmount }元</td>
		</tr>
	</table>
	<div style="width: 100%; border-bottom: 1px solid #f37b1d; font-size: 0px; margin-bottom:2px;"></div>
	<table class="table2" cellspacing="0" cellpadding="0">
		<tr>
			<td style="border-right: 1px solid #f37b1d;height:30px;vertical-align: middle;"><a href="financial_description.htm?id=${param.id }" style="color:#FF7433">项目描述</a></td>
			<td style="vertical-align: middle;"><a href="financial_buy_history.htm?id=${param.id }" style="color:#FF7433">投资记录</a></td>
		</tr>
	</table>
	<div style="width: 100%; border-bottom: 1px solid #f37b1d; font-size: 0px; margin-top:2px;"></div>
	<div style="text-align: center; margin-top: 20px; margin-bottom: 10px; color: #188FFF">
		<img src="img/safe.png" style="height: 18px; margin-right: 10px;" />${financialTarget.cashMark }
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
							<c:if test="${financialTarget.type=='CPB' }">${financialTarget.period }<input type="hidden" id="period" value="${financialTarget.period }" /></c:if>
							<c:if test="${financialTarget.type=='SCB' }"><input type="text" id="period" maxLength="4" style='width:30px;' /></c:if>
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
						<input type="hidden" id="interestRate" value="${financialTarget.annualizedRates }" />
						<input type="hidden" id="minAmount" value="${financialTarget.minAmount }" />
						<input type="hidden" id="collectAmount" value="${financialTarget.collectAmount }" />
						<input type="hidden" id="finishAmount" value="${financialTarget.finishAmount }" />
						<button type="button" id="computeIncome" style="border:1px solid #FF7433;border-radius:8px;padding:6px 40px;color:#FFF;background:#FF7433">计 算 收 益</button>
					</td>
				</tr>
			</tbody>
		</table>
		<c:choose>
			<c:when test="${financialTarget.status!='onsale' }">
				<a id="btnBuyNow" class="cantbuy">已售罄</a> 
			</c:when>
			<c:when test="${financialTarget.finishAmount>=financialTarget.collectAmount }">
				<a id="btnBuyNow" class="cantbuy">已售罄</a>
			</c:when>
			<c:otherwise>
				<a id="btnBuyNow" href="bid_form.htm?id=${financialTarget.id }&_channel=${param._channel}">立即理财</a>
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

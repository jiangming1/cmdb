<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>你投资-我返现</title>
<style>
*{
	margin: 0;
	padding: 0;
	font-family: "Microsoft YaHei", 'Helvetica Neue', Arial, 'Liberation Sans', FreeSans, sans-serif;
}
ul {
	list-style: none;
}
a {
	color: #FFF;
	text-decoration: none;
	border: none;
	outline: none;
}
a,button,input{	
/*	-webkit-tap-highlight-color: rgba(255, 255, 255, 0);	*/	/* 可以完全去掉点击显示的蓝色框	*/
/*	-webkit-user-modify: read-write-plaintext-only; */
}
a:focus{
	text-decoration:none;
	outline:none;
}
img{
	box-sizing: border-box;
	max-width: 100%;
	height: auto;
	vertical-align: middle;
	border: 0;
}
input{
	border: 0;
	outline:none;/*去除蓝色边框*/
}
.fl{
	float: left;
}
.fr{
	float: right;
}
.clearfix:before,.clearfix:after {
	display: table;
	content: " ";
	line-height: 0;
	width: 100%;
	visibility: hidden;
}
.clearfix:after { 
	clear: both; 
}
.btn-no-login{
    display: block;
    width: 80%;
    margin: 30px auto;
    height: 35px;
    line-height: 35px;
    text-align: center;
    background: #f74040;
    border-radius: 8px;
    box-shadow: 0 2px 0 #f74040;
}
.change_wrap{
	width: 90%;
	padding-top: 10%;
	background: url(img/invest_info.png) no-repeat;
	background-size: 100%;
	margin: 0 auto;
	overflow: hidden;
}
table{
	border-collapse:collapse;
	border-spacing:0;
}
.tab-info tr td{
	height: 26px;
	line-height: 26px;
	text-align: center;
}
.padding-five{
	padding: 5px;
}
.btn-cash{
	width: 80%;
	margin: 0 auto;
	text-align: center;
	background: #f74040;
	box-shadow: 0 2px 0 #df1515;
	border-radius: 8px;
}
.btn-cash-gray{
	width: 80%;
	margin: 0 auto;
	text-align: center;
	background: #888;
	box-shadow: 0 2px 0 #777;
	border-radius: 8px;
}
.btn-button1{
	display: inline-block;
	line-height: 30px;
	text-align: center;
	background: #f74040;
	box-shadow: 0 2px 0 #df1515;
	border-radius: 8px;
}
.btn-button2{
	display: inline-block;
	line-height: 30px;
	text-align: center;
	background: #FF492B;
	box-shadow: 0 2px 0 #cf2d13;
	border-radius: 8px;
}
.rule-info table{
	width: 100%;
}
.rule-tab1 tr td,.rule-tab2 tr td{
	height: 26px;
	line-height: 26px;
}
.rule-tab2 tr td{ 
	text-align: center;
	border: 1px solid #593e02;
}
.ver-top{
	vertical-align: top;
}
.mask{
	position: fixed;
	left: 0;
	top: 0;
	background: rgba(0,0,0,0.6);
	width: 100%;
	height: 100%;
	z-index: 2;
	display: none;
}
.exchange-record-wrap{
	width: 80%;
	padding: 5%;
	height: 320px;
	position: fixed;
	left: 5%;
	top: 50%;
	margin-top: -160px;
	background: #FFF;
	z-index: 5;
	border-radius: 8px;
	display: none;
}
.record-title{
	text-align: center;
	width: 90%;
	margin: 0 auto 10px;
	color: #593e02;
	font-size: 20px;
}
.btn-close-btn2{
	width: 35%;
	margin: 20px auto;
	line-height: 30px;
	background: #FF492B;
	box-shadow: 0 2px 0 #df1515;
	border-radius: 5px;
	color: #FFF;
	text-align: center;
}
.tab-record tr td{
	padding: 5px 0;
}
.receive-wrap{
	width: 80%;
	padding: 5%;
	height: 240px;
	position: fixed;
	left: 5%;
	top: 50%;
	margin-top: -132px;
	background: #FFF;
	z-index: 5;
	border-radius: 8px;
	border: 1px solid red;
	display: none;
}
</style>
</head>
<body style="background: #ffcb59;">
<input type="hidden" id="device" value="${param.device }" />
<input type="hidden" id="app_token" value="${param.app_token }" />
<div class=""><img src="img/20160921banner.png"></div>
<c:choose>
	<c:when test="${loginStatus == 0 }">
		<!-- - 未登录状态按钮 - -->
		<a href="javascript:void(0);" class="btn-no-login">登录投资，立马返现</a>
	</c:when>
	<c:otherwise>
		<div class="change_wrap" >
			<div class="change_detail" style="width: 100%;color: #FFF;">
				<table class="tab-info" style="width: 100%;">
					<tr>
						<td>理财期限</td>
						<td>投资金额</td>
						<td>可兑换现金红包</td>
					</tr>
					<tr>
						<td>30-50天</td>
						<td><span id="amount30">${amount30 }</span>元</td>
						<td class="padding-five">
							<c:choose>
								<c:when test="${amount30 < 5000 }">
									<div class="btn-cash-gray">0元</div>
								</c:when>
								<c:when test="${amount30 >= 5000 && amount30 < 10000}">
									<div class="btn-cash" rel="amount30">2元</div>
								</c:when>
								<c:when test="${amount30 >= 10000 && amount30 < 20000}">
									<div class="btn-cash" rel="amount30">5元</div>
								</c:when>
								<c:when test="${amount30 >= 20000 && amount30 < 50000}">
									<div class="btn-cash" rel="amount30">10元</div>
								</c:when>
								<c:when test="${amount30 >= 50000 && amount30 < 100000}">
									<div class="btn-cash" rel="amount30">30元</div>
								</c:when>
								<c:when test="${amount30 >= 100000}">
									<div class="btn-cash" rel="amount30">70元</div>
								</c:when>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td>50-80天</td>
						<td>${amount60 }元</td>
						<td class="padding-five">
							<c:choose>
								<c:when test="${amount60 < 5000 }">
									<div class="btn-cash-gray">0元</div>
								</c:when>
								<c:when test="${amount60 >= 5000 && amount60 < 10000}">
									<div class="btn-cash" rel="amount60">6元</div>
								</c:when>
								<c:when test="${amount60 >= 10000 && amount60 < 20000}">
									<div class="btn-cash" rel="amount60">15元</div>
								</c:when>
								<c:when test="${amount60 >= 20000 && amount60 < 50000}">
									<div class="btn-cash" rel="amount60">35元</div>
								</c:when>
								<c:when test="${amount60 >= 50000 && amount60 < 100000}">
									<div class="btn-cash" rel="amount60">90元</div>
								</c:when>
								<c:when test="${amount60 >= 100000}">
									<div class="btn-cash" rel="amount60">200元</div>
								</c:when>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td>80天以上</td>
						<td>${amount90 }元</td>
						<td class="padding-five">
							<c:choose>
								<c:when test="${amount90 < 5000 }">
									<div class="btn-cash-gray">0元</div>
								</c:when>
								<c:when test="${amount90 >= 5000 && amount90 < 10000}">
									<div class="btn-cash" rel="amount90">20元</div>
								</c:when>
								<c:when test="${amount90 >= 10000 && amount90 < 20000}">
									<div class="btn-cash" rel="amount90">45元</div>
								</c:when>
								<c:when test="${amount90 >= 20000 && amount90 < 50000}">
									<div class="btn-cash" rel="amount90">100元</div>
								</c:when>
								<c:when test="${amount90 >= 50000 && amount90 < 100000}">
									<div class="btn-cash" rel="amount90">280元</div>
								</c:when>
								<c:when test="${amount90 >= 100000}">
									<div class="btn-cash" rel="amount90">600元</div>
								</c:when>
							</c:choose>
						</td>
					</tr>
				</table>
				<div class="clearfix" style="width: 90%;margin: 5px auto;">
					<a href="javascript:void(0);" class="btn-button1 btn-exchange-record fl" style="width: 35%;">兑换记录</a>
					<a href="../financial_zone.htm?tab=zone&app_view=zone" class="btn-button1 fr" style="width: 55%;">投资领现金红包</a>
				</div>
				<div style="margin-left: 5%; font-size: 14px; margin-top: 10px;">*现金以理财金的形式发放，可直接提现</div>
			</div>
		</div>
	</c:otherwise>
</c:choose>

<div class="rule-info" style="color: #593e02;width: 86%;margin: 0 auto;padding: 2% 3%;">
	<div style="text-align: center; font-weight: bold; padding: 10px 0px;">活动规则</div>
	<table class="rule-tab1">
		<tr>
			<td>1.</td>
			<td>活动时间： 9.23-9.29</td>
		</tr>
		<tr>
			<td style="vertical-align: top;">2.</td>
			<td>活动期间用户累计投资达到规定金额，即可兑换现金红包，奖励以理财金形式发放，可直接提现</td>
		</tr>
	</table>
	<table class="rule-tab2" style="margin-top: 10px; font-size:14px;">
		<tr>
			<td>投资金额/投资期限</td>
			<td>30-50天</td>
			<td>50-80天</td>
			<td>80天以上</td>
		</tr> 
		<tr>
			<td>5000</td>
			<td>2</td>
			<td>6</td>
			<td>20</td>
		</tr> 
		<tr>
			<td>10000</td>
			<td>5</td>
			<td>15</td>
			<td>45</td>
		</tr> 
		<tr>
			<td>20000</td>
			<td>10</td>
			<td>35</td>
			<td>100</td>
		</tr> 
		<tr>
			<td>50000</td>
			<td>30</td>
			<td>90</td>
			<td>280</td>
		</tr> 
		<tr>
			<td>100000</td>
			<td>70</td>
			<td>200</td>
			<td>600</td>
		</tr> 
	</table>
	<div style="margin-top: 10px; margin-bottom: 30px; font-size:13px;">*活动最终解释权归来存吧所有</div>
</div>
<!-- - 兑换记录弹出框 - -->
<div class="mask"></div>
<div class="exchange-record-wrap">
	<div class="record-title" style="">兑换记录</div>
	<div class="btn-close btn-close-btn1" style="position: absolute; top: 5px;right: 10px;"><img src="img/icon-close.png" style="width: 30px;"></div>
	<div style="height: 240px;overflow: auto;">
		<table class="tab-record" style="width: 100%;text-align: center;color: #593e02; font-size: 15px;">
			<tr>
				<td>现金红包</td>
				<td>兑换时间</td>
				<td>&nbsp;状态&nbsp;</td>
			</tr>
			<c:choose>
				<c:when test="${exchangeRecord != null && fn:length(exchangeRecord) > 0}">
					<c:forEach items="${exchangeRecord }" var="record" varStatus="status">
						<tr>
							<td class="ver-top">${record.cashAmount }元</td>
							<td><span>${record.createTime }</span></td>
							<c:choose>
								<c:when test="${record.status == 1 }">
									<td class="ver-top">已发放</td>
								</c:when>
								<c:otherwise>
									<td class="ver-top">未发放</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td class="ver-top" colspan="3" style="color:#888; font-size: 20px;">暂无兑换记录</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	<div class="btn-close btn-close-btn2">关闭</div>
</div>
<!-- - 领取弹出框 - -->
<div class="receive-wrap" >
	<div class="record-title" id="exchange-title">兑换现金红包</div>
	<div class="btn-close" style="position: absolute; top: 5px;right: 10px;"><img src="img/icon-close.png" style="width: 30px;"></div>
	<div style="text-align: center;position: relative;margin: 20px 0;">
		<img src="img/red-box-bg.png" style="width: 50%;">
		<input type="hidden" id="period" name="period" value="0" />
		<div style="position: absolute;left: 25%;top: 12%;width: 50%;text-align: center;color: #ff492b"><span style="font-size: 30px;font-weight: bold;" id="cash-amount">600</span>元</div>
	</div>
	<div id="exchange-tips" style="color: #593e02; display:none;">已经以理财金形式发放至账户</div>
	<div class="clearfix" style="margin-top: 10px;">
		<a href="../financial_zone.htm?tab=zone&app_view=zone" class="fl btn-button2" style="width: 50%;">再投点　换大的</a>
		<a href="javascript: void(0);" class="fr btn-button2" id="btn-exchange" style="width: 45%;">确认兑换</a>
		<a href="javascript: void(0);" class="fr btn-button2" id="btn-continue" style="width: 45%; display:none;">继续兑换</a>
	</div>
</div>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".change_wrap").height($(".change_wrap").width()*0.9*579/692);
	$(".btn-exchange-record").click(function(){
		$(".mask,.exchange-record-wrap").show();
	})
	$(".btn-close, #btn-continue").click(function(){
// 		$(".mask,.exchange-record-wrap,.receive-wrap").hide();
		window.location.reload();
	})
	$(".btn-cash").click(function(){
		$(".mask,.receive-wrap").show();
		var cashAmount = $(this).text();
		if(cashAmount) {
			$("#cash-amount").text(cashAmount.substr(0, cashAmount.length-1));
		}
		var periodRel = $(this).attr("rel");
		if(periodRel) {
			$("#period").val(periodRel.substr(periodRel.length-2, periodRel.length));
		}
	})
	
	$(".btn-no-login").click(function() {
		if($("#device").val()) {
			window.location.href="invest_cash_back.htm?app_view=login&device="+$("#device").val();
		} else {
			window.location.href="../login.htm?tab=account&returnUrl=activity/invest_cash_back.htm"
		}
	});
	
	$("#btn-exchange").click(function() {
		var param = {
			t : new Date(),
			period : $("#period").val(),
			app_token : $("#app_token").val()
		};
		$.post("exchange_cash.htm", param, function(data){
			if(data.code=="success") {
				$("#exchange-title").text("恭喜");
				$("#exchange-tips").show();
				$("#btn-exchange").remove();
				$("#btn-continue").show();
			} else {
				window.location.reload();
			}
			
		},"json");
// 		$("#btn-exchange").attr("href", "invest_cash_back.htm");
	});
	
})
</script>
</body>
</html>
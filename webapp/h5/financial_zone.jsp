<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>理财专区</title>
<link type="text/css" rel="stylesheet" href="css/lcb_wx_common.css?v=201611171733">
<link type="text/css" rel="stylesheet" href="financial_zone.css?v=201608291718">
<link type="text/css" rel="stylesheet" href="activity.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<style type="text/css">
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
.tab-financial-zone{
	height: 40px; 
	background-color: #fff;
	padding: 10px 12%;
}
.btn-financial-zone{
	width: 50%;
	height: 100%;
	line-height: 40px; 
	text-align: center;
	float: left;
	box-sizing: border-box;
}
.btn-current{
	border: 1px solid #ff5a2c;
	border-top-left-radius: 8px;
	border-bottom-left-radius: 8px;
	border-right: 0px;
	color: #ff7d59;	
	background-color: white;
}
.btn-regular{
	border: 1px solid #ff5a2c;
	border-top-right-radius: 8px;
	border-bottom-right-radius: 8px;
	border-left: 0px;
	color: #ff7d59;
	background-color: white;
}
.btn-financial-active{
	background-color: #ff5a2c;
	color: white;
}
.current-info table tr td{
	text-align: center;
	line-height: 30px;
	width: 50%;
}
.btn-withdraw,.btn-buy{
	width: 35%;
	text-align: center;
	border: 1px solid #FF5A2C;
	line-height: 40px;
	border-radius: 40px;
}
.btn-withdraw{
	float: left;
	color: #FF5A2C;
	margin-left: 10%
}
.btn-buy{
	float: right;
	background-color: #FF5A2C;
	color: #FFF;
	margin-right: 10%;
}
.backBar table td {
	border-bottom: 0px;
}
</style>
</head>
<body style="background-color: #f2f2f4;">
	<div class="backBar">
		<table>
			<tr>
				<td style="width: 50px;"></td>
				<td>理财专区</td>
				<td style="width: 50px;"></td>
			</tr>
		</table>
	</div>
	<div class="tab-financial-zone clearfix">
		<div class="btn-current btn-financial-zone <c:if test='${param.tab1 !=null && param.tab1 !="" && param.tab1=="current" }'>btn-financial-active</c:if>">活期理财</div>
		<div class="btn-regular btn-financial-zone <c:if test='${param.tab1 ==null || param.tab1 =="" || param.tab1!="current" }'>btn-financial-active</c:if>">定期理财</div>
	</div>
	<div class="tab-select-con" style="width: 100%; margin-bottom: 50px;">
		<div class="current-con" style="display: <c:choose><c:when test='${param.tab1 !=null && param.tab1 !="" && param.tab1=="current" }'>block</c:when><c:otherwise>none</c:otherwise></c:choose>;">
			<div style="background: #FF9F2C;padding: 10px;color: #FFF;">
				<div><img src="img/icon_xiaozhu.png" style="width: 25px;margin-right: 10px;">随存宝</div>
				<div style="text-align: center;margin: 5px 0;">昨日收益（元）
<!-- 					<span class="btn_conceal"><img src="img/icon_show_money.png" style="width: 24px;"></span> -->
				</div>
				<div class="income-number" style="font-size: 30px;text-align: center;">
					<c:choose>
						<c:when test="${loginStatus == 1 }">
							<c:choose>
								<c:when test="${yesterdayProfit > 0 }"><fmt:formatNumber value="${yesterdayProfit }" pattern="##.##" minFractionDigits="2" /></c:when>
								<c:otherwise>暂无收益</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>— —</c:otherwise>
					</c:choose>
				</div>
				<div style="text-align: center;margin: 5px 0;">累计收益（元）</div>
				<div class="income-number" style="font-size: 20px;text-align: center;">
					<c:choose>
						<c:when test="${loginStatus == 1 }">
							<fmt:formatNumber value="${totalProfit }" pattern="##.##" minFractionDigits="2" />
						</c:when>
						<c:otherwise>— —</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="current-info" style="padding: 10px 0; background-color: #fff;">
				<table style="width: 100%;">
					<tr style="color: #999;">
						<td>万元收益/日</td>
						<td>年化收益</td>
					</tr>
					<tr style="font-size: 24px;color: #FF5A2C;border-bottom: 1px solid #ECECEC;">
						<td style="padding-bottom: 10px;">
							<c:choose>
								<c:when test="${loginStatus == 1 }">
									<fmt:formatNumber value="${tenThousandDayProfit }" pattern="##.##" minFractionDigits="2" />
								</c:when>
								<c:otherwise>1.91</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${loginStatus == 1 }">
									<fmt:formatNumber value="${annualizedRates }" pattern="##.##" minFractionDigits="2" />
								</c:when>
								<c:otherwise>7.00</c:otherwise>
							</c:choose>%
						</td>
					</tr>
					<tr style="color: #999;">
						<td style="padding-top: 10px;">持有金额（元）</td>
						<td rowspan="2" style="vertical-align: middle;"><a href="sui_cun_bao_balance_list.htm" style="color: #999;">交易记录</a></td>
					</tr>
					<tr style="font-size: 24px;color: #FF5A2C;">
						<td>
							<c:choose>
								<c:when test="${loginStatus == 1 }">
									<fmt:formatNumber value="${balance }" pattern="##.##" minFractionDigits="2" />
								</c:when>
								<c:otherwise>— —</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</table>
			</div>
			<div class="clearfix" style="padding: 10px 0; margin-top: 15px;">
				<a href="sui_cun_bao_withdraw_form.htm" class="btn-withdraw">提现</a>
				<a href="bid_form.htm?id=${scbTargetId }" class="btn-buy">买入</a>
			</div>
		</div>
		<div class="regular-con" style="width:100%; margin-bottom:50px; margin-top:8px; display: <c:choose><c:when test='${param.tab1 !=null && param.tab1 !="" && param.tab1=="current" }'>none</c:when><c:otherwise>block</c:otherwise></c:choose>;">
			<c:forEach items="${targetList }" var="target">
				<a class="a2Detail " href="financial_detail.htm?id=${target.id }&_channel=weixin">
					<table class="table1 <c:if test="${target.finishAmount >= target.collectAmount }">saleout</c:if> <c:if test="${target.targetMark == 'hot' }">tag-hot</c:if> <c:if test="${target.targetMark == 'activity' }">tag-huodong</c:if>" cellspacing="0" cellpadding="0">
						<tr class="tr1">
							<td colspan="2">${target.name }
								<c:if test="${target.incrRate > 0 }">
									<span class="incr-rates">加送<fmt:formatNumber value="${target.incrRate }" pattern="##.##" minFractionDigits="1" />%</span>
								</c:if>
	<%-- 							<c:if test="${target.newInvestor }">(新手标)</c:if> --%>
							</td>
							<td rowspan="2" class="progressTr">
								<c:choose>
									<c:when test="${target.finishAmount >= target.collectAmount }">
										<img alt="" src="img/saleout.png" style="width: 80px; margin: 10px 15px -10px 0px;" />
									</c:when>
									<c:otherwise>
										<div style="position: absolute; right:0px; top: -1px;">
											<c:if test="${target.targetMark == 'hot' }">
												<img src="img/icon_hot.png" style="width:50%; vertical-align: top;" />
											</c:if>
											<c:if test="${target.targetMark == 'activity' }">
												<img src="img/icon_huodong.png" style="width:50%; vertical-align: top;" />
											</c:if>
										</div>
										<canvas percent="${target.finishAmount*100/target.collectAmount }" class="progress" width="200" height="200"></canvas>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr class="tr2">
							<td class="td1">
								<div class="ratesTr">
									<c:choose>
										<c:when test="${target.incrRate > 0 }">
											<span class="rates"><fmt:formatNumber value="${target.annualizedRates - target.incrRate}" pattern="##.##" minFractionDigits="1" /></span>%
										</c:when>
										<c:otherwise>
											<span class="rates"><fmt:formatNumber value="${target.annualizedRates }" pattern="##.##" minFractionDigits="1" /></span>%
										</c:otherwise>
									</c:choose>
								</div>
								<div class="words">预期年化</div>
							</td>
							<td class="td2">
								<div class="periodTr">
									<span class="period">${target.period }天</span>
								</div>
								<div class="words" style="padding-bottom:0px;">理财期限</div>
							</td>
						</tr>
					</table>
				</a>
			</c:forEach>
			<div style="text-align: center; padding-bottom: 10px;">
				<a href="financial_saleout_repayment.htm?tab=zone&t=<%=new Date()%>" class="btn-more"><span>已售罄${sellOutCount }个，已还款${repaymentCount }个，点击查看</span></a>
			</div>
		</div>
	</div>
	<div style="height: 4px; font-size: 0px;"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
	<script src="financial_zone.js?v=1"></script>
	<script src="activity.js?v=1"></script>
	<script type="text/javascript">
		$(function(){
			$(".btn-current").click(function(){
// 				$(this).addClass("btn-financial-active");
// 				$(".btn-regular").removeClass("btn-financial-active");
// 				$(".current-con").show();
// 				$(".regular-con").hide();
				window.location.href="financial_zone.htm?tab=zone&tab1=current&t="+new Date();
			});
			$(".btn-regular").click(function(){
// 				$(this).addClass("btn-financial-active");
// 				$(".btn-current").removeClass("btn-financial-active");
// 				$(".regular-con").show();
// 				$(".current-con").hide();
				window.location.href="financial_zone.htm?tab=zone&tab1=regular&t="+new Date();
			});
// 			$(".btn_conceal").click(function(){
// 				var imgUrl=$(this).children("img").attr("src");
// 				if( imgUrl == "img/icon_show_money.png"){
// 					$(this).children("img").attr("src","img/icon_hide_money.png");
// 					$(".income-number").text("****");
// 				}else{
// 					$(this).children("img").attr("src","img/icon_show_money.png");
// 				}
// 			});
		});
	</script>
</body>
</html>
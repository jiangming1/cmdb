<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<script src="js/jquery.min.js"></script>
<link rel="stylesheet" href="old_res/slider.css" type="text/css" />
<link type="text/css" rel="stylesheet" href="css/lcb_wx_common.css?v=201611171733"/>
<script src="old_res/amazeui.min.js"></script>
<script src="js/slider-H5.js"></script>
<link type="text/css" rel="stylesheet" href="activity.css">
<script src="activity.js"></script>
<title>首页</title>
<style type="text/css">
#div1 {
	text-align: center;
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

.btn-warning {
	border-radius: 4px;
	height: 40px;
	line-height: 40px;
	background-color: #337ab7;
	border-color: #337ab7;
	color: white;
}

.am-slider-default .am-control-nav {
	bottom: 10px;
}

#btnBuyNow {
	display: inline-block;
	line-height: 40px;
	width: 60%;
	background-color: #ff5a2c;
	color: white;
	text-decoration: none;
	border-radius: 10px;
}

.statistics-info {
	padding: 15px 10px;
	background-color: #fff;
}

.statistics-info table {
	width: 100%;
}
.statistics-info table td{
	padding: 3px;
}

.a2Detail {
	color: #000;
}

.table1 {
	width: 100%;
	background-color: #fff;
	margin-bottom: 8px;
	padding-bottom: 6px;
	border-bottom: 1px solid #ccc;
}

.tag-hot {
	border-top: 1px solid #ff5b2c;
}

.tag-huodong {
	border-top: 1px solid #ff9f2c;
}

.table1 td div {
	padding: 0px;
    padding-bottom: 5px;
}

.tr1 td {
	font-size: 15px;
	padding: 5px;
	padding-left: 20px;
}

.tr2 td {
	width: 33%;
}

.ratesTr {
	color: #ff5a2c;
	font-size: 16px;
}

.rates {
	font-size: 25px;
}

.periodTr {
	font-size: 12px;
}

.period {
	font-size: 20px;
	color: #ff5a2c;
}

.progressTr {
	text-align: right;
	padding-right: 10px;
/* 	border-bottom: 1px solid #ccc; */
	position: relative;
	padding: 10px 5px 0 10px;
}

.progress {
	width: 80px;
	margin: 10px 15px -10px 0px;
}

.td1 {
	padding-left: 20px;
}

.td2 {
	padding-left: 20px;
	text-align:center;
}

.table1:HOVER {
	background-color: #efefef;
}

.words {
	color: #555;
}

.saleout td,.saleout .ratesTr,.saleout .words{
	color: #ccc !important; 
}
.ico-scb {
	text-align: center;
	margin-bottom: -20px;
}
.ico-scb img{
	width: 80%;
}
.incr-rates {
	border: 1px solid #fc906a;
    border-radius: 11px;
    font-size: 12px;
    height: 12px;
    padding: 1px 3px;
	vertical-align: middle;
	display: inline-block;
	margin-top: -5px;
}
</style>
<script type="text/javascript">
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?c9ae2d80750f75bf824d5d4fa2c8fd5e";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
</head>
<body style="padding: 0px; margin: 0px; background-color: #f2f2f4;">
	<jsp:include page="bottom.jsp"></jsp:include>
	<div class="am-slider am-slider-default am-slider-a1" data-am-slider='{directionNav:false}' data-am-flexslider id="demo-slider-0" style="box-shadow: none;">
		<ul class="am-slides">
			<c:choose>
				<c:when test="${bannerArray != null && fn:length(bannerArray) > 0}">
					<c:forEach items="${bannerArray }" var="banner" varStatus="status">
						<li><a href="${banner.href }"><img src="${banner.pic }" /></a></li>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<li><a href="invite_info.htm?channel="><img src="http://laicunba.b0.upaiyun.com/lcb/invite_banner.png" /></a></li>
					<li><a href="security_guarantee.htm"><img src="http://pic.laicunba.com/up/2.png" /></a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	
	<div class="statistics-info">
		<table>
			<tr>
				<td rowspan="2" width="15%"><img src="img/icon-rocket.png" style="height:36px;"></td>
				<td width="50%">用户累计投资(万元)</td>
				<td width="35%">累计注册(人)</td>
			</tr>
			<tr>
				<td style="color:#ff5422;">${statisticsData.bid_amount }</td>
				<td style="color:#ff5422;">${statisticsData.bid_user }</td>
			</tr>
		</table>
	</div>
	
	<div class="regular-con" style="width:100%; margin-bottom:50px;">
		<div style="color: #a3a3a3; padding: 10px 15px;">产品推荐</div>
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
	</div>

<%-- 	<c:if test="${financingTarget!=null }"> --%>
<!-- 		<div id="div1" style="margin-top: 20px;"> -->
<%-- 			<div style="line-height: 30px;font-size:22px;margin-bottom:5px;">${financingTarget.name }</div> --%>
<!-- 			<div style="background: url('img/circle31.png') no-repeat 50% 0px; width: 300px; margin: 0px auto;"> -->
<!-- 				<br /> -->
<%-- 				<div style="line-height: 30px;font-size:18px;">理财期限 <span style="color:#ff5a2c;">${financingTarget.period }</span> 天</div> --%>
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${financingTarget.incrRate > 0 }"> --%>
<%-- 						<div style="line-height: 60px; font-size: 50px; color: #ff6005;margin-top:25px;"> <fmt:formatNumber value="${financingTarget.annualizedRates - financingTarget.incrRate}" pattern="##.##" minFractionDigits="1" />%</div> --%>
<%-- 						<div style="text-align: center; color: #fe7c4e; border-radius: 15px; border: 1px solid #fe885f; left:210px; font-size:12px;position: absolute; top:325px; padding: 1px 3px; vertical-align: middle;height: 12px;">加送<fmt:formatNumber value="${financingTarget.incrRate }" pattern="##.##" minFractionDigits="1" />%</div> --%>
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<%-- 						<div style="line-height: 60px; font-size: 50px; color: #ff6005;margin-top:25px;"> <fmt:formatNumber value="${financingTarget.annualizedRates }" pattern="##.##" minFractionDigits="1" />%</div> --%>
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
<!-- 				<div style="width: 60%; color:#feb381; margin: 0px auto; margin-bottom: 10px; font-size: 28px; overflow: hidden; margin-top:-10px;">..............................</div> -->
<!-- 				<div style="line-height: 40px; font-size: 18px;">预计年化收益</div> -->
<!-- 			</div> -->
<!-- 			<table id="table1" style="margin-bottom:20px;"> -->
<!-- 				<tr> -->
<!-- 					<td> -->
<!-- 						<img src="img/benxi.png" style="height: 20px;" /> -->
<!-- 						<span style="padding-left:5px; color:#888;">本息保障</span> -->
<!-- 					</td> -->
<!-- 					<td> -->
<!-- 						<img src="img/zdfk.png" style="height: 25px;" /> -->
<!-- 						<span style="padding-left:2px; color:#888;">自动返款</span> -->
<!-- 					</td> -->
<!-- 					<td> -->
<!-- 						<img src="img/cnhg.png" style="height: 25px;" /> -->
<!-- 						<span style="padding-left:2px; color:#888;">承诺回购</span> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<%-- 			<a id="btnBuyNow"  href="financial_detail.htm?id=${financingTarget.id }">${financingTarget.minAmount }元起购</a> --%>
<!-- 			<div style="text-align: center; margin-top: 20px; margin-bottom: 10px; color: #188FFF"> -->
<%-- 				<img src="img/safe.png" style="height: 18px; margin-right: 10px;" />${financingTarget.cashMark } --%>
<!-- 			</div> -->
<!-- 			<div style="height: 60px;"></div> -->
<!-- 		</div> -->
<%-- 	</c:if>  --%>
	<script type="text/javascript" src="financial_zone.js?v=201611161635"></script>
	<script type="text/javascript">
	$(function(){
		 $("html,body").animate({scrollTop: 100}, 100);  
	});
	
	</script>
</body>
</html>
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
<link type="text/css" rel="stylesheet" href="css/lcb_wx_common.css">
<link type="text/css" rel="stylesheet" href="financial_zone.css">
<link type="text/css" rel="stylesheet" href="activity.css">
<script src="js/jquery.min.js"></script>
</head>
<body style="background-color: #f2f2f2;">
	<div class="backBar">
		<table>
			<tr>
				<td style="width: 50px;"><a href="financial_zone.htm?tab=zone&t=<%=new Date()%>" style="line-height: 44px;">〈</a></td>
				<td>更多</td>
				<td style="width: 50px;"></td>
			</tr>
		</table>
	</div>
	
	<div id="topLayout">
		<div>
			<a href="javascript:void(0);" class="selected" rel="saleout">已售罄</a>
		</div>
 		<div>
 			<a href="javascript:void(0);" rel="repayment">已还款</a>
 		</div>
	</div>
	<div id="saleoutDiv" style="width: 100%; margin-bottom: 50px;">
		<c:forEach items="${saleoutList }" var="target">
			<a class="a2Detail" href="financial_detail.htm?id=${target.id }&_channel=weixin">
				<table class="table1 saleout" cellspacing="0" cellpadding="0">
					<tr class="tr1">
						<td colspan="2">${target.name }
							<c:if test="${target.incrRate > 0 }">
								<span class="incr-rates">加送${target.incrRate }%</span>
							</c:if>
						</td>
						<td rowspan="2" class="progressTr">
							<c:choose>
								<c:when test="${target.finishAmount >= target.collectAmount }">
									<img alt="" src="img/saleout.png" style="width: 80px; margin: 10px 15px -10px 0px;" />
								</c:when>
								<c:otherwise>
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
										<span class="rates">${target.annualizedRates - target.incrRate}</span>%
									</c:when>
									<c:otherwise>
										<span class="rates">${target.annualizedRates }</span>%
									</c:otherwise>
								</c:choose>
							</div>
							<div class="words">复合年化</div>
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
	<div id="repaymentDiv" style="width: 100%; margin-bottom: 50px; display:none;">
		<c:forEach items="${repaymentList }" var="target">
			<a class="a2Detail" href="financial_detail.htm?id=${target.id }&_channel=weixin">
				<table class="table1 saleout" cellspacing="0" cellpadding="0">
					<tr class="tr1">
						<td colspan="2">${target.name }
							<c:if test="${target.incrRate > 0 }">
								<span class="incr-rates">加送${target.incrRate }%</span>
							</c:if>
						</td>
						<td rowspan="2" class="progressTr">
							<c:choose>
								<c:when test="${target.finishAmount >= target.collectAmount }">
									<img alt="" src="img/repayment.png" style="width: 80px;" />
								</c:when>
								<c:otherwise>
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
										<span class="rates">${target.annualizedRates - target.incrRate}</span>%
									</c:when>
									<c:otherwise>
										<span class="rates">${target.annualizedRates }</span>%
									</c:otherwise>
								</c:choose>
							</div>
							<div class="words">复合年化</div>
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
	<div style="height: 4px; font-size: 0px;"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
	<script src="financial_zone.js?v=1"></script>
	<script src="activity.js?v=1"></script>
</body>
</html>
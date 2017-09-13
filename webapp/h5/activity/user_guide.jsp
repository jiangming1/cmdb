<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<link type="text/css" rel="stylesheet" href="../css/lcb_wx_common.css">
<link type="text/css" rel="stylesheet" href="../financial_zone.css?v=201608291724">
<link type="text/css" rel="stylesheet" href="../activity.css">
<script src="../js/jquery.min.js"></script>
<script src="../financial_zone.js"></script>
<title>用户向导</title>
</head>
<style>
/* body {
	background: url("img/user_guide.png") no-repeat left top;
	background-size: 100%;
} */

.backBar table {
	width: 100%;
	height: 50px;
	background: #fff;
	font-size: 20px;
}

.backBar table td {
	text-align: center;
	color: white;
}

.backBar a {
	display: inline-block;
	width: 100%;
	height: 100%;
	text-decoration: none;
	line-height: 50px;
	color: white;
}

.target_div{
	position:absolute;
	top:150%;
	width:94%;
	left:3%;
}

.title{
	position:relative;
	color:#EF9485;
	font-size:13px;
	text-align:center;
	padding:30px 0 15px 0;
}

table{
	box-shadow:0 3px 3px #efe1d8;
}
</style>
<body style="padding: 0px; margin: 0px;">
	<c:if test="${param.device==null||param.device=='' }">
		<div class="backBar">
			<table>
				<tr>
					<td style="width: 50px;"><a href="javascript:history.go(-1)">〈</a></td>
					<td>新手引导</td>
					<td style="width: 50px;"></td>
				</tr>
			</table>
		</div>
	</c:if>
 <img src="img/user_guide.png" width="100%">
<div class="target_div">
<div class="title">随存宝，随存随取！</div>
		<c:choose>
			<c:when test="${scb==null }">
				<div style="line-height: 100px; text-align: center; line-height: 100px; color: #ccc">暂时缺货,请持续关注</div>
			</c:when>
			<c:otherwise>
				
				<a class="a2Detail" href="?app_view=detail&id=${scb.id }">
					<table class="table1" cellspacing="0" cellpadding="0" style="height:95px; margin-bottom: 0px;">
<!-- 						<tr class="tr1"> -->
<%-- 							<td colspan="2">${scb.name }</td> --%>
<%-- 							<td rowspan="2" class="progressTr"><canvas percent="${scb.finishAmount/scb.collectAmount }" class="progress" width="200" height="200"></canvas></td> --%>
<!-- 						</tr> -->
						
						<tr class="tr1">
							<td width="33%">随存随取</td>
							<td width="33%" rowspan="2">
								<div class="ico-scb"><img src="../img/ico-scb.png" /></div>
							</td>
							<td rowspan="2" class="progressTr">
								<c:choose>
									<c:when test="${scb.finishAmount >= scb.collectAmount }">
										<img alt="" src="../img/saleout.png" style="width: 80px;" />
									</c:when>
									<c:otherwise>
										<canvas percent="${100*scb.finishAmount/scb.collectAmount }" class="progress" width="200" height="200"></canvas>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr class="tr2">
							<td class="td1">
								<div class="ratesTr">
									<span class="rates">${scb.annualizedRates }</span>%
								</div>
								<div class="words">复合年化</div>
							</td>
						</tr>
					</table>
				</a>
			</c:otherwise>
		</c:choose>
		
		<c:forEach items="${financingTargets }" var="target" varStatus="status">
		<c:if test="${status.index<3 }">
		<c:choose>
		<c:when test="${target.newInvestor}">
			<div class="title">超高收益，新手入门！</div>
		</c:when>
		<c:otherwise >
			<div class="title">票据理财，稳定收益好！</div>
		</c:otherwise>
		</c:choose>
			<a class="a2Detail " href="?app_view=detail&id=${target.id }">
				<table class="table1 <c:if test="${target.finishAmount >= target.collectAmount }">saleout</c:if> <c:if test="${target.targetMark == 'hot' }">tag-hot</c:if> <c:if test="${target.targetMark == 'activity' }">tag-huodong</c:if>" cellspacing="0" cellpadding="0">
					<tr class="tr1">
						<td colspan="2">${target.name }
							<c:if test="${target.incrRate > 0 }">
								<span class="incr-rates">加送${target.incrRate }%</span>
							</c:if>
<%-- 							<c:if test="${target.newInvestor }">(新手标)</c:if> --%>
						</td>
						<td rowspan="2" class="progressTr">
							<c:choose>
								<c:when test="${target.finishAmount >= target.collectAmount }">
									<img alt="" src="../img/saleout.png" style="width: 80px; margin: 10px 15px -10px 0px;" />
								</c:when>
								<c:otherwise>
									<div style="position: absolute; right:0px; top: -1px;">
										<c:if test="${target.targetMark == 'hot' }">
											<img src="../img/icon_hot.png" style="width:50%; vertical-align: top;" />
										</c:if>
										<c:if test="${target.targetMark == 'activity' }">
											<img src="../img/icon_huodong.png" style="width:50%; vertical-align: top;" />
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
			</c:if>
		</c:forEach>
		
</div>
</body>
</html>
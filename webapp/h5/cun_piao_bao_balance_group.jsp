<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>来存吧</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<style type="text/css">
* {
	font-size: 1em;
	font-family: "微软雅黑"
}

.backBar {
	border-bottom: 1px solid #E6E6E6;
}

.backBar table {
	width: 100%;
	height: 50px;
	background-color: #FFF;
	font-size: 20px;
}

.backBar table td {
	text-align: center;
}

.backBar a {
	display: inline-block;
	width: 100%;
	height: 100%;
	text-decoration: none;
	line-height: 50px;
	color: #FF5A2C;
}

table{
	border-collaspe:collaspe;
	border-spacing:0;
}

img{
	box-sizing: border-box;
	max-width: 100%;
	height: auto;
	vertical-align: middle;
	border: 0;
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

.c1 {
	text-align: center;
}

.table1 {
	width: 100%;
	background-color: white;
	border-bottom: 1px solid #ccc;
}

.tr1 td {
	padding: 10px 0px 0px 10px;
}

.tr2 td {
	padding: 0px 0px 10px 10px;
	color: #ccc;
}

.a1 {
	
}

.splitLine{
	line-height: 50px;
	height: 50px;
	text-align: center;
	color: gray;
}

.tips{
	padding: 0 4%;
	height: 40px;
	line-height: 40px;
	color: #666;
}

.order{
	display: block;
	width: 100%;
	padding: 0 4%;
	border-bottom: 1px solid #B3B3B3;
	position: relative;
	background-color: #fff;
}

.order-last{
	border: 0;
}

.order table{
	width: 100%;
}

.order table tr td{
	height: 30px;
	line-height: 30px;
}

.color-times{
	color: #999;
}

.color-targets{
	color: #636363;
}

.txt-right{
	text-align: right; 
}

.dies-venit-tips{
	position: absolute;
	top: 10%;
	right: 18%;
}

a {
    text-decoration: none;
}
</style>
</head>
<body style="background-color: #f2f2f2">
	<c:if test="${param.device==null||param.device=='' }">
		<div class="backBar">
			<table>
				<tr>
					<td style="width: 50px;"><a href="my_account.htm?tab=account&t=<%=new Date()%>"><img src="img/icon_fanhui.png" style="height: 40px;"></a></td>
					<td>交易记录</td>
					<td style="width: 50px;"></td>
				</tr>
			</table>
		</div>
	</c:if>
	<c:choose>
		<c:when test="${scbGroupVO == null && (noExpireFixBidVOList == null || fn:length(noExpireFixBidVOList) <= 0) && (expireFixBidVOList == null || fn:length(expireFixBidVOList) <= 0) && (allFixBidVOList == null || fn:length(allFixBidVOList) <= 0) }">
			<div style="text-align: center; margin-top: 40%;">
				<img src="img/icon_wujilu.png" style="width: 40%;" />
				<div style="margin-top: 6%; text-align: center; color: #808080; font-size: 16px;">暂无交易记录</div>
			</div>
		</c:when>
		<c:otherwise>
			<div>
				<c:if test="${scbGroupVO != null }">
					<a class="a1" href="sui_cun_bao_balance_list.htm?expire=false&device=${param.device }&app_token=${param.app_token }">
						<table class="table1">
							<tr class="tr1">
								<td style="width: 200px; font-weight: bold;">随存宝</td>
								<td rowspan="2" style="color: #FF7433">${scbGroupVO.tradeCount}笔</td>
								<td rowspan="2" style="width: 30px;">〉</td>
							</tr>
							<tr class="tr2">
								<td>本金<fmt:formatNumber value="${scbGroupVO.totalPrincipal}" pattern="0.00" />元</td> 
							</tr>
						</table>
					</a>
				</c:if>
				
				<c:if test="${(noExpireFixBidVOList != null && fn:length(noExpireFixBidVOList) > 0) || (expireFixBidVOList != null && fn:length(expireFixBidVOList) > 0)}">
					<div id="listByGroup" style="width: 100%;margin-bottom: 15px;">
						<c:if test="${noExpireFixBidVOList != null && fn:length(noExpireFixBidVOList) > 0}">
							<div class="tips clearfix" style="">
								<span class="fl">未到期投资</span>
								<span class="fr" id="paixu_h"><img src="img/icon_paixu_a.png" style="width: 70px;"></span>
							</div>
							<c:forEach items="${noExpireFixBidVOList }" var="noExpireFixBidVO" varStatus="status">
								<a class="order <c:if test='${status.index == fn:length(noExpireFixBidVOList) - 1}'>order-last</c:if>" href="invest_order_detail.htm?device=${param.device }&app_token=${param.app_token }&bidId=${noExpireFixBidVO.bidId }">
									<table>
										<tr class="color-times">
											<td><fmt:formatDate value="${noExpireFixBidVO.payTime }" pattern="yyyy-MM-dd HH:mm:ss"/><c:if test="${noExpireFixBidVO.payMark=='ACTIVITY' }"><span style="color:#ff7433;font-size: 12px;">(体验金)</span></c:if></td>
											<td class="txt-right">交易成功</td>
										</tr>
										<tr class="color-targets">
											<td>${noExpireFixBidVO.targetName }</td>
											<td class="txt-right"><fmt:formatNumber value="${noExpireFixBidVO.buyAmount }" pattern="##.##" minFractionDigits="2" /></td>
										</tr>
									</table> 
								</a>
							</c:forEach>
						</c:if>
						
						<c:if test="${expireFixBidVOList != null && fn:length(expireFixBidVOList) > 0}">
							<div class="tips clearfix" style="">
								<span class="fl">已到期投资</span>
								<c:if test="${noExpireFixBidVOList == null || fn:length(noExpireFixBidVOList) <= 0 }">
									<span class="fr" id="paixu_h"><img src="img/icon_paixu_a.png" style="width: 70px;"></span>
								</c:if>
							</div>
							<c:forEach items="${expireFixBidVOList }" var="expireFixBidVO" varStatus="status">
								<a bid="${expireFixBidVO.bidId }"  class="order <c:if test='${status.index == fn:length(expireFixBidVOList) - 1}'>order-last</c:if>" href="invest_order_detail.htm?device=${param.device }&app_token=${param.app_token }&bidId=${expireFixBidVO.bidId }">
									<table>
										<tr class="color-times">
											<td><fmt:formatDate value="${expireFixBidVO.payTime }" pattern="yyyy-MM-dd HH:mm:ss"/><c:if test="${expireFixBidVO.payMark=='ACTIVITY' }"><span style="color:#ff7433;font-size: 12px;">(体验金)</span></c:if></td>
											<td class="txt-right status-tip">交易成功</td>
										</tr>
										<tr class="color-targets">
											<td>${expireFixBidVO.targetName }</td>
											<td class="txt-right"><fmt:formatNumber value="${expireFixBidVO.buyAmount }" pattern="##.##" minFractionDigits="2" /></td>
										</tr>
									</table> 
									<div class="dies-venit-tips"><img class="daozhang" src="img/icon_yidaozhang.png" style="width: 80px;"></div>
								</a>
							</c:forEach>
						</c:if>
					</div>
				</c:if>
				
				<c:if test="${allFixBidVOList != null && fn:length(allFixBidVOList) > 0 }">
					<div id="listByOrder" style="width: 100%;margin-bottom: 15px; display: none;">
						<div class="tips clearfix" style="">
							<span class="fl"></span>
							<span class="fr" id="paixu_a"><img src="img/icon_paixu_h.png" style="width: 70px;"></span>
						</div>
						<c:forEach items="${allFixBidVOList }" var="fixBidVO" varStatus="status">
							<a class="order <c:if test='${status.index == fn:length(allFixBidVOList) - 1}'>order-last</c:if>" href="invest_order_detail.htm?device=${param.device }&app_token=${param.app_token }&bidId=${fixBidVO.bidId }">
								<table>
									<tr class="color-times">
										<td><fmt:formatDate value="${fixBidVO.payTime }" pattern="yyyy-MM-dd HH:mm:ss"/><c:if test="${fixBidVO.payMark=='ACTIVITY' }"><span style="color:#ff7433;font-size: 12px;">(体验金)</span></c:if></td>
										<td class="txt-right">交易成功</td>
									</tr>
									<tr class="color-targets">
										<td>${fixBidVO.targetName }</td>
										<td class="txt-right"><fmt:formatNumber value="${fixBidVO.buyAmount }" pattern="##.##" minFractionDigits="2" /></td>
									</tr>
								</table>
								<c:if test="${fixBidVO.buyAmount == fixBidVO.withdrawPrincipal }">
									<div class="dies-venit-tips"><img class="daozhang" src="img/icon_yidaozhang.png" style="width: 80px;"></div>
								</c:if>
							</a>
						</c:forEach>
					</div>
				</c:if>
			</div>
		</c:otherwise>
	</c:choose>
	
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
	$(function(){
		$.post("withdraw_task.htm",{
			t:new Date(),
			app_token:"${param.app_token}"
		},function(data){
			if(!data){
				return ;
			}
			for(var i in data){
				var row=data[i]; 
				try{
					var p = eval('('+row.param+')'); 
					if(!p.bid){
						continue;
					}
					$(".order[bid='"+p.bid+"']").find(".status-tip").html("已回款,等待银行到账");
					$(".order[bid='"+p.bid+"']").find(".daozhang").remove(); 
				}catch(e){}
			}
		},"json");
		
		$("#paixu_a").click(function() {
			$("#listByOrder").hide();
			$("#listByGroup").show();
		});
		
		$("#paixu_h").click(function() {
			$("#listByGroup").hide();
			$("#listByOrder").show();
		});
		
	});
	
	</script>
</body>
</html>
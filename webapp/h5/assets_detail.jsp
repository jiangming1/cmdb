<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<link type="text/css" rel="stylesheet" href="css/lcb_wx_common.css" />
<link type="text/css" rel="stylesheet" href="css/mycss.css?v=2016032301" />
<script src="js/jquery.min.js"></script>
<title>在投总收益</title>
</head>
<body style="background: #FFF;">
	<c:if test="${not hasResult }">
		<div style="line-height: 100px; text-align: center; color: gray">该功能内测当中,敬请期待</div>
	</c:if>
	<c:if test="${hasResult }">
		<div>
			<c:if test="${param.device==null||param.device=='' }">
				<div class="backBar">
					<table>
						<tbody>
							<tr>
								<td style="width: 50px;"><a href="my_account.htm?tab=account&t=<%=new Date()%>">〈</a></td>
								<td>在投总收益</td>
								<td style="width: 50px;"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</c:if>
			<div class="assets_header">
				<div class="assets_header_con">
					<span class="assets_title">在投总收益(元)</span><br> <span class="assets_number"> </span>
				</div>
			</div>
			<ul class="assents_main">
				<li class="assents_list_first"><span class="scb_list"></span>随存宝</li>
				<li class="assents_list">
					<div class="fl">在投资金（元）</div>
					<div class="fr" style="color: #FF7433">
						<span id="SCBPrincipal"><fmt:formatNumber value="${SCBresult.currentPrincipal}" pattern="##.##" minFractionDigits="2"></fmt:formatNumber></span>
					</div>
				</li>
				<li class="assents_list">
					<div class="fl">在投总收益（元）</div>
					<div class="fr" style="color: #FF7433">
						<span id="SCBProfit"><fmt:formatNumber value="${SCBresult.currentProfit}" pattern="##.##" minFractionDigits="2"></fmt:formatNumber></span>
					</div>
				</li>
			</ul>
			<hr style="border: 1px solid #EEE;" />
			<ul class="assents_main">
				<li class="assents_list_first"><span class="ypb_list"></span>银票宝系列</li>
				<li class="assents_list">
					<div class="fl">在投资金（元）</div>
					<div class="fr" style="color: #FF7433">
						<span id="CPBPrincipal"><fmt:formatNumber value="${CPBresult.currentPrincipal}" pattern="##.##" minFractionDigits="2"></fmt:formatNumber> </span>
					</div>
				</li>
				<li class="assents_list">
					<div class="fl">在投总收益（元）</div>
					<div class="fr" style="color: #FF7433">
						<span id="CPBProfit"><fmt:formatNumber value="${CPBresult.currentProfit}" pattern="##.##" minFractionDigits="2"></fmt:formatNumber> </span>
					</div>
				</li>
			</ul>

		</div>
	</c:if>
	<script>
		var totalProfit = 0;
		totalProfit = parseFloat("${SCBresult.currentProfit}") + parseFloat("${CPBresult.currentProfit}");
		$(".assets_number").text(parseFloat(totalProfit).toFixed(2));
	</script>

</body>
</html>
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
<title>复投有礼-首页</title>
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
	color: #6A6A6A;
	text-decoration: none;
	border: none;
	outline: none;
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
.target-wrap{
	width: 80%;
	margin: 0 auto;
	padding: 0.5rem;
	border: 1px solid #311919; 
	box-shadow: inset 0px 0px 1px #311919,inset -0px -0px 1px #311919;
	margin-top: 1rem;
}
.u-hr{
	width: 93%;
	margin: 1rem auto;
/* 	background: #dda705; */
}
.rule table tr td{
	font-size: 0.9rem;
	line-height: 1.3rem;
}
.td-ver-top{
	vertical-align: top;
}
.td-txt-right{
	text-align: right;
}
.color-red{
	color: #fc4721;
}
.btn-ahref{
	padding: 0.2rem 0.5rem;
	background: #9577ef;
	color: #FFF;
	border-radius: 0.5rem;
	box-shadow: 0 2px 2px rgba(118,83,219,0.47);
}
.btn-ahref-gray {
	padding: 0.2rem 0.5rem;
	background: #888;
	color: #FFF;
	border-radius: 0.5rem;
	box-shadow: 0 2px 2px rgba(88,88,88,0.47);
}
</style>
</head>
<body style="background: #FFC412;">
<input type="hidden" id="device" value="${param.device }" />
<input type="hidden" id="app_token" value="${param.app_token }" />
<div class="head" style=""><img src="img/head-poster.jpg"></div>
<div class="main" style="overflow: hidden; margin-bottom: 30px;">
	<c:choose>
		<c:when test="${bidCount == -1 }">
			<div class="login-see">
				<a href="javascript:void(0);" id="btn-login" style="width: 80%;margin: 1rem auto;display: block;"><img src="img/btn-login-see.png"></a>
				<div class="u-hr"><img src="img/hr-decoration.png"></div>
			</div>
		</c:when>
		<c:when test="${bidCount == 0 }">
			<div class="sorry-pity" style="">
				<div style="width: 80%;margin: 1rem auto;"><img src="img/sorry-pity.png"></div>
				<div class="u-hr"><img src="img/hr-decoration.png"></div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="acceptance-order" style="position: relative;">
				<div class="color-red" style="text-align: center;font-size: 1.5rem;margin-bottom: 1rem;">已兑付订单</div>
				<c:choose>
					<c:when test="${cashedList != null && fn:length(cashedList) > 0}">
						<c:forEach items="${cashedList }" var="bidVO" varStatus="status">
							<div class="target-wrap">
								<ul style="width: 100%;">
									<li class="clearfix">
										<span class="fl" style="font-size: 1.2rem;">${bidVO.targetName }</span>
										<a href="active_target_detail.htm?bidId=${bidVO.bidId }&period=60&device=${param.device }&app_token=${param.app_token }&_channel=weixin" class="fr btn-ahref">60天加息1%&nbsp;</a>
									</li>
									<li class="clearfix" style="margin: 0.5rem 0;">
										<span class="fl" style="font-size: 1.2rem;">本金${bidVO.buyAmount }元</span>
										<a href="active_target_detail.htm?bidId=${bidVO.bidId }&period=90&device=${param.device }&app_token=${param.app_token }&_channel=weixin" class="fr btn-ahref">90天加息2%</a>
									</li>
									<li class="clearfix color-red" style="font-size: 0.8rem;">
										<span class="fl" >兑付日期:<span><fmt:formatDate value="${bidVO.endProfit }" pattern="M.dd"/></span></span>
										<span class="fr" >复投加息入口<fmt:formatDate value="${bidVO.endProfit }" pattern="M.dd"/>-<fmt:formatDate value="${bidVO.gmtCreate }" pattern="M.dd"/>限时开启</span>
									</li>
								</ul>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="sorry-pity" style="">
							<div style="width: 80%;margin: 1rem auto;"><img src="img/no_cashed_order.png"></div>
						</div>
					</c:otherwise>
				</c:choose>
				<!-- - 气泡 - -->
				<div style="position: absolute; left: -4%;top: 40%;z-index: -1;"><img src="img/qipao1.png" style="width: 50%;"></div>
				<div class="u-hr"><img src="img/hr-decoration.png"></div>
			 </div>
			 <!-- - 即将兑付订单 - -->
			 <div class="will-acceptance-order" style="position: relative;">
				<div class="color-red" style="text-align: center;font-size: 1.5rem;">即将兑付订单</div>
				<c:choose>
					<c:when test="${cashingList != null && fn:length(cashingList) > 0}">
						<c:forEach items="${cashingList }" var="bidVO" varStatus="status">
							<div class="target-wrap">
								<ul style="width: 100%;">
									<li class="clearfix">
										<span class="fl" style="font-size: 1.2rem;">${bidVO.targetName }</span>
										<a href="javascript:void(0);" class="fr btn-ahref-gray">60天加息1%&nbsp;</a>
									</li>
									<li class="clearfix" style="margin: 0.5rem 0;">
										<span class="fl" style="font-size: 1.2rem;">本金${bidVO.buyAmount }元</span>
										<a href="javascript:void(0);" class="fr btn-ahref-gray">90天加息2%</a>
									</li>
									<li class="clearfix color-red" style="font-size: 0.8rem;">
										<span class="fl">兑付日期:<span><fmt:formatDate value="${bidVO.endProfit }" pattern="M.dd"/></span></span>
										<span class="fr">复投加息入口<fmt:formatDate value="${bidVO.endProfit }" pattern="M.dd"/>-<fmt:formatDate value="${bidVO.gmtCreate }" pattern="M.dd"/>限时开启</span>
									</li>
								</ul>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="sorry-pity" style="">
							<div style="width: 80%;margin: 1rem auto;"><img src="img/no_cashing_order.png"></div>
						</div>
					</c:otherwise>
				</c:choose>
				<!-- - 气泡 - -->
				<div style="position: absolute; right: -26%;top: 40%;z-index: -1;"><img src="img/qipao2.png" style="width: 50%;"></div>
				<div class="u-hr"><img src="img/hr-decoration.png"></div>
			</div>
		</c:otherwise>
	</c:choose>
	
	<!-- - 活动规则 - -->
	<div class="rule" style="width: 86%;margin: 0 auto 2rem;position: relative;">
		<table>
			<tr>
				<td colspan="2">活动规则</td>
			</tr>
			<tr>
				<td class="td-ver-top">1、</td>
				<td>活动时间：8.19-8.29 </td>
			</tr>
			<tr>
				<td class="td-ver-top">2、</td>
				<td>活动仅对在活动期间有到期订单的用户开放</td>
			</tr>
			<tr>
				<td class="td-ver-top">3、</td>
				<td>定期理财到期后3天内，复投加息入口将开启，用户点击进入可投资加息标</td>
			</tr>
			<tr>
				<td class="td-ver-top">4、</td>
				<td>复投加息入口开启期间，用户可多次投资加息标</td>
			</tr>
			<tr>
				<td class="td-ver-top">5、</td>
				<td>如对活动有疑问，可添加<span class="color-red">qq群473119359</span>或关注<span class="color-red">"来存吧" 微信公众号</span>咨询</td>
			</tr>
			<tr>
				<td colspan="2">*活动最终解释权归来存吧所有</td>
			</tr>
		</table>
		<!-- - 气泡 - -->
		<div style="position: absolute;left: -15%;top: -5%;z-index: -1;"><img src="img/qipao3.png" style="width: 50%;"></div>
		<div style="position: absolute;right: -40%;bottom: 0%; z-index: -1;"><img src="img/qipao4.png" style="width: 50%;"></div>
	</div>
</div>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#btn-login").click(function() {
		if($("#device").val()) {
			window.location.href="reinvest_activity.htm?app_view=login";
		} else {
			window.location.href="../login.htm?tab=account&returnUrl=activity/reinvest_activity.htm"
		}
	});
})
</script>
</body>
</html>
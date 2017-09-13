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
<title>复投有礼第二期</title>
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
.blockwrap{
	width: 84%;
	padding: 4%;
	background: #fe6e20;
	border-radius: 8px;
}
.target-older,.target-newer{
	width: 96%;
	margin: 0 auto;
	padding: 2%;
	background: #fff;
	border-radius: 6px;
}
.target-older{
	margin: 10px auto;
}
.target-newer{
	margin: 0 auto;
}
.btn-buy{
	display: block;
	width: 90%;
	color: #FFF;
	background: #fc6514;
	text-align: center;
	padding: 6% 0;
	vertical-align: middle;
	border-radius: 6px;
	box-shadow: 0 2px 0 #e25205;
}
.tab-rank tr td{
	text-align: center;
	height: 30px;
	line-height: 30px;
}
</style>
</head>
<body style="background: #363a60;">
	<input type="hidden" id="device" value="${param.device }" />
	<input type="hidden" id="app_token" value="${param.app_token }" />
	<div class="top" style="position: relative;">
		<img src="img/20161008top.png">
		<c:choose>
			<c:when test="${userStatus == -1 }">
				<div class="btn-login" style="position: absolute; width: 62%; left: 19%; bottom: 4%;">
					<a href="javascript:void(0);"><img src="img/20161008btn-login.png"></a>
				</div>
			</c:when>
			<c:when test="${userStatus == 0 }">
				<div style="width: 100%; position: absolute; left: 0; top: 80%;">
					<div style="text-align: center; color: #FFF;">新人专享</div>
					<div class="blockwrap" style="margin: 10px auto;">
						<div style="width: 96%;margin: 0 auto;padding: 2%;background: #544b78;">
							<c:choose>
								<c:when test="${target7 != null }">
									<div class="target-newer">
										<table style="width: 100%;text-align: center;">
											<tr>
												<td style="width: 33%">预期年化</td>
												<td style="width: 33%">理财期限</td>
												<td rowspan="2" style="width: 34%">
													<c:choose>
														<c:when test="${target7.status == 'onsale' && target7.finishAmount < target7.collectAmount }">
															<a class="btn-buy" href="../financial_detail.htm?app_view=detail&id=${target7.id }" style="">购买</a>
														</c:when>
														<c:otherwise>
															<a class="btn-buy" href="javascript:void(0);" style="background: #888; box-shadow: 0 2px 0 #777;">已售罄</a>
														</c:otherwise>
													</c:choose>
												</td>
											</tr>
											<tr style="color: #fc6514;">
												<td><fmt:formatNumber value="${target7.annualizedRates }" pattern="##.##" minFractionDigits="1" />%</td>
												<td>${target7.period }天</td>
											</tr>
										</table>		
									</div>
								</c:when>
								<c:otherwise>
									<div class="target-newer">
										<table style="width: 100%;text-align: center;">
											<tr>
												<td style="width: 33%">预期年化</td>
												<td style="width: 33%">理财期限</td>
												<td rowspan="2" style="width: 34%">
													<a class="btn-buy" href="javascript:void(0);" style="background: #888; box-shadow: 0 2px 0 #777;">已售罄</a>
												</td>
											</tr>
											<tr style="color: #fc6514;">
												<td>20%</td>
												<td>7天</td>
											</tr>
										</table>		
									</div>
								</c:otherwise>
							</c:choose>
						</div> 
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div style="width: 100%;position: absolute;left: 0;top: 80%;">
					<div style="text-align: center; color: #FFF;">老用户专享</div>
					<div class="blockwrap" style="margin: 10px auto;">
						<div style="width: 96%;margin: 0 auto;padding: 2%;background: #544b78;">
							<div class="target-older">
								<table style="width: 100%;text-align: center;">
									<c:choose>
										<c:when test="${target30 != null }">
											<tr>
												<td style="width: 33%">预期年化</td>
												<td style="width: 33%">理财期限</td>
												<td rowspan="2" style="width: 34%">
													<c:choose>
														<c:when test="${target30.status == 'onsale' && target30.finishAmount < target30.collectAmount }">
															<a class="btn-buy" href="../financial_detail.htm?app_view=detail&id=${target30.id }" style="">购买</a>
														</c:when>
														<c:otherwise>
															<a class="btn-buy" href="javascript:void(0);" style="background: #888; box-shadow: 0 2px 0 #777;">已售罄</a>
														</c:otherwise>
													</c:choose>
												</td>
											</tr>
											<tr style="color: #fc6514;">
												<td><fmt:formatNumber value="${target30.annualizedRates - 0.5}" pattern="##.##" minFractionDigits="1" />+0.5%</td>
												<td>${target30.period }天</td>
											</tr>
										</c:when>
										<c:otherwise>
											<tr>
												<td style="width: 33%">预期年化</td>
												<td style="width: 33%">理财期限</td>
												<td rowspan="2" style="width: 34%">
													<a class="btn-buy" href="javascript:void(0);" style="background: #888; box-shadow: 0 2px 0 #777;">已售罄</a>
												</td>
											</tr>
											<tr style="color: #fc6514;">
												<td>9+0.5%</td>
												<td>30天</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</table>
							</div>
							
							<div class="target-older">
								<table style="width: 100%;text-align: center;">
									<c:choose>
										<c:when test="${target60 != null }">
											<tr>
												<td style="width: 33%">预期年化</td>
												<td style="width: 33%">理财期限</td>
												<td rowspan="2" style="width: 34%">
													<c:choose>
														<c:when test="${target60.status == 'onsale' && target60.finishAmount < target60.collectAmount }">
															<a class="btn-buy" href="../financial_detail.htm?app_view=detail&id=${target60.id }" style="">购买</a>
														</c:when>
														<c:otherwise>
															<a class="btn-buy" href="javascript:void(0);" style="background: #888; box-shadow: 0 2px 0 #777;">已售罄</a>
														</c:otherwise>
													</c:choose>
												</td>
											</tr>
											<tr style="color: #fc6514;">
												<td><fmt:formatNumber value="${target60.annualizedRates - 1}" pattern="##.##" minFractionDigits="1" />+1%</td>
												<td>${target60.period }天</td>
											</tr>
										</c:when>
										<c:otherwise>
											<tr>
												<td style="width: 33%">预期年化</td>
												<td style="width: 33%">理财期限</td>
												<td rowspan="2" style="width: 34%">
													<a class="btn-buy" href="javascript:void(0);" style="background: #888; box-shadow: 0 2px 0 #777;">已售罄</a>
												</td>
											</tr>
											<tr style="color: #fc6514;">
												<td>10+1%</td>
												<td>60天</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</table>
							</div>
							
							<div class="target-older">
								<table style="width: 100%;text-align: center;">
									<c:choose>
										<c:when test="${target90 != null }">
											<tr>
												<td style="width: 33%">预期年化</td>
												<td style="width: 33%">理财期限</td>
												<td rowspan="2" style="width: 34%">
													<c:choose>
														<c:when test="${target90.status == 'onsale' && target90.finishAmount < target90.collectAmount }">
															<a class="btn-buy" href="../financial_detail.htm?app_view=detail&id=${target90.id }" style="">购买</a>
														</c:when>
														<c:otherwise>
															<a class="btn-buy" href="javascript:void(0);" style="background: #888; box-shadow: 0 2px 0 #777;">已售罄</a>
														</c:otherwise>
													</c:choose>
												</td>
											</tr>
											<tr style="color: #fc6514;">
												<td><fmt:formatNumber value="${target90.annualizedRates - 2}" pattern="##.##" minFractionDigits="1" />+2%</td>
												<td>${target90.period }天</td>
											</tr>
										</c:when>
										<c:otherwise>
											<tr>
												<td style="width: 33%">预期年化</td>
												<td style="width: 33%">理财期限</td>
												<td rowspan="2" style="width: 34%">
													<a class="btn-buy" href="javascript:void(0);" style="background: #888; box-shadow: 0 2px 0 #777;">已售罄</a>
												</td>
											</tr>
											<tr style="color: #fc6514;">
												<td>11+2%</td>
												<td>90天</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</table>
							</div>
						</div> 
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<!-- - 复投排名 - --><!--新手专享对应： margin: 110px auto 30px; --><!--未登录状态对应： margin： 30px auto; --><!--老用户专享对应：margin: 270px auto 30px; -->
	<div class="blockwrap" style="margin: <c:choose><c:when test='${userStatus == -1 }'> 30px</c:when><c:when test='${userStatus == 0 }'> 110px</c:when><c:otherwise > 270px</c:otherwise></c:choose> auto 30px;">
		<div style="text-align: center;margin-bottom: 5px;color: #FFF;">复投排行榜</div>
		<div style="width: 96%;height: 200px;overflow: auto;margin: 0 auto;background: #fff;padding: 2%;border-radius: 8px;">
			<table class="tab-rank" style="width: 100%;">
				<c:choose>
					<c:when test="${investRankList != null && fn:length(investRankList) > 0}">
						<tr>
							<td style="width: 20%;">排名</td>
							<td>手机号</td>
							<td>投资金额</td>
						</tr>
						<c:forEach items="${investRankList }" var="investRank" varStatus="status">
							<tr>
								<td>
									<c:choose>
										<c:when test="${status.index == 0 }"><img src="img/20161008first.png" style="height: 30px;"></c:when>
										<c:when test="${status.index == 1 }"><img src="img/20161008second.png" style="height: 30px;"></c:when>
										<c:when test="${status.index == 2 }"><img src="img/20161008third.png" style="height: 30px;"></c:when>
										<c:otherwise>${status.index + 1 }</c:otherwise>
									</c:choose>
								</td>
								<td>${fn:substring(investRank.mobile, 0, 3)}****${fn:substring(investRank.mobile, 7, 11)}</td>
								<td>${investRank.buyAmount }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="3" style="color:#666; font-size: 18px;">排行榜正在统计中...</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
	</div>
	<!-- - 活动规则 和 底部- -->
	<div class="bottom" style=""><img src="img/20161008bottom.png"></div>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".btn-login").click(function() {
		if($("#device").val()) {
			window.location.href="reinvest_activity2.htm?device=app&app_view=login";
		} else {
			window.location.href="../login.htm?tab=account&returnUrl=activity/reinvest_activity2.htm"
		}
	});
})
</script>
</body>
</html>
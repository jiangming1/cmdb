<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta name = "format-detection" content = "telephone=no"><!-- 防止ios将数字识别成手机号码，不会影响真正电话号码的识别。-->
<meta charset="utf-8">
<title>周年庆活动</title>
<script src="../js/jquery.min.js"></script>
<script src="../js/jweixin-1.0.0.js"></script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}
img{
	box-sizing: border-box;
	max-width: 100%;
	height: auto;
	vertical-align: middle;
	border: 0;
}
a{
	color: #FFF;
	text-decoration: none;
}
input{
	border: none;
	outline: none;
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
.rule-1,.rule-2,.rule-3,.rule-4{
	position: absolute;
	background: #87e2b5;
	padding: 1% 2%;
	border-radius: 0.5rem;
}
.rule-1{
	right: 21%;
	top: 30.7%;
}
.rule-2{
	right: 16%;
	top: 41.8%;
}
.rule-3{
	right: 12%;
	top: 56.7%;
}
.rule-4{
	right: 10%;
	top: 71.5%;
}
.rule-warp{
	display: none;
}
.rule-warp-con{
	position: relative;
	background: #FFF;
	padding: 4%;
	color: #ce514f;
	border: 1px solid #FFF;
	border-radius: 0.5rem;
}
.rule-warp-con:after{
	content: "";
	display: block;
	position: absolute;
	top: 100%;
	border-width: 8px;
	border-style: solid dashed dashed dashed;
	border-color: #FFF transparent transparent transparent; 
}
.cash-claim:after{
	left: 40%;
}
.new-time:after{
	left: 49%;
}
.invite-exp:after{
	left: 53%;
}
.last:after{
	left: 58%;
}
.btn-receive{
	position: absolute;
	left: 37%;
	top: 37%;
	width: 26%;
	color: #ce514f;
	padding: 0.5% 0;
	background: #FFF;
	font-weight: bold;
}
.btn-receive-out{
	position: absolute;
	left: 37%;
	top: 37%;
	width: 26%;
	color: #fcfbe9;
	padding: 0.5% 0;
	background: #9e9e9d;
	font-weight: bold;
}
.color-orange{
	color: #ef491c;
}
.buy-message table tr td{
	color: #7f4020;
	text-align: center;
}
/* 邀请好友按钮  */
.btn-invite{
    width: 40%; 
    padding: 1%;
    position: absolute; 
    left: 30%; 
    top: 68.2%; 
    background: #EF491C; 
    border-radius: 0.5rem;
    text-align: center;
}
/* 遮罩层样式*/
.mask{
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background: rgba(0,0,0,0.6);
	z-index: 9;
	display: none; 
}
/* 现金券领取弹出框 */
.cash-coupon{
	position: fixed;
	width: 80%;
	height: 45%;
	left: 10%;
	top:25%;
	text-align: center;
	z-index: 10;
	background: #FFF;
	display: none;
}
.btn-cash{
	margin-top: 10%;
}
.btn-cash a,.btn-invest a{
	display: inline-block;
	background: #ef491c;
	color: #FFF;
	width: 35%;
	padding: 3% 5%;
	border-radius: 0.5rem;
}
.btn-close{
	position: absolute;
	right: -5%;
	top: -5%;
	font-size: 1.5rem;
	border-radius: 50%;
	background: #757575;
	color: #FFF;
	width: 2.2rem;
	height: 2.2rem;
	line-height: 2.2rem;
	text-align: center;
}
.btn-close-rule{
	position: absolute;
	right: -1%;
	top: -1%;
	font-size: 1.0rem;
	font-weight: bold;
	color: #888;
	width: 1.2rem;
	height: 1.2rem;
	line-height: 1.2rem;
	text-align: center;
}
/* 标的售罄内容样式*/
.sell-out{
	position: fixed;
	width: 90%;
	height: 55%;
	left: 5%;
	top: 20%;
	background: #FFF;
	z-index: 10;
	text-align: center;
	display: none;
}
.target-box{
	background: #9E9E9E;
	padding: 2% 3%;
	width: 90%;
	margin: 5% auto;
}
.target-box>div{
	border-radius: 0.5rem;
	background: #FFF;
	padding: 5% 0;
}
.target-box table tr td{
	line-height: 2rem;
}
/* 登录框内容样式*/
.login-wrap{
	position: fixed;
	width: 70%; 
	height: 18rem;
	left: 5%;top: 20%;
	background: #FFF; 
	border-radius: 0.5rem;
	padding: 4% 10%;
	display: none;
}
.input-wrap{
	width: 90%;
	padding: 0 5%;
	margin:1rem auto; 
	border-radius: 0.5rem;
	border: 1px solid #c7c7c7;
}
</style>
<script type="text/javascript">
</script>
</head>
<body style="background-color: #ce514f;font-size: 1rem;">
<input type="hidden" id="device" value="${param.device }" />
<input type="hidden" id="app_token" value="${param.app_token }" />
<div style="width: 100%;position: relative;"> 
	<img src="http://laicunba.b0.upaiyun.com/lcb/anniversary-bg.jpg"/>
	<div class="rule-1">
		<div style="position: relative;">
			<span class="btn-rule">活动规则</span>
			<div class="rule-warp" style="position: absolute;left: -75%;top: -370%;width: 290%;">
				<div class="rule-warp-con cash-claim">每天10:00、15:00限量发放，每位用户限领1张</div>
				<div class="btn-close-rule">×</div>
			</div>
		</div>
	</div>
	<div style="font-size: 0.7rem;text-align: center;">
		<c:choose>
			<c:when test="${cashCouponCount > 0 }">
				<div class="btn-receive">立即领取</div>
			</c:when>
			<c:otherwise>
				<div class="btn-receive-out">已领完</div>
			</c:otherwise>
		</c:choose>
		<div class="" style="position: absolute;left: 34%;top: 39%;width: 32%;color: #FFF;"> 数量有限 机不可失</div>
	</div>
	<div class="rule-2">
		<div style="position: relative;">
			<span class="btn-rule">活动规则</span>
			<div class="rule-warp" style="position: absolute;left: -100%;top: -370%;width: 280%;">
				<div class="rule-warp-con new-time">每天10:00、15:00定时上标，先投先赚钱</div>
				<div class="btn-close-rule">×</div>
			</div>
		</div>
	</div>
	<div class="raise-rates01" style="position: absolute;top: 45.5%; left:23%;width: 54%;">
		<table style="text-align: center;width: 104%;">
			<c:choose>
				<c:when test="${target60 != null }">
					<tr>
						<td style="width: 28%;" class="color-orange">${target60.annualizedRates - 1 }%+<span style="font-size: 0.8rem;">1%</span></td>
						<td style="width: 29%;" class="color-orange">${target60.period }天</td>
						<td style="width: 45%;">
							<c:choose>
								<c:when test="${target60.status!='onsale' || target60.finishAmount>=target60.collectAmount }">
									<div style="background: #9E9E9E;border-radius: 0.5rem; padding: 0.1rem 0;width: 80%;margin: 0 auto;">
										<a href="javascript:void(0);" onclick="sellOutAlert(${target60.annualizedRates },${target60.period })">售罄</a>
									</div>
								</c:when>
								<c:otherwise>
									<div style="background: #ef491c;border-radius: 0.5rem; padding: 0.1rem 0;width: 80%;margin: 0 auto;">
										<a href="../financial_detail.htm?id=${target60.id }">购买</a>
									</div>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td style="width: 28%;" class="color-orange">10.20%+<span style="font-size: 0.8rem;">1%</span></td>
						<td style="width: 29%;" class="color-orange">60天</td>
						<td style="width: 45%;">
							<div style="background: #ef491c;border-radius: 0.5rem;padding: 0.1rem 0;width: 80%;margin: 0 auto;">
								<a href="javascript:void(0);">购买</a>
							</div>
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
			<tr style="font-size: 0.5rem;">
				<td>预计年化</td>
				<td>理财期限</td>
				<td>每天定时上新</td>
			</tr>
		</table>
	</div>
	<div class="raise-rates02" style="position: absolute;top: 51.5%; left:23%;width: 54%;">
		<table style="text-align: center;width: 104%;">
			<c:choose>
				<c:when test="${target90 != null }">
					<tr>
						<td style="width: 28%;" class="color-orange">${target90.annualizedRates - 2 }%+<span style="font-size: 0.8rem;">2%</span></td>
						<td style="width: 29%;" class="color-orange">${target90.period }天</td>
						<td style="width: 45%;">
							<c:choose>
								<c:when test="${target90.status!='onsale' || target90.finishAmount>=target90.collectAmount }">
									<div style="background: #9E9E9E;border-radius: 0.5rem; padding: 0.1rem 0;width: 80%;margin: 0 auto;">
										<a href="javascript:void(0);" onclick="sellOutAlert(${target90.annualizedRates },${target90.period })">售罄</a>
									</div>
								</c:when>
								<c:otherwise>
									<div style="background: #ef491c;border-radius: 0.5rem;padding: 0.1rem 0;width: 80%;margin: 0 auto;">
										<a href="../financial_detail.htm?id=${target90.id }">购买</a>
									</div>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td style="width: 28%;" class="color-orange">10.10%+<span style="font-size: 0.8rem;">2%</span></td>
						<td style="width: 29%;" class="color-orange">90天</td>
						<td style="width: 45%;">
							<div style="background: #ef491c;border-radius: 0.5rem;padding: 0.1rem 0;width: 80%;margin: 0 auto;">
								<a href="javascript:void(0);">购买</a>
							</div>
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
			<tr style="font-size: 0.5rem;">
				<td>预计年化</td>
				<td>理财期限</td>
				<td>每天定时上新</td>
			</tr>
		</table>
	</div>
	<div class="rule-3">
		<div style="position: relative;">
			<span class="btn-rule">活动规则</span>
			<div class="rule-warp" style="position: absolute;left: -115%;top: -450%;width: 290%;">
				<div class="rule-warp-con invite-exp">邀请好友投资，您得30元现金券，好友得18888元理财金</div>
				<div class="btn-close-rule">×</div>
			</div>
		</div>
	</div>
	<div class="btn-invite" style=""><a href="../invite_info.htm?app_view=login">邀请好友</a></div>
	<div class="rule-4">
		<div style="position: relative;">
			<span class="btn-rule">活动规则</span>
			<div class="rule-warp" style="position: absolute;left: -130%;top: -1040%;width: 290%;">
				<div class="rule-warp-con last">活动期间累计投资60天以上银票宝总额前10名都有现金奖励，活动在结束三个工作日内发放到账户余额，可直接提现，第一名：888元；第二名：666元；第三名：288元；第4-10名：88元。</div>
				<div class="btn-close-rule">×</div>
			</div>
		</div>
	</div>
	<div style="position: absolute;top:73.5%;width: 78%; left: 10%;height: 14%;text-align: center;overflow: auto;">
		<div style="color: #7f4020;font-size: 1.2rem;">投资排行榜</div>
		<div style="border-bottom: 1px solid #7f4020;color: #ef491c;">第一名获得888元现金大奖</div>
		<div class="buy-message" style="width: 80%;margin: 0 auto;">
			<table style="width: 100%;">
				<c:if test="${anniversaryBidList != null && fn:length(anniversaryBidList) > 0}">
		         	<c:forEach items="${anniversaryBidList }" var="anniversaryBid" varStatus="status">
						<tr>
							<td style="width: 50%;">${status.index + 1 }.${fn:substring(anniversaryBid.mobile, 0, 3)}****${fn:substring(anniversaryBid.mobile, 7, 11)}</td>
							<td >${anniversaryBid.buyAmount }</td>
						</tr>
		         	</c:forEach>
		         </c:if>
			</table>
		</div>
	</div>
</div>
<div class="mask"></div>
<!-- - 现金券弹出层 - -->
<div class="cash-coupon">
	<div class="color-orange" style="font-size: 1.5rem;margin: 10% 0;">成功领取</div>
	<div style=""><img src="img/cash-coupon.png" style="width: 50%;"></div>
	<div class="btn-cash"><a href="../red_package_list.htm?app_view=login">查看现金券</a><a href="../financial_zone.htm?tab=zone&app_view=zone" style="margin-left: 2.5%;">使用现金券</a></div>
	<div class="btn-close">&times;</div>
</div>
<!-- - 已售罄弹出层内容 - -->
<div class="sell-out">
	<div class="color-orange" style="font-size: 1.5rem;margin-top: 5%;">本轮加息标已售罄</div>
	<div style="color: #9E9E9E;margin-top: 2%;">每天10：00、15:00限量发放</div>
	<div class="target-box">
		<div style="">
			<table style="width: 100%;">
				<tr style="font-size: 1.2rem;">
					<td class="color-orange" id="rates-td" style="width: 27%;">14%+<span style="font-size: 0.8rem;">1%</span></td>
					<td class="color-orange" id="period-td" style="width: 27%;">60天</td>
					<td style="width: 46%;"><div style="background: #9E9E9E;border-radius: 0.5rem;padding: 2% 0;">售罄</div></td>
				</tr>
				<tr style="font-size: 0.7rem;">
					<td>预期年化</td>
					<td>理财期限</td>
					<td>每天10点、15点上新</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="btn-invest"><a href="../financial_zone.htm?tab=zone&app_view=zone">投资</a><a href="javascript:void(0);" id="go_on" style="margin-left: 2.5%;">继续看活动</a></div>
	<div class="btn-close">&times;</div>
</div>
<!-- - 登录弹出框 - -->
<div class="login-wrap">
	<div class="clearfix" style="height: 3rem;">
		<div class="color-orange" style="font-size: 1.5rem;float: left;">登录</div>
		<div style="float: right;margin-top: 0.8rem;">没有账号，立即<a class="color-orange" href="#" style="font-size: 1.3rem;">注册</a></div>
	</div>
	<div class="input-wrap"><input placeholder="手机号" type="text" style="height: 2rem;width: 100%;" maxlength="11"></div>
	<div class="input-wrap"><input placeholder="密码" type="password" style="height: 2rem;width: 100%;"></div>
	<div class="clearfix"><a href="#" style="color: #999;float: right;border-bottom: 1px solid #999;">忘记密码？</a></div>
	<div style="width: 80%;padding: 0.5rem 0;text-align: center; margin: 1rem auto;background: #ef491c;border-radius: 0.5rem;">
		<a href="#">登录</a>
	</div>
	<div class="btn-close">×</div>
</div>
<script type="text/javascript">
$(function(){
	$(".btn-rule").click(function(){
		$(".rule-warp").hide();
		$(this).next().show();
	})
	$(".btn-receive").click(function(){
		$(".btn-receive").prop("disabled", true);
		$.post("receive_cash_coupon.htm?app_token="+$("#app_token").val(), null, function(data) {
			if(data.code=="SUCCESS"){ 
				$(".cash-coupon,.mask").fadeIn();
				return;
			}else if(data.code=="LOGIN_TIME_OUT"){
// 				$(".mask").fadeIn();
// 				$(".login-wrap").fadeIn();
				var device = $("#device").val();
				if(device) {
					window.location.href="anniversary.htm?app_view=login";
				} else {
					window.location.href="../login.htm?tab=account&returnUrl=activity/anniversary.htm";
				}
			}else{
				alert(data.msg);
			}
			$(".btn-receive").prop("disabled",false);
		}, "json");
	})
	$(".mask").click(function(){
		$(".mask").fadeOut();
		$(".cash-coupon").fadeOut();
		$(".sell-out").fadeOut();
	})	
	$(".btn-close, #go_on").click(function(){
		$(".mask").fadeOut();
		$(".cash-coupon").fadeOut();
		$(".sell-out").fadeOut();
// 		$(".login-wrap").fadeOut();
	})
	$(".btn-close-rule").click(function() {
		$(".rule-warp").fadeOut();
	})
})

function sellOutAlert(rates, period) {
	if(period>=90) {
		$("#rates-td").html((rates-2)+'%+<span style="font-size: 0.8rem;">2%</span>');
	} else if(period>=60) {
		$("#rates-td").html((rates-1)+'%+<span style="font-size: 0.8rem;">1%</span>');
	}
	$("#period-td").html(period + "天");
	$(".mask").fadeIn();
	$(".sell-out").fadeIn();
}
</script>
</body>
</html>
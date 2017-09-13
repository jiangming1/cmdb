<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>万圣节活动-首页</title>
<style>
*{
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
	text-decoration: none;
	color: #FFF;
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
.btn-receive{
	position: absolute;
}
.mask{
	position: fixed;
	width: 100%;
	height: 100%;
	left: 0;
	top: 0;
	background: rgba(0,0,0,0.6);
	display: none;
	z-index: 2;
}
.halloween-popup{
	position: fixed;
	width: 80%;
	left: 5%;
	padding: 5% 5% 10%;
	top: 40%;
	background: #FFF;
	border-radius: 8px;
	display: none;
	z-index: 3;;
}
.btn-sure{
	width: 35%;
	padding: 3% 0;
}
</style>
</head>
<body>
<div style="width: 100%;position: relative;">
	<img src="http://laicunba.b0.upaiyun.com/lcb/activity/halloween/halloween.png" />
	<input type="hidden" id="loginStatus" value="${loginStatus }" />
	<input type="hidden" id="device" value="${param.device }" />
	<input type="hidden" id="app_token" value="${param.app_token }" />
	<div class="btn-receive plus-rate-half">
		<c:choose>
			<c:when test="${loginStatus== 1 }">
				<c:choose>
					<c:when test="${totalInvestAmount >= 1000 }">
						<c:choose>
							<c:when test="${incrRate1 == null }"><img src="img/halloween-receive-a.png" /></c:when>
							<c:otherwise><img src="img/halloween-receive-d.png" /></c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise><img src="img/halloween-receive-h.png" /></c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise><img src="img/halloween-receive-a.png" /></c:otherwise>
		</c:choose>
	</div>
	<div class="btn-receive plus-rate-one">
		<c:choose>
			<c:when test="${loginStatus== 1 }">
				<c:choose>
					<c:when test="${totalInvestAmount >= 2000 }">
						<c:choose>
							<c:when test="${incrRate2 == null }"><img src="img/halloween-receive-a.png" /></c:when>
							<c:otherwise><img src="img/halloween-receive-d.png" /></c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise><img src="img/halloween-receive-h.png" /></c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise><img src="img/halloween-receive-a.png" /></c:otherwise>
		</c:choose>
	</div>
	<div class="btn-receive plus-rate-onefive">
		<c:choose>
			<c:when test="${loginStatus== 1 }">
				<c:choose>
					<c:when test="${totalInvestAmount >= 5000 }">
						<c:choose>
							<c:when test="${incrRate3 == null }"><img src="img/halloween-receive-a.png" /></c:when>
							<c:otherwise><img src="img/halloween-receive-d.png" /></c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise><img src="img/halloween-receive-h.png" /></c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise><img src="img/halloween-receive-a.png" /></c:otherwise>
		</c:choose>
	</div>
	<div class="btn-receive plus-rate-two">
		<c:choose>
			<c:when test="${loginStatus== 1 }">
				<c:choose>
					<c:when test="${totalInvestAmount >= 10000 }">
						<c:choose>
							<c:when test="${incrRate4 == null }"><img src="img/halloween-receive-a.png" /></c:when>
							<c:otherwise><img src="img/halloween-receive-d.png" /></c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise><img src="img/halloween-receive-h.png" /></c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise><img src="img/halloween-receive-a.png" /></c:otherwise>
		</c:choose>
	</div>
</div>
<div class="mask"></div>
<div class="halloween-popup">
	<h2 id="popup-title" style="text-align: center;color: #320a0a;">确认领取</h2>
	<input type="hidden" id="incrRate" value="0" />
	<div id="popup-content" style="text-align: center;margin: 10px 0;"><img src="img/halloween-ratehalf.png" style="width: 70%;" /></div>
	<div class="clearfix">
		<div class="fl btn-sure halloween-close" style="margin-left: 10%;"><img src="img/halloween-close.png" /></div>
		<div class="fr btn-sure halloween-sure" style="margin-right: 10%;"><img src="img/halloween-sure.png" /></div>
		<div class="fl btn-sure halloween-money" style="margin-left: 10%; display:none;"><img src="img/halloween-money.png" /></div>
		<div class="fr btn-sure halloween-onreceive" style="margin-right: 10%; display:none;"><img src="img/halloween-onreceive.png" /></div>
	</div>
</div>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	// 点击领取出现弹出框 
	$(".btn-receive").click(function(){
		if($("#loginStatus").val() == 0 && $("#device").val()) {
			window.location.href="halloween.htm?app_view=login&device="+$("#device").val();
		} else if($("#loginStatus").val() == 0) {
			window.location.href="../login.htm?tab=account&returnUrl=activity/halloween.htm"
		} else if($("#loginStatus").val() == 1 && $(this).children().attr("src") == "img/halloween-receive-a.png") {
			var incrRate = 0;
			if($(this).hasClass("plus-rate-half")) {
				incrRate = 0.5;
				$("#incrRate").val(0.5);
				$("#popup-content").html('<img src="img/halloween-ratehalf.png" style="width: 70%;" />');
			} else if($(this).hasClass("plus-rate-one")) {
				incrRate = 1;
				$("#incrRate").val(1);
				$("#popup-content").html('<img src="img/halloween-rateone.png" style="width: 70%;" />');
			} else if($(this).hasClass("plus-rate-onefive")) {
				incrRate = 1.5;
				$("#incrRate").val(1.5);
				$("#popup-content").html('<img src="img/halloween-rateonefive.png" style="width: 70%;" />');
			} else if($(this).hasClass("plus-rate-two")) {
				incrRate = 2;
				$("#incrRate").val(2);
				$("#popup-content").html('<img src="img/halloween-ratetwo.png" style="width: 70%;" />');
			}
			$(".mask,.halloween-popup").fadeIn();
		}
	});
	$(".halloween-sure").click(function() {
		var param = {
			t : new Date(),
			incrRate : $("#incrRate").val(),
			app_token : $("#app_token").val()
		};
		$.post("halloween_receive_rate_incr.htm", param, function(data){
			if(data.code=="SUCCESS") {
				$("#popup-title").text("领取成功");
				$(".halloween-sure").hide();
				$(".halloween-close").hide();
				$(".halloween-money").show();
				$(".halloween-onreceive").show();
			} else {
				$("#popup-title").text("领取失败");
				$("#popup-content").text(data.msg);
				$(".halloween-sure").hide();
				$(".halloween-close").hide();
				$(".halloween-money").show();
				$(".halloween-onreceive").show();
			}
		},"json");
	});
	$(".halloween-money").click(function() {
		window.location.href = "../financial_zone.htm?tab=zone&app_view=zone";
	});
	$(".halloween-onreceive").click(function() {
		window.location.reload();
	});
	$(".halloween-close, .mask").click(function(){
		$("#incrRate").val(0);
		$(".mask,.halloween-popup").fadeOut();
	})
	var popupHeight = $(".halloween-popup").height();
	$(".halloween-popup").css("margin-top","-"+(popupHeight/2)+"px");
	//按钮定位 
	var	ratio = $(window).width()/750;
	function rdist(num){
		return Math.floor(ratio*num) + "px";
	};
	$(".btn-receive").css({
		width: rdist(212),
		height: rdist(81),
	});
	$(".plus-rate-half").css({
		left: rdist(88),
		top: rdist(1002),
	});
	$(".plus-rate-one").css({
		right: rdist(88),
		top: rdist(1002),
	});
	$(".plus-rate-onefive").css({
		left: rdist(88),
		top: rdist(1426),
	});
	$(".plus-rate-two").css({
		right: rdist(88),
		top: rdist(1426),
	});
});
</script>
</body>
</html>
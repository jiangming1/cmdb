<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>新年新气象，闲钱不闲置</title>
<style type="text/css">
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
li{
	list-style: none;
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
.wrap{
	width: 100%;
	position: relative;
}
.wrap>div{
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
.rule-wrap{
	position: fixed;
	left: 5%;
	top: 50%;
	z-index: 3;
	width: 90%;
	display: none;
}
.btn-receive{
	position: absolute;
/*	border: 1px solid #FFF; */
}
.popup{
	width: 90%;
	position: fixed;
	left: 5%;
	top: 20%;
	z-index: 5;
	text-align: center; 
	display: none;
}
.btn-close{
	position: absolute;
	right: -8px;
	top: -17px;
	width: 50px;
}
.btn-submit,.btn-submit2{ 
	position: absolute;
}
</style>
</head>
<body>
<div class="wrap">
	<input type="hidden" id="loginStatus" value="${loginStatus }" />
	<input type="hidden" id="device" value="${param.device }" />
	<input type="hidden" id="app_token" value="${param.app_token }" />
	<img src="http://laicunba.b0.upaiyun.com/lcb/activity/new_year_bg.jpg"/>
	<c:choose>
		<c:when test="${loginStatus == 1 && vcoinBalance > 0}">
			<div class="current-integral" style="width: 100%;text-align: center;color: #fdff5f;">${vcoinBalance }</div>
		</c:when>
		<c:when test="${loginStatus == 1 && vcoinBalance == 0}">
			<div class="current-integral" style="width: 100%;text-align: center;color: #fdff5f;">0</div>
		</c:when>
		<c:otherwise>
			<div class="current-integral" style="width: 100%;text-align: center;color: #fdff5f;"><span style="font-size: 14px;"><a href="javascript:void(0);" id="login-btn" style="color:#25a2fe;display:inline-block;">登录</a>查看积分</span></div>
		</c:otherwise>
	</c:choose>
	<div class="btn-invest" style="text-align: center;"><a href="../financial_zone.htm?tab=zone&app_view=zone" style="color: #fdff5f;">立即投资</a></div>
	<div class="btn-rule"></div>
	<!-- - 领取奖品的按钮 - -->
	<div style="left: 0;top: 0;">
		<div class="btn-receive receive-one"></div>
		<div class="btn-receive receive-two"></div>
		<div class="btn-receive receive-three"></div>
		<div class="btn-receive receive-four"></div>
		<div class="btn-receive receive-five"></div>
		<div class="btn-receive receive-six"></div>
		<div class="btn-receive receive-seven"></div>
	</div>
</div>
<!-- 活动规则 -->
<div class="mask"></div>
<div class="rule-wrap">
	<img src="http://laicunba.b0.upaiyun.com/lcb/activity/new_year_rule.jpg" style="border-radius: 10px;">
	<div class="btn-close"><img src="img/close.png"></div>
</div>
<!--	奖品弹出框内容	-->
<div class="popup twenty_cash">
	<img src="http://laicunba.b0.upaiyun.com/lcb/activity/new_year_twenty_cash.jpg">	
	<div class="btn-close"><img src="img/close.png"></div>
</div>
<div class="popup fifty_fare">
	<img src="http://laicunba.b0.upaiyun.com/lcb/activity/new_year_fifty_fare.jpg">
	<div class="btn-submit"></div>
	<div class="btn-close"><img src="img/close.png"></div>
</div>
<div class="popup hundred_fare">
	<img src="http://laicunba.b0.upaiyun.com/lcb/activity/new_year_hundred_fare.jpg">
	<div class="btn-submit"></div>
	<div class="btn-close"><img src="img/close.png"></div>
</div>
<div class="popup need_address">
	<img src="http://laicunba.b0.upaiyun.com/lcb/activity/new_year_need_address.jpg">
	<div class="prize-name" style="text-align: center;position: absolute;font-size: 12px;"></div>
	<div class="address_bar" style="position: absolute;"><input type="text" style="border: 0;outline: none;width: 100%;" /></div>
	<div class="btn-submit2"></div>
	<div class="btn-close"><img src="img/close.png"></div>
</div>
<div class="popup sorry_tips">
	<img src="http://laicunba.b0.upaiyun.com/lcb/activity/new_year_sorry_tips.jpg">
	<div class="btn-invest1" style="position: absolute;"><a href=""></a></div>
	<div class="btn-close"><img src="img/close.png"></div>
</div>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="activity.js"></script>
<script type="text/javascript">
$(function(){
	// ======	计算定位函数 
	var	ratio = $(window).width()/750;	
	function rdist(num){
		return Math.floor(ratio*num) + "px";
	};
	// ========= 当前积分 
	$(".current-integral").css({
		top: rdist(425),
	});
	//	======== 立即投资内容样式	
	$(".btn-invest").css({
		width: rdist(473),
		height: rdist(59),
		lineHeight: rdist(59),
		left: rdist(139),
		top: rdist(535),
	});
	// ======== 活动规则按钮
	$(".btn-rule").css({
		width: rdist(121),
		height: rdist(42),
		right: rdist(0),
		top: rdist(640),
	});
	// =====	立即领取 内容样式
	$(".btn-receive").css({
		width: rdist(135),
		height: rdist(51),
	});
	$(".receive-one").css({
		left: rdist(206),
		top: rdist(905),
	});
	$(".receive-two").css({
		left: rdist(518),
		top: rdist(905),
	});
	$(".receive-three").css({
		left: rdist(206),
		top: rdist(1209),
	});
	$(".receive-four").css({
		left: rdist(518),
		top: rdist(1209),
	});
	$(".receive-five").css({
		left: rdist(206),
		top: rdist(1515),
	});
	$(".receive-six").css({
		left: rdist(518),
		top: rdist(1515),
	});
	$(".receive-seven").css({
		left: rdist(363),
		top: rdist(1821),
	});
	// ===== 弹出框提交按钮 
	$(".btn-submit").css({
		width: rdist(156),
		height: rdist(64),
		left: rdist(148),
		top: rdist(416),
	});
	$(".btn-submit2").css({
		width: rdist(156),
		height: rdist(64),
		left: rdist(148),
		top: rdist(356),
	});
	$(".prize-name").css({
		width: rdist(356),
		height: rdist(42),
		left: rdist(46),
		top: rdist(176),
	});
	$(".address_bar").css({
		width: rdist(356),
		height: rdist(42),
		left: rdist(46),
		top: rdist(255),
	});
	$(".btn-invest1").css({
		width: rdist(260),
		height: rdist(70),
		left: rdist(208),
		top: rdist(236),
	});
	// ====== 活动规则样式设置	
	var ruleHeight = rdist(423);
	//console.log("活动规则的高度是："+ ruleHeight);
	$(".rule-wrap").css("marginTop","-" + ruleHeight);

	// 活动规则的点击事件
	$(".btn-rule").click(function(){
		$(".mask,.rule-wrap").fadeIn();
	});
	$(".btn-close,.mask").click(function(){
		$(".mask,.rule-wrap,.popup").fadeOut();
		window.location.reload();
	});

	$("#login-btn").click(function() {
		if($("#device").val()) {
			window.location.href="new_year.htm?app_view=login&device=" + $("#device").val();
		} else {
			window.location.href="../login.htm?tab=account&returnUrl=activity/new_year.htm"
		}
	});
	
	Activity.ready($("#app_token").val(), "20161224", "JOIN_INFO", {
		t:new Date()
	}, function(data){
		$(".btn-receive").click(function(){
			var _index = $(this).index();
			Activity.join("00" + ($(this).index()+ 1), {
				defid: 'newyear' + ($(this).index()+ 1)
			}, function(jdata){
				if(jdata.code=="SUCCESS"){
					switch(_index){
						case 0: 
							$(".mask,.twenty_cash").fadeIn();
							break;
						case 1: 
							$(".mask,.fifty_fare").fadeIn();
							break;
						case 2: 
							$(".mask,.hundred_fare").fadeIn();
							break;
						case 3: 
							$(".prize-name").text("获得三只松鼠年货礼盒1423g");
							$(".mask,.need_address").fadeIn();
							break;
						case 4: 
							$(".prize-name").text("获得500元京东卡");
							$(".mask,.need_address").fadeIn();
							break;
						case 5: 
							$(".prize-name").text("获得日本虎牌电饭煲");
							$(".mask,.need_address").fadeIn();
							break;
						case 6: 
							$(".prize-name").text("获得同程旅游黄金会员卡");
							$(".mask,.need_address").fadeIn();
							break;
					};
				}else if(jdata.code=="token_error"){
					if(!$("#device").val()){
						console.log("h5 login");
						window.location.href="../login.htm?tab=account&returnUrl=activity/new_year.htm";
					}else{
						console.log("app login");
						window.location.href="new_year.htm?app_view=login";
					}
				}else if(jdata.code=="HAS_NO_CHANGE"){
					$(".mask1,.alert").hide();
					$(".alert-joined").show(); 
					
				}else{
// 					alert(JSON.stringify(jdata));
					alert("积分不足");
				}
			});
		});
	});
	
	$(".btn-submit2").click(function() {
		var p = {
				t : new Date(),
				content : "我在双旦活动中，" + $(".prize-name").text() + "，我的收货地址是：" + $(".need_address input").val().trim(),
				app_token : "${param.app_token}"
			};
			if (!p.content) {
				$("#content").focus();
				return;
			}
			$.post("../submit_feed_back.htm", p, function(data) {
				if (data && data.code == 'SUCCESS') {
					alert("收货地址提交成功");
				} else {
					alert("收货地址提交失败");
				}
			}, "json");
	});

});
</script>
</body>
</html>
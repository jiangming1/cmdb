<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>老虎机活动-首页</title>
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
.rockBar{
    -webkit-animation: rockingBar 0.1s linear infinite;
    -moz-animation: rockingBar 0.1s linear infinite;
    animation: rockingBar 0.1s linear infinite;
}
.t-pan-light{
	background: url(img/light-h.png) no-repeat center;
	background-size: 100%;
}
.t-animation{
	-webkit-animation: lightShining 2s linear infinite; 
	-moz-animation: lightShining 2s linear infinite; 
	animation: lightShining 2s linear infinite;
}
.b-pan-light{
	background: url(img/light-a.png) no-repeat center;
	background-size: 100%;	
}
.b-animation{
	-webkit-animation: lightShining1 2s linear infinite; 
	-moz-animation: lightShining1 2s linear infinite; 
	animation: lightShining1 2s linear infinite;
}
.b-animation{

}
.prize-wrap{
	overflow: hidden;
}
.prize-info{
	background: url(img/prize-info.png);
	background-size: 100%;
}
.prevent{
	pointer-events: none;
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
	width: 80%;
	height: 60%;
	padding: 5%;
	position: fixed;
	left: 5%;
	top: 15%;
	z-index: 3;
	background: #FEFEFE;
	border-radius: 10px;
	overflow: auto;
	display: none; 
}
.hr{
	margin-top: 5px;
	height: 1px;
	border: 0; 
	background: -webkit-linear-gradient(left, rgba(122,122,122,0.2), #A7A7A7, rgba(122,122,122,0.2));
	background: -moz-linear-gradient(left, rgba(122,122,122,0.2), #A7A7A7, rgba(122,122,122,0.2));
	background: -o-linear-gradient(left, rgba(122,122,122,0.2), #A7A7A7, rgba(122,122,122,0.2));
	background: -ms-linear-gradient(left, rgba(122,122,122,0.2), #A7A7A7, rgba(122,122,122,0.2));
	background: linear-gradient(left, rgba(122,122,122,0.2), #A7A7A7, rgba(122,122,122,0.2));
}
.rule-tab tr td{
	line-height: 24px;
}
.rule-tab tr td span{
	color: #FF5A2C;
}
.ver-top{
	vertical-align: top;
}
.btn-sure{
	width: 35%;
	color: #FFF;
	margin: 10px auto;
	text-align: center;
	border-radius: 8px;
	box-shadow: 0 2px 2px #9a834d;
	background: #e0a928;
}
.win-info{
	position: fixed;
	width: 80%;
	padding: 5%;
	left: 5%;
	top: 40%;
	background: #FFF;
	z-index: 3;
	border-radius: 8px;
	display: none;	
}
@-webkit-keyframes lightShining{
	0% {background: url(img/light-a.png) no-repeat center;background-size: 100%;}
	49% {background: url(img/light-h.png) no-repeat center;background-size: 100%;}
	50% {background: url(img/light-a.png) no-repeat center;background-size: 100%;}
	99% {background: url(img/light-h.png) no-repeat center;background-size: 100%;}
	100% {background: url(img/light-a.png) no-repeat center;background-size: 100%;}
}
@-moz-keyframes lightShining{
	0% {background: url(img/light-a.png) no-repeat center;background-size: 100%;}
	49% {background: url(img/light-h.png) no-repeat center;background-size: 100%;}
	50% {background: url(img/light-a.png) no-repeat center;background-size: 100%;}
	99% {background: url(img/light-h.png) no-repeat center;background-size: 100%;}
	100% {background: url(img/light-a.png) no-repeat center;background-size: 100%;}
}
@keyframes lightShining{
	0% {background: url(img/light-a.png) no-repeat center;background-size: 100%;}
	49% {background: url(img/light-h.png) no-repeat center;background-size: 100%;}
	50% {background: url(img/light-a.png) no-repeat center;background-size: 100%;}
	99% {background: url(img/light-h.png) no-repeat center;background-size: 100%;}
	100% {background: url(img/light-a.png) no-repeat center;background-size: 100%;}
}
@-webkit-keyframes lightShining1{
	0% {background: url(img/light-h.png) no-repeat center;background-size: 100%;}
	49% {background: url(img/light-a.png) no-repeat center;background-size: 100%;}
	50% {background: url(img/light-h.png) no-repeat center;background-size: 100%;}
	99% {background: url(img/light-a.png) no-repeat center;background-size: 100%;}
	100% {background: url(img/light-h.png) no-repeat center;background-size: 100%;}
}
@-moz-keyframes lightShining1{
	0% {background: url(img/light-h.png) no-repeat center;background-size: 100%;}
	49% {background: url(img/light-a.png) no-repeat center;background-size: 100%;}
	50% {background: url(img/light-h.png) no-repeat center;background-size: 100%;}
	99% {background: url(img/light-a.png) no-repeat center;background-size: 100%;}
	100% {background: url(img/light-h.png) no-repeat center;background-size: 100%;}
}
@keyframes lightShining1{
	0% {background: url(img/light-h.png) no-repeat center;background-size: 100%;}
	49% {background: url(img/light-a.png) no-repeat center;background-size: 100%;}
	50% {background: url(img/light-h.png) no-repeat center;background-size: 100%;}
	99% {background: url(img/light-a.png) no-repeat center;background-size: 100%;}
	100% {background: url(img/light-h.png) no-repeat center;background-size: 100%;}
}
@-webkit-keyframes rockingBar{
	0% {transform: rotate(0deg);}
	12.5% {transform: rotate(7deg);}
	25% {transform: rotate(15deg);}
	37.5% {transform: rotate(7deg);}
	50% {transform: rotate(0deg);}
	62.5% {transform: rotate(-7deg);}
	75% {transform: rotate(-15deg);}
	100% {transform: rotate(-7deg);}
}
@-moz-keyframes rockingBar{
	0% {transform: rotate(0deg);}
	12.5% {transform: rotate(7deg);}
	25% {transform: rotate(15deg);}
	37.5% {transform: rotate(7deg);}
	50% {transform: rotate(0deg);}
	62.5% {transform: rotate(-7deg);}
	75% {transform: rotate(-15deg);}
	100% {transform: rotate(-7deg);}
}
@keyframes rockingBar{
	0% {transform: rotate(0deg);}
	12.5% {transform: rotate(7deg);}
	25% {transform: rotate(15deg);}
	37.5% {transform: rotate(7deg);}
	50% {transform: rotate(0deg);}
	62.5% {transform: rotate(-7deg);}
	75% {transform: rotate(-15deg);}
	100% {transform: rotate(-7deg);}
}
</style>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
	$(function() {
		var shareurl = 'http://8.laicunba.com/h5/regist_new.jsp?invite_code=${inviteCode}&mobile=${mobile}';
		if($("#channel").val()) {
			shareurl += "&channel=${param.channel}";
		}
		wx.config({
			debug : false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
			appId : '${weiXinVO.appid}', // 必填，公众号的唯一标识
			timestamp :'${weiXinVO.timestamp}', // 必填，生成签名的时间戳
			nonceStr : '${weiXinVO.nonceStr}', // 必填，生成签名的随机串
			signature :'${weiXinVO.signature}',// 必填，签名，见附录1
			 jsApiList: ['onMenuShareQZone',
		        'onMenuShareTimeline',
		        'onMenuShareAppMessage',
		        'onMenuShareQQ',
		        'onMenuShareWeibo',
		        'hideMenuItems',
		        'showMenuItems',
		        'hideAllNonBaseMenuItem',
		        'showAllNonBaseMenuItem',
		        'translateVoice',
		        'startRecord',
		        'stopRecord',
		        'onRecordEnd',
		        'playVoice',
		        'pauseVoice',
		        'stopVoice',
		        'uploadVoice',
		        'downloadVoice',
		        'chooseImage',
		        'previewImage',
		        'uploadImage',
		        'downloadImage',
		        'getNetworkType',
		        'openLocation',
		        'getLocation',
		        'hideOptionMenu',
		        'showOptionMenu',
		        'closeWindow',
		        'scanQRCode',
		        'chooseWXPay',
		        'openProductSpecificView',
		        'addCard',
		        'chooseCard',
		        'openCard']
		// 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		});


		wx.ready(function() {
			// config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，
			// config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，
			// 则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，
			// 则可以直接调用，不需要放在ready函数中。

			wx.onMenuShareAppMessage({
				title : '要理财,来存吧!', // 分享标题
				desc : '来存吧票据理财,注册即送18888元理财金,新手宝7天年化收益率达20%!100万小伙伴的选择,让你的每笔财富增值!', // 分享描述
				link :shareurl, // 分享链接
				imgUrl : 'http://8.laicunba.com/h5/img/sharelogo.png', // 分享图标
				type : '', // 分享类型,music、video或link，不填默认为link
				dataUrl : '', // 如果type是music或video，则要提供数据链接，默认为空
				success : function() {
					// 用户确认分享后执行的回调函数
				},
				cancel : function() {
					// 用户取消分享后执行的回调函数
				}
			});

			wx.onMenuShareTimeline({
				title : '要理财,来存吧!来存吧票据理财,注册即送18888元理财金,新手宝7天年化收益率达20%!100万小伙伴的选择,让你的每笔财富增值!', // 分享标题
				link : shareurl, // 分享链接
				imgUrl : 'http://8.laicunba.com/h5/img/sharelogo.png', // 分享图标
				success : function() {
					// 用户确认分享后执行的回调函数
					
				},
				cancel : function() {
					// 用户取消分享后执行的回调函数
					
				}
			});
			
			wx.onMenuShareQQ({
			    title: '要理财,来存吧!', // 分享标题
			    desc: '来存吧票据理财,注册即送18888元理财金,新手宝7天年化收益率达20%!100万小伙伴的选择,让你的每笔财富增值!', // 分享描述
			    link: shareurl, // 分享链接
			    imgUrl: 'http://8.laicunba.com/h5/img/sharelogo.png', // 分享图标
			    success : function() {
					// 用户确认分享后执行的回调函数
					
				},
				cancel : function() {
					// 用户取消分享后执行的回调函数
					
				}
			});
			
			wx.onMenuShareQZone({
			    title: '要理财,来存吧!', // 分享标题
			    desc: '来存吧票据理财,注册即送18888元理财金,新手宝7天年化收益率达20%!100万小伙伴的选择,让你的每笔财富增值!', // 分享描述
			    link: shareurl, // 分享链接
			    imgUrl: 'http://8.laicunba.com/h5/img/sharelogo.png', // 分享图标
			    success : function() {
					// 用户确认分享后执行的回调函数
					
				},
				cancel : function() {
					// 用户取消分享后执行的回调函数
					
				}
			});

		}); 
	}); 
</script>
</head>
<body style="background: #e94126;">
<!-- - 老虎机头部 - -->
<div class="wrap">
	<input type="hidden" id="loginStatus" value="${loginStatus }" />
	<input type="hidden" id="device" value="${param.device }" />
	<input type="hidden" id="app_token" value="${param.app_token }" />
	<img src="img/slot-machine-top.png" />
	<c:choose>
		<c:when test="${loginStatus == 1 }"><div class="invitecode" style="text-align: center;">${inviteCode}</div></c:when>
		<c:otherwise><div class="invitecode" style="text-align: center;">******</div></c:otherwise>
	</c:choose>
 	<div class="erwm">
 		<c:choose>
			<c:when test="${loginStatus == 1 }"><img src="${picPath }${inviteQrCode}" /></c:when>
			<c:otherwise><img src="img/wxgzh1.png" /></c:otherwise>
		</c:choose>
	</div>
 	<div class="btn-invite"></div>
</div>
<!-- - 老虎机中部 - -->
<div class="wrap">
	<img src="img/slot-machine-center.png" />
	<div class="btn-rule"></div>
	<c:choose>
		<c:when test="${loginStatus == 1 && vcoinBalance > 0}">
			<div class="residual-integral" style="color: #FFF; text-align: center;">您还剩余<span id="vcoin">${vcoinBalance }</span>积分</div>
		</c:when>
		<c:when test="${loginStatus == 1 && vcoinBalance == 0}">
			<div class="residual-integral" style="color: #FFF; text-align: center;">您还剩余0积分</div>
		</c:when>
		<c:otherwise>
			<div class="residual-integral" style="color: #FFF; text-align: center;">请点击<a href="javascript:void(0);" id="login-btn" style="color:#25a2fe;display:inline-block;">登录</a>查看积分</div>
		</c:otherwise>
	</c:choose>
	<div class="draw-wrap"></div>
	<div class="rocking-bar" style="border: none;transform: rotate(0deg);transform-origin: bottom;">
		<img src="img/rocking-bar.png">
	</div>
	<div class="pan-light t-pan-light"></div>
	<!-- - 奖品转动区域开始 - -->	 
	<div class="prize-wrap prize-wrap1">
		<div class="prize-box prize-box1" style="position: relative;">
			<div class="prize-info"></div>
			<div class="prize-info"></div>
			<div class="prize-info"></div>
		</div>
	</div>
	<div class="prize-wrap prize-wrap2">
		<div class="prize-box prize-box2" style="position: relative;">
			<div class="prize-info"></div>
			<div class="prize-info"></div>
			<div class="prize-info"></div>
		</div>
	</div>
	<div class="prize-wrap prize-wrap3">
		<div class="prize-box prize-box3" style="position: relative;">
			<div class="prize-info"></div>
			<div class="prize-info"></div>
			<div class="prize-info"></div>
		</div>
	</div>
	<!-- - 奖品转动区域结束 - -->
	<div class="pan-light b-pan-light"></div>
	<div class="btn-start"></div>
</div>
<!-- - 老虎机底部 - -->
<div class="wrap">
	<img src="img/slot-machine-bottom.png" />	
	<div class="invite-info" style="overflow: auto;font-size: 15px;">
		<table style="width: 100%;">
			<c:choose>
				<c:when test="${inviteList != null && fn:length(inviteList) > 0 }">
					<c:forEach items="${inviteList }" var="inviteReward">
						<tr>
							<td style="text-align: left;">${fn:substring(inviteReward.mobile, 0, 3)}****${fn:substring(inviteReward.mobile, 7, 11)}</td>
							<td style="text-align: right;padding-right: 5px;">${inviteReward.reward }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td style="text-align: center;padding-top: 5px; color:#888;" colspan="2">您暂时还没有已邀请好友哦!</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</div>	
<!-- - 活动规则和遮罩层 - -->
<div class="mask"></div>
<div class="rule-wrap">
	<div class="" style="text-align: center;">活动规则</div>
	<hr class="hr" />
	<table class="rule-tab" style="width: 100%;margin-top: 10px;">
		<tr>
			<td class="ver-top">1、</td>
			<td>邀请一位好友注册且首次投资为新手宝，获得一张<span>1%的加息券</span>（1个月以上可用）， 并累积35积分；</td>
		</tr>
		<tr>
			<td class="ver-top">2、</td>
			<td>邀请一位好友注册且首次投资为银票宝，获得一张<span>2%的加息券</span>（2个月以上可用）， 并累积50积分；</td>
		</tr>
		<tr>
			<td class="ver-top">3、</td>
			<td>积分满100即可参加一次老虎机抽奖活动，奖品为<span class="color-tip">5元现金券</span>（15天1000以上 可用），<span>10元现金券</span>（15天1000以上 可用）,<span>小米移动电源</span>和<span>bong手环</span>；</td>
		</tr>
		<tr>
			<td class="ver-top">4、</td>
			<td>现金券和加息券可在我的红包内查看，实体奖励于活动结束的三个工作日内发放</td>
		</tr>
	</table>
	<div class="btn-sure">返回</div>
</div>
<!-- - 中奖弹出框 - -->
<div class="win-info">
	<h2 style="text-align: center;">恭喜中奖</h2>
	<div class="win-item" style="text-align: center;"><img src="img/20161103five.png" style="width: 50%;"></div>
	<div class="clearfix">
		<div class="fl btn-sure" style="margin-left: 10%;">继续摇奖</div>
		<div class="fr btn-sure" style="margin-right: 10%;">返回</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	//计算定位函数 
	var	ratio = $(window).width()/750;	
	function rdist(num){
		return Math.floor(ratio*num) + "px";
	};
	// 邀请码内容 
	$(".invitecode").css({
		width: rdist(175),
		height: rdist(56),
		left: rdist(287),
		top: rdist(548),
		lineHeight: rdist(56),
	});
	// 二维码内容样式 
	$(".erwm").css({
		width: rdist(205),
		height: rdist(205),
		left: rdist(272),
		top: rdist(670),
	});
	// 邀请按钮 
	$(".btn-invite").css({
		width: rdist(553),
		height: rdist(78),
		left: rdist(93),
		top: rdist(967),
	});
	// 活动规则按钮
	$(".btn-rule").css({
		width: rdist(125),
		height: rdist(43),
		right: rdist(0),
		top: rdist(39),
	});
	// 剩余积分次数 内容样式 
	$(".residual-integral").css({
		width: rdist(439),
		height: rdist(62),
		lineHeight: rdist(62),
		left: rdist(148),
		top: rdist(87),
	});
	// 圆点闪烁内容样式 
	$(".pan-light").css({
		width: rdist(547),
		height: rdist(30),
		lineHeight: rdist(30),
	});
	$(".t-pan-light").css({
		left: rdist(95),
		top: rdist(170),
	});
	$(".b-pan-light").css({
		left: rdist(95),
		top: rdist(414),
	});
	//中间奖品区域内容样式 
	$(".prize-wrap").css({
		width: rdist(123),
		height: rdist(172),
		left: rdist(127),
		top: rdist(225),
	});
	$(".prize-wrap2").css({
		left: rdist(308),
	});
	$(".prize-wrap3").css({
		left: rdist(487),
	});
	$(".prize-info").css({
		width: rdist(123),
		height: rdist(326),
	});
	// 摇杆内容样式 
	$(".rocking-bar").css({
		width: rdist(40),
		height: rdist(140),
		right: rdist(40),
		top: rdist(220),
	});
	// 立即摇奖内容样式 
	$(".btn-start").css({
		width: rdist(554),
		height: rdist(88),
		left: rdist(90),
		top: rdist(467),
	});
	// 邀请还有内容信息样式 
	$(".invite-info").css({
		width: rdist(470),
		height: rdist(206),
		left: rdist(126),
		top: rdist(210),
	});
	// 弹出框按钮高度 
	$(".btn-sure").css({
		height: rdist(82),
		lineHeight: rdist(82),
	});
	var winHeight = $(".win-info").height()/2;
	console.log(winHeight);
	$(".win-info").css("marginTop","-" + winHeight + "px");
	//点击关闭按钮 
	$(".btn-sure").click(function(){
// 		$(".win-info, .rule-wrap, .mask").fadeOut();
		window.location.reload();
	});
	//页面模块定位完成	
	var top = rdist(-32);// 奖品初始高度
	$(".prize-box").css("top",top);// 奖品初始显示位置
	$(".btn-start").click(function(){	// 点击抽奖按钮 执行函数 
		var param = {
			t : new Date(),
			app_token : $("#app_token").val()
		};
		if($("#loginStatus").val() == 1 && $("#vcoin").text() >= 100) {
			$.post("start_slot_machines.htm", param, function(data) {
				if (data.code == "SUCCESS") {
					reset();
					letGo(data.rewardLevel);
					$(".rocking-bar").addClass("rockBar");
					$(this).addClass("prevent");// 给按钮添加禁止事件 
					$(".t-pan-light").addClass("t-animation");			
					$(".b-pan-light").addClass("b-animation");
				} else if (data.code == "FAIL") {
					alert(data.msg);
				}
			}, "json");
		} else if($("#loginStatus").val() != 1) {
			alert("登录超时，请重新登录");
		} else if($("#vcoin").text() < 100) {
			alert("您的积分不足100了，马上去邀请好友吧");
		} else {
			alert("0000000");
		}
	});
	// 奖品滚动函数 
	function letGo(textNum){
		var topFirst = rdist(-780);
	 // var bong = rdist(-602), five = rdist(-684), xiaomi = rdist(-764),ten = rdist(-520);
// 		var textNum = parseInt(Math.random()*100)//随机数 0-99
		console.log(textNum);
		if(textNum == 'A'){
			textNum = 1; //五元现金券
			setTimeout(function(){
				$(".win-item").children("img").attr("src","img/20161103five.png");
				$(".win-info,.mask").show();
				$(".btn-start").removeClass("prevent");
				$(".t-pan-light").removeClass("t-animation");			
				$(".b-pan-light").removeClass("b-animation");
				$(".rocking-bar").removeClass("rockBar");
			},3000);
			
		}else if(textNum == 'B'){
			textNum = 3; //十元现金券
			setTimeout(function(){
				$(".win-item").children("img").attr("src","img/20161103ten.png");
				$(".win-info,.mask").show();
				$(".btn-start").removeClass("prevent");
				$(".t-pan-light").removeClass("t-animation");			
				$(".b-pan-light").removeClass("b-animation");
				$(".rocking-bar").removeClass("rockBar");
			},3000);
			
		}else if(textNum == 'C'){
			textNum = 2; //小米电源
			setTimeout(function(){
				$(".win-item").children("img").attr("src","img/20161103xiaomi.png");
				$(".win-info,.mask").show();
				$(".btn-start").removeClass("prevent");
				$(".t-pan-light").removeClass("t-animation");			
				$(".b-pan-light").removeClass("b-animation");
				$(".rocking-bar").removeClass("rockBar");
			},3000);
		} else if(textNum == 'D'){
			textNum = 0;	//bong手环
			setTimeout(function(){
				$(".win-item").children("img").attr("src","img/20161103bong.png");
				$(".win-info,.mask").show();
				$(".btn-start").removeClass("prevent");
				$(".t-pan-light").removeClass("t-animation");			
				$(".b-pan-light").removeClass("b-animation");
				$(".rocking-bar").removeClass("rockBar");
			},3000);
		}
		//console.log(textNum);
		var num = [rdist(-602),rdist(-684),rdist(-764),rdist(-520)][textNum]; 
		// num[0] = bong手环	num[1] = 5元现金券	num[2] = 小米电源	num[3] = 10元现金券 
		// 负责奖品滚动 
		$(".prize-box1").animate({"top": topFirst},1000,"linear",function(){
			 $(this).css("top",0).animate({"top":num},1000,"linear");
		});
		$(".prize-box2").animate({"top": topFirst},1000,"linear",function(){
			 $(this).css("top",0).animate({"top":num},1800,"linear");
		});
		$(".prize-box3").animate({"top": topFirst},1000,"linear",function(){
			 $(this).css("top",0).animate({"top":num},1300,"linear");
		});
	}
	// 点击抽奖时重置奖品位置 
	function reset(){
		$(".prize-box").css("top",top);
	}
	
	// 活动规则的点击事件
	$(".btn-rule").click(function(){
		$(".mask,.rule-wrap").fadeIn();
	});
// 	$(".btn-sure").click(function(){
// 		$(".mask,.rule-wrap").fadeOut();
// 	});
	
	$("#login-btn").click(function() {
		if($("#device").val()) {
			window.location.href="slot_machines.htm?app_view=login&device="+$("#device").val();
		} else {
			window.location.href="../login.htm?tab=account&returnUrl=activity/slot_machines.htm"
		}
	});
	
	$(".btn-invite").click(function() {
		var device = "${param.device}";
		var app_token = "${param.app_token}";
		if($("#loginStatus").val() == 0) {
			if(device) {
				window.location.href="../invite_info.htm?device=app&_app_version=2.0&app_view=acc&app_token="+app_token;
			} else {
				window.location.href="../login.htm?tab=account&returnUrl=invite_info.htm";
			}
		} else {
			if(device) {
				window.location.href="../invite_info.htm?device=app&_app_version=2.0&app_view=acc&app_token="+app_token;
			} else {
				window.location.href="../invite_info.htm";
			}
		}
	});
});
</script>
</body>
</html>
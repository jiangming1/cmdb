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
<title>七夕节关爱单身狗</title>
<script src="../js/jquery.min.js"></script>
<script src="../js/jweixin-1.0.0.js"></script>
<style type="text/css">
*{
	margin: 0;
	padding: 0;
	font-family: "微软雅黑";
}
img{
	box-sizing: border-box;
	max-width: 100%;
	height: auto;
	vertical-align: middle;
	border: 0;
}
#demo {
	overflow:hidden;
	width: 66%;
	position: absolute;
	left: 17%; 
	top: 3.5%;
}
#indemo {	
	float: left;
	width: 600%;
}
#demo1 {
	float: left;
}
#demo2 {
	float: left; 
}
.hey-no-stop{
	position: absolute;
	text-align: center;
	right: 19.5%;
	top: 10.7%;
	color: #fff25e;
	line-height: 18px;
	-webkit-animation: twinkle 400ms ease-out infinite alternate;
	-moz-animation: twinkle 400ms ease-out infinite alternate;
	-o-animation: twinkle 400ms ease-out infinite alternate;
	-ms-animation: twinkle 400ms ease-out infinite alternate;
	animation: twinkle 400ms ease-out infinite alternate;
}
.finna-chance{
	position: absolute;
	top: 23.7%;
	width: 100%;
	height: 9%;
	line-height: 60px;
	text-align: center;
	color: #FFF;
	font-size: 1rem;
	background: url(http://laicunba.b0.upaiyun.com/lcb/chance-board-bg.png) no-repeat;
	background-size: 100%;
	text-shadow: 1px 0 0 #207ff9,
				-1px 0 #207ff9,
				0 -1px 0 #207ff9,
				0 1px 0 #207ff9,
				1px 0 2px #207ff9,
				-1px 0 2px #207ff9,
				0 1px 2px #207ff9,
				0 -1px 2px #207ff9;
}
.finna-chance a{
	font-size:12px;
	color: #fff;
	text-decoration: none;
	display: inline-block;
	height: 11px;
    line-height: 12px;
/*     border-bottom: 2px solid red; */
    -webkit-border-image:url(img/btn-bottom-border.png) 30 30 round; /* Safari 5 */
	-o-border-image:url(img/btn-bottom-border.png) 30 30 round; /* Opera */
	border-image:url(img/btn-bottom-border.png) 30 30 round;
	border-top: 0px;
	border-left: 0px;
	border-right: 0px;
	border-bottom: 6px;
	margin-top: 23px;
    vertical-align: top;
}

.click-tip{
	position: absolute;
	left: 0%;
	top: 40%;
	color: #FFF;
	font-size: 0.7rem;
	transform: rotate(30deg);
	-webkit-animation: opacity 0.3s ease-out alternate infinite;
	-moz-animation: opacity 0.3s ease-out alternate infinite;
	-o-animation: opacity 0.3s ease-out alternate infinite;
	-ms-animation: opacity 0.3s ease-out alternate infinite;
	animation: opacity 0.3s ease-out alternate infinite;
	display: none;
}
.click-tip2 {
	position: absolute;
	left: 0%;
	top: 37.5%;
	width: 17.1%;
}
.btn-rule{
	position: absolute; 
	right: 0;
	top: 38.5%;
	width: 19%;
	height: 3%;
	cursor: pointer; 
}
.color-red{
	color: red;
}
a.model-box{
	position: absolute; 
	width: 34%;
	height: 10%;
	display: inline-block;
}
a.model-box-last{
	position: absolute; 
	width: 70%;
	height: 10%;
	display: inline-block;
}
.data-number{
	width: 100%; 
	border: 1px solid #CCC;
	text-align: center;
}
.data-number tr td{
	border: 1px solid #CCC;
}
table tr td{
	line-height: 1.3rem;;
}
.mask{
	position: fixed; 
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background: rgba(0,0,0,0.75);
	display: none;
}
.rule-con{
	position: fixed;
	width: 90%;
	height: 94%;
	top: 0%; 
	padding: 5%;
	color: #fff;
/*	background: rgba(0,0,0,0.75); */
	border-radius: 0.5rem;
	overflow: auto;
	display: none;
}
.btn-close{
	position: fixed; 
	right: 3%;
	top: 2%;
	width: 1.5rem; 
	height: 1.5rem;
	line-height: 26px;
	text-align: center;
	border: 2px solid #CCC; 
	border-radius: 50%;
	z-index: 5;
	background: rgba(0,0,0,0.6);
	color: #FFF;
	font-weight: bold;
	font-size: 19px;
}
@-webkit-keyframes twinkle {
	0% {
		text-shadow: 0 1px 0px #207ff9,
					 1px 0 0px #207ff9,
					 0 -1px 0px #207ff9,
					 -1px 0 0px #207ff9; 
	}	
	100% {
		text-shadow: 0 1px 0px #207ff9,
					 1px 0 0px #207ff9,
					 0 -1px 0px #207ff9,
					 -1px 0 0px #207ff9,
					 0 1px 10px #207ff9,
					 1px 0 10px #207ff9,
					 0 -1px 10px #207ff9,
					 -1px 0 10px #207ff9; 
	}
}
@-moz-keyframes twinkle {
	0% {
		text-shadow: 0 1px 0px #207ff9,
					 1px 0 0px #207ff9,
					 0 -1px 0px #207ff9,
					 -1px 0 0px #207ff9; 
	}	
	100% {
		text-shadow: 0 1px 0px #207ff9,
					 1px 0 0px #207ff9,
					 0 -1px 0px #207ff9,
					 -1px 0 0px #207ff9,
					 0 1px 10px #207ff9,
					 1px 0 10px #207ff9,
					 0 -1px 10px #207ff9,
					 -1px 0 10px #207ff9; 
	}
}
@-o-keyframes glow {
	0% {
		text-shadow: 0 1px 0px #207ff9,
					 1px 0 0px #207ff9,
					 0 -1px 0px #207ff9,
					 -1px 0 0px #207ff9; 
	}	
	100% {
		text-shadow: 0 1px 0px #207ff9,
					 1px 0 0px #207ff9,
					 0 -1px 0px #207ff9,
					 -1px 0 0px #207ff9,
					 0 1px 10px #207ff9,
					 1px 0 10px #207ff9,
					 0 -1px 10px #207ff9,
					 -1px 0 10px #207ff9; 
	}
}
@-ms-keyframes twinkle {
	0% {
		text-shadow: 0 1px 0px #207ff9,
					 1px 0 0px #207ff9,
					 0 -1px 0px #207ff9,
					 -1px 0 0px #207ff9, 
	}	
	100% {
		text-shadow: 0 1px 0px #207ff9,
					 1px 0 0px #207ff9,
					 0 -1px 0px #207ff9,
					 -1px 0 0px #207ff9,
					 0 1px 10px #207ff9,
					 1px 0 10px #207ff9,
					 0 -1px 10px #207ff9,
					 -1px 0 10px #207ff9; 
	}
}
@keyframes twinkle {
	0% {
		text-shadow: 0 1px 0px #207ff9,
					 1px 0 0px #207ff9,
					 0 -1px 0px #207ff9,
					 -1px 0 0px #207ff9, 
	}	
	100% {
		text-shadow: 0 1px 0px #207ff9,
					 1px 0 0px #207ff9,
					 0 -1px 0px #207ff9,
					 -1px 0 0px #207ff9,
					 0 1px 10px #207ff9,
					 1px 0 10px #207ff9,
					 0 -1px 10px #207ff9,
					 -1px 0 10px #207ff9; 
	}
}
@-webkit-keyframes opacity{
	0%{
		opacity: 0;
	}
	100%{
		opacity: 1;
	}
}
@-o-keyframes opacity{
	0%{
		opacity: 0;
	}
	100%{
		opacity: 1;
	}
}
@-ms-keyframes opacity{
	0%{
		opacity: 0;
	}
	100%{
		opacity: 1;
	}
}
@keyframes opacity{
	0%{
		opacity: 0;
	}
	100%{
		opacity: 1;
	}
}
.left-demo {
	overflow: hidden;
	position: absolute;
	color: #fff;
	left: 0%;
	top: 0%;
	width: 38%;
}
</style>
</head>
<body style="background: #17114a;">
<input type="hidden" id="device" value="${param.device }" />
<input type="hidden" id="app_token" value="${param.app_token }" />
<div style="position: relative;">
	<img src="http://laicunba.b0.upaiyun.com/lcb/qixi-bg.jpg">
	<div id="demo">
		<div id="indemo">
			<div id="demo1"><img src="img/marquee-tip.png"></div>
			<div id="demo2"></div>
		</div>
<!-- 		<marquee behavior="scroll" scrollamount="3"> -->
<!-- 			<div id=""><img src="img/marquee-tip_.png"></div> -->
<!-- 		</marquee> -->
	</div>
	
	<div class="left-demo">
		<img src="http://laicunba.b0.upaiyun.com/lcb/qixi-robot.png" />
	</div>
	<div class="hey-no-stop">嗨<br/>不停</div>
	<c:choose>
		<c:when test="${rewardCount == -1}">
			<div class="finna-chance">我的投资得理财金机会：<a href="javascript:void(0);" id="btn-login">登录查看</a>&nbsp;</div>
		</c:when>
		<c:otherwise>
	 		<div class="finna-chance">我的投资得理财金机会：<span>${rewardCount }</span>次&nbsp;</div>
		</c:otherwise>
	</c:choose>
	<div class="click-tip">点击理财	</div>
	<div class="click-tip2">
		<img id="click-tip0" src="img/click-tip0.png" style="display:none;" />
		<img id="click-tip1" src="img/click-tip1.png" />
	</div>
	<!-- 活动规则按钮 -->
	<div class="btn-rule"></div>
	<!-- - 标的链接到相应标的 - --> 
	<a class="model-box" href="../financial_detail.htm?id=${target90.id }" style="left: 9%;top: 45%;"></a>
	<a class="model-box" href="../financial_detail.htm?id=${target60.id }" style="left: 56%;top: 45%;"></a>
	<a class="model-box" href="../financial_detail.htm?id=${target30.id }" style="left: 9%;top: 63%;"></a>
	<a class="model-box" href="../financial_detail.htm?id=${target15.id }" style="left: 56%;top: 63%;"></a>
	<a class="model-box-last" href="../financial_detail.htm?id=${target7.id }" style="left: 14%;top: 79%;"></a>
	<!-- - 遮罩层 - -->
	<div class="mask"></div>
	<!-- - 活动规则内容 - -->
	<div class="rule-con">
		<!-- - 关闭按钮 - -->
		<div class="btn-close">&times;</div>
		<div style="text-align: center;">活动规则</div>
		<table>
			<tr>
				<td>1.</td>
				<td>活动时间：8.5～8.10；</td>
			</tr>
			<tr>
				<td style="vertical-align: top;">2.</td>
				<td>新用户<span class="color-red">首次投资</span>可获得投资金额对应倍数的理财金；</td>
			</tr>
			<tr>
				<td style="vertical-align: top;">3.</td>
				<td>老用户邀请1位投资好友<span class="color-red">（除随存宝）</span>也可获得1次投资返理财金的机会，<span class="color-red">默认下一次投资使用</span>,多邀多得</td>
			</tr>
		</table>
		<table class="data-number" cellpadding="0" cellspacing="0">
			<tr >
				<td style="border: 1px solid #CCC;">理财期限（天）</td>
				<td style="border: 1px solid #CCC;">理财金倍数</td>
			</tr>
			<tr>
				<td>7</td>
				<td>1</td>
			</tr>
			<tr>
				<td>15</td>
				<td>3</td>
			</tr>
			<tr>
				<td>30&le;X&lt;60</td>
				<td>6</td>
			</tr>
			<tr>
				<td>60&le;X&lt;80</td>
				<td>15</td>
			</tr>
			<tr>
				<td>X&ge;80</td>
				<td>30</td>
			</tr>
		</table>
		<table>
			<tr>
				<td style="vertical-align: top;">例.</td>
				<td>小林首次投资93天【银票宝】10000元，获得30倍理财金为30万元理财金，理财金到期收益为300000*0.03*2/365=49.32 元</td>
			</tr>
		</table>
		<table>
			<tr>
				<td style="vertical-align: top;">4.</td>
				<td>理财金奖励在投资成功后直接发放到账户理财金余额，理财金年化收益率3%，理 财期限为2天，到期后转入账户余额，可提现</td>
			</tr>
			<tr>
				<td>*</td>
				<td>本活动最终解释权归来存吧所有</td>
			</tr>
		</table>
		<div style="text-align: center; margin: 20px 0;">
			<a href="../invite_info.htm?app_view=login"><img src="img/invite-btn.png" style="width: 60%;" /></a>
		</div>
	</div>
</div>

<script src="../js/jquery.min.js"></script>
<script>
var speed=30; //数字越大速度越慢
var tab=document.getElementById("demo");
var tab1=document.getElementById("demo1");
var tab2=document.getElementById("demo2");
tab2.innerHTML=tab1.innerHTML;
function Marquee(){
if(tab2.offsetWidth-tab.scrollLeft<=0)
tab.scrollLeft-=tab1.offsetWidth
else{
tab.scrollLeft++;
}
}
var MyMar=setInterval(Marquee,speed);
// tab.onmouseover=function() {clearInterval(MyMar)};
// tab.onmouseout=function() {MyMar=setInterval(Marquee,speed)};

$(function(){
	$(".btn-rule").click(function(){
		$(".mask,.rule-con").fadeIn();
// 		$("body").css("overflow","hidden");
	});
	$(".btn-close").click(function(){
		$(".mask,.rule-con").fadeOut();
// 		$("body").css("overflow","auto");
	});
	
	$("#btn-login").click(function() {
		if($("#device").val()) {
			window.location.href="chinese_valentine.htm?app_view=login";
		} else {
			window.location.href="../login.htm?tab=account&returnUrl=activity/chinese_valentine.htm"
		}
	});
	
	setInterval("clickTips()", 200);
})

function clickTips() {
// 	$("#click-tip0").show().siblings().hide();
	if($("#click-tip0").css("display") == "none") {
		$("#click-tip0").show();
	} else {
		$("#click-tip0").hide();
	}
	if($("#click-tip1").css("display") == "none") {
		$("#click-tip1").show();
	} else {
		$("#click-tip1").hide();
	}
}
</script>
</body>
</html>
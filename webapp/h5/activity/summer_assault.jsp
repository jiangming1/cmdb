<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>暑假突击战</title>
<link rel='stylesheet' href='../css/summer_assault.css'>
<script src="../js/jquery.min.js"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.1.0.js"></script>
<script src="summer_assault.js"></script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

.contain {
	width:100%;
	position: relative;
	
} 


#page-wrap {
	position:absolute;
	width:71%;
	top:88.45%;
	left:18.5%;
	font: 18px Georgia, serif;
	text-align: center;
	line-height: 16px;
	color: #eee;
	font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
}
.jinduchi{
	position:absolute;
	top:0px;
	left:0px;
	margin-left:-10px;
	margin-top:-9px;
}
.jinduchi img{
	width:23px;
}
.words{
	position:absolute;
	color:#e9e5fc;
	top:33%;
	left:22%;
	font-weight:900;
	font-size:1.3em;
}

.words02{
	position:absolute;
	color:#e9e5fc;
	top:74%;
	left:30%;
	font-weight:900;
	font-size:1.3em;
}

.btn001{
	position:absolute;
	top:38.5%;
	left:7%;
	 width: 22%;
	 height: 12%;
	 border-radius: 50%; 
	 -moz-border-radius: 50%;
	 -webkit-border-radius: 50%;
}
.btn002{
	position:absolute;
	top:38.5%;
	left:39%;
	width: 22%;
	 height: 12%;
	 border-radius: 50%; 
	 -moz-border-radius: 50%;
	 -webkit-border-radius: 50%;
}
.btn003{
	position:absolute;
	top:38.5%;
	left:71%;
	 width: 22%;
	 height: 12%;
	 border-radius: 50%; 
	 -moz-border-radius: 50%;
	 -webkit-border-radius: 50%;
}

.rule{
     position: fixed;
	 right: -20px; 
	 bottom: 30%;
}
.rule img{
	height:50px;
}
.mask{
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background: rgba(0,0,0,0.2);
	z-index: 9;
	display: none;
}
.detail_con{
	background:#eee;
	z-index: 18; 
	position: fixed; 
	display: none;
	left:6%;
	top:5%;
	width: 80%;
	height: 80%;
	overflow:auto; 
	padding: 4%;
	border-radius: 8px;
	font-family: "微软雅黑";
}
.close{
	position: fixed;
	z-index: 20; 
	right: -7%;
	top: 0%;
	display: none;
}

.close img{
	width:70%;
}

.detail_header{
	 border-bottom: 1px solid #CCC; 
	 text-align: center; 
	 font-size: 22px; 
	 padding: 5px; 
	 margin-bottom: 10px; 
	 color: #ff5b2c;
}
.detail_header_list{
	list-style: decimal;
}
.detail_header_list tr td{
	color: #595757;
	font-size: 12px;
	line-height: 18px;	
}

.td-a a{
	color: #ff5b2c !important;
}
.td-1{
	vertical-align: top;
}
.maskimg{
	position:fixed;
	left:0;
	top:0;
	z-index:100;
	display:none;
}

.maskimg img{
	width:93%;
}
</style>
<script type="text/javascript">
$(function() {
	var webPath = '${webPath}';
	var shareurl = '${weiXinVO.link}';
	var userStatus = '${userStatus}';
	var energy = '${energy}';
	if(energy>1000){
		energy = 1000;
	}
	var percent = energy/10;
	$("#energy").css("width",percent+"%");
	$(".meter > span").each(function() {
		$(this).data("origWidth", $(this).width()).width(0).animate({
			width : $(this).data("origWidth")
		}, 1200);

		$(".jinduchi").animate({
			left : (percent-1)+"%"
		}, 1200);
	});
	$(".rule img").click(function() {
		$(".mask,.detail_con,.close").fadeIn();
	});
	$(".close img").click(function() {
		$(".mask,.detail_con,.close").fadeOut();
	});
	$(".btn002").click(function() {
		if(userStatus=="userNull"){
			window.location.href="../login.htm?tab=account&returnUrl="+shareurl; 
			userStatus ='';
			return;
		}
		$(".mask,.maskimg").fadeIn();
		$(".mask").css("background","rgba(0,0,0,0.6)");
	});
	$(".mask").click(function() {
		$(".mask,.maskimg").fadeOut();
	})
	
	
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
         	        'openCard'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
	});


	wx.ready(function() {
		// config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，
		// config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，
		// 则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，
		// 则可以直接调用，不需要放在ready函数中。
		
		
		//隐藏所有的目录
		wx.hideOptionMenu();
		
		//显示想要显示的目录
		wx.showMenuItems({
	    menuList: ['menuItem:share:appMessage',
	               'menuItem:share:timeline'] //要显示的菜单项，所有menu项见附录3
		});
		doshare(webPath,shareurl);
	}); 
}); 
</script>
</head>
<body style="background-color: #061670;">
<div class="contain">
	 <img src="img/summerweixin003.jpg" width="100%" />
	<div class="words">已有<span>${number+200}</span>位勇士达成目标
	</div>
	<div>
		<a class="btn001 btn" href="../../h5/financial_zone.htm?tab=zone"></a>
		<a class="btn003 btn" href="../../h5/invite_info.htm?channel=summerAssault_activity"></a>
		<!-- <a class="btn002 btn" href="summer_assault_btn.htm"></a> -->
		<div class="btn002 btn"></div>
	</div>
	<div class="words02">我的能量值：
	<c:if test="${energy == ''||energy==null }">0</c:if>
	<c:if test="${energy != ''&&energy!=null }">${energy}</c:if>
	</div>
	<div id="page-wrap">	
		<div class="meter red">
			<span  id="energy">${energy}</span>
			<i class="jinduchi"><img src="img/13.png"></i>
		</div>
	</div>
		<div class="rule">
			<img src="img/activitybtn.png" />
		</div>
		<div class="mask"></div>
		<div class="detail_con">
			  <div class="detail_header">活动规则</div>
    <table class="detail_header_list">
        <tr>
           <td class="td-1">1.</td>
           <td>活动时间：7.1-7.15</td>
        </tr>
        <tr>
           <td class="td-1">2.</td>
					<td>参加突击战的勇士只要得到100能量值即能平分五千万理财金大奖；当能量值达到300、500、800时，勇士可额外获得实物奖品。例：达到800能量值，可以选择任意一份实物奖品，达到500能量值，只能选择移动电源或vr眼镜，每位勇士仅能获得一份实物奖品；</td>
		</tr>
        <tr>
           <td class="td-1">3.</td>
					<td>能量值获取方法：<br/>
					① 邀请好友注册：5能量值(需通过活动页面邀请，最多累积获得10能量值)；<br/>
					② 投资银票宝：<br/>
						30天至60天(不含30天)银票宝 每1000元获取5能量值；<br/>60天至80天(不含60天)银票宝 每1000元获取10能量值；<br/>80天以上(不含80天)银票宝 每1000元获取20能量值；<br/>
						 ③ 分享活动页面<span style="color:#ff5b2c;font-size:12px;">(必须分享到朋友圈才能获得积分)</span>：2能量值(每天最多获取2能量值，累积最多获取10能量值)；</td>
				</tr>
        <tr>
           <td class="td-1">4.</td>
           <td>活动奖励发放：<br/>
         	  ① 理财金奖励将在3个工作日内发放到各位勇士的账户中；<br/>
           	② 达到实物奖品发放条件的勇士发送注册手机号＋奖品名称＋收件地址 到“来存吧”微信公众号，奖品将在活动结束后3个工作日内发放；</td>
        </tr>
        <tr>
           <td class="td-1">5.</td>
           <td class="td-a">如有疑问请<br/>拨打客服电话<a href="tel: 400-6191520">400-6191-520</a>或<br/>加入qq群<a href="http://jq.qq.com/?_wv=1027&amp;k=28umF5P">473119359</a>咨询。</td>
        </tr>
        <tr style="font-size: 14px;">  <td class="td-1">*</td>
        <td >活动最终解释权归来存吧所有</td></tr>
    </table>

		</div>
		<div class="close">
				<img src="img/close.png">
			</div>
	</div>
	<form id="shareForm" action="share_summer_assault.htm?share=share" style="display:'none';" method="post">
	</form>
	<div class="maskimg">
		<img src="../img/maskimg.png" />
	</div>

</body>
</html>
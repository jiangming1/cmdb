<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>圣诞节活动</title>
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
.txt-mid{
	text-align: center;
}
.txt-right{
	text-align: right;
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
<body>
<div class="wrap">
	<input type="hidden" id="loginStatus" value="${loginStatus }" />
	<input type="hidden" id="device" value="${param.device }" />
	<input type="hidden" id="app_token" value="${param.app_token }" />
	<img src="http://laicunba.b0.upaiyun.com/lcb/activity/christmas_bg.jpg" />
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
	<div class="btn-rule" style="color: #FFF;text-align: center;"></div>
	<div class="invite-rank">
		<table style="width: 100%;font-size: 14px;color: #1B1B1B;">
			<tr>
				<td colspan="3" style="color:#999; text-align: center;">暂无邀请排行榜</td>
			</tr>
		</table>
	</div>
	<div class="activity-tips" style="text-align: center; font-size: 12px; width: 100%; color:#ff5a2c;">*最终排行榜以活动结束当天数据为准。</div>
	<div class="invite-info" style="overflow: auto;">
		<table style="width: 100%;text-align: center;">
			<tr>
				<c:choose>
					<c:when test="${loginStatus == 1 }">
						<td style="text-align: center;padding-top: 5px; color:#999;" colspan="2">您暂时还没有已邀请好友哦!</td>
					</c:when>
					<c:otherwise>
						<td style="text-align: center;padding-top: 5px; color:#888;" colspan="2">您已登录超时，请点击<a href="javascript:void(0);" id="login-btn" style="color:#25a2fe;display:inline-block;">登录</a>!</td>
					</c:otherwise>
				</c:choose>
			</tr>
		</table>
	</div>
</div>
<div class="mask"></div>
<div class="rule-wrap" style="">
	<img src="http://laicunba.b0.upaiyun.com/lcb/activity/christmas_rule.jpg" style="border-radius: 10px;">
	<div class="btn-close" style="position: absolute;right: -8px;top: -17px;width: 50px;"><img src="img/close.png"></div>
</div>
<script type="text/javascript" src="activity.js"></script>
<script type="text/javascript">
$(function(){
	Activity.ready($("#app_token").val(), "20161221", "INVITE_TOP_INFO,FRIEND_INFO,REG_INFO", {
		"iBeginBuyTime":"2016-12-20 20:00:00",
		"iEndBuyTime":"2016-12-31 00:00:00",
		"fBidType":"CPB",
		"fBeginCreateTime":"2016-12-20 20:00:00",
		"fEndCreateTime":"2016-12-31 00:00:00",
		"fBeginBuyTime":"2016-12-20 20:00:00",
		"fEndBuyTime":"2016-12-31 00:00:00"
	}, function(data) { 
		if(data.INVITE_TOP_INFO && data.INVITE_TOP_INFO != '') {
			var array = data.INVITE_TOP_INFO;
			if(data.REG_INFO && data.REG_INFO != '') {
				array = array.concat(eval('('+data.REG_INFO+')'));
				array.sort(function(a,b){
		            return b.invite_count-a.invite_count});
			}
			var htmlStr = '';
			$(".invite-rank table").html("");
			for(var i in array) {
				if(i < 3) {
					htmlStr += '<tr>' +
								'<td>' + array[i].mobile + '</td>' +
								'<td class="txt-mid">' + array[i].invite_count + '</td>';
					
					if(i == 0) {
						htmlStr += '<td class="txt-right">飞利浦电动牙刷</td>' +
							'</tr>';
					} else if(i == 1) {
						htmlStr += '<td class="txt-right">飞利浦剃须刀</td>' +
							'</tr>';
					} else if(i == 2) {
						htmlStr += '<td class="txt-right">小米小钢炮音箱</td>' +
							'</tr>';
					}
								
				}
			}
			if(htmlStr) {
				$(".invite-rank table").html(htmlStr);
			}
		}
		
		if(data.FRIEND_INFO && data.FRIEND_INFO != '') {
			var array = data.FRIEND_INFO;
			var htmlStr = '';
			$(".invite-info table").html("");
			for(var i in array) {
				htmlStr += '<tr>' +
							'<td>' + array[i].mobile + '</td>';
				
				if(i == 0) {
					htmlStr += '<td style="padding-right: 5px;">20元话费</td>';
				} else if(i == 1) {
					htmlStr += '<td style="padding-right: 5px;">小米移动电源</td>';
				} else{
					htmlStr += '<td style="padding-right: 5px;">无</td>';
				}
				htmlStr += '</tr>';			
			}
			htmlStr += '</table>';
			$(".invite-info table").html(htmlStr);
		}

		Activity.conditions.time(function() {

		});

	});
	
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
		top: rdist(594),
		lineHeight: rdist(56),
	});
	// 二维码内容样式 
	$(".erwm").css({
		width: rdist(205),
		height: rdist(205),
		left: rdist(276),
		top: rdist(704),
	});
	// 邀请按钮 
	$(".btn-invite").css({
		width: rdist(551),
		height: rdist(77),
		left: rdist(98),
		top: rdist(988),
	});
	// 活动规则按钮
	$(".btn-rule").css({
		width: rdist(250),
		height: rdist(28),
		left: rdist(250),
		top: rdist(1085),
	});
	// 邀请排行榜 内容样式
	$(".invite-rank").css({
		width: rdist(520),
		height: rdist(125),
		left: rdist(115),
		top: rdist(1315),
	});
	// 样式
	$(".activity-tips").css({
		top: rdist(1475),
	});
	// 已邀请好友 内容样式
	$(".invite-info").css({
		width: rdist(570),
		height: rdist(190),
		left: rdist(90),
		top: rdist(1735),
	});
	
	// 活动规则样式设置	
	var ruleHeight = rdist(305);
	//console.log("活动规则的高度是："+ ruleHeight);
	$(".rule-wrap").css("marginTop","-" + ruleHeight);

		
	// 活动规则的点击事件
	$(".btn-rule").click(function(){
		$(".mask,.rule-wrap").fadeIn();
	});
 	$(".btn-close,.mask").click(function(){
 		$(".mask,.rule-wrap").fadeOut();
 	});
	
	$("#login-btn").click(function() {
		if($("#device").val()) {
			window.location.href="christmas.htm?app_view=login&device="+$("#device").val();
		} else {
			window.location.href="../login.htm?tab=account&returnUrl=activity/christmas.htm"
		}
	});
	
	$(".btn-invite").click(function() {
		var device = "${param.device}";
		var app_token = "${param.app_token}";
		if($("#loginStatus").val() == 0) {
			if(device) {
				window.location.href="../invite_info.htm?device=app&_app_version=2.0&app_token="+app_token;
			} else {
				window.location.href="../login.htm?tab=account&returnUrl=invite_info.htm";
			}
		} else {
			if(device) {
				window.location.href="../invite_info.htm?device=app&_app_version=2.0&app_token="+app_token;
			} else {
				window.location.href="../invite_info.htm";
			}
		}
	});
});
</script>
</body>
</html>
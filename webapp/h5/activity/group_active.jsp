<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>组团抢话费-首页</title>
<link type="text/css" rel="stylesheet" href="../css/phone_fare.css"/>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.1.0.js"></script>
<script>
	$(function() {	
		var shareurl = 'http://8.laicunba.com/h5/activity/group_regist.htm?invite_code=${inviteCode}';
				wx.config({
					debug : false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
					appId : '${appid}', // 必填，公众号的唯一标识
					timestamp :'${timestamp}', // 必填，生成签名的时间戳
					nonceStr : '${nonceStr}', // 必填，生成签名的随机串
					signature :'${signature}',// 必填，签名，见附录1
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
               //微信好友 
					wx.onMenuShareAppMessage({
						title : '组团抢话费，来存吧万元话费等你抢', // 分享标题
						desc : '送你18888理财金＋年化20%新手宝，加入我的团，跟我一起抢150元话费', // 分享描述
						link :shareurl, // 分享链接
						imgUrl : 'http://8.laicunba.com/h5/activity/img/group_share.jpg', // 分享图标
						type : '', // 分享类型,music、video或link，不填默认为link
						dataUrl : '', // 如果type是music或video，则要提供数据链接，默认为空
						success : function() {
							// 用户确认分享后执行的回调函数
						},
						cancel : function() {
							// 用户取消分享后执行的回调函数
						}
					});
                //朋友圈
					wx.onMenuShareTimeline({
						title : '组团抢话费，来存吧万元话费等你抢！送你18888理财金＋年化20%新手宝，加入我的团，跟我一起抢150元话费', // 分享标题
						link : shareurl, // 分享链接
						imgUrl : 'http://8.laicunba.com/h5/activity/img/group_share.jpg', // 分享图标
						success : function() {
							// 用户确认分享后执行的回调函数
							
						},
						cancel : function() {
							// 用户取消分享后执行的回调函数
							
						}
					});
				//qq 好友  	
					wx.onMenuShareQQ({
					    title: '组团抢话费，来存吧万元话费等你抢！', // 分享标题
					    desc: '送你18888理财金＋年化20%新手宝，加入我的团，跟我一起抢150元话费', // 分享描述
					    link: shareurl, // 分享链接
					    imgUrl: 'http://8.laicunba.com/h5/activity/img/group_share.jpg', // 分享图标
					    success : function() {
							// 用户确认分享后执行的回调函数
							
						},
						cancel : function() {
							// 用户取消分享后执行的回调函数
							
						}
					});
			// qq空间  		
					wx.onMenuShareQZone({
					    title: '组团抢话费，来存吧万元话费等你抢！', // 分享标题
					    desc: '送你18888理财金＋年化20%新手宝，加入我的团，跟我一起抢150元话费!', // 分享描述
					    link: shareurl, // 分享链接
					    imgUrl: 'http://8.laicunba.com/h5/activity/img/group_share.jpg', // 分享图标
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
<div style="width: 100%; position: relavite;">
     <img src="img/group_active.png">
     <div class="btn_invite">立即邀请好友入团</div>
</div>
<div class="mask"></div>
<div class="maskimg">
	<img src="img/maskimg.png" />
</div>
<script>
   $(".btn_invite").click(function(){
	   $(".mask,.maskimg").fadeIn();
   })
   $(".mask").click(function(){
	   $(".mask,.maskimg").fadeOut();
   })
</script>
</body>
</html>
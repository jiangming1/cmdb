<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<title>测试分享</title>
<script src="../js/jquery.min.js"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
	$(function() {
		wx.config({
			debug : true,
			appId : '${weiXinVO.appid}',
			timestamp : '${weiXinVO.timestamp}',
			nonceStr : '${weiXinVO.nonceStr}',
			signature : '${weiXinVO.signature}',
			jsApiList : [ 'onMenuShareQZone', 'onMenuShareTimeline', 'onMenuShareAppMessage', 'onMenuShareQQ', 'onMenuShareWeibo', 'hideMenuItems', 'showMenuItems', 'hideAllNonBaseMenuItem',
					'showAllNonBaseMenuItem', 'translateVoice', 'startRecord', 'stopRecord', 'onRecordEnd', 'playVoice', 'pauseVoice', 'stopVoice', 'uploadVoice', 'downloadVoice', 'chooseImage',
					'previewImage', 'uploadImage', 'downloadImage', 'getNetworkType', 'openLocation', 'getLocation', 'hideOptionMenu', 'showOptionMenu', 'closeWindow', 'scanQRCode', 'chooseWXPay',
					'openProductSpecificView', 'addCard', 'chooseCard', 'openCard' ]
		});

		var shareurl = 'http://8.laicunba.com/h5/regist_new.jsp';

		wx.ready(function() {
			alert("wx ready");
			// config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，
			// config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，
			// 则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，
			// 则可以直接调用，不需要放在ready函数中。

			wx.onMenuShareAppMessage({
				title : '要理财,来存吧!', // 分享标题
				desc : '来存吧票据理财,注册即送18888元理财金,新手宝7天年化收益率达20%!100万小伙伴的选择,让你的每笔财富增值!', // 分享描述
				link : shareurl, // 分享链接
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
				title : '要理财,来存吧!', // 分享标题
				desc : '来存吧票据理财,注册即送18888元理财金,新手宝7天年化收益率达20%!100万小伙伴的选择,让你的每笔财富增值!', // 分享描述
				link : shareurl, // 分享链接
				imgUrl : 'http://8.laicunba.com/h5/img/sharelogo.png', // 分享图标
				success : function() {
					// 用户确认分享后执行的回调函数
					alert("share to QQ ok");

				},
				cancel : function() {
					// 用户取消分享后执行的回调函数
					alert("share to QQ cancle");

				}
			});

			wx.onMenuShareQZone({
				title : '要理财,来存吧2!', // 分享标题
				desc : '来存吧票据理财,注册即送18888元理财金,新手宝7天年化收益率达20%!100万小伙伴的选择,让你的每笔财富增值!', // 分享描述
				link : shareurl, // 分享链接
				imgUrl : 'http://8.laicunba.com/h5/img/sharelogo.png', // 分享图标
				success : function() {
					// 用户确认分享后执行的回调函数
					alert("share to QQ ok");

				},
				cancel : function() {
					// 用户取消分享后执行的回调函数 
					alert("share to QQ cancle");

				}
			});

			
		 
			
			
			
			  document.querySelector('#checkJsApi').onclick = function () {
					alert("hello 6");
					alert(WeixinJSBridge);
					if (typeof WeixinJSBridge == "undefined") {
						alert("请先通过微信搜索  ，通过微信分享文章 ");
					} else {
						alert("WeixinJSBridge.invoke");
						WeixinJSBridge.invoke('shareTimeline', {
							"title" : "要理财,来存吧!",
							"link" : shareurl,
							"desc" : "关注互联网创业",
							"img_url" : 'http://8.laicunba.com/h5/img/sharelogo.png'
						});
					}
				  };
			
			
			
		});
		wx.error(function(res) {

			alert("error:" + res);

		});

		$("#shareBtn").click(function() {
			alert("hello 5");
			alert(WeixinJSBridge);
			if (typeof WeixinJSBridge == "undefined") {
				alert("请先通过微信搜索  ，通过微信分享文章 ");
			} else {
				alert("WeixinJSBridge.invoke");
				WeixinJSBridge.invoke('shareTimeline', {
					"title" : "要理财,来存吧!",
					"link" : shareurl,
					"desc" : "关注互联网创业",
					"img_url" : 'http://8.laicunba.com/h5/img/sharelogo.png'
				});
			}

		});
		 
	});
</script>
</head>
<body>
	hello.

	<a id="sharea" href="lcb://share">立即邀请</a>

	<br />
	<button id="shareBtn">立即邀请11</button>
	
	<br />
	<button id="shareBtn2">立即邀请2</button>
	<br />
	<button id="checkJsApi">checkJsApi</button>
</body>

</html>
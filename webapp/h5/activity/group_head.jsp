<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>组团抢话费-团长</title>
<link type="text/css" rel="stylesheet" href="../css/phone_fare.css"/>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.1.0.js"></script>
<script type="text/javascript">
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
<div style="width: 100%;">
     <img src="img/group_banner.png">
</div>
<div class="redcolor" style="width: 100%; text-align: center;font-size: 2rem;">我的团</div>
<div style="width: 100%;">
    <table style="width: 100%;">
         <tr>
             <td style="width: 25%"></td>
             <td style="width: 50%"></td>
             <td style="width: 25%"><a href="group_chart.htm" class="redcolor">排行榜＞</a></td>
         </tr>
    </table>
</div>
<div style="width:90%; margin: 1rem auto; height: 15rem; overflow: scroll;overflow-x:hidden;overflow-y: auto;">
	<table style="width: 80%; margin: 0 auto;">
		<tr class="redcolor" style=" font-size: 1.2rem;">
			<td style="width: 40%; text-align: center;">团长</td>
			<td style="width: 60%; text-align: center;">${fn:substring(userMobile, 0, 3)}****${fn:substring(userMobile, 7, 11)}</td>
		</tr>
		<c:forEach items="${memberList }" var="member" varStatus="status">
			<tr>
				<td style="width: 40%; text-align: center;">${status.index + 2 }</td>
				<td style="width: 60%; text-align: center;">${fn:substring(member.memberMobile, 0, 3)}****${fn:substring(member.memberMobile, 7, 11)}</td>
			</tr>
		</c:forEach>
     </table>
</div>
<div class="btn_rule fr">活动规则 〉</div>
<div class="clearfix"></div>
<c:if test="${groupStatus==null||groupStatus==''||groupStatus==1 }">
	<div class="clearfix" style="width: 100%; margin-top: 2rem;">
	    <div class="fl btn_continue" id="btn_end">结束组团领话费</div>
	    <div class="fr btn_continue" id="btn_continue">继续邀请抢话费</div>
	</div>
</c:if>
<!-- 活动规则内容 -->
<div class="mask"></div>
<div class="mask1"></div>
<div class="maskimg">
	<img src="img/maskimg.png" />
</div>
<div class="group_rule">
     <div class="rule_title">活动规则</div>
	 <table class="rule_con">
	        <tr>
	            <td class="td-1">1.</td>
	            <td>活动时间：5.31-6.15；</td>
	        </tr>
	        <tr>
	        <td class="td-1">2.</td>
	            <td>老用户邀请新用户组团，老用户升级为团长；</td>
	        </tr>
	        <tr>
	            <td class="td-1">3.</td>
	            <td>老用户可随时结束组团，按照团员人数领取话费奖励：(整个团至少有一个认证用户)<br/>
	                3人团：10元话费，<br/>
	                6人团：30元话费，<br/>
	                9人团：50元话费；<br/>
	            </td>
	        </tr>
	        <tr>
	            <td class="td-1">4.</td>
	            <td>活动结束后，团员数排名前三位的团长可额外获得100元、80元、50元话费奖励，如出现团员数相同情况，按达到团员数时间顺序排名；</td>
	        </tr>
	        <tr>
	            <td class="td-1">5.</td>
	            <td class="td-a">例：小林邀请了8个好友，组成了9人团，但是他想冲击100元话费大奖，又继续邀请了10位好友，组成了19人团，活动结束后排在团员人数的第二名，这样小林总获得9人团奖励50元话费+团员数第二名奖励80元话费，共130元话费；</td>
	        </tr>
	        <tr>
	            <td class="td-1">6.</td>
	            <td class="td-a">话费将在活动结束后3个工作日内直接充值到团长注册的手机号;</td>
	        </tr>
	        <tr>
	            <td class="td-1">7.</td>
	            <td class="td-a">如有疑问请<br/>关注<span style="color: #FF5C47;">来存吧微信公共号</span>或<br/>加入<span style="color: #FF5C47;">qq群473119359</span>咨询。</td>
	        </tr>
	        <tr>
	            <td class="td-1"></td>
	            <td class="td-a" style="color: #FF7433;">*最终解释权归来存吧所有*</td>
	        </tr>
	 </table>
	 <div class="btn_sure" style="width: 70%;">确定</div>
</div>
<!-- 结束组团活动弹出框 -->
<div class="end_alert">
     <div style="text-align: center;margin-top: 8%;font-size: 1.2rem; padding: 0 5%;">您的团员数为${memberCount }人，可领取${rewardAmount }元话费，您确定结束组团吗?</div>
     <div style="margin: 10% 0 15%;">
          <a href="javascript:void(0);" class="btn_end_alert" id="end_yes" style="margin-left: 18%;">是</a>
          <a href="javascript:void(0);" class="btn_end_alert" id="end_no" style="margin-left: 16%;">否</a>
     </div>
</div>
<!-- 点击是 之后的弹出框 -->
<div class="end_alert1">
     <div style="text-align: center;margin-top: 10%;font-size: 1.2rem;">您的团员数为12人，<br/>可领取50元话费</div>
     <div class="btn_receive" id="btn_draw">领取50元话费</div>
</div>
<!-- 点击领取话费按钮  之后的弹出框 -->
<div class="end_alert2" style="position: relavite;">
<!--      <span class="btn_close" style="">&times;</span> -->
     <div style="text-align: center;margin-top: 10%;font-size: 1.2rem;">成功领取${rewardAmount }元话费<br/>活动结束三个工作日内到账</div>
     <a class="btn_receive" id="btn_financial" href="../financial_zone.htm?tab=zone">要理财，来存吧</a>
</div>
<script type="text/javascript">
  //点击活动规则按钮 弹出活动规则内容 js 
	$(".btn_rule").click(function(){
		$(".mask,.group_rule").fadeIn();
	});
	$(".btn_sure").click(function(){
		$(".mask,.group_rule").fadeOut();
	});
  // 点击结束组团活动按钮  弹出框  js
    $("#btn_end").click(function(){
    	$(".mask1,.end_alert").fadeIn();
    });
  //点击 是 按钮 弹出结算后邀请入团人数及所得话费 
    $("#end_yes").click(function(){
    	$.post("terminate_group.htm", null, function(data) {
			if (data.code == "success") {
				$(".end_alert").hide();
		    	$(".end_alert2").fadeIn();
			} else if (data.code == "fail") {
				$(".end_alert").hide();
				$(".end_alert2 div").text("领取失败," + data.msg);
		    	$(".end_alert2").fadeIn();
			}
		}, "json");
    	
    });
  // 点击领取话费按钮 弹出到账时间的提示
    $("#btn_draw").click(function(){
    	$(".end_alert1").hide();
    	$(".end_alert2").fadeIn();
    })
  //点击 X  关闭 弹出框 
    $(".btn_close").click(function(){
    	$(".mask1,.end_alert2").fadeOut();
    })
  //点击 否  按钮 关闭结束组团弹出框 
    $("#end_no").click(function(){
    	$(".mask1,.end_alert").fadeOut();
    });
  // 点击继续邀请抢话费活动按钮 弹出框 js 
	$("#btn_continue").click(function(){
		$(".mask,.maskimg").fadeIn();
	});
	$(".mask,.maskimg").click(function(){
		$(".mask,.maskimg,.group_rule").fadeOut();
	});

</script>
</body>
</html>
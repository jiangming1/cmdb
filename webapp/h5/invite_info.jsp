<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta name="format-detection" content="telephone=no">
<title>邀请返现</title>
<script src="js/jquery.min.js"></script>
<script src="js/jweixin-1.0.0.js"></script>
<link type="text/css" rel="stylesheet" href="invite_info.css">
<script>
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
    <c:if test="${param.device==null||param.device=='' }">
	<div class="backBar">
		<table>
			<tr>
				<td style="width: 50px;"><a href="my_account.htm?tab=account&t=<%=new Date()%>"><img src="img/icon_fanhui.png" style="height: 40px;"></a></td>
				<td>邀请返现</td>
				<td style="width: 50px;"></td>
			</tr>
		</table>
	</div>
	</c:if>
	<div><img src="img/invitebg005.jpg"></div>
	<div class="invitebody">
		<div class="invitecodecontent">
			<input type="hidden" id="channel" value="${param.channel}" />
			<div class="invitetext">我的邀请码</div>
			<div class="invitenum">
				${inviteCode}</div>
			<div class="inviteQrCode">
				<img src="${picPath }${inviteQrCode}" />
			</div>
			<div class="scanningremain">微信扫一扫</div>
			<c:if test="${param.device==null||param.device=='' }">
				<div class="inviteaction" id="inviteaction">立即邀请</div>
			</c:if>
			<c:if test="${param.device!=null&&param.device!='' }">
					<a id="shareanew" href="lcb://share">
					<div class="inviteactionapp" id="inviteactionappnew">立即邀请</div></a>
			</c:if>
            <div class="btn-invite-rule">点击查看活动规则></div>
		</div>
		<div style="background: #dcdcdc;width: 100%; padding-bottom: 1rem;position: relative;">
		    
			<div class="invite-info" style="padding: 15px;">
				<div style="background-color: #fff; padding:15px;border-radius: 5px;">
					<div style="text-align: left; font-size: 14px;">邀请一位好友投资您可得30元现金券</div>
					<img src="img/rewardinfo02.png" />
					<div style="font-size: 14px; text-align: left; color: #ef491c;">您的好友将获得18888理财金+年化20%新手宝</div>
				</div>
			</div>
			<div class="invite-info" style="padding: 0 15px;">
				<div style="background-color: #fff; padding:15px;border-radius: 5px;">
					<div style="color: #FF7433;padding-top:1rem;padding-bottom: 0.5rem; border-bottom: 1px solid #CCC;">我的邀请战绩</div>
					<div class="invite-info-top clearfix">
						<div class="invite-info-top-left">
							共邀请<span class="inviteinfofontcolor">${inviteList_size}</span>名好友
						</div>
						<div class="invite-info-top-right">
							目前收益<span class="inviteinfofontcolor">${allCashCoupon }</span>元
						</div>
					</div>
					<div class="inviteinfocontent">
						<div class="inviteinfocontenttop clearfix">
							<div class="inviteinfofriendsnum">好友号码</div>
							<div class="inviteinfostatus">邀请状态</div>
							<div class="inviteinforewards">现金券奖励</div>
						</div>
						<div class="inviteinfocontentbody clearfix">
							<c:forEach items="${inviteList }" var="inviteUser">
								<div class="inviteinfofriendsnum">${inviteUser.mobile }</div>
								<div class="inviteinfostatus">${inviteUser.status }</div>
								<div class="inviteinforewards">${inviteUser.cashcoupon }</div>
								<br>
							</c:forEach>
						</div>				
					</div>
				</div>
			</div>
	    </div>
	</div>
	<div class="mask"></div>
	<div class="maskimg">
		<img src="img/maskimg.png" />
	</div>
	<!-- 活动规则   -->
	<div class="invite_rule_con">
          <div class="rule_title">活动规则</div>
          <table class="rule_con">
               <tr>
                   <td class="td-1">1）&nbsp;</td>
                   <td>好友注册成功并首次投资定期理财，您将获得30元现金券1张（投资5000元60天以上订单可使用）</td>
               </tr>
               <tr>
               <td class="td-1">2）&nbsp;</td>
                   <td>获得的现金券可在&nbsp;我的账户-我的红包&nbsp;中查看</td>
               </tr>
               <tr>
                   <td class="td-1">3）&nbsp;</td>
                   <td>您的好友将获得：<br/>18888理财金收益+20%新手宝投标资格</td>
               </tr>
            </table>
            <div class="btn_sure">确&nbsp;定</div>
     </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
	<script type="text/javascript">
		$(".inviteaction").click(function() {
			$(".mask,.maskimg").fadeIn();
		})
		$(".mask,.maskimg,.btn_sure").click(function() {
			$(".mask,.maskimg,.invite_rule_con").fadeOut();
		})
		$(".btn-invite-rule").click(function(){
			$(".mask,.invite_rule_con").fadeIn();
		})
		
		//支持app老版本的分享按钮
		var version = '${param._app_version}';
		if(version!=null&&version!=''){
			//$('#shareanew').attr('href','invite_info.htm?app_view=share&title=要理财,来存吧!&url=http://8.laicunba.com/h5/regist_new.jsp&summary=来存吧票据理财,注册即送18888元理财金,新手宝7天年化收益率达20%!100万小伙伴的选择,让你的每笔财富增值!');
			$('#shareanew').attr('href','invite_info.htm?app_view=share&title=%e8%a6%81%e7%90%86%e8%b4%a2%2c%e6%9d%a5%e5%ad%98%e5%90%a7!&url=http://8.laicunba.com/h5/regist_new.jsp&summary=%e6%9d%a5%e5%ad%98%e5%90%a7%e7%a5%a8%e6%8d%ae%e7%90%86%e8%b4%a2%2c%e6%b3%a8%e5%86%8c%e5%8d%b3%e9%80%8118888%e5%85%83%e7%90%86%e8%b4%a2%e9%87%91%2c%e6%96%b0%e6%89%8b%e5%ae%9d7%e5%a4%a9%e5%b9%b4%e5%8c%96%e6%94%b6%e7%9b%8a%e7%8e%87%e8%be%be20%25!100%e4%b8%87%e5%b0%8f%e4%bc%99%e4%bc%b4%e7%9a%84%e9%80%89%e6%8b%a9%2c%e8%ae%a9%e4%bd%a0%e7%9a%84%e6%af%8f%e7%ac%94%e8%b4%a2%e5%af%8c%e5%a2%9e%e5%80%bc!');
	
		}
		
		function getShareInfo(){
			var title = "要理财,来存吧!";
			var summary = "来存吧票据理财,注册即送18888元理财金,新手宝7天年化收益率达20%!100万小伙伴的选择,让你的每笔财富增值!";
			var url = "http://8.laicunba.com/h5/regist_new.jsp";
			window.share.onSumResult(summary,title,url);
			return{
				title:title,
				summary:summary,
				url:url
			}	
		}
		
		function getShareInfoIOS(){
			var title = "要理财,来存吧!";
			var summary = "来存吧票据理财,注册即送18888元理财金,新手宝7天年化收益率达20%!100万小伙伴的选择,让你的每笔财富增值!";
			var url = "http://8.laicunba.com/h5/regist_new.jsp";
			return{
				title:title,
				summary:summary,
				url:url
			}	
		}
	</script>
</body>
</html>
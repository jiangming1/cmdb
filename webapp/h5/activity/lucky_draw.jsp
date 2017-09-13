<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<title>转盘抽奖</title>
<link type="text/css" rel="stylesheet" href="../css/lcb_wx_common.css?201601241"/>
<link type="text/css" rel="stylesheet" href="../css/zpmain.css">
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.1.0.js"></script>
<script src="lucky_draw.js?v=201605172119"></script>
<script type="text/javascript">
$(function() {	
	var shareurl = 'http://8.laicunba.com/h5/activity/lucky_draw.htm';
	wx.config({
		debug : false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		appId : '${appid}', // 必填，公众号的唯一标识
		timestamp :'${timestamp}', // 必填，生成签名的时间戳
		nonceStr : '${nonceStr}', // 必填，生成签名的随机串
		signature :'${signature}',// 必填，签名，见附录1
		jsApiList: [
		     'onMenuShareQZone',
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
				title : '我在来存吧摇大奖啦！', // 分享标题
				desc : 'Iphone6s，88元现金红包，一起带回家！', // 分享描述
				link :shareurl, // 分享链接
				imgUrl : 'http://8.laicunba.com/h5/img/sharelogo.png', // 分享图标
				type : '', // 分享类型,music、video或link，不填默认为link
				dataUrl : '', // 如果type是music或video，则要提供数据链接，默认为空
				success : function() {
					// 用户确认分享后执行的回调函数
					$("#shareForm").submit();
				},
				cancel : function() {
					// 用户取消分享后执行的回调函数
				}
			});

			wx.onMenuShareTimeline({
				title : '我在来存吧摇大奖啦！Iphone6s，88元现金红包，一起带回家！', // 分享标题
				link : shareurl, // 分享链接
				imgUrl : 'http://8.laicunba.com/h5/img/sharelogo.png', // 分享图标
				success : function() {
					// 用户确认分享后执行的回调函数
					$("#shareForm").submit();
				},
				cancel : function() {
					// 用户取消分享后执行的回调函数
					
				}
			});
			
			wx.onMenuShareQQ({
			    title: '我在来存吧摇大奖啦！', // 分享标题
			    desc: 'Iphone6s，88元现金红包，一起带回家！', // 分享描述
			    link: shareurl, // 分享链接
			    imgUrl: 'http://8.laicunba.com/h5/img/sharelogo.png', // 分享图标
			    success : function() {
					// 用户确认分享后执行的回调函数
			    	$("#shareForm").submit();
				},
				cancel : function() {
					// 用户取消分享后执行的回调函数
					
				}
			});
			
			wx.onMenuShareQZone({
			    title: '我在来存吧摇大奖啦！', // 分享标题
			    desc: 'Iphone6s，88元现金红包，一起带回家！', // 分享描述
			    link: shareurl, // 分享链接
			    imgUrl: 'http://8.laicunba.com/h5/img/sharelogo.png', // 分享图标
			    success : function() {
					// 用户确认分享后执行的回调函数
			    	$("#shareForm").submit();
				},
				cancel : function() {
					// 用户取消分享后执行的回调函数
					
				}
			});

	}); 
}); 
</script>
</head>
<body style=" background: #85def5;">
<div style="width: 100%;">
	<input type="hidden" id="app_token" name="app_token" value="${app_token }" />
	<input type="hidden" id="msgType" name="msgType" value="${msgType }" />
	<div><img src="img/zpact05111420.png"></div>
	<div style="  position: relative; margin-top: 110px;">
		<img src="img/zpbg0512.png">
		<div class="zpcon" style=" position: absolute;left: 50%;top: 50%; margin-left: -150px; margin-top: -260px; width: 300px; height: 300px;">
               <img src="img/zpcon05121001.png" >
          </div>
          <div class="btn_chou" style=" position: absolute;left: 50%;top: 50%; margin-left: -50px; margin-top: -160px; width: 100px; height: 100px;">
               <img src="img/btn_chou.png" >
          </div>
          <button class="btn_run" style=" position: absolute;left: 50%;top: 50%; margin-left: -35px; margin-top: -145px; width: 70px; height: 70px; border-radius: 100%; cursor: pointer; border: 0;background: transparent;outline: none;z-index: 40;">
              
          </button>
          <div style=" position: absolute;left: 17%;bottom: 18%; width: 80px;"><img src="img/tree_tip.png"></div>
          <div style=" position: absolute;left: 19%;bottom: 27%; font-size: 10px; transform: rotate(-10deg) ">剩余次数:<span class="residue">${luckyDrawCount }</span></div>
     </div>
</div>
<!-- 活动规则  -------------------------- -->
<div class="rule"> 活动规则</div>
<div class="mask"></div>
<div class="detail_con">
    <div class="detail_header">活动规则</div>
    <table class="detail_header_list">
        <tr>
           <td class="td-1">1.</td>
           <td>活动时间：5.16-5.30；</td>
        </tr>
        <tr>
           <td class="td-1">2.</td>
           <td>所有用户都可分享获得抽奖机会，且每位用户仅可通过分享获得一次摇转盘机会；</td>
        </tr>
        <tr>
           <td class="td-1">3.</td>
           <td>所有用户投资定期理财项目均可获得摇转盘机会，活动期间每投资1笔即可获得1次摇转盘的机会，上不封顶，多投多得；</td>
        </tr>
        <tr>
           <td class="td-1">4.</td>
           <td>如您摇到实物奖品，客服将会在3个工作日与您联系；现金将会在客服核实之后发放到您的随存宝账户中；红包会由系统自动发放到您的红包账户，请注意查看；</td>
        </tr>
        <tr>
           <td class="td-1">5.</td>
           <td class="td-a">如有疑问，请拨打客服电话：<br/><a href="tel: 400-6191520">400-6191-520</a>
           或加入qq群：<br/><a href="http://jq.qq.com/?_wv=1027&amp;k=28umF5P">473119359</a>咨询</td>
        </tr>
    </table>
    <div class="btn_sure">确定</div>
</div>
<!-- 中奖弹出层 ----------------------- -->
<div class="prize_mask">
    <div class="close">&times;</div>
    <div class="prize_con"></div>
    <div class="btn_look" >
    <c:choose>
		<c:when test="${param.device==null || param.device==''}">
			<a href="../red_package_list.htm?app_token=${app_token }" style=" color: #FFF;">点击查看</a>
		</c:when> 
		<c:otherwise>
			<a href="laicunbapackage://package" style=" color: #FFF;">点击查看</a>
		</c:otherwise>
	</c:choose>
    </div>
</div>
<div class="prize_mask1">
      <div class="prize_con"></div>
      <div class="btn_close" ><a href="javascript:void(0);" style=" color: #FFF;">点击关闭</a></div>
</div>
<!-- 第一次还未抽奖时的提示信息 -->
<div class="warm_tips tips1">
    <div class="close">&times;</div>
    <div><img src="../zpimages/tips.png"></div>
    <div style="text-align: center;">点击右上角分享可增加摇转盘机会哦！</div>
	<div class="btn_share" ><a href="javascript:void(0);" style=" color: #FFF;">点击关闭</a></div>
</div>
<!-- 抽过奖后抽奖次数为零的提示信息 -->
<div class="warm_tips tips2">
     <div class="close">&times;</div>
     <div><img src="../zpimages/tips.png"></div>
     <div style="text-align: center;">您的摇奖次数为0，<br/>来存吧，投一次转一次，转了财会来！</div>
	<c:choose>
		<c:when test="${param.device==null || param.device==''}">
			<div class="target_financial" rel="http://8.laicunba.com/h5/financial_zone.htm?tab=zone">来存吧</div>
		</c:when> 
		<c:otherwise>
			<div class="target_financial" rel="laicunbafinancial://financial">来存吧</div>
		</c:otherwise>
	</c:choose>
</div>
<div style=" background: #fdeccb; width: 100%; padding: 10px 0; margin-top: -5px;">
     <div style="border-bottom: 1px solid #e5920b; color: #e5920b; width: 40%;font-size: 18px; margin: 0 auto; text-align: center;">幸运中奖用户</div>
     <div class="Winning_info"> 
         <ul class="roll_list">
         <c:choose>
			<c:when test="${luckyUserList != null && fn:length(luckyUserList) > 0}">
         	<c:forEach items="${luckyUserList }" var="luckyUser">
         	 <li>用户${fn:substring(luckyUser.mobile, 0, 3)}****${fn:substring(luckyUser.mobile, 7, 11)}摇到了${luckyUser.amount}元红包</li>
         	</c:forEach>
         </c:when>
         <c:otherwise>
             <li>用户189****7422摇到了10元话费</li>
             <li>用户135****6456摇到了88元现金</li>
             <li>用户137****5813摇到了5.2元爱情红包</li>
             <li>用户151****3009摇到了10元话费</li>
             <li>用户183****6949摇到了10元红包</li> 
             <li>用户189****6395摇到了5元红包</li>
             <li>用户182****8833摇到了18元现金</li>
             <li>用户187****8059摇到了5元红包</li>
             <li>用户150****1079摇到了8.8发财红包</li>
             <li>用户178****3582摇到了5.2元爱情红包</li>
             <li>用户180****0571摇到了5元红包</li>
             <li>用户187****4631摇到了18元现金</li>
             <li>用户151****7355摇到了10元话费</li>
             <li>用户157****4126摇到了5元红包</li>
             <li>用户135****1784摇到了5元红包</li>
             <li>用户134****8131摇到了5元红包</li>
             <li>用户186****0457摇到了8.8发财红包</li>
             <li>用户135****0211摇到了5.2元爱情红包</li>
             <li>用户188****2944摇到了10元话费</li>
             <li>用户159****4600摇到了10元红包</li>
             <li>用户157****5367摇到了8.8发财红包</li>
             <li>用户135****2296摇到了5.2元爱情红包</li>
             <li>用户158****7777摇到了8.8发财红包</li>
             <li>用户150****4463摇到了5.2元爱情红包</li>
             <li>用户150****2546摇到了5元红包</li>
             </c:otherwise>
             </c:choose>
         </ul>
     </div>
</div>
<form id="shareForm" action="share_lucky_draw.htm">
</form>
</body>
</html>

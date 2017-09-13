<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>夏日旅游趴</title>
  <link rel="stylesheet" href="../css/idangerous.swiper.css">
  <link rel='stylesheet' href='summer_travel.css'>
</head>
<body>
<div>
<img src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel/travelContent.jpg" width="100%" />
<img class="rule_button" src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel/rule_button.png" />
<input type="hidden" id="device" value="${param.device }" />
<div class="activity" >
   <div class="device">
  	<div align="center" > <img class="topImg" src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel/top.png" width="7%"/></div>
  	<div align="center" > <img class="buttomImg" src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel/buttom.png" width="7%" /></div>
    <div class="swiper-container">
      <div  class="swiper-wrapper">
      	<div class="swiper-slide">
            <img id="disney" src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel/disney.png" />
            <span style="display:none;" id="500000">上海迪斯尼</span>
        </div>
		 <div class="swiper-slide">
            <img id="paris"  src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel/paris.png" />
            <span style="display:none;" id="1300000">度假胜地巴厘岛</span>
        </div>
        <div class="swiper-slide">
           <img id="qingmai" src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel/qingmai.png" />
           <span style="display:none;" id="1000000">清迈5日游</span>
        </div>
		 <div class="swiper-slide">
            <img id="wuzheng" src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel/wuzheng.png" />
            <span style="display:none;" id="250000">江南乌镇</span>
        </div>
		 <div class="swiper-slide">
            <img id="yunnan" src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel/yunnan.png" />
            <span style="display:none;" id="800000">云南摄影之旅</span>
        </div>
         <div class="swiper-slide">
           <img id="cash5" src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel/cash5.png" />
           <span style="display:none;" id="3000">5元现金券</span>
        </div>
        <div class="swiper-slide">
           <img id="cash10"  src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel/cash10.png" />
           <span style="display:none;" id="4000">10现金券</span>
        </div>
        <div class="swiper-slide">
          <img id="giftCard30" src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel/giftCard30.png" />
          <span style="display:none;" id="20000">30元携程礼品卡</span>
        </div>
        <div class="swiper-slide">
          <img id="giftCard100" src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel/giftCard100.png" />
          <span style="display:none;" id="50000">100元携程礼品卡</span>
        </div>
        <div class="swiper-slide">
          <img id="giftCard200" src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel/giftCard200.png" />
          <span style="display:none;" id="90000">200元携程礼品卡</span>
        </div>
      </div>
    </div>
  </div>

<div class="button_exchange" align="center" onclick="exchangeReward()">
	<img src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel/exchange-button.png" width="80%">
</div>
			<div class="exchange_process">
				<span class="touzi"></span>
				<img src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel/now_exchange.png" width="100%"/>
				<div class="exchange_process_button"> <img class="confirm_button" src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel/exchange_confirm_button.png" />
				<img class="cancel_button" src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel/exchange_cancel_button.png" /></div>
			</div>
			
			<div  class="exchange_success">
				<span class="touzi"></span>
				<img src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel/exchange_success.png" width="100%"/>
				<div class="exchange_process_button"> 
				<img class="copy_weixin_number" src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel/exchange_success_button02.png" />
				<img class="lookfor_reward" src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel/exchange_success_button01.png" /></div>
			</div>
			<div  class="exchange_fail">
				<span class="touzi"></span>
				<div class="surplus touzi"></div>
				<div class="need_buy touzi"></div>
				<div class="reward_product"></div>
				<img src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel/exchange_fail.png" width="100%"/>
				<div class="exchange_fail_button"> 
				<img class="close_fail" src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel//exchange_fail_button02.png" />
				<img class="buy_financing" src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel/exchange_fail_button01.png" /></div>
			</div>
<hr class="hr" color="#ccc"/>
<div class="activity_button" align="center" > <a href="#"><img src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel/activity_button.png" width="95%" /></a></div>
<div class="my_button" align="center" ><a onclick="change('myInfo')" > <img  src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel/my_button.png" width="95%"/></a></div>
</div>
		<div class="myInfo" style="display: none;">
			<div class="my_top">
				<div class="touzi touzi_title">累积投资60天以上银票宝</div>
				<div class="touzi touzi_content">
					<span style="font-size: 1.3em;" class="alreadyBuy">10000</span>元
				</div>
				<div class="touzi surplus_title" >剩余可兑换奖励金额</div>
				<div class="touzi surplus_content">
					<span style="font-size: 1.3em;" class="surplusMoney">5000</span>元
				</div>
				<img src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel/my_top.png" width="100%" />
			</div>
			<div class="my_buttom">
				<div class="exchange exchange_title">我兑换的奖品</div>
				<div class="exchange reward">
				</div>
				<img src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel/my_buttom.png" width="100%" />
			</div>
			<hr class="hr" color="#ccc" />
			<div class="activity_button" align="center">
				<a onclick="change('activity')"><img
					src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel/activity_button02.png" width="95%" /></a>
			</div>
			<div class="my_button" align="center">
				<a href="#"> <img src="http://laicunba.b0.upaiyun.com/lcb/activity/summertravel/my_button02.png"
					width="95%" /></a>
			</div>  
		</div>
	</div>
	
	
	<div class="mask"></div>
	<div class="detail_con">
			  <div class="detail_header">活动规则</div>
    <table class="detail_header_list">
        <tr>
           <td class="td-1">1.</td>
           <td>活动时间：8.19-8.30</td>
        </tr>
        <tr>
           <td class="td-1">2.</td>
					<td>活动期间，用户累积投资60天以上【银票宝】达到一定金额后，可在【活动】页面兑换相应奖品，兑换后将减去对应的累积投资金额；奖品可重复兑换</td>
		</tr>
        <tr>
           <td class="td-1">3.</td>
					<td>"累积投资金额"指活动期间累积投资60天以上【银票宝】的金额,"剩余可兑换奖励金额"指还能兑换奖品的投资金额；累积投资金额=已兑换奖品的投资金额+剩余可兑换奖励金额</td>
		</tr>
        <tr>
           <td class="td-1">4.</td>
           <td>现金券将在您兑换后实时发放到账户中;兑换携程礼品卡和旅游套餐的用户请添加微信号为"laicunba1"好友并备注注册手机号，奖品将会通过在活动结束3个工作日内通过微信号发放</td>
        </tr>
        <tr>
           <td class="td-1">5.</td>
           <td>所有旅游套餐均为跟团游，套餐包括交通工具（大巴或飞机）和酒店费用，其他具体内容可咨询微信客服</td>
        </tr>
        <tr>
           <td class="td-1">6.</td>
           <td>旅游期间发生任意问题，请与旅行社沟通，与本平台无关</td>
        </tr>
        <tr>
           <td class="td-1">7.</td>
           <td class="td-a">如有疑问请<br/>拨打客服电话<a href="tel: 400-6191520">400-6191-520</a>或<br/>加入qq群<a href="javascript:void(0);">473119359</a>咨询。</td>
        </tr>
        <tr style="font-size: 14px;">  <td class="td-1">*</td>
        <td >活动最终解释权归来存吧所有</td></tr>
    </table>

		</div>
		<div class="close">
				<img src="img/close.png">
			</div>
<script src="../js/jquery.min.js"></script>
<script src="../js/idangerous.swiper-2.1.min.js"></script>
<script src="../js/clipboard.min.js"></script>
<script>
var divheight = $(window).height();
$(".swiper-container").css("height",divheight*0.45);
$(".reward").css("height",divheight*0.18);
  var mySwiper = new Swiper('.swiper-container',{
    centeredSlides: true,
    slidesPerView: 2,
    watchActiveIndex: true,
	mode: 'vertical',
	loop:true,
  })
  	
  function change(div_name){
	 	  if(div_name=='activity'){
		  $(".activity").css("display","block");
		  $(".myInfo").css("display","none");
	  }else if(div_name=='myInfo'){
		  var p = {
				  t :new Date(),
				  app_token:'${param.app_token}'
		  }
		  $.post("summer_travel_my_info.htm",p,function(data) {
			  if(data.userStatus == 0){
				  if($("#device").val()) {
					  window.location.href="anniversary.htm?app_view=login";
				  }else{
					window.location.href="../login.htm?tab=account&returnUrl="+data.url;
				  }
				}else{
					$(".mask,.exchange_success,.activity").fadeOut();
					$(".myInfo").fadeIn();
					 $(".alreadyBuy").html(data.alreadyBuy);
					 $(".surplusMoney").html(data.surplus);
					 var rewardList = data.rewardContents;
					 $(".reward").empty();
					 for(var i in rewardList){		 
						 $(".reward").append("<div class='reward_info'>"+rewardList[i]+"</div>");
					 }
				}
		  }, "json");
	  }
  }
  
	$(".rule_button").click(function() {
		$(".mask,.detail_con,.close").fadeIn();
	});
	$(".close img").click(function() {
		$(".mask,.detail_con,.close").fadeOut();
	});
	
	function exchangeReward(){
		var rewardContent = $(".swiper-slide-active span").text();
		$(".mask,.exchange_process").fadeIn();
		$(".exchange_process span").html(rewardContent);	
	}
	$(".cancel_button").click(function() {
		$(".mask,.exchange_process").fadeOut();
	});
	$(".confirm_button").click(function() {
		var rewardContent = $(".swiper-slide-active span").text();
		var rewardValue = $(".swiper-slide-active span").attr("id");
		var p = {
			t:new Date(),
			rewardMoney : rewardValue,
			rewardContent : rewardContent,
			app_token:'${param.app_token}'
		}
		$.post("summer_travel_exchange_reward.htm", p,function(data) {
			if(data.userStatus == 0){
				 if($("#device").val()) {
					 window.location.href="anniversary.htm?app_view=login";
				  }else{
					window.location.href="../login.htm?tab=account&returnUrl="+data.url;
				  }
			}else{
				if(data.exchangeStatu == 0){
					$(".exchange_fail span").html(rewardContent);
					$(".reward_product").html("就可以兑换"+'“'+rewardContent+'”');
					$(".exchange_process").fadeOut();
					$(".exchange_fail").fadeIn();
					$(".surplus").html("剩余可兑换奖励金额:"+data.surplus+"元");
					$(".need_buy").html("再投资60天以上<span color=''>【银票宝】</span>"+data.needBuy+"元");
				}else if(data.exchangeStatu == 1){
					$(".exchange_success span").html(rewardContent);
					$(".exchange_process").fadeOut();
					$(".exchange_success").fadeIn();
				}		
			}
		}, "json");
		
	});
	$(".copy_weixin_number").click(function() {
		$(".mask,.exchange_success").fadeOut();
	});
	    
	$(".lookfor_reward").click(function() {
		var p = {
				t:new Date(),
				app_token:'${param.app_token}'
		}
		$.post("summer_travel_my_info.htm",p,function(data) {
			  if(data.userStatus == 0){
				  if($("#device").val()) {
					  window.location.href="anniversary.htm?app_view=login";
				  }else{
					window.location.href="../login.htm?tab=account&returnUrl="+data.url;
				  }
				}else{
					$(".mask,.exchange_success,.activity").fadeOut();
					$(".myInfo").fadeIn();
					 $(".alreadyBuy").html(data.alreadyBuy);
					 $(".surplusMoney").html(data.surplus);
					 var rewardList = data.rewardContents;
					 $(".reward").empty();
					 for(var i in rewardList){		
						 $(".reward").append("<div class='reward_info'>"+rewardList[i]+"</div>");
					 }
				}
		  }, "json");
		
	});
	$(".close_fail").click(function() {
		$(".mask,.exchange_fail").fadeOut();
	});
	$(".buy_financing").click(function() {
		window.location.href="../financial_zone.htm?tab=zone&app_view=zone";
	});
</script>
</body>
</html>
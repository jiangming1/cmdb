<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>当理财遇上爱情</title>
<link type="text/css" rel="stylesheet" href="../css/mycss.css?t=201605191158"/>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<style>
.backBar table {
    background-color: #f2c5dc;
}
</style>
</head>
<body>
<c:if test="${param.device==null||param.device=='' }">
	<div class="backBar">
		<table>
			<tr>
				<td style="width: 50px;"><a href="my_account.htm?tab=account&t=<%=new Date()%>">〈</a></td>
				<td>当理财遇上爱情</td>
				<td style="width: 50px;"></td>
			</tr>
		</table>
	</div>
</c:if>
<div style=" width: 100%;">
     <img src="img/financial_love_header.png">
</div>
<div style="background: url(img/love_bg.png) repeat-y center;background-size: 100%;width: 100%;">
     <div style="padding-top: 1rem;">
         <div class="financial_love_title">一重好礼</div>
         <div class="financial_love_con">
              <div class="con_header">全民礼</div>
              <div class="con_photo"><img src="img/jdecard.png" width="50%"></div>
              <div class="con_word">"来存吧"微信公众号回复"理财遇上爱情"<br/>参与活动即可获得200元京东E卡</div>
              <c:choose>
		         <c:when test="${param.device==null || param.device==''}">
			         <a class="con_btn allpeople" href="javascript: void(0);">参加活动</a>
		         </c:when> 
		         <c:otherwise>
			         <a class="con_btn" href="laicunbaallpeople://allpeople">参加活动</a>
		         </c:otherwise>
	          </c:choose>
         </div>
     </div>
     <div style="padding-top: 1rem;">
         <div class="financial_love_title">二重好礼</div>
         <div class="financial_love_con">
              <div class="con_header">聚财礼</div>
              <div class="con_photo"><img src="img/raise_rate.png" width="50%"></div>
              <div class="con_word">活动专属加息表最高加息3%<br/>我赚钱您花钱</div>
              <c:choose>
		         <c:when test="${param.device==null || param.device==''}">
			         <a class="con_btn" href="http://8.laicunba.com/h5/financial_zone.htm?tab=zone">来存吧</a>
		         </c:when> 
		         <c:otherwise>
			         <a class="con_btn" href="laicunbafinancial://financial">来存吧</a>
		         </c:otherwise>
	          </c:choose>
         </div>
     </div>
     <div style="padding-top: 1rem;">
         <div class="financial_love_title">三重好礼</div>
         <div class="financial_love_con">
              <div class="con_header">土豪礼</div>
              <div class="con_photo"><img src="img/vreye.png" width="50%"></div>
              <div class="con_word">活动期间，累计投资到相应金额，<br/>运动手表、VR眼镜免费拿回家</div>
              <c:choose>
		         <c:when test="${param.device==null || param.device==''}">
			         <a class="con_btn" href="http://8.laicunba.com/h5/financial_zone.htm?tab=zone">来存吧</a>
		         </c:when> 
		         <c:otherwise>
			         <a class="con_btn" href="laicunbafinancial://financial">来存吧</a>
		         </c:otherwise>
	          </c:choose>                                       
         </div>
     </div>
     <div style="padding-top: 1rem;">
         <div class="financial_love_title">四重好礼</div>
         <div class="financial_love_con">
              <div class="con_header">幸运礼</div>
              <div class="con_photo"><img src="img/luck_iphone.png" width="50%"></div>
              <div class="con_word">转盘活动还在继续，先摇转盘再投资<br/>收益涨涨涨，更有机会得iPhone6s</div>
              <a class="con_btn" href="lucky_draw.htm?app_token=${app_token}">摇转盘</a>
         </div>
     </div>
     <div class="financial_love_rule">
          <div class="rule_title" style="text-align: center; color: #706d6f; margin-top: 1.2rem; font-size: 1.4rem;">活动规则</div>
          <table class="rule_con">
               <tr>
                   <td class="td-1">1.</td>
                   <td>活动时间：5.18-5.25；</td>
               </tr>
               <tr>
               <td class="td-1">2.</td>
                   <td>"全民礼"请在微信公众号"来存吧"中获取，公众号中回复"理财遇上爱情"，参与活动，拿200元京东e卡，人人有奖；</td>
               </tr>
               <tr>
                   <td class="td-1">3.</td>
                   <td>土豪礼：<br/>累计投资30天以上定期理财5000元以上的用户即有机会获得移动电源1只；
                              <br/>累计投资30天以上定期理财10000元以上的用户即有机会获得VR眼镜1台；
                              <br/>累计投资30天以上定期理财15000元以上的用户即有机会获得bong运动手表1只；
                              <br/>奖品将在活动结束后的五个工作日内发放。
                   </td>
               </tr>
               <tr>
                   <td class="td-1">4.</td>
                   <td>转盘活动页面请点击按钮或首页广告页进入</td>
               </tr>
               <tr>
                   <td class="td-1">5.</td>
                   <td class="td-a">如有疑问，请拨打客服电话：<br/><a href="tel: 400-6191520">400-6191-520</a>
           或加入qq群：<br/><a href="http://jq.qq.com/?_wv=1027&amp;k=28umF5P">473119359</a>咨询</td>
               </tr>
            </table>
     </div>
</div>
<div class="mask"></div>
<!-- 微信公众号二维码 -->
<div class="concern">
    <div style="padding-top:15px;">
         <span style="font-size:18px;">长按识别图中二维码<br/>进入微信公众号</span> 
         <span class="close" style="">&times;</span>
    </div>
    <div class="clear"></div>
    <div style="margin:30px auto;">
         <img src="img/wxgzh1.png" style="border:1px solid #FF7433;border-radius:5px;">  
    </div> 
</div>
<script>
//抽奖 次数为0时 点击跳转到app理财专区  
$(".allpeople").click(function(){
	$(".mask,.concern").show();
});
$(".close").click(function(){
	$(".mask,.concern").hide();
})
</script>
</body>
</html>
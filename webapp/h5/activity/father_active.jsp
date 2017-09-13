<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>父亲节活动-首页</title>
<link type="text/css" rel="stylesheet" href="../css/phone_fare.css"/>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.1.0.js"></script>
</head>
<body style="background: #DADADA;">
<div style="width: 100%;">
     <img src="img/father_header.png">
</div>
<div class="father-main">
     <div class="father-main-con">
          <div><img src="img/father_back.png"></div>
          <div class="father-back-con">
               <div style="border-radius: 0.5rem; background: #FFF;position: relative;">
                    <c:choose>
						<c:when test="${target != null}">
							<table style="width: 100%;">
		                        <tr>
		                            <td style="width: 50%; text-align: center;">******</td>                           
		                        </tr>
		                        <tr style="color: #ff7932; font-size: 1.5rem;">
		                            <td style="width: 50%; text-align: center;">${target.annualizedRates }%</td>
		                            <td style="width: 50%; text-align: center;">${target.period }天</td>
		                        </tr>
		                        <tr>
		                            <td style="width: 50%; text-align: center;">预计年化</td>
		                            <td style="width: 50%; text-align: center;">理财期限</td>
		                        </tr>
		                    </table>
						</c:when>
						<c:otherwise>
							<table style="width: 100%;">
		                        <tr>
		                            <td style="width: 50%; text-align: center;">******</td>                           
		                        </tr>
		                        <tr style="color: #ff7932; font-size: 1.5rem;">
		                            <td style="width: 50%; text-align: center;">xx%</td>
		                            <td style="width: 50%; text-align: center;">xx天</td>
		                        </tr>
		                        <tr>
		                            <td style="width: 50%; text-align: center;">预计年化</td>
		                            <td style="width: 50%; text-align: center;">理财期限</td>
		                        </tr>
		                    </table>
						</c:otherwise>
					</c:choose>
                    <div class="father-back-tips">感恩回馈专属标</div>
               </div>
          </div>
		<c:choose>
			<c:when test="${param.device==null||param.device=='' }">
				<a href="../financial_detail.htm?id=${target.id }" class="father-btn">去投资，拿现金券</a>
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0);" class="father-btn">去投资，拿现金券</a>
			</c:otherwise>
		</c:choose>
     </div>
     <div class="father-main-con">
          <div><img src="img/father_financial.png"></div>
		<c:choose>
			<c:when test="${param.device==null||param.device=='' }">
				<a href="../invite_info.htm?channel=father_active" class="father-btn father-btn-share">去邀请，拿现金券</a>
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0);" class="father-btn father-btn-share">去邀请，拿现金券</a>
			</c:otherwise>
		</c:choose>
     </div>
</div>
<div class="father-rule">
     <div class="clearfix" style="position: absolute;left: 0;top: 0.5rem;">
          <div class="father-rule-word">活动规则</div>
          <div class="triangle-right"></div>
     </div>
     <div style="width: 90%;padding: 3rem 5% 2rem;">
          <table class="father-rule-list">
		        <tr>
		           <td class="td-1">1.</td>
		           <td>活动时间：6.17-6.30；</td>
		        </tr>
		        <tr>
		           <td class="td-1">2.</td>
		           <td>活动期间投资“感恩回馈专属标”即返5元现金券，每个用户每个标仅能领取1次，现金券自动发放到账户中；</td>
		        </tr>
		        <tr>
		           <td class="td-1">3.</td>
		           <td>活动期间邀请好友投资领取30元现金券，邀请40周岁（1976年以及之前出生 ）以上新用户投资加送10元现金券，自动发放到账户中；</td>
		        </tr>
		        <tr>
		           <td class="td-1">4.</td>
		           <td class="td-a">如有疑问，请拨打客服电话：<br/><a href="tel: 400-6191520">400-6191-520</a>
		           或加入qq群：<br/><a href="http://jq.qq.com/?_wv=1027&amp;k=28umF5P">473119359</a>咨询</td>
		        </tr>
		        <tr>
		           <td class="td-1">5.</td>
		           <td class="td-a">活动最终结束权归来存吧所有。</td>
		        </tr>
          </table>
     </div>
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
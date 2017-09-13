<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>来存吧</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="css/lcb_wx_common.css?201604141" />
<style type="text/css">
* {
	font-size: 1em;
	font-family: "微软雅黑"
}
img{
	box-sizing: border-box;
	max-width: 100%;
	height: auto;
	vertical-align: middle;
	border: 0;
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
li{
	list-style: none;
}
.backBar {
	width: 100%;
	background-color: #fff;
}

.backBar table {
	width: 100%;
	height: 50px;
	font-weight: bold;
	font-size: 18px;
}

.backBar table td {
	text-align: center;
	border-bottom: 1px solid #E6E6E6;
}

.backBar a {
	display: inline-block;
	width: 100%;
	height: 100%;
	text-decoration: none;
	line-height: 50px;
	color: #FF5A2C;
	font-size: 24px;
}
.tab2{
	width: 100%;
	margin-top: 15px;
	padding: 0 4%;
	padding-top: 20px;
}
.tab2 li{
	height: 30px;
	line-height: 30px; 
}
.order-date-info li{
	height: auto;
	min-height: 35px;
	position: relative;
	padding-left: 15px;
}
.border-green{
	border-left: 1px solid #1fb464;
}
.border-gray{
	border-left: 1px solid #B3B3B3;
}
.order-date-info li:before{
	display: inline-block;
	content: '';
	width: 14px;
	height: 14px;
/*	border: 2px solid #FFF; */
	border-radius: 50%;
	position: absolute;
	background-color: #1fb464;
	left: -7px;
	top: 0px;
}
.ball_gray:before{
	background-color: #B3B3B3!important;
}
.btnKaiguan{
	height: 40px;
}
.mask{
	position: fixed;
	width: 100%;
	height: 100%;
	background: rgba(0,0,0,0.4);
	overflow: hidden;
	z-index: 5;
	left: 0;
	top: 0;
	display: none;
}
.rule-user-ticket{
	width: 90%;
	padding: 8% 5%;
	position: fixed;
	left: 5%;
	top: 40%;
	border-radius: 8px;
	background: #FFF;
	z-index: 10;
	display: none;
}
.title{
	text-align: center;
	border-bottom: 2px solid #E6E6E6;
	padding-bottom: 5px;
	font-size: 17px;
	font-weight: bold;
}
.sure{
	width: 85%;
	margin: 0 auto;
	text-align: center;
	border: 1px solid #FF5A2C;
	height: 40px;
	border-radius: 15px;
	line-height: 40px;
	color: #FF5A2C; 
	font-size: 18px;
}
.bottom-float{
	text-align: center;
	font-size: 18px;
	background-color: #fff;
	width: 100%;
	position: fixed;
	bottom: 0;
	padding: 10px 0;
}
</style>
</head>
<body style="background-color: #f2f2f2;">
<c:if test="${param.device==null||param.device=='' }">
	<div class="backBar">
		<table>
			<tr>
				<td style="width: 50px;"><a href="cun_piao_bao_balance_group.htm?t=<%=new Date()%>"><img src="img/icon_fanhui.png" style="height: 40px;"></a></td>
				<td>交易详情</td>
				<td style="width: 50px;"></td>
			</tr>
		</table>
	</div>
</c:if>
<div style="width: 100%;padding: 0 4%; background-color: #fff;">
	<ul class="tab2">
		<li class="clearfix" style="color: #999;">
			<span class="fl">购买金额<c:if test="${financingTargetBidDO.payMark=='ACTIVITY' }"><span style='color:#ff7433;font-size: 12px;'>(体验金)</span></c:if></span>
			<span class="fr">到期收益</span>
		</li>
		<li class="clearfix" style="color: #4D4D4D;font-size: 30px;">
			<span class="fl"><fmt:formatNumber value="${financingTargetBidDO.buyAmount }" pattern="##.##" minFractionDigits="2" /></span>
			<span class="fr"><fmt:formatNumber value="${income }" pattern="##.##" minFractionDigits="2" /></span>
		</li>
	</ul>
	<c:choose>
		<c:when test="${financingTargetBidDO.payMark == 'DEMAND_2_FIX' }">
			<c:set var="bankCardNoLength" value="${fn:length(userBank.bankCardNo) }" />
			<input type="hidden" id="bankCardNoTail" value="${userBank.bankName }(尾号 ${fn:substring(userBank.bankCardNo, bankCardNoLength - 3, bankCardNoLength)})" />
		</c:when>
		<c:otherwise>
			<c:set var="bankCardNoLength" value="${fn:length(financingTargetBidDO.bankCardNo) }" />
			<input type="hidden" id="bankCardNoTail" value="${financingTargetBidDO.bankName }(尾号 ${fn:substring(financingTargetBidDO.bankCardNo, bankCardNoLength - 3, bankCardNoLength)})" />
		</c:otherwise>
	</c:choose>
	<div id="backText1" bidid="${financingTargetBidDO.id }" style="border-top: 1px solid #C6C6C6;border-bottom: 1px solid #C6C6C6;height: 40px;line-height: 40px;padding-left: 15px;">
		<c:choose>
			<c:when test="${financingTargetBidDO.transferCurrent || (financingTargetBidDO.payMark !='DEMAND_2_FIX' && (financingTargetBidDO.bankCardNo == null || financingTargetBidDO.bankCardNo == ''))}">
				<c:choose>
					<c:when test="${repayStatus == -1 }">到期转入随存宝</c:when>
					<c:when test="${repayStatus == 0 }">正在转入随存宝</c:when>
					<c:otherwise>已转入随存宝</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${repayStatus == -1 }">到期转入银行卡</c:when>
					<c:when test="${repayStatus == 0 }">正在转入银行卡</c:when>
					<c:otherwise>已转入银行卡</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${financingTargetBidDO.payMark == 'DEMAND_2_FIX' }">
						${userBank.bankName }(尾号 ${fn:substring(userBank.bankCardNo, bankCardNoLength - 3, bankCardNoLength)})
					</c:when>
					<c:otherwise>
						${financingTargetBidDO.bankName }(尾号 ${fn:substring(financingTargetBidDO.bankCardNo, bankCardNoLength - 3, bankCardNoLength)})
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
	</div>
	<ul class="order-date-info" style="padding-left: 22px;margin-top: 15px;">
		<li class="border-green">购买时间　<fmt:formatDate value="${financingTargetBidDO.payTime }" pattern="yyyy-MM-dd HH:mm:ss"/></li>
		<li class="<c:choose><c:when test='${repayStatus == -1 }'> border-gray</c:when><c:otherwise> border-green</c:otherwise></c:choose>">计算收益　<fmt:formatDate value="${financingTargetBidDO.beginProfit }" pattern="yyyy-MM-dd"/></li>
		<li class="<c:if test="${repayStatus == -1 }">ball_gray</c:if>">到期日期　<fmt:formatDate value="${financingTargetBidDO.endProfit }" pattern="yyyy-MM-dd"/></li>
	</ul>
	<c:if test="${repayStatus == -1 }">
		<div class="clearfix" style="border-top: 1px solid #C6C6C6; padding: 15px 0;">
			<span class="fl" id="backText2">开启后到期转入活期(随存宝)<br/>(到期2天前可操作)</span>
			<span class="fr" style="padding-right: 40px;">
				<c:choose>
					<c:when test="${financingTargetBidDO.transferCurrent}">
						<img src="../static/imgs/icon_kaiguan_kai.png" bid_id="${financingTargetBidDO.id }" status='current' class="btnKaiguan">
					</c:when>
					<c:otherwise>
						<img src="../static/imgs/icon_kaiguan_guan.png" bid_id="${financingTargetBidDO.id }" status='bank' class="btnKaiguan">
					</c:otherwise>
				</c:choose>
			</span>
		</div>
	</c:if>
</div>
<c:if test="${bid2DemandCount == 0 && not financingTargetBidDO.transferCurrent && repayStatus == -1 }">
	<div class="clearfix" id="btn_use_ticket">
		<div class="btn-use-ticket fr"><img src="img/btn_use_ticket.png" style="width: 80px;" /></div>
	</div>
</c:if>
<!-- <div class="clearfix" style="margin-bottom: 45px;"> -->
<!-- 	<div class="btn-sent-bag fr"><img src="img/icon_fahongbao.png" style="width: 80px;" /></div> -->
<!-- </div> -->
<div class="mask"></div>
<div class="rule-user-ticket">
	<div class="title">活动规则</div>
	<div style="margin-top: 30px; line-height: 20px; font-size: 16px; padding: 0 5px;">首次成功使用“到期转入随存宝”功能即赠5元现金券(1000元60天以上订单可以使用)</div>
	<div style="margin-bottom: 40px; line-height: 20px; font-size: 16px; padding: 0 5px;">奖励将在订单成功回款后自动发放至“我的红包”</div>
	<div class="sure">确定</div>
</div>
<div class="popBox" id="windowcenter">
	<p class="pop_header" id="windowtitle">提示标题</p>
	<div class="popconbox">
		<div class="popconc" id="windowtext"></div>
		<div class="popbtnbox" id="windowbuttons">
			<a href="javascript:;" title="确定" class="popbtn sure dialogok" >确定</a>
			<a href="javascript:;" title="取消" class="popbtn cancel dialogcancel">取消</a>
		</div>
	</div>
</div>
<div id="windowpopbg" class="popbg" style="display:none;"></div>
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="lcb_wx_common.js?201604141"></script>
<script>
$(function(){
	$(".btnKaiguan").click(function(){ 
		var param = {
			t: new Date(),
			bidId: $(this).attr("bid_id"),
			app_token: "${param.app_token }"
		};
		if($(this).attr("status")=="current"){
			$.post("updateFlagExpiredTransfer2Bank.htm",param,function(data){
				if(data.code=="SUCCESS"){
					if($("#btn_use_ticket"))$("#btn_use_ticket").show();
					$("#backText1").text("到期转入银行卡 " + $("#bankCardNoTail").val());
// 					$("#backText2").html("开启后到期转入活期(随存宝)<br/>(到期2天前可操作)");
					$("[bid_id='"+data.bidId+"']").attr("status","bank");
					$("[bid_id='"+data.bidId+"']").attr("src","../static/imgs/icon_kaiguan_guan.png");
				}else{
					alertT(2, "定转活开关", "现在不可以改了！");
				} 
			},"json"); 
		}else{
			$.post("updateFlagExpiredTransfer2Current.htm",param,function(data){ 
				if(data.code=="SUCCESS"){
					if($("#btn_use_ticket"))$("#btn_use_ticket").hide();
					$("#backText1").text("到期转入随存宝");
// 					$("#backText2").html("关闭后到期转入银行卡 "+$("#bankCardNoTail").val()+"<br/>(到期2天前可操作)");
					$("[bid_id='"+data.bidId+"']").attr("status","current");
					$("[bid_id='"+data.bidId+"']").attr("src","../static/imgs/icon_kaiguan_kai.png");
				}else{ 
					alertT(2, "定转活开关", "现在不可以改了！");
				} 
			},"json"); 
		}
	});
	
	var height = $(".rule-user-ticket").height();
	$(".rule-user-ticket").css("margin-top","-"+(height/2)+"px");
	$(".btn-use-ticket").click(function(){
		$(".mask,.rule-user-ticket").show();
	})
	$(".sure").click(function(){
		$(".mask,.rule-user-ticket").hide();
	})
	
});
</script>	


	<script type="text/javascript">
	$(function(){
		$.post("withdraw_task.htm",{
			t:new Date(),
			app_token:"${param.app_token}"
		},function(data){
			if(!data){
				return ;
			}
			for(var i in data){
				var row=data[i]; 
				try{
					var p = eval('('+row.param+')'); 
					if(!p.bid){
						continue;
					}
					 
					$("#backText1[bidid='"+p.bid+"']").text("已回款,等待银行到账"); 
				}catch(e){}
			}
		},"json");
		
		
		
	});
	
	</script>

</body>
</html>
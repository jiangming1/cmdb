<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>来存吧</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<style type="text/css">
* {
	font-size: 1em;
	font-family: "微软雅黑"
}

.backBar {
	
}

.backBar table {
	width: 100%;
	height: 50px;
	background-color: #FFF;
	font-size: 20px;
	font-weight: bold;
	color: #000;
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
}

.c1 {
	text-align: center;
}

.table1 {
	width: 100%;
	background-color: white;
	border-bottom: 1px solid #ccc;
}

.table1 td {
	text-align: center;
	padding: 5px;
}

.money1 {
	font-size: 20px;
	color: #FF7433;
}

.money2 {
	color: #FF7433;
}

.tr1 td {
	padding: 10px 0px 0px 10px;
}

.tr2 td {
	padding: 0px 0px 10px 10px;
	color: #ccc;
}

.table2 {
	width: 100%;
	background-color: white;
	border-bottom: 1px solid #ccc;
}

.table2 td {
	padding: 5px;
}

.table2 td div {
	padding-left: 5px;
}

.line1 {
	text-align:center;
}

.c2 {
	color: #ccc;
	text-align: center;
}
.kaiguan img{
	height: 36px;
}
</style>
</head>
<body style="background-color: #eee;">
	<c:if test="${param.device==null||param.device=='' }">
		<div class="backBar">
			<table>
				<tr>
					<td style="width: 50px;"><a href="cun_piao_bao_balance_group.htm?t=<%=new Date()%>"><img src="img/icon_fanhui.png" style="height: 40px;"></a></td>
					<td>${target.name }</td>
					<td style="width: 50px;"></td>
				</tr>
			</table>
		</div>
	</c:if>
	<table class="table1">
		<tr>
			<td>本金</td>
			<td>到期总收益</td>
		</tr>
		<tr>
			<td class="money1"><fmt:formatNumber value="${totalPrincipal }" pattern="0.00" /></td>
			<td class="money1"><fmt:formatNumber value="${totalProfit }" pattern="0.00" /></td>
		</tr>
	</table>
	<div style="height: 20px;"></div>
	<c:forEach items="${cpbBidVOList }" var="bid">
		<table class="table2">
			<tr>
				<td width="17%"></td>
				<td width="17%"></td>
				<td width="17%"></td>
				<td width="16%"></td>
				<td width="17%"></td>
				<td width="16%"></td>
			</tr>
			<tr>
				<td valign="top" colspan="2" >
					<div class="line1">本金</div>
					<div class="money2 line1">${bid.buyAmount }</div> 
				</td>
				<td valign="top" colspan="2" >
					<div class="line1">到期收益</div>
					<div class="money2 line1">
						<fmt:formatNumber value="${bid.profit }" pattern="0.00" />
					</div>

				</td>
				<td valign="top" colspan="2">
					<div class="line1">付款方式</div>
					<div class="line1">
						<c:choose>
							<c:when test="${bid.payMark=='DEMAND_2_FIX' }">随存宝</c:when>
							<c:otherwise>${bid.bankName }</c:otherwise>
						</c:choose>
					</div>
				</td>
			</tr>
			<tr style="border-bottom: 1px solid #aaa;">
				<td colspan="4">
					<div class="c2">
						购买:
						<fmt:formatDate value="${bid.payTime }" pattern="yyyy-MM-dd HH:mm:ss" />
					</div>
					<div class="c2">
						到期:
						<fmt:formatDate value="${bid.endProfit }" pattern="yyyy-MM-dd HH:mm:ss" />
					</div>
				</td>
				<td colspan="2">
					<div class="c2">
						剩余天数:
						<c:choose>
							<c:when test="${bid.buyAmount>bid.withdrawPrincipal && bid.remainDay>0 }">${bid.remainDay }</c:when>
							<c:when test="${bid.buyAmount>bid.withdrawPrincipal && bid.remainDay==0 }">还款中</c:when>
							<c:when test="${bid.buyAmount>bid.withdrawPrincipal && bid.remainDay<0 }">还款中(一个工作日到账)</c:when>
							<c:otherwise>已还款</c:otherwise>
						</c:choose>
					</div>
					<div class="c2">还款路径:${bid.bankName }</div>
				</td> 
			</tr>
			<c:if test="${bid.buyAmount>bid.withdrawPrincipal && bid.remainDay>0 }">
				<tr class="kaiguan">
					<td	colspan="3">
						<table style="width: 100%; border-right: 1px solid #aaa;">
							<tr>
								<td valign="top" > 
									<div style="font-size: 16px; line-height: 22px; text-align: center; color:#777;">到期转入<br/>随存宝</div>
	<!-- 								<div style="font-size: 12px;color: #ccc;">(到期2天前可操作)</div> -->
								</td>
								<td style="text-align: right; padding-right: 20px;">
									<c:if test="${bid.transferCurrent}">
										<img class="btnKaiguan" bid_id="${bid.bidId }" status='current' src="../static/imgs/icon_kaiguan_kai.png" /> 
									</c:if>
									<c:if test="${not bid.transferCurrent}">
										<img class="btnKaiguan" bid_id="${bid.bidId }" status='bank' src="../static/imgs/icon_kaiguan_guan.png" /> 
									</c:if>
								</td>
							</tr>
						
						</table> 
					</td>
					<td colspan="3">
						<c:if test="${bid2DemandCount == 0 && not bid.transferCurrent}">
							<div style="position: absolute; height:88px; width:72px;right:0px;"><img src="img/btn_use_ticket.png" style="height:100%;" /></div>
						</c:if>
					</td>
				</tr>
			</c:if>
		</table>
	</c:forEach>

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$(".btnKaiguan").click(function(){ 
				var param={
						t:new Date(),
						bidId:$(this).attr("bid_id"),
						app_token:"${param.app_token }"
				};
				if($(this).attr("status")=="current"){
					$.post("updateFlagExpiredTransfer2Bank.htm",param,function(data){
						
						if(data.code=="SUCCESS"){ 
							$("[bid_id='"+data.bidId+"']").attr("status","bank");
							$("[bid_id='"+data.bidId+"']").attr("src","../static/imgs/icon_kaiguan_guan.png");
						}else{ 
							alert("现在不可以改了");
						} 
					},"json"); 
					

				}else{
					$.post("updateFlagExpiredTransfer2Current.htm",param,function(data){ 
						if(data.code=="SUCCESS"){ 
							$("[bid_id='"+data.bidId+"']").attr("status","current");
							$("[bid_id='"+data.bidId+"']").attr("src","../static/imgs/icon_kaiguan_kai.png");
						}else{ 
							alert("现在不可以改了");
						} 
					},"json"); 
					
				}

			});
 
			
		});

	</script>
</body>
</html>
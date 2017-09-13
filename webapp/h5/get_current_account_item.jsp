<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>交易记录</title>
<link rel="stylesheet" type="text/css" href="css/mycss.css">
<style type="text/css">
body {
	background-color: #eee;
}

#table1 {
	width: 90%;
	background-color: white;
	margin: 0px auto;
	margin-top: 20px;
}

#table1 td {
	padding: 6px 10px;
	text-align: right;
}

#table1 tr td:FIRST-CHILD {
	text-align: left;
}

.lineTr {
	border-bottom: 1px solid #eee;
	color: #4d4d4d;
}

.mark {
	
}

.balance {
	color: #ccc;
}

.gmt_create {
	color: #999;
}
.withdraw_progress{
	width: 100%; 
	background-color: #f2f2f2;
	border-radius:5px;
	color: #666;
	font-size: 14px;
}
.withdraw_progress tr{
	height: 20px;
}
.withdraw_progress tr td{
	padding: 5px !important;
}
.ask{
	background-color: white;
	border-radius:5px;
	width: 45px;
	padding: 5px;
	color: #666;
	text-align: center;
	
}
.withdrawProgress{
	display: none;
}
</style>
</head>
<body>
	<c:if test="${param.device==null||param.device=='' }">
		<div class="backBar">
			<table>
				<tr>
					<td style="width: 50px;"><a href="financial_zone.htm?tab=zone&tab1=current&t=<%=new Date()%>">
							<img src="img/icon_fanhui.png" style="height: 40px;">
						</a></td>
					<td>交易记录</td>
					<td style="width: 50px;"></td>
				</tr>
			</table>
		</div>
	</c:if>
	<c:choose>
		<c:when test="${currentAccountItemDOList == null || fn:length(currentAccountItemDOList) <= 0 }">
			<div style="text-align: center; margin-top: 40%;">
				<img src="img/icon_wujilu.png" style="width: 40%;" />
				<div style="margin-top: 6%; text-align: center; color: #808080; font-size: 16px;">暂无交易记录</div>
			</div>
		</c:when>
		<c:otherwise>
			<div style="background-color: white;">
				<table id="table1">
					<c:forEach items="${currentAccountItemDOList }" var="item">
						<tr>
							<td class="gmt_create"><fmt:formatDate value="${item.gmtCreate }" pattern="YYYY-MM-dd HH:mm" /></td>
							<td class="balance">${item.balance }</td>
						</tr>
						
						<tr <c:if test="${item.mark!='withdraw' }"> class="lineTr" </c:if> >
							<td class="mark">
								<c:choose>
									<c:when test="${item.mark=='withdraw' }">取现</c:when>
									<c:when test="${item.mark=='CA2D' }">购买存票宝</c:when>
									<c:when test="${item.mark=='PROFIT' }">收益</c:when>
									<c:when test="${item.mark=='SCB2CA' }">非复利转入</c:when>
									<c:otherwise>${item.mark }</c:otherwise>
								</c:choose>
							</td>
							<td class="amount"><c:if test="${item.type=='OUT' }">-</c:if>${item.amount }</td>
						</tr>
						<c:if test="${item.mark=='withdraw' }"> 
							<tr class="lineTr withdrawProgress" ca_item='${item.id }'>
								<td colspan="2">
									<c:choose>
										<c:when test="${item.mark=='withdraw' }">
											<div class="withdraw_progress">
												<table style="width: 100%;">
													<tr>
														<td style="width: 20px; padding-left: 10px !important;" rowspan="2" >
															<img class="progressIcon" src="img/withdraw_apply.png" style="height: 50px;"/>
														</td>
														<td style="text-align: left;" class="applyTime">提现申请  10-18 16:48</td>
														<td rowspan="2" style="width: 60px;">
															<div class="ask"><a href="feed_back.htm?app_token=${param.app_token}&device=${param.device}">咨询</br>客服</a></div>
														</td>
													</tr>
													<tr> 
														<td class="statusTime" style="text-align: left;">预计到账 10-28 16:48</td>
													</tr>
												</table>
											</div>
										</c:when>
									</c:choose>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</div>
		</c:otherwise>
	</c:choose>
</body>

<script src="js/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$.post("withdraw_record.htm",{
		t:new Date(),
		app_token:"${param.app_token}"
	},function(data){
		var row=null;
		for(var i in data){
			row=data[i];
			if(row.type!='CA'){
				continue;
			}
			 
			var withdrawProgresTr = $("#table1").find("[ca_item='"+row.id.substring(8)+"']"); 
			withdrawProgresTr.find(".applyTime").html("提现成功 "+toDate(row.applyTime));
			if(row.status=="apply"){
				withdrawProgresTr.find(".progressIcon").attr("src","img/withdraw_apply.png");
				var expectedTime = new Date(row.applyTime);
				if(expectedTime.getDay()==5){
					expectedTime.setDate(expectedTime.getDate()+3);
				}else if(expectedTime.getDay()==6){
					expectedTime.setDate(expectedTime.getDate()+2);
				}else{ 
					expectedTime.setDate(expectedTime.getDate()+1);
				} 
				expectedTime.setHours(23, 0, 0, 0);
				if(row.summary){ 
					withdrawProgresTr.find(".statusTime").html(row.summary);
				}else{ 
					withdrawProgresTr.find(".statusTime").html("等待回款 ");
				}
			}else if(row.status=="send"){  
				withdrawProgresTr.find(".progressIcon").attr("src","img/withdraw_finish.png"); 
				withdrawProgresTr.find(".statusTime").html("已回款,等待到账 "+toDate(row.optTime)); 
			}else if(row.status=="transfered"){  
				withdrawProgresTr.find(".progressIcon").attr("src","img/withdraw_finish.png"); 
				withdrawProgresTr.find(".statusTime").html("已到账");
				//withdrawProgresTr.find(".ask").remove();
				
			}
			//alert(JSON.stringify(row));
			withdrawProgresTr.show();
		}
	},"json"); 
});
var toDate=function(timestamp){
	var date = new Date(timestamp);
	return date.getFullYear() + "-" + (date.getMonth()>=9 ? date.getMonth() + 1 : "0" + (date.getMonth() + 1)) + "-" + (date.getDate()>9 ? date.getDate() : "0" + date.getDate()) + " " + (date.getHours()>9 ? date.getHours() : "0" + date.getHours()) + ":" + (date.getMinutes()>9 ? date.getMinutes() : "0" + date.getMinutes()) + ":" + (date.getSeconds()>9 ? date.getSeconds() : "0" + date.getSeconds());
}
 
</script>
</html>
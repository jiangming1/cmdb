<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>投资人(${userDO.mobile })账户详情</title>
<script src="../../static/md5.js"></script>
<script src="../../static/jquery-1.11.0.js"></script>
<script src="../../static/highcharts-4.2.1/js/highcharts.js"></script> 
<style type="text/css">
.column {
	font-weight: bold;
	display: inline-block;
	margin-right: 10px;
	margin-left: 10px;
	color: #000033;
}

.value {
	color: gray;
	text-shadow:0 -1px 0 rgba(0, 0, 0, 0.65);
}

.ul {
	list-style: decimal;
}
th{
	font-weight: normal;
}
.closed td{
	text-decoration: line-through;
	color: #ccc;
}
.closed {
	 
}
.ul li table{ 
}
h4{
	 cursor: pointer;
}

#userNotExist{
	text-align: center;
	font-size: 30px;
	display: none;
	height: 300px;
	color: gray;
	line-height: 300px;
	text-shadow:0 -1px 0 rgba(0, 0, 0, 0.65);
}
#circleDiv{
	width: 300px;
	height: 300px; 
	border-radius:50%;
	margin: 0px auto;
}

</style>
</head>
<body style="background-color: #eee">
	<div id="userNotExist">
		<div id="circleDiv">
		   user not exist!
		</div>
	
	</div>
	<div id="userExist">
	<div style="text-align: center;">
		<h1 class="value">投资人(${userDO.mobile })账户详情</h1>
 
		<span class="value">生成时间 &nbsp;&nbsp;<fmt:formatDate value="${current_time }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
		<span class="value" id="showOrHideAllTable" style="cursor: pointer;" >Show or hide all Table</span>
	</div>
	<ul class="ul">
		<li>
			<h4>注册信息</h4>
			<p>
				<span class="column">时间</span><span class="value"><fmt:formatDate value="${userDO.gmtCreate }" pattern="yyyy-MM-dd HH:mm:ss"/>  </span>
				<span class="column">渠道</span><span class="value">${userDO.channel }</span>
				<span class="column">邀请人</span><span class="value"><c:if test="${inviteUser!=null}">${inviteUser.mobile }(<c:if test="${inviteUser.trueName==null }">匿名</c:if>${inviteUser.trueName } )</c:if> </span>
				<span class="column">账户状态</span> 
					<c:choose>
						<c:when test="${userDO.status=='disable' }"><span class="value">已注销</span></c:when>
						<c:otherwise><span class="value">正常使用</span><button id="btnDisable">注销</button></c:otherwise>
					</c:choose>
				 
				
			</p>
		</li>
		<li><h4>基本信息</h4>
			<div>
				<span class="column">手机号码</span><span class="value">${userDO.mobile }</span> 
				<span class="column">姓名</span><span class="value">${userDO.trueName }</span>
				<span class="column">身份证号</span><span class="value">${userDO.pid }</span>
				<span class="column">我的邀请码</span><span class="value">${userDO.inviteCode }</span>
				<span class="column">活期账户类型</span><span class="value">
				<c:choose>
					<c:when test="${userDO.hType==null }">(老)随存宝</c:when>
					<c:when test="${userDO.hType=='CURRENT_ACCOUNT' }">(新)随存宝-复利</c:when>
					<c:otherwise>${userDO.hType }</c:otherwise>
				</c:choose>
				</span>
			</div>
			<div>
				<span class="column">Device</span><span class="value">${userDO.device }</span> 
				<span class="column">App Ver</span><span class="value">${userDO.appVer }</span> 
				<span class="column">Jpush Id</span><span class="value">${userDO.pushId }</span> 
			</div>	
		</li>
		<li>
			<h4>参与活动 </h4>
		    <table border="1" id="activityTable">
		    	<thead>
		    		<tr>
		    			<th>序</th>
		    			<th>下单时间</th>
		    			<th>计息时间</th>
		    			<th>到期时间</th>
		    			<th>标的名称</th>
		    			<th>体验金(本金)</th>
		    			<th>年化</th>
		    			<th>取现本金</th>
		    			<th>到期收益</th>
		    			<th>取现收益</th>
		    		</tr>
		    	</thead>
		    	<tbody>
		    	<c:forEach items="${activityList }" var="activity" varStatus="status">
		    		<tr>
		    			<td>${status.index+1 }</td>
		    			<td><fmt:formatDate value="${activity.pay_time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		    			<td><fmt:formatDate value="${activity.begin_profit }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		    			<td><fmt:formatDate value="${activity.end_profit }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		    			<td>${activity.name }</td>
		    			<td>${activity.buy_amount }</td>
		    			<td>${activity.annualized_rates }</td>
		    			<td>${activity.withdraw_principal }</td> 
		    			<td class="total_profit"><fmt:formatNumber value="${activity.total_profit }" /></td>
		    			<td class="withdraw_profit">${activity.withdraw_profit }</td>
		    		</tr>
		    	</c:forEach>
		    	</tbody> 
		    </table>
		    <div>  
		    	<span class="column">已转随存取收益</span><span class="value" id="activity_2_scq_profit">#</span> 
		    	<span class="column">待转随存取收益</span><span class="value" id="activity_wait_profit">#</span> 
		    </div>
		</li>
		<li>
			<h4>现金券</h4>
			<table border="1">
		    	<thead>
		    		<tr>
		    			<th>序</th>
		    			<th>获得时间</th>
		    			<th>券名称</th>
		    			<th>面额</th>
		    			<th style="width: 100px;">使用条件<span style="color: red">(看不懂,请教技术部门)</span></th>
		    			<th>投标ID</th>
		    			<th>已用金额</th>
		    			<th>有效开始</th>
		    			<th>有效结束</th>
		    			<th>备注</th> 
		    			<th>更新时间</th> 
		    		</tr>
		    	</thead>
		    	<tbody>
		    	<c:forEach items="${cashCouponList }" var="cashCoupon" varStatus="status">
		    		<tr
		    			<c:if test="${cashCoupon.usedAmount >0 }"> class="closed" </c:if>
		    		 >
		    			<td>${status.index+1 }</td>
		    			<td><fmt:formatDate value="${cashCoupon.gmtCreate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		    			<td>${cashCoupon.name }</td>
		    			<td>${cashCoupon.amount }</td>
		    			<td>${cashCoupon.conditions }</td>
		    			<td>${cashCoupon.financingTargetBidId }</td>
		    			<td>${cashCoupon.usedAmount }</td>
		   				<td><fmt:formatDate value="${cashCoupon.beginTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		   				<td><fmt:formatDate value="${cashCoupon.endTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						
		    			<td>${cashCoupon.summary }</td>
		    			<td><fmt:formatDate value="${cashCoupon.gmtWrite }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		    		</tr>
		    	</c:forEach>
		    	</tbody>  
			</table>
		</li>
		<li>
			<h4>加息券</h4>
			<table border="1">
		    	<thead>
		    		<tr>
		    			<th>序</th>
		    			<th>获得时间</th>
		    			<th>券名称</th>
		    			<th>加息</th>
		    			<th style="width: 100px;">使用条件<span style="color: red">(看不懂,请教技术部门)</span></th>
		    			<th>投标ID</th>
		    			<th>状态</th>
		    			<th>有效开始</th>
		    			<th>有效结束</th>
		    			<th>备注</th> 
		    			<th>更新时间</th> 
		    		</tr>
		    	</thead>
		    	<tbody>
		    	<c:forEach items="${rateIncrList }" var="rateCoupon" varStatus="status">
		    		<tr>
		    			<td>${status.index+1 }</td>
		    			<td><fmt:formatDate value="${rateCoupon.gmtCreate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		    			<td>${rateCoupon.name }</td>
		    			<td>${rateCoupon.rate }</td>
		    			<td>${rateCoupon.conditions }</td>
		    			<td>${rateCoupon.financingTargetBidId }</td>
		    			<td>${rateCoupon.status }</td>
		   				<td><fmt:formatDate value="${rateCoupon.beginTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		   				<td><fmt:formatDate value="${rateCoupon.endTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						
		    			<td>${cashCoupon.summary }</td>
		    			<td><fmt:formatDate value="${rateCoupon.gmtWrite }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		    		</tr>
		    	</c:forEach>
		    	</tbody>  
			</table>
		</li>
		
		<li>
			<h4>定期标</h4>
		    <table border="1" id="cpbTable">
		    	<thead>
		    		<tr>
		    			<th>序</th>
		    			<th>下单时间</th>
		    			<th>银行</th>
		    			<th>姓名</th>
		    			<th>卡号</th>
		    			<th>计息时间</th>
		    			<th>到期时间</th>
		    			<th>标的名称</th>
		    			<th>购买金额(本金)</th>
		    			<th>年化</th>
		    			<th>取现本金</th>
		    			<th>到期收益</th>
		    			<th>取现收益</th>
		    		</tr>
		    	</thead>
		    	<tbody>
		    	<c:forEach items="${cpbList }" var="cpb" varStatus="status">
		    		<tr  <c:if test="${cpb.buy_amount==cpb.withdraw_principal }">class="closed"</c:if>  > 
		    			<td>${status.index+1 }</td>
		    			<td><fmt:formatDate value="${cpb.pay_time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		    			<td> 
								<c:choose>
			    					<c:when test="${cpb.pay_mark=='DEMAND_2_FIX' }">活转定</c:when>
									<c:otherwise>${cpb.bank_name }</c:otherwise>							
								</c:choose>
		    			</td>
		    			<td>${cpb.pay_name }</td>
		    			<td>${cpb.bank_card_no }</td>
		    			<td><fmt:formatDate value="${cpb.begin_profit }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		    			<td><fmt:formatDate value="${cpb.end_profit }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		    			<td>${cpb.name }</td>
		    			<td class="buy_amount">${cpb.buy_amount }</td>
		    			<td>${cpb.annualized_rates }</td>
		    			<td class="withdraw_principal">${cpb.withdraw_principal }</td> 
		    			<td class="total_profit"><fmt:formatNumber value="${cpb.total_profit }" /></td>
		    			<td class="withdraw_profit">${cpb.withdraw_profit }</td>
		    		</tr>
		    	</c:forEach>
		    	</tbody> 
		    </table>
		    <div>
		    	<span class="column">累计本金</span><span class="value" id="cpb_buy_amount">#</span> 
		    	<span class="column">累计收益</span><span class="value" id="cpb_total_profit">#</span> 
		    	<span class="column">可提现本金</span><span class="value" id="cpb_can_withdraw_principal">#</span> 
		    	<span class="column">可提现收益</span><span class="value" id="cpb_can_withdraw_profit">#</span> 
		    </div>
		</li>
		<li>
			<h4>随存取标</h4>
		    <table border="1" id="scbTable">
		    	<thead>
		    		<tr>
		    			<th>序</th>
		    			<th>下单时间</th>
		    			<th>计息时间</th>
		    			<th>重新计息时间</th>
		    			<th>银行</th>
		    			<th>卡号</th>
		    			<th>标的名称</th>
		    			<th>购买金额(本金)</th>
		    			<th>年化</th>
		    			<th>取现本金</th>
		    			<th>至今收益</th>
		    			<th>取现收益</th>
		    		</tr>
		    	</thead>
		    	<tbody>
		    	<c:forEach items="${scbList }" var="scb" varStatus="status">
		    		<tr <c:if test="${scb.buy_amount>scb.withdraw_principal }"> class="canWithDraw"  </c:if>  
		    			<c:if test="${scb.buy_amount==scb.withdraw_principal }">class="closed"</c:if>
		    		>
		    			<td>${status.index+1 }</td>
		    			<td><fmt:formatDate value="${scb.pay_time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		    			<td><fmt:formatDate value="${scb.begin_profit }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		    			<td><fmt:formatDate value="${scb.re_begin_profit }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		    			<td>${scb.bank_name }</td>
		    			<td>${scb.bank_card_no }</td>
		    			<td>${scb.name }</td>
		    			<td class="buy_amount">${scb.buy_amount }</td>
		    			<td>${scb.annualized_rates }</td>
		    			<td class="withdraw_principal">${scb.withdraw_principal }</td> 
		    			<td class="total_profit"><fmt:formatNumber value="${scb.total_profit }" /></td>
		    			<td class="withdraw_profit">${scb.withdraw_profit }</td>
		    		</tr>
		    	</c:forEach>
		    	</tbody> 
		    </table>
		    <div>
		    	<span class="column">累计本金</span><span class="value" id="scb_buy_amount">#</span>   
		    	<span class="column">可提现本金</span><span class="value" id="scb_can_withdraw_principal">#</span> 
		    	<span class="column">可提现收益</span><span class="value" id="scb_can_withdraw_profit">#</span> 
		    </div>
		</li>
		<li>
			<h4>复利活期账户</h4>
			<c:if test="${userDO.hType!='CURRENT_ACCOUNT' }">
				<div>未开通</div>
			</c:if>
			<c:if test="${userDO.hType=='CURRENT_ACCOUNT' }">
				<div> 
					<span class="column">余额</span><span class="value">${balance }</span>
				</div>
				<table border="1">
			    	<thead>
			    		<tr>
			    			<th>序</th>
			    			<th>类型</th>
			    			<th>发生时间</th>
			    			<th>摘要</th> 
			    			<th>备注</th>  
			    			<th>金额</th> 
			    			<th>历史余额</th> 
			    		</tr>
			    	</thead>
			    	<tbody>
			    	<c:forEach items="${currentAccountItemDOList }" var="item" varStatus="status">
			    		<tr>
			    			<td>${status.index+1 }</td>
			    			<td>${item.type }</td> 
			    			<td><fmt:formatDate value="${item.gmtCreate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			    			<td>${item.mark }</td> 
			    			<td>${item.summary }</td>  
			    			<td>${item.amount }</td> 
			    			<td>${item.balance }</td> 
			    		</tr> 
			    	</c:forEach>
			    	</tbody>
				</table>
			</c:if> 
		</li>
		<li>
			<h4>提现记录</h4>
		    <table border="1">
		    	<thead>
		    		<tr>
		    			<th>序</th>
		    			<th>类型</th> 
		    			<th>提现时间</th>
		    			<th>银行户名</th> 
		    			<th>身份证号</th> 
		    			<th>银行名称</th> 
		    			<th>银行卡号</th> 
		    			<th>取现本金</th> 
		    			<th>取现收益</th>
		    			<th>收益节余扣款</th>
		    			<th>状态</th>
		    			<th>转账时间</th>
		    		</tr>
		    	</thead>
		    	
		    	<tbody>
		    	<c:forEach items="${withdrawList }" var="withdraw" varStatus="status">
		    		<tr
		    			<c:if test="${withdraw.status=='transfered' }">class="closed"</c:if>
		    		
		    		><td>${status.index+1 }</td>
		    			<td>
		    				<c:choose>
		    					<c:when test="${withdraw.mark=='DEMAND_2_FIX' }">活转定</c:when>
		    					<c:when test="${withdraw.mark=='INIT_CURRENT_ACCOUNT' }">转复利活期账户</c:when>
		    					<c:when test="${withdraw.type=='SCB' }">随存宝,主动提现申请</c:when>
		    					<c:when test="${withdraw.type=='CPB' }">存票宝,到期自动提现</c:when>
		    					<c:when test="${withdraw.type=='CA' }">复利活期提现申请</c:when>
		    				</c:choose>
		    			</td>
		    			<td><fmt:formatDate value="${withdraw.applyTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		    			<td>${withdraw.name }</td>
		    			<td>${withdraw.pid }</td>
		    			<td>${withdraw.bankName }</td>
		    			<td>${withdraw.bankNo }</td>
		    			<td>${withdraw.withdrawPrincipal }</td>
		    			<td>${withdraw.withdrawProfit }</td>
		    			<td>${withdraw.subtractRemainProfit }</td>
		    			<td>${withdraw.status }</td>
		    			<td><fmt:formatDate value="${withdraw.optTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		    			 
		    		</tr>
		    	</c:forEach>
		    	</tbody> 
		    </table> 
		</li>	
		<li><h4>绑定的银行卡</h4>
			<div>
			    <table border="1">
			    	<thead>
			    		<tr> 
			    			<th>绑定时间</th>
			    			<th>卡号</th>
			    			<th>银行</th>
			    			<th>姓名</th> 
			    			<th>身份证</th>
			    			<th>状态</th>
			    			<th>操作</th>
			    		</tr>
			    	</thead>
			    	<tbody>
			    	<c:forEach items="${bankList }" var="bank" varStatus="status">
			    		<tr 
			    		 <c:if test="${bank.status=='disable' }">class="closed"</c:if>
			    		> 
			    			<td><fmt:formatDate value="${bank.gmtCreate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			    			<td>${bank.bankCardNo }</td>
			    			<td>${bank.bankName }</td>
			    			<td>${bank.holder }</td> 
			    			<td>${bank.pid }</td> 
			    			<td>
			    				<c:choose>
			    					<c:when test="${bank.status=='disable' }">已解绑</c:when>
			    					<c:when test="${bank.status=='enable' or bank.status== null }">正常使用</c:when>
			    					<c:otherwise>${bank.status }</c:otherwise>
			    				</c:choose>
			    			</td> 
			    			<td>
			    				<c:if test="${bank.status=='enable' or bank.status== null }">
			    					<button class="unBindBtn" card_id="${bank.id }">解绑</button>
			    				</c:if>
			    			</td> 
			    		</tr>
			    	</c:forEach>
			    	</tbody> 
			    </table>
			</div>
		</li>
		<li><h4>同名多卡通道</h4>
			<div>
				<span class="column">策略</span><span class="value" id="newCardPolicy">
					${newCardPolicy.val }
				</span>  
				<input type="text" id="newCardInput" placeholder="请输入银行卡" style="width: 300px;" />
				<button id="btnAddPreNewCard">添加</button> 
				<button id="btnEnableNewCard">开通同名卡,不限卡号</button>
				<button id="btnDisableNewCard">禁止第二张卡</button>
			</div>
		</li>	
		<li><h4>积分</h4> 
			<div>
			    <span class="column">积分余额</span><span class="value">${vcoinWallet.balance }</span>
			    <span class="column">充值</span><input type="text" id="vcoinInput" maxlength="6" placeholder="积分数量" style="width: 60px;" />	<button id="addVcoinBtn" uid="${userDO.id }" >确认充值</button>
			    <table border="1">
			    	<thead>
			    		<tr> 
			    			<th>时间</th>
			    			<th>mark</th> 
			    			<th>备注</th>
			    			<th>收入</th>
			    			<th>支出</th>
			    			<th>余额</th> 
			    		</tr>
			    	</thead>
			    	<tbody>
			    	<c:forEach items="${vcoinList }" var="vcoin" varStatus="status">
			    		<tr> 
			    			<td><fmt:formatDate value="${vcoin.gmtCreate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>

			    			<td>${vcoin.mark }</td> 
			    			<td>${vcoin.summary }</td> 
			    			<td>${vcoin.dr }</td>
			    			<td>${vcoin.cr }</td>
			    			<td>${vcoin.balance }</td>  
			    		</tr>
			    	</c:forEach>
			    	</tbody> 
			    </table>
			</div>
		</li>		
		<li><h4>其它</h4>
			<div>
				<span class="column">收益节余</span><span class="value">${userDO.remainProfit }</span>  
			</div>
		</li>
		 
		<li>
			<h4>邀请好友</h4>
			<div>
				<c:forEach items="${subUserList }" var="u">
					<span class="value">${u.mobile }(<c:if test="${u.true_name==null }">匿名</c:if>${u.true_name })</span>
					<span>,</span>
				</c:forEach>
			</div>
		</li>
		<li style="display: none;">
			<h4>用户评级</h4>
			<div>
				<span class="value">A++</span>
			</div>
		</li>
		<li style="display: none;">
			<h4>备注</h4>
			<div>
				<span class="value">XXX</span>
			</div>
		</li>
	</ul>
	
	</div>
	<script type="text/javascript">
		$(".value").each(function(){
			var valueNode = $(this); 
			if(valueNode.html().trim()==""){
				valueNode.html("无");
			}
			
		});
		
		$(function(){
			try{
				
				var activityTotalProfit = CountTool.sum($("#activityTable").find(".total_profit")); 
				var activity2SCBProfit = CountTool.sum($("#activityTable").find(".withdraw_profit")); 
			    $("#activity_2_scq_profit").html(activity2SCBProfit.toFixed(3));			
			    $("#activity_wait_profit").html((activityTotalProfit - activity2SCBProfit).toFixed(3));
				 
				var cpbTableTotalProfit = CountTool.sum($("#cpbTable").find(".total_profit")); 
				var cpbTable2SCBProfit = CountTool.sum($("#cpbTable").find(".withdraw_profit")); 
				var cpbBuyAmount = CountTool.sum($("#cpbTable").find(".buy_amount")); 
				var cpbWithdraw_principal = CountTool.sum($("#cpbTable").find(".withdraw_principal")); 
			    
				$("#cpb_buy_amount").html(cpbBuyAmount.toFixed(3));		
				$("#cpb_total_profit").html(cpbTableTotalProfit.toFixed(3));	
				$("#cpb_can_withdraw_principal").html((cpbBuyAmount-cpbWithdraw_principal).toFixed(3));	
				$("#cpb_can_withdraw_profit").html((cpbTableTotalProfit-cpbTable2SCBProfit).toFixed(3));				
				
				
				var scbTableTotalProfit = CountTool.sum($("#scbTable").find(".canWithDraw").find(".total_profit")); 
				var scbTable2SCBProfit = CountTool.sum($("#scbTable").find(".canWithDraw").find(".withdraw_profit")); 
				var scbBuyAmount = CountTool.sum($("#scbTable").find(".buy_amount")); 
				var scbWithdraw_principal = CountTool.sum($("#scbTable").find(".withdraw_principal")); 
				
				
				$("#scb_buy_amount").html(scbBuyAmount.toFixed(3));		
				$("#scb_can_withdraw_principal").html((scbBuyAmount-scbWithdraw_principal).toFixed(3));	 
				$("#scb_can_withdraw_profit").html((scbTableTotalProfit-scbTable2SCBProfit).toFixed(3));
				
				
				$("h4").click(function(){
					var table = $(this).parent().find("table");
					if(table.length==0){
						return ;
					}  
					if(table.css("display")=="none"){ 
						table.show();
					}else{
						table.hide();
					}
				});
				$("#showOrHideAllTable").click(function(){
					
					$("table").slideToggle();
				});
			}catch(e){
				alert(e);
			}
			
			$("#btnDisable").click(function(){
				
				var p={
						t:new Date(),
						userId:"${userDO.id }"
				};
				var pwd = window.prompt("确认密码", "");
				if(!pwd){
					return ;
				}
				p.pwd=MD5(pwd);
				$.post("../disable.htm",p,function(data){
					if(data.code==true){
						alert("注销成功");
					}else if(data.code=="pwd_error"){
						alert("确认密码错误");
					}else{
						alert("出错了:"+data.code);
					}
					
				},"json"); 
				
			});
			$("#addVcoinBtn").click(function(){
				 
				var p={
						t:new Date(),
						amt:$("#vcoinInput").val().trim(),
						uid:$(this).attr("uid")
				};
				if(!p.amt){
					$("#vcoinInput").focus();
					return ;
				}
				var pwd = window.prompt("确认密码", "");
				if(!pwd){
					return ;
				}
				p.pwd=MD5(pwd);
				$.post("../setting/add_vcoin.htm",p,function(data){
					if(data.code==true){
						alert("冲值成功");
					}else if(data.code=="pwd_error"){
						alert("确认密码错误");
					}else{
						alert("出错了:"+data.code);
					}
					
				},"json"); 
			});
			$(".unBindBtn").click(function(){
				var p={
						t:new Date(),
						bankCardId:$(this).attr("card_id")
				};
				var pwd = window.prompt("确认密码", "");
				if(!pwd){
					return ;
				}
				p.pwd=MD5(pwd);
				$.post("../bank_card_disable.htm",p,function(data){
					if(data.code==true){
						alert("解绑成功");
					}else if(data.code=="pwd_error"){
						alert("确认密码错误");
					}else{
						alert("出错了:"+data.code);
					}
					
				},"json"); 
				
			});
			
			
			$("#btnEnableNewCard").click(function(){
				var p={
						t:new Date(),
						uid:"${userDO.id }",
						policy:"*"
				};
				$.post("../setting/save_new_card_policy.htm",p,function(data){ 
					$("#newCardPolicy").html(data.val);
				},"json");
				
			});
			$("#btnDisableNewCard").click(function(){
				var p={
						t:new Date(),
						uid:"${userDO.id }",
						policy:"-"
				};
				$.post("../setting/save_new_card_policy.htm",p,function(data){ 
					$("#newCardPolicy").html(data.val);
				},"json");
				
			});
			$("#btnAddPreNewCard").click(function(){
				var p={
						t:new Date(),
						uid:"${userDO.id }",
						policy:$("#newCardInput").val()
				};
				if(!p.policy){
					$("#newCardInput").focus();
				}
				$.post("../setting/save_new_card_policy.htm",p,function(data){
					$("#newCardPolicy").html(data.val);
					$("#newCardInput").val("");
					$("#newCardInput").focus();
				},"json");
				
			});
		});
		var CountTool={
				sum:function(tds){
					if(!tds){
						return 0;
					}
					if(tds.size()==0){
						return 0;
					}
					var number = 0; 
					for(var i=0;i<tds.size();i++){
						var n = $(tds[i]).html().trim();
						if(/^[0-9.]+$/.test(n)){
							number +=parseFloat(n);
						}
					}
					return number;
					
				}
		};
	</script>
	
	<c:if test="${userDO==null }"> 
		<script type="text/javascript">
			$(function(){
				$("#userExist").hide();
				$("#userNotExist").show();
			});
		
		</script>
	
	</c:if>
	
</body>
</html>
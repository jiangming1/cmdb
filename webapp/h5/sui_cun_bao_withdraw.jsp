<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:if test="${hasCheckBank==null }">  
	<c:redirect url="sui_cun_bao_withdraw_form.htm?device=${param.device}&app_token=${param.app_token}"></c:redirect>
</c:if>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>来存吧-提现</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="css/lcb_wx_common.css?201604141" />
<style type="text/css">
body {
	background-color: #eee;
}

* {
	font-size: 1em;
	font-family: "微软雅黑";
}

#div2 table {
	width: 100%;
}

.table td {
	border: 0px !important;
}

.money {
	text-align: right;
	color: #fa9f59;
	font-size: 16px;
}

.table2 {
	width: 100%;
}

.table2 td {
	padding: 5px 0px 0px 0px;
}

.blockDiv {
	background-color: white;
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 10px 20px 10px 20px;
	width: 100%;
}

#bankCardSelect {
	border: 0px;
	width: 100%;
	height: 100%;
}
.cpb ,.current_account{
	display: none;
}
</style>
</head>
<body>
	<c:if test="${param.device==null||param.device=='' }">
			<div class="backBar backBar2">
				<table>
					<tbody>
						<tr>
							<td style="width: 50px;"><a href="sui_cun_bao_home.htm"><img src="img/icon_fanhui.png" style="height: 40px;"></a></td>
							<td>提现</td>
							<td style="width: 50px;"></td>
						</tr>
					</tbody>
				</table>
			</div>
	</c:if>
	<input type="hidden" id="deviceInput" value="${param.device }" />
	<input type="hidden" id="app_token" value="${param.app_token }" />
	<input type="hidden" id="mobileInput" value="${mobile }" />
	<div style="padding: 10px;">
		<div id="div2" class="blockDiv">

			<table id="cardSelectTable" style="display: none;">
				<tr>
					<td style="width: 60px; padding-top: 10px; padding-bottom: 10px;"><img id="bankLogo" src="bank_logo/no_bank.png" width="50px;" /></td>
					<td style="text-align: left;"><select id="bankCardSelect">
						</select></td>
				</tr>

			</table>
			<div style="line-height: 40px;"> 
				<c:choose>
					<c:when test="${userBank!=null }"> 
						提现到银行卡:尾号${userBank_subCard }(${userBank.bankName })
					</c:when>
					<c:otherwise>自动转到您的购买银行卡</c:otherwise>
				</c:choose> 
				
			</div>
			<div style="width: 100%; border-bottom: 1px dashed #ccc;"></div>

			<table class="table2">
				<tr class="cpb">
					<td>可提现本金</td>
					<td class="money principal">0.00</td>
				</tr>
				<tr class="cpb">
					<td>可提现收益</td>
					<td class="money totalProfit">0.00</td>
				</tr>
				<tr class="current_account">
					<td>可提现余额</td>
					<td class="money balance">0.00</td>
				</tr>
			</table>

		</div>


		<div id="div2" class="blockDiv" style="margin-top: 10px;">
			<table class="table2">
				<tr>
					<td>提现金额 <span style="color: #fa9f59; font-weight: bold; font-size: 20px;">|</span></td>
					<td><input type="number" id="withdrawMoneyInput" style="width: 100%; height: 35px; border: 0px; padding-left: 5px; color: #fa9f59" placeholder="最低100元起" /></td>
					<td>元</td>
				</tr>
			</table>
		</div>
		<table class="table2" style="display: none;">
			<tr>
				<td>一同转出收益:<span class="money withdrawProfit">0.00</span>元
				</td>
				<td>共到账金额:<span class="money principalAndProfit">0.00</span>元
				</td>
			</tr>

		</table>
		<div id="imgVerifyCodeBox" style="display: none; margin-top: 10px;">
			<table>
				<tr>
					<td><input id="imgVerifyCodeInput" style="height: 40px;width: 100px;" maxlength="5" /></td>
					<td><img id="imgVerifyCode" style="height: 40px;" /></td>
					<td><a id="btnRefresh" style="font-size: 20px;">&nbsp;看不清楚?</a></td>
				</tr>
			</table>
			
			
		</div>
		<button id="btnWithdraw"   class="btn btn-warning" style="width: 100%; font-size: 20px; margin-top: 20px;color: #fff; background-color: #f0ad4e; border-color: #eea236; line-height: 0;">提现</button>
	</div>
	<div style="margin-left:5%;">提现说明：</div>
    <div style="border:1px solid #DDD;margin:10px 5%; border-radius:5px;padding:10px 0 10px 15px;">
    <table>
       <tbody>
           <tr>
              <td>1.最低100起提；</td>
           </tr>
           <tr>
              <td>2.当日购买，次日方可提现；</td>
           </tr>
           <tr>
              <td>3.当日只可提现3次；</td>
           </tr>
           <tr>
              <td>4.周一0点至周四24点期间申请提现，还款时间为申请日的第二天；周五0点至周日24点期间申请提现，还款时间为下周一。</td>
           </tr>
           <tr>
              <td>5.节假日提现，顺延到工作日到账。</td>
           </tr>
        </tbody>
    </table>
    </div>
	<jsp:include page="lcb_wx_common.jsp"></jsp:include>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="base.js"></script>
	<script src="bankCard.js"></script>
	<script src="sui_cun_bao_withdraw.js?v=7"></script>
	<script type="text/javascript" src="lcb_wx_common.js?201604141"></script>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>购买</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="css/bootstrap.min.css" /> 
<link type="text/css" rel="stylesheet" href="css/lcb_wx_common.css?201604141" />
<style type="text/css">
.table1 {
	width: 100%;
	margin-top: 10px;
}

.table1 td {
	padding: 10px;
}

.table1 .inputLine {
	border-bottom: 1px solid #ccc;
	background-color: white;
}

.table1 .inputLine input {
	width: 100%;
	height: 30px;
	border: 1px solid white;
}

#submitLayout {
	position: fixed;
	bottom: 0px;
	width: 100%;
	padding: 10px;
	background-color: rgba(0, 0, 0, 0.3);
}

.dayTip, .singleTip, .monthTip {
	color: red;
}

.bankInfo {
	display: inline-block;
	padding-left: 10px;
}

#runingLayout {
	position: absolute;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.6);
	z-index: 10;
	color: white;
	text-align: center;
	display: none;
}

#btnSubmit {
	
}

.btn-warning {
	height: 40px;
	padding: 0px;
}
#touchConfirmPadDiv{
	position: absolute;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.6);
	z-index: 10;
	color: white;
	text-align: center;
	line-height: 300px;
	display: none;
}
#touchArea{
	border-radius:6px;
	width: 100%;height: 200px; margin: 0px auto; background-color: white;
	padding: 10px;
	
}
#btnTouchPay{
	width: 100px;
	vertical-align:top;
}
 
#touchProgress{
	width: 0%;
	height: 100%;
	border-radius:3px;
	background-image:linear-gradient(to right, #f3f3f3 0px, green 100%);
	background-color: green;
}

.close-btn {
	display: inline-block;
	padding-right: 5px;
	font-size: 25px;
	font-family: '微软雅黑';
	top: -5px;
	right: -5px;
	position: absolute;
	color: #333!important;
}
a {
	text-decoration: none!important;
}
.btnKaiguan{
	height: 30px;
	margin-top: 8px;
}
#btnKaiguanDiv{
	width: 100%; background-color: white; margin-top: 10px;padding: 10px 0px 10px 0px;
	border: 1px solid #ccc;
	border-left: 0px;
	border-right: 0px;

}
</style>
</head>
<body style="padding: 0px; margin: 0px; background-color: #eee">
	<input id="newCardPolicy" value="${newCardPolicy.val }" type="hidden">
	<input id="transfer_status_input" value="${transfer_status }" style="display: none;"/> 
	<div style="color: red; line-height: 40px; display: none;" >公告:亲爱的用户,系统正在维护升级.请等待!</div>
	<div id="touchConfirmPadDiv">
		<table style="width: 100%;height: 100%;">
			<tr>
				<td style="padding: 20px;"> 
					<div id="touchArea">
					     <div  style="height: 30px; line-height: 30px; text-align: center; color: #000; font-size: 18px; position:relative;">
					     	<span id="touchPayStatus">长按3秒进行支付</span>
					     	<a class="close-btn" id="colseBtn">×</a>
					     </div>
						 <div style="width: 100%; height: 5px; background-color: #ededed;border-radius:3px;">
						 	<div id="touchProgress"></div>
						 </div>
						 <div style="margin-top: 30px;">
						 	<img src="img/btn_touch_pay_0.png" id="btnTouchPay" />
						 </div>
					</div>
				</td>
			</tr>
		</table>

	</div>
	<div id="runingLayout">
		<table style="width: 100%;height: 100%;">
			<tr>
				<td valign="middle" >
					<div class="alertContent" style="width: 90%;margin: 0px auto;">下单中,请稍等...</div>
				</td>
			</tr>
		</table>
	</div>
	<input id="channelInput" type="hidden" value="${param._channel }" />
	<input id="financingTargetIdInput" type="hidden" value="${param.id }" />
	<input id="userIdInput" type="hidden" value="${user.id }" />
	<input id="app_token" type="hidden" value="${param.app_token}" />
	<input id="limitAmount" type="hidden" value="${financingTargetDO.limitAmount }" />
	<input id="minAmount" type="hidden" value="${financingTargetDO.minAmount }" />
	<input id="periodInput" type="hidden" value="${financingTargetDO.period }" />
	<input id="targetTypeInput" type="hidden" value="${financingTargetDO.type }" />

    <c:if test="${param.device==null||param.device=='' }">
			<div class="backBar backBar2">
				<table>
					<tbody>
						<tr>
							<td style="width: 50px;"><a href="financial_detail.htm?id=${param.id }"><img src="img/icon_fanhui.png" style="height: 40px;"></a></td>
							<td>购买</td>
							<td style="width: 50px;"></td>
						</tr>
					</tbody>
				</table>
			</div>
	</c:if>
	<table class="table1" style="margin:0px;">

		<tr class="inputLine">
			<td>购买金额</td>
			<td><input id="buyAmountInput" type="number" placeholder="最低${financingTargetDO.minAmount }元起" value="${param.default_buy_amount }" /></td>
			<td>元</td>
		</tr>
		<tr>
			<td colspan="3">
				<div style="float: left;">可购份额 ${remainAmount }元</div>
				<div style="float: right;">
					<c:if test="${financingTargetDO.limitAmount!=null && financingTargetDO.limitAmount>0 }">
						限额: ${financingTargetDO.limitAmount }元
					</c:if>
				</div>
			</td>
		</tr>

	</table>

	<div id="cashCouponSelectDiv" style="padding: 10px; display: none;">
		现金券
		<select >
			<option value=""></option>
		</select> 
	</div>
	<div id="rateIncrCouponSelectDiv" style="padding: 10px; display: none;">
		加息券
		<select >
			<option value=""></option>
		</select> 
	</div>

	<table class="table1">
		<tbody id="historyBankTab">
			<c:if test="${scbAmount!=null }">
				<tr class="inputLine "  >
					<td style="width: 60px;"><input type="radio" class="scp" name="bankRadio" value="scb" <c:if test="${scbAmount<=0 }">  disabled="disabled" </c:if>  /></td>
					<td><span >
					随存宝&nbsp;  <fmt:formatNumber value="${scbAmount }" maxFractionDigits="2" type="currency"   />  元 
					<input type="hidden" id="scbAmountInput" value="${scbAmount }" />
					</span></td>
				</tr>
			</c:if>
			<tr class="inputLine bank">
				<td style="width: 60px;"><input type="radio" class="historyBankRadio" name="bankRadio" /></td>
				<td><img class="bankIcon" style="width: 30px; float: left;" src="bank_logo/no_bank.png" /><span class="bankInfo"></span></td>
			</tr>
			<tr class="inputLine" id="newBankInfo">
				<td style="width: 60px;"><input type="radio" name="bankRadio"></td>
				<td>使用其它银行卡</td>
			</tr>
		</tbody>
	</table>

	<table class="table1" id="newBankInfoTable" style="margin-bottom:50x;">
		<tr class="inputLine">
			<td>姓名</td>
			<td><input id="nameInput" placeholder="请输入姓名" value="" /></td>
			<td></td>
		</tr>
		<tr class="inputLine">
			<td>身份证</td>
			<td><input id="pidInput" type="text" placeholder="请输入身份证" value="" /></td>
			<td></td>
		</tr>
		<tr>
			<td colspan="3"></td>
		</tr>
		<tr class="inputLine">
			<td>支付方式</td>
			<td></td>
			<td></td>
		</tr>
		<tr class="inputLine">
			<td style="width: 90px;"><img id="bankIcon" src="bank_logo/no_bank.png" height="30" /></td>
			<td><select id="bankSelect" style="width: 100%; height: 100%; border: 0px; height: 30px;">
				</select></td>
			<td></td>
		</tr>
		<tr class="inputLine">
			<td>卡号</td>
			<td colspan="2"><input id="bankCardNoInput" type="number" placeholder="请输入银行卡号" value="" /></td>
		</tr>
		<tr>
			<td colspan="3" style="color: gray;">限额:单笔<span class="singleTip"></span>元&nbsp;单日<span class="dayTip"></span>元&nbsp;单月<span class="monthTip"></span>元&nbsp;
			</td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
	<c:if test="${financingTargetDO.type=='CPB' }">
	<div id="btnKaiguanDiv" >
		<table style="width: 100%;">
							<tr>
								<td valign="top" > 
									<div style="line-height: 30px; padding-left: 40px;">
										<span>到期转入随存宝</span>
										<div style="color:#ccc; font-size: 10px; margin-top: -15px;">（首次送券）</div> 
									</div> 
								</td>
								<td valign="top" style="text-align: right; padding-right: 20px;">
									<img class="btnKaiguan" status='bank' src="../static/imgs/icon_kaiguan_guan.png" />
								</td> 
	
							</tr>
						
		</table> 
	</div>
	</c:if>
	<table style="margin: 20px 0px 60px; width: 100%; height: 100%;">
		<tr>
			<td style="width: 50px;vertical-align: top; padding-left: 10px;">
				<input type="checkbox" id="agreementCheck" checked="checked" style="width: 25px; height: 25px;" />
			</td>
			<td style="width: 110px;text-align: right; vertical-align: top; margin-top: 5px; display: inline-block;">
				<span>已阅读并同意</span>
			</td>
			<td style="vertical-align: top;width: 215px;">
				<div style="margin-top: 5px;">
					<input type="hidden" id="tid" value="${param.id }"/>
					<input type="hidden" id="app_token" value="${param.app_token }"/>
					<c:if test="${financingTargetDO.type=='CPB' }">
						<a href="pay_service_agreement.htm?tid=${param.id }">《支付服务协议》</a><br/>
						<a href="javascript:void(0);" id="borrowAgreementBtn">《质押借款协议》</a>
					</c:if>
					<c:if test="${financingTargetDO.type=='SCB' }">
						<a href="deal_impower_agreement.htm?app_token=${param.app_token }&tid=${param.id }">《交易授权委托书》</a>
					</c:if>
				</div>
			</td>
		</tr>
	</table>
	<div id="submitLayout">
		<button id="btnSubmit" class="btn btn-warning" style="width: 100%;">提交订单</button>
	</div>
	<form id="formPay" action="${fuiouPayUrl }" method="post" target="_self">
		<input name="t" value="<%=new Date() %>" type="hidden" />
		<input name="mchntCd" type="hidden" value="${mchntCd }" /> <input name="orderid" type="hidden" value="" /> <input name="ono" type="hidden" value="" /> <input name="backurl" type="hidden" value="${backurl }" /> <input name="reurl" type="hidden" value="${reurl }" /> <input name="homeurl" type="hidden" value="${homeurl }" /> <input name="name" type="hidden" value="" /> <input name="sfz" type="hidden" value="" /> <input name="md5" type="hidden" value="" />
	</form>
	
	<div id="baofooWapPayLayout" style="display: none;">
		
	</div>
	
	<jsp:include page="lcb_wx_common.jsp"></jsp:include>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="bankCard.js?v=14"></script>
	<script src="bid_form.js?v=21"></script>
	<script type="text/javascript" src="lcb_wx_common.js?201604131"></script>
</body>
</html>
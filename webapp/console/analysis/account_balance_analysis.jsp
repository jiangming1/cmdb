<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="../../static/jquery-1.11.0.js"></script>
<script src="../../static/highcharts-4.2.1/js/highcharts.js"></script>
<script src="account_balance_analysis.js"></script>
<style type="text/css">
td, th {
	padding: 5px;
}

.in .data_amount, .out .data_amount {
	text-align: right;
	font-weight: bold;
}

.in .data_amount {
	color: #f40;
}

.out .data_amount {
	color: blue;
}

.in .data_count, .out .data_count {
	font-size: 12px;
	color: gray;
}
.test_error{
	color: red;
}
.d{
	font-weight: bold;
}
.fh{
	font-size: 40px;
	color: gray;
}

#tfoot td{
	 background-color: #ccc;
}
#thead{  
	height: 30px;
}
#thead th{ 
 background-image: linear-gradient(to bottom, #f3f3f3 0px, #e3e3e3 100%);
 height: 30px !important;
}
.date_id{
	width: 105px;
}
.user_pay,.cash_coupon,.pay_out_principal,.pay_out,.d2h_profit,.h2d_profit,.activity_profit,.remain_profit,.testBalance,.total_amount{ 
	width: 105px;
}
#topHeader{
	list-style: none;
	margin: 0px;
	padding: 0px; 
}
#topHeader li{
	float: left;
	width: 116px;
	height:30px;
	text-align:center;
	font-size:11px;
	border:2px solid #f3f3f3;
}
#top{
    background-color:gray;
	position: fixed;
	top: 0px;
 	background-image: linear-gradient(to bottom, #f3f3f3 0px, #e3e3e3 100%);
 	border: 1px solid gray;
}
#seeUL {
	list-style: decimal;
}
</style>
</head>
<body style="margin-top: 0px;"> 
<div id="top">
 <h4 style="clear: both; padding-left: 10px;">系统总账平衡表</h4>
 <ul id="topHeader">
 	<li>日期</li>
 	<li>银行卡支付</li>
 	<li>打款本金</li>
 	<li>打款利息</li>
 	<li>现金券</li>
 	<li>定->活<br />(收益转本金)</li>
 	<li>活->定<br />(收益转本金)</li>
 	<li>体验金<br />(收益转本金)</li>
 	<li>开启复利<br />(收益转本金)</li>
 	<li>复活利息</li>
 	<li>收益节余</li>
 	<li>存量(总负债)</li>
 	<li>试算</li>
 </ul>
</div> 
 
	

	<table border="1" style="margin-top: 100px;">
		 
		<tbody id="tbody" >
			<tr>
				<td class="date_id"></td>
				<td class="user_pay in"><div class="data_count"></div>
					<div class="data_amount"></div></td>
					
				<td class="pay_out_principal out"><div class="data_count"></div>
					<div class="data_amount"></div></td>
					
				<td class="pay_out out"><div class="data_count"></div>
					<div class="data_amount"></div></td>
				<td title="现金券" class="cash_coupon in"><div class="data_count"></div>
					<div class="data_amount"></div></td>
				<td title="定转活" class="d2h_profit in"><div class="data_count"></div>
					<div class="data_amount"></div></td>
				<td title="活转定" class="h2d_profit in"><div class="data_count"></div>
					<div class="data_amount"></div></td>
				<td title="体验金" class="activity_profit in"><div class="data_count"></div>
					<div class="data_amount"></div></td>
				<td title="开启复利,收益转本金" class="init_ca in" ><div class="data_count"></div>
					<div class="data_amount"></div></td>
					
				<td title="复利新增利息" class="ac_profit in"><div class="data_count"></div>
					<div class="data_amount"></div></td>
				<td class="remain_profit"><div class="data_count"></div>
					<div class="data_amount"></div></td>

				<td>
					<div class="total_amount"></div>
				</td>
				<td class="testBalance"></td>
			</tr>
		</tbody>
		<tfoot id="tfoot">
			<tr>
				<td class="date_id">总计</td>
				<td class="user_pay in"><div class="data_count"></div>
					<div class="data_amount"></div></td>
					
				<td class="pay_out_principal out"><div class="data_count"></div>
					<div class="data_amount"></div></td>
					
				<td class="pay_out out"><div class="data_count"></div>
					<div class="data_amount"></div></td>
				<td class="cash_coupon in"><div class="data_count"></div>
					<div class="data_amount"></div></td>
				<td class="d2h_profit in"><div class="data_count"></div>
					<div class="data_amount"></div></td>
				<td class="h2d_profit in"><div class="data_count"></div>
					<div class="data_amount"></div></td>
				<td class="activity_profit in"><div class="data_count"></div>
					<div class="data_amount"></div></td>
				<td class="init_ca in"><div class="data_count"></div>
					<div class="data_amount"></div></td>
					
				<td class="ac_profit in"><div class="data_count"></div>
					<div class="data_amount"></div></td>
				<td class="remain_profit"><div class="data_count"></div>
					<div class="data_amount"></div></td>

				<td>
					<div class="total_amount"></div>
				</td>
				<td class="testBalance" title="从2016-06-25开始试算结果累计"></td>
			</tr>
		</tfoot>
	</table>
	<ul id="seeUL"><h4>说明</h4> 
		<li>存量(总负债):该数值体现我们公司对客户承担的还款责任.注意:该指标不包括未到期的收益,包括僵尸用户的体验金收益。</li>
		<li>平衡公式:
			<span class="d">昨日存量</span>
			<span class="fh">+</span><span class="d">银行卡支付</span> 
			<span class="fh">-</span><span class="d">打款本金</span>
			<span class="fh">+</span><span class="d">现金券</span>
			<span class="fh">+</span><span class="d">定->活</span>
			<span class="fh">+</span><span class="d">活->定</span>
			<span class="fh">+</span><span class="d">体验金</span>
			<span class="fh">+</span><span class="d">复活利息</span>
			<span class="fh">+</span><span class="d">(今日收益节余-昨日收益节余)</span> 
			<span class="fh">-</span><span class="d">今日存量</span>
			<span class="fh">=</span><span class="d">0</span>
		</li>
		<li>打款本金、打款利息,从2016-06-06(自动打款)之前在洪婷那里有</li>
		<li>2016-06-25 到 2016-08-04号试算一列出现了小尾巴,原因:存量里面统计了一部分提现的活期收益(而存量不应包含任何未转本金的收益),但是前面所有列的数据均未出错</li>
		<li>2016-08-05日之后试算结果应为0</li>
		<li>昨日及之前的数据不会变,如果发现会变动,则说明有人非法纂改数据</li>
		<li>财务账上实际在用资金:本页面存量 - (所有收益转本金及现金券) - 进出支付手续费 - 打款利息</li>
		<li>以下是复活账户资金流水分类表,左边所有收入的部分减支出部分减余额==0则安全</li>
	</ul>
	<table>
		<tr>
			<td>
				<div id="accApie" style="width: 50%; height: 300px; float: left;"></div> 
			</td>
			<td style="font-size: 30px;">-</td>
			<td style="font-size: 30px;" id="caBalanceAmt">####</td>
			<td style="font-size: 30px;">=</td>
			<td style="font-size: 30px;" id="caBalanceTest">#</td>
			<td id="caBalanceTestImg"></td>
		</tr>
	</table>
 	 
	<a name="bottom" href="#bottom"></a>
</body>
</html>
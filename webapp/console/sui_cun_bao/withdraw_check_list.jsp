<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta charset="utf-8">
<link href="https://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<title>提现申请列表</title>
<style type="text/css">
.item {
	width: 100%;
}

.item td {
	border: 0px;
}

.item tr:HOVER {
	background-color: #eee;
}

.mainTr td {
	border-top: 1px solid red;
}

.mainTr th {
	font-size: 16px !important;
}

.itemTr {
	display: none;
}

.itemTr th {
	color: #ccc;
}

.itemTr td {
	color: #ccc;
}

.money {
	color: #f40 !important;
	font-size: 18px;
	font-weight: bold;
}

.money2 {
	color: #f40 !important;
}
.CA{
	background-color: #ccc;
}
</style>
</head>
<body>
	<div style="color: red;font-size: 20px; margin: 10px;">非常注意:确认提现后,将自动免复核打款,不需要线下打款.</div>
	<table class="table">
		<thead>
			<tr>
				<th>申请时间</th>
				<th>活期类型</th>
				<th>姓名</th>
				<th>身份证号码</th>
				<th>手机号码</th>
				<th>提现本金</th>
				<th>提现收益</th>
				<th>前期收益节余</th>
				<th>银行名称</th>
				<th>银行卡号</th>
				<th>状态</th>
				<th>操作人</th>
				<th>转账时间</th>
				<th>&nbsp;</th>
				
			</tr>
		</thead>
		<tbody id="tbody">
			<tr class="mainTr">
				<td><i class="icon-plus swithItem"></i><span class="apply_time">申请时间</span></td>
				<td class="h_type">活期类型</td>
				<td class="apply_name">姓名</td>
				<td class="apply_pid">身份证号码</td>
				<td class="user_mobile">手机号码</td>
				<td class="money">¥<span class="apply_withdraw_principal">提现本金</span></td>
				<td class="money">¥<span class="apply_withdraw_profit">0</span></td>
				<td style="color: blue"><span class="subtract_remain_profit" >0</span></td>
				
				<td class="apply_bank_name">银行名称</td>
				<td class="apply_bank_card_no">银行卡号</td>
				<td>申请中</td>
				<td class="opt_name">操作人</td>
				<td class="opt_time">转账时间</td>
				<td><button class="btnConfirm">确认转账</button></td>
			</tr>
			<tr class="itemTr">
				<td colspan="12">
					<table class="item">
						<thead>
							<tr>
								<th>支付时间</th>
								<th>标的名字</th>
								<th>购买金额</th>
								<th>年化</th>
								<th>开始计息</th>
								<th>姓名</th>
								<th>支付通道</th>
								<th>身份证</th>
								<th>银行</th>
								<th>卡号</th>
								<th>取现本金</th>
								<th>取现收益</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="pay_time">无</td>
								<td class="target_name">无</td>
								<td class="buy_amount">无</td>
								<td class="annualized_rates">无</td>
								<td class="begin_profit">无</td>
								<td class="pay_name">无</td>
								<td class="pay_channel">无</td>
								<td class="pay_pid">无</td>
								<td class="bank_name">无</td>
								<td class="bank_card_no">无</td>
								<td class="withdraw_principal money2">无</td>
								<td class="withdraw_profit money2">无</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
	<script src="../../static/jquery-1.11.0.js"></script>
	<script src="../../static/bootstrap2/js/bootstrap.min.js"></script>
	<script src="../../static/md5.js"></script>
	<script src="withdraw_check_list.js"></script>
</body>
</html>
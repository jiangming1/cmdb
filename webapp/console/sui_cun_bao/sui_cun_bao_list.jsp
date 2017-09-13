<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta charset="utf-8">
<title>随存宝购买数据</title>
<script src="../../static/jquery-1.11.0.js"></script>
<script src="../../static/md5.js"></script>
<script src="../../static/comm.js"></script>
<link rel="stylesheet" type="text/css" href="../../static/jquery-easyui-1.4.4/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="../../static/jquery-easyui-1.4.4/themes/icon.css">
<script type="text/javascript" src="../../static/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
<style type="text/css">
.expired {
	color: red;
}

.expireing {
	color: blue;
}
</style>
</head>
<body class="easyui-layout">
	<div data-options="region:'center',split:true" style="background-color: #eee; border: 0px;">
		<table id="tt" class="easyui-datagrid" style="width: 100%; height: 100%;" data-options="rownumbers:true,singleSelect:true,url:'../query.htm?listId=SCB_BID_VIEW.list&countId=SCB_BID_VIEW.count',method:'post',pagination:true,rownumbers:true,sortName:'pay_time',sortOrder:'desc',fitColumns:true">
			<thead>
				<tr>

					<th field="certificate_id">订单编号(富友)</th>
					<th field="true_name">账户实名</th>
					<th field="pay_name">支付名字</th>
					<th field="pay_pid">身份证</th>
					<th field="mobile">手机</th>
					<th field="buy_amount" align="right" sortable="true" data-options="styler:sortableStyle">购买金额</th>
					<th field="bank_name">银行名字</th>
					<th field="bank_card_no">卡号</th>
					<th field="annualized_rates" align="right">年化</th>
					<th field="pay_time" sortable="true" data-options="formatter:cellPayTime,styler:sortableStyle">下单时间</th>
					<th field="target_name">标名</th>
					<th field="code">标的编号</th>
					<th field="summary">备注</th> 
					<th field="id" data-options="hidden:true">id</th>
				</tr>
			</thead>
		</table>
	</div>

	<script type="text/javascript">
 

		function cellEndProfit(val, row) {
			if (!val) {
				return "";
			}
			var endProfitDate = new Date(val);
			var t = endProfitDate.getTime() - new Date().getTime();
			var newVal = new Date(val).toCNString();
			if (t < 0) {
				newVal = "<span class='expired'>" + newVal + "&nbsp;已过期</span>";
			} else if (t < 86400000 * 3) {
				newVal = "<span class='expireing'>" + newVal + "&nbsp;即将到期</span>";
			}
			return newVal;
		}

		function cellPayTime(val, row) {
			if (!val) {
				return "";
			}
			return new Date(val).toCNString();
		}

		function cellProfit(val, row) {
			return val.toFixed(2);
		}

		function sortableStyle(value, row, index) {
			return 'background-color:#CC9966;';
		}
	</script>
</body>
</html>
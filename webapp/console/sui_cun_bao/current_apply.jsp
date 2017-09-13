<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta charset="utf-8">
<title>复利请款单</title>
<script src="../../static/jquery-1.11.0.js"></script>
<script src="../../static/md5.js"></script>
<script src="../../static/comm.js"></script>
<link rel="stylesheet" type="text/css" href="../../static/jquery-easyui-1.4.4/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="../../static/jquery-easyui-1.4.4/themes/icon.css">
<script type="text/javascript" src="../../static/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../static/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
<style type="text/css">
.expired {
	color: red;
}

.expireing {
	color: blue;
}

.attentionPlase {
	padding-left: 20px;
	color: red;
	font-size: 20px;
}
</style>
</head>
<body class="easyui-layout">
	<div data-options="region:'center',split:true" style="background-color: #eee; border: 0px; overflow:hidden;">
		<div id="tb" style="padding:3px">
			<span>开始时间:</span>
			<input class="easyui-datetimebox" data-options="showSeconds:true" id="beginTime"></input>
			<span>结束时间:</span>
			<input class="easyui-datetimebox" data-options="showSeconds:true" id="endTime"></input>
			<button class="btn" id="queryBtn" onclick="doSearch()">查 询</button>
			<button class="btn" id="exportBtn" onclick="doExport()">导出excel</button>　　　　　　
			<a href='money_apply.jsp'>查看活期请款单</a>
		</div>
		<table id="tt" class="easyui-datagrid" style="width: 100%; height: 95%;" data-options="rownumbers:true,singleSelect:true,url:'../query.htm?listId=FINANCE_OFFICE.current_apply&countId=FINANCE_OFFICE.current_apply_count&status=apply',method:'post',pagination:false,rownumbers:true,fitColumns:true">
			<thead>
				<tr>
					<th field="gmt_create">申请时间</th>
					<th field="name">姓名</th>
					<th field="mobile">手机号码</th>
					<th field="bank_card_no">卡号</th>
					<th field="bank_name">银行</th>
					<th field="pid">身份证</th>
					<th field="withdraw_principal" data-options="formatter:fmtAmount">取现本金</th>
					<th field="withdraw_profit" data-options="formatter:fmtAmount">取现收益</th>
					<th field="handling_charge" data-options="formatter:fmtAmount">手续费</th>
					<th field="total_amount" data-options="formatter:fmtAmount">合计金额</th>
					<th field="mark">备注</th>
					<th field="principal_total" data-options="formatter:sumPrincipal">本金总计</th>
					<th field="profit_total" data-options="formatter:sumProfit">收益总计</th>
					<th field="handling_total" data-options="formatter:sumHandling">手续费总计</th>
					<th field="sum_total" data-options="formatter:sumAmount">请款总计</th>
				</tr>
			</thead>
		</table>
	</div>

	<script type="text/javascript">
		var principalTotal = 0;
		var profitTotal = 0;
		var handlingTotal = 0;
		var sumTotal = 0;
		$(function() {
			var attentionPlase = "请注意:体验金购买数据会在到期后的最近一天(包括双休)早上8点自动处理(本金回收,收益转随存宝),有不明白的联系技术部(王鸿雁18367156949)";
			$(".datagrid-toolbar").find("td").append("<span class='attentionPlase'>" + attentionPlase + "</span>");
		});

		function fmtAmount(val, row) {
			return val.toFixed(2);
		}
		
		function sumPrincipal(val, row) {
			if (!val) {
				val = 0;
			}
			var amount = new Number(val);
			principalTotal = new Number(val) + new Number(principalTotal);
			return principalTotal.toFixed(2);
		}

		function sumProfit(val, row) {
			if (!val) {
				val = 0;
			}
			var amount = new Number(val);
			profitTotal = new Number(val) + new Number(profitTotal);
			return profitTotal.toFixed(2);
		}

		function sumHandling(val, row) {
			if (!val) {
				val = 0;
			}
			var amount = new Number(val);
			handlingTotal = new Number(val) + new Number(handlingTotal);
			return handlingTotal.toFixed(2);
		}

		function sumAmount(val, row) {
			if (!val) {
				val = 0;
			}
			var amount = new Number(val);
			sumTotal = new Number(val) + new Number(sumTotal);
			return sumTotal.toFixed(2);
		}
		
		function doSearch(){
			principalTotal = 0;
			profitTotal = 0;
			handlingTotal = 0;
			sumTotal = 0;
			$('#tt').datagrid('load',{
				beginTimeStr: $('#beginTime').datetimebox('getValue'),
				endTimeStr: $('#endTime').datetimebox('getValue')
			});
		}
		
		function doExport(){
			if (confirm("确定要导出excel吗?")) {
				var listId = "FINANCE_OFFICE.current_apply_export";
				var myDate = new Date();
				var mytime = myDate.toCNString2(); // 获取当前时间
				var beginTimeStr= $('#beginTime').datetimebox('getValue');
				var endTimeStr=$('#endTime').datetimebox('getValue');
				var excelname = "复利请款单" + mytime;	
				window.open("../exportexcel.htm?listId=" + listId
						+ "&excelname=" + excelname + "&beginTimeStr="
						+ beginTimeStr + "&endTimeStr=" + endTimeStr
						+ "&status=apply");
			}
			
		}
	</script>
</body>
</html>
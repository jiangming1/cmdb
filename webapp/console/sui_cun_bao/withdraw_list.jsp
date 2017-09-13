<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta charset="utf-8">
<title>存票宝购买数据</title>
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

.easyui-datebox2 {
	width: 100px;
}

.textbox {
	border-radius: 0px;
}
</style>
</head>

<body class="easyui-layout">

	<div data-options="region:'center',split:true" style="background-color: #eee; border: 0px;">
		<table id="tt" class="easyui-datagrid" style="width: 100%; height: 100%;" data-options="rownumbers:true,singleSelect:true,url:'../query.htm?listId=WITHDRAW_ANALYSIS.userWithdrawList&countId=WITHDRAW_ANALYSIS.userWithdrawCount',method:'post',toolbar:toolbar,pagination:true,rownumbers:true,sortName:'date',sortOrder:'asc',fitColumns:true">
			<thead>
				<tr>

					<th field="withdraw_id">ID</th>
					<th field="date" sortable="true" data-options="formatter:cellPayTime,styler:sortableStyle">申请时间</th>
					<th field="true_name">姓名</th> 
					<th field="mobile">手机</th>
					<th field="profit" align="right" sortable="true" data-options="styler:sortableStyle">利息成本</th>
					<th field="activity" align="right" sortable="true" data-options="styler:sortableStyle">活动成本</th>
					<th field="principal" align="right" sortable="true" data-options="styler:sortableStyle">本金</th>
					<th field="status" >取现状态</th>
					<th field="apply_money" align="right" sortable="true" data-options="styler:sortableStyle">取现金额</th>
					<th field="certificate_id" >自动打款编号</th>
					 
				</tr>
			</thead>
		</table>
	</div>
	<div id="conditionDiv" style="margin-left: 20px;">
  
		<select id="cashedType">
			<option value="">所有</option>
			<option value="apply">未打款</option>
			<option value="transfered">已打款</option>
			<option value="close">问题提现,已关闭</option>
		</select>
		<input placeholder="手机号码" id="mobileInput" /> 提现时间<input id="gmtCreateBegin" class="easyui-datebox easyui-datebox2" />~<input id="gmtCreateEnd" class="easyui-datebox easyui-datebox2" />
		<button id="btnQuery">查找</button>
		<button id="btnExport">导出</button>
		<span style="color: red;"></span>
	</div>
	<script type="text/javascript">
		var toolbar = [];

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

		$(function() {
			$('#conditionDiv').appendTo($($(".datagrid-toolbar")[0]).find("tr"));
			$("#typeSelect").change(function() { 
				$("#tt").datagrid("load", QueryCondition.get());

			});
			$("#cashedType").change(function() {

				$("#tt").datagrid("load", QueryCondition.get());

			});

			$("#btnQuery").click(function() {
				
				$("#tt").datagrid("load", QueryCondition.get());

			});
			//var attentionPlase = "请注意:8:00自动处理体验金标的,9:10自动处理定期标的,有不明白的联系技术部(王鸿雁18367156949)";
			//$(".datagrid-toolbar").find("td").append("<span class='attentionPlase'>" + attentionPlase + "</span>");
			
			$("#btnExport").click(function(){
				var param = QueryCondition.get(); 
				var href="../exportexcel.htm?listId=WITHDRAW_ANALYSIS.userWithdrawList&rows=10000&excelname=withdraw&";
				if(param.mobile){
					href+="&mobile="+param.mobile;
				}
				if(param.cashedType){
					href+="&cashedType="+param.cashedType;
				}
				if(param.gmtCreateBegin){
					href+="&gmtCreateBegin="+param.gmtCreateBegin;
				}
				if(param.gmtCreateEnd){
					href+="&gmtCreateEnd="+param.gmtCreateEnd;
				} 
				window.open(href)
			});
		
		});

		var QueryCondition = {
			get : function() {
				var p = { 
					mobile : $("#mobileInput").val().trim(),
					cashedType : $("#cashedType").val().trim(),
					gmtCreateBegin:$('#gmtCreateBegin').datebox('getValue'),
					gmtCreateEnd:$('#gmtCreateEnd').datebox('getValue') 
				}; 
				return p;
			}
		};
	</script>
</body>

</html>
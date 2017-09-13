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
.has_cashed{
	background:url("../../static/imgs/has_cached.png");
}
</style>
</head>

<body class="easyui-layout">

	<div data-options="region:'center',split:true" style="background-color: #eee; border: 0px;">
		<table id="tt" class="easyui-datagrid" style="width: 100%; height: 100%;" data-options="rownumbers:true,singleSelect:true,url:'../query.htm?listId=CPB_BID_VIEW.list&countId=CPB_BID_VIEW.count',method:'post',toolbar:toolbar,pagination:true,rownumbers:true,sortName:'end_profit',sortOrder:'asc',fitColumns:true,onLoadSuccess:onLoadSuccess">
			<thead>
				<tr>

					<th field="certificate_id">订单编号</th>
					<th field="pay_channel">支付渠道</th>
					<th field="transfer_current">到期转活?</th>
					<th field="true_name">账户实名</th>
					<th field="pay_name">支付名字</th>
					<th field="pay_pid">身份证</th>
					<th field="mobile">手机</th>
					<th field="buy_amount" align="right" sortable="true" data-options="styler:sortableStyle">购买金额</th>
					<th field="cash_coupon_amount" align="right">现金券</th>
					<th field="incr_rate" align="right">加息券</th>
					<th field="withdraw_principal" align="right">已提现本金</th>

					<th field="period">期限(天)</th>
					<th field="end_profit" align="right" sortable="true" data-options="formatter:cellEndProfit,styler:sortableStyle">提现日期</th>
					<th field="profit" data-options="formatter:cellProfit" align="right">到期利息</th>
					<th field="bank_name">银行名字</th>
					<th field="bank_card_no">卡号</th>
					<th field="annualized_rates" align="right">年化</th>
					<th field="pay_time" sortable="true" data-options="formatter:cellPayTime,styler:sortableStyle">下单时间</th>
					<th field="target_name">标名</th>
					<th field="code">标的编号</th>
					<th field="summary">备注</th>
					<th field="withdraw_type">提现类型</th>
					<th field="id" data-options="hidden:true">id</th>
				</tr>
			</thead>
		</table>
	</div>
	<div id="conditionDiv" style="margin-left: 20px;">

		投标类型

		<select id="typeSelect">
			<option value="all">所有</option>
			<option value="activity">活动标的</option>
			<option value="fuiou_pay">银行卡支付</option> 
			<option value="DEMAND_2_FIX">活转定</option>
		</select>
		<select id="cashedType">
			<option value="no_cashed">未提现</option>
			<option value="cashed">已提现</option>
		</select>
		<select id="transferCurrentSelect">
			<option value=""></option>
			<option value="2demand">到期转活</option>
			<option value="2card">到期转卡</option>
		</select>
		<input placeholder="手机号码" id="mobileInput" /> 下单<input id="gmtCreateBegin" class="easyui-datebox easyui-datebox2" />~<input id="gmtCreateEnd" class="easyui-datebox easyui-datebox2" /> 到期<input id="gmtProfitBegin" class="easyui-datebox easyui-datebox2" />~<input id="gmtProfitEnd" class="easyui-datebox easyui-datebox2" />
		<button id="btnQuery">查找</button>
		<button id="btnExport">导出</button>
		<span style="color: red;"></span>
	</div>
	<script type="text/javascript">
		var toolbar = [ {
			text : '确认提现',
			iconCls : 'icon-ok',
			handler : function() {
				var selectedRow = $('#tt').datagrid('getSelected');
				if (!selectedRow) {
					alert("请选择");
					return;
				}

				if (new Date(selectedRow.end_profit).getTime() > new Date().getTime()) {
					alert("该投资还未到期,不能提现!");
					return;
				}

				var confirmStr = "确认已付给:" + selectedRow.true_name + ",本金:" + selectedRow.buy_amount + "利息:" + selectedRow.profit.toFixed(2) + ",共:"
						+ (selectedRow.buy_amount + selectedRow.profit).toFixed(2) + "元";
				if (!window.confirm(confirmStr)) {
					return;
				}

				var pwd = window.prompt("确认密码");
				if (!pwd) {
					return;
				}
				var paremeter = {
					t : new Date(),
					bidId : selectedRow.id,
					pwd : MD5(pwd),
					rowIndex : $('#tt').datagrid('getRowIndex', selectedRow)
				};
				//alert($('#tt').datagrid('getRowIndex', selectedRow));
				if (!selectedRow.bank_card_no) {
					paremeter["bankInfo"] = window.prompt("银行卡信息如:银行名,卡号尾号");
					if (!paremeter["bankInfo"]) {
						alert("出错了.您没输入银行名,卡号,退出确认!");
						return;
					}
				}
				$.post("cun_piao_bao_withdraw.htm", paremeter, function(data) {
					if (data.code == 'SUCCESS') {
						$('#tt').datagrid('deleteRow', data.rowIndex);
						
					    /**
					    	下面这段代码是为了修复Easyui连续删除的BUG(连错行)
					    */ 
						var  trs = $(".datagrid-view2").find("tr.datagrid-row"); 
						for(var i=0;i<trs.length;i++){
							$(trs[i]).attr("datagrid-row-index",i);
							$(trs[i]).attr("id","datagrid-row-r1-2-"+i);
						}
						
						trs = $(".datagrid-view1").find("tr.datagrid-row"); 
						for(var i=0;i<trs.length;i++){
							$(trs[i]).attr("datagrid-row-index",i);
							$(trs[i]).attr("id","datagrid-row-r1-1-"+i);
							$(trs[i]).find(".datagrid-cell-rownumber").html(i+1);
						}
						alert("提现成功");
					} else if (data.code == 'PWD_ERROR') {
						alert("确认密码错误");
					} else {
						alert("出错了,错误代码:" + data.code);
					}
				}, "json");
			}
		} ];
		function onLoadSuccess(){
			if($("#cashedType").val()=="cashed"){
				$(".datagrid-body").addClass("has_cashed"); 
			}else{
				$(".datagrid-body").removeClass("has_cashed"); 
			}
			
		}
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
			
			$("#transferCurrentSelect").change(function(){
				$("#tt").datagrid("load", QueryCondition.get());
				
			});

			$("#btnQuery").click(function() {
				
				$("#tt").datagrid("load", QueryCondition.get());

			});
			//var attentionPlase = "请注意:8:00自动处理体验金标的,9:10自动处理定期标的,有不明白的联系技术部(王鸿雁18367156949)";
			//$(".datagrid-toolbar").find("td").append("<span class='attentionPlase'>" + attentionPlase + "</span>");
			
			$("#btnExport").click(function(){
				var param = QueryCondition.get();
				param["rows"]=100; 
				$.post("../query.htm?listId=CPB_BID_VIEW.list",param,function(data){
					var form=$('<form id="excel_create_form" action="../excel_create.htm" style="display: none;" method="post"></form>');
					form.append('<input type="hidden" id="contentInput" name="content" />');
					form.append('<input type="hidden" id="nameInput" name="name" />');
					form.find("#contentInput").val(JSON.stringify(data.rows));
					form.find("#nameInput").val("定期购买数据");
					$("body").append(form);
					form.submit();
				},"json"); 
			});
		
		});

		var QueryCondition = {
			get : function() {
				var p = {
					bidType : $("#typeSelect").val(),
					mobile : $("#mobileInput").val().trim(),
					cashedType : $("#cashedType").val().trim(),
					gmtCreateBegin:$('#gmtCreateBegin').datebox('getValue'),
					gmtCreateEnd:$('#gmtCreateEnd').datebox('getValue'),
					gmtProfitEnd:$('#gmtProfitEnd').datebox('getValue'),
					gmtProfitBegin:$('#gmtProfitBegin').datebox('getValue'),
					transferCurrentType:$("#transferCurrentSelect").val().trim()
				}; 
				return p;
			}
		};
	</script>
</body>

</html>
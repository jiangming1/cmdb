$(function() {
	$("#btnFuiouWithdrawTask").click(function(){
		$.post("execute_all_fuiou_widthdraw_task.htm",{
			t:new Date(),
			gmtSendDate : $('#gmtSendDate').datebox('getValue')
			
		},function(data){
			if(data.code=="started"){
				alert("启动批量发送");
			}else if(data.code=="running"){
				alert("执行中.不要多次点击了");
			}else{
				alert(JSON.stringify(data));
			}
		},"json"); 
	});
});
var toolbar = [ {
	text : '手动执行',
	iconCls : 'icon-ok',
	handler : function() {
		var selectedRow = $('#tt').datagrid('getSelected');
		if (!selectedRow) {
			alert("请选择");
			return;
		}

		// if (selectedRow.status != 'new') {
		// alert("该任务已经执行过了,不能重复执行!");
		// return;
		// }

		if (!window.confirm("确认执行")) {
			return;
		}
		var paremeter = {
			t : new Date(),
			taskId : selectedRow.id,
			rowIndex : $('#tt').datagrid('getRowIndex', selectedRow)
		};
		$.post("execute_task.htm", paremeter, function(data) {
			$('#tt').datagrid("updateRow", {
				index : data.rowIndex,
				row : {
					status : data.status,
					result : data.result,
					run_time : new Date().getTime()
				}
			});
			if (data.success) { 
				alert("执行完毕");
			} else {
				alert(JSON.stringify(data));
			}
		}, "json");

	}
} ];
function onLoadSuccess() {
	if ($("#cashedType").val() == "cashed") {
		$(".datagrid-body").addClass("has_cashed");
	} else {
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

function cellTime(val, row) {
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

	$("#transferCurrentSelect").change(function() {
		$("#tt").datagrid("load", QueryCondition.get());

	});

	$("#btnQuery").click(function() {

		$("#tt").datagrid("load", QueryCondition.get());

	});
	// var attentionPlase =
	// "请注意:8:00自动处理体验金标的,9:10自动处理定期标的,有不明白的联系技术部(王鸿雁18367156949)";
	// $(".datagrid-toolbar").find("td").append("<span class='attentionPlase'>"
	// + attentionPlase + "</span>");

	$("#btnExport").click(function() {
		var param = QueryCondition.get();
		param["rows"] = 100;
		$.post("../query.htm?listId=CPB_BID_VIEW.list", param, function(data) {
			var form = $('<form id="excel_create_form" action="../excel_create.htm" style="display: none;" method="post"></form>');
			form.append('<input type="hidden" id="contentInput" name="content" />');
			form.append('<input type="hidden" id="nameInput" name="name" />');
			form.find("#contentInput").val(JSON.stringify(data.rows));
			form.find("#nameInput").val("定期购买数据");
			$("body").append(form);
			form.submit();
		}, "json");
	});

	$("#executedSelect").change(function() {
		if ($(this).val() == "new") {
			$("#successSelect").val("");
		}
	});
});
var QueryCondition = {
	get : function() {
		var p = {
			type : $("#typeSelect").val(),
			mobile : $("#mobileInput").val().trim(),
			beginTimer : $('#gmtCreateBegin').datebox('getValue'),
			endTimer : $('#gmtCreateEnd').datebox('getValue')
		};

		var executedFlag = $("#executedSelect").val();
		var sucessFlag = $("#successSelect").val();
		if (executedFlag == "new") {
			p.status = 'new';
		} else if (executedFlag == "executed" && sucessFlag == '') {
			p.status = 'executed';
		} else if (sucessFlag == 'success') {
			p.status = 'success';
		} else if (sucessFlag == 'fail') {
			p.status = 'fail';
		}
		return p;
	}
};
$(function() {
	$('#cashCouponDatagrid').datagrid({
		onDblClickCell : function(index, field, value) {
			var defId = $(this).datagrid('getSelected').id;
			$("#tt2").datagrid("load", {
				mobile : $("#keywordsInput").val().trim(),
				defId : defId
			});
		}
	});
	$('#cashCouponDatagridToolbarForm').appendTo($($(".datagrid-toolbar")[0]).find("tr"));
	$('#tt2ToolbarForm').appendTo($($(".datagrid-toolbar")[1]).find("tr"));

	$("#btnBatchGivePerson").click(function() {
		var selectedRow = $('#cashCouponDatagrid').datagrid('getSelected');
		if (!selectedRow) {
			alert("请选择");
			return;
		}
		window.location = "batch_send_coupon.jsp?coupon_type=cash_coupon&def_id=" + selectedRow.id;

	});
	$("#btnGivePerson").click(function() {

		var selectedRow = $('#cashCouponDatagrid').datagrid('getSelected');
		if (!selectedRow) {
			alert("请选择");
			return;
		}

		var param = {
			t : new Date(),
			defId : selectedRow.id,
			mobile : $("#mobileInput").val().trim(),
			quantity : $("#quantityInput").val().trim(),
			summary : $("#summaryInput").val().trim(),
			message : $("#messageInput").val().trim()
		};
		if (!param.mobile) {
			$("#mobileInput").focus();
			return;
		}
		$("#mobileInput").val("");
		$("#summaryInput").val("");
		$.post("give_cash_coupon.htm", param, function(data) {
			if (data.code == "true") {

				$('#tt2').datagrid('appendRow', {
					name : data.cashCouponDO.name,
					mobile : data.mobile,
					amount : data.cashCouponDO.amount,
					used_amount : '0',
					conditions : data.cashCouponDO.conditions,
					summary : data.cashCouponDO.summary
				});
				alert("赠送成功!");

			} else {
				alert("出错了:" + data.code);
			}

		}, "json");

	});

	$("#btnFind").click(function() {
		$("#tt2").datagrid("load", {
			mobile : $("#keywordsInput").val().trim()
		});
	});

});
var cashCouponDefToolbar = [];

var cashCouponToolbar = [ {
	text : '删除',
	iconCls : 'icon-remove',
	handler : function() {

	}
} ];

function dateFormat(val, row) {
	if (!val) {
		return "";
	}
	return new Date(val).toCNString();
}

function usedAmountStyler(value, row, index) {
	if (value > 0) {
		return 'background-color:#CC9966;';
	}
	return '';

}
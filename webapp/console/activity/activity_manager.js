$(function() {
	$('#tt1').datagrid({
		onDblClickCell : function(index, field, value) {
			var actid = $(this).datagrid('getSelected').id; 
			$("#tt2").datagrid("load", {
				mobile : $("#mobileInput").val().trim(),
				status:$("#statusSelect").val().trim(),
				actid:actid
			});
		}
	});
	$('#cashCouponDatagridToolbarForm').appendTo($($(".datagrid-toolbar")[0]).find("tr"));
	$('#tt2ToolbarForm').appendTo($($(".datagrid-toolbar")[1]).find("tr"));

 
 

	$("#btnFind").click(function() {
		var selectedRow = $('#tt1').datagrid('getSelected');
		$("#tt2").datagrid("load", {
			mobile : $("#mobileInput").val().trim(),
			status:$("#statusSelect").val().trim(),
			actid:selectedRow?selectedRow.id:""
		});
	});

});
var cashCouponDefToolbar = [];

var cashCouponToolbar = [];

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
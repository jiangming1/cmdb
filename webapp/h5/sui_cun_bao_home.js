$(function() {

	$.post("sui_cun_bao_get_merged_profit.htm", {
		t : new Date()
	}, function(profit) {
		if (!profit) {
			$("#dayProfit").html("0.00");
			$("#totalProfit").html("0.00");
			$("#principal").html("0.00");
			return;
		}
		$("#dayProfit").html(profit.dayProfit ? profit.dayProfit : "0.00");
		$("#totalProfit").html(profit.totalProfit ? profit.totalProfit : "0.00");
		$("#principal").html(profit.principal ? profit.principal : "0.00");

	}, "json");

});
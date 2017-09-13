$(function() {
	$.post("sui_cun_bao_get_current_account.htm", {
		t : new Date()
	}, function(profit) {
		if (!profit) {
			$("#dayProfit").html("0.00");
			$("#totalProfit").html("0.00");
			$("#principal").html("0.00");
			return;
		}
		$("#dayProfit").html(profit.yesterdayProfit ? profit.yesterdayProfit.toFixed(2) : "0.00");
		$("#totalProfit").html(profit.totalProfit ? profit.totalProfit.toFixed(2) : "0.00");
		$("#principal").html(profit.balance ? profit.balance.toFixed(2) : "0.00");

	}, "json");

});
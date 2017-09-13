$(function() {

	$("#btnQuery").click(function() {
		var p = {
			mobile : $("#mobile").val().trim(),
			t : new Date()
		};
		if (!p.mobile) {
			$("#mobile").focus();
			return;
		}
		$.post("../../h5/sui_cun_bao_get_merged_profit.htm", p, function(data) {
			if (!data.principal) {
				$("#totalProfit").val("");
				$("#principal").val("");
				return;
			}
			$("#totalProfit").val(data.totalProfit);
			$("#principal").val(data.principal);

		}, "json");
	});

	$("#btnWithdraw").click(function() {
		var p = {
			t : new Date(),
			withdrawAmount : $("#withdrawAmount").val().trim(),
			mobile : $("#mobile").val().trim()
		};
		if (!p.withdrawAmount) {
			$("#withdrawAmount").focus();
			return;
		}
		if (!p.mobile) {
			$("#mobile").focus();
			return;
		}
		var checkPwd = window.prompt("确认密码");
		if (!checkPwd) {
			return;
		}
		p["pwd"] = MD5(checkPwd);
		$.post("negotiate_withdraw.htm", p, function(data) {
			if (data.code == "SUCCESS") {
				alert("提现申请成功!");
				$("#withdrawAmount").val("");
			} else if (data.code == "PWD_ERROR") {
				alert("支付密码错误!");
			} else {
				alert("其它错误:" + data.code);
			}
		}, "json");
	});
});
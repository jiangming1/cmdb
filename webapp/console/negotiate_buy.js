var moneyRegex = /(^[0-9]+$)|(^[0-9]+\.[0-9]{1,2}$)/g;
$(function() {

	$("#btnQueryTarget").click(function() {
		$("#targetCodeInput").removeClass("notExit");
		$("#remainAmountInput").val("0");
		var code = $("#targetCodeInput").val().trim();
		if (!code) {
			return;
		}

		var param = {
			t : new Date(),
			code : code
		};
		$.post("financing_target/financing_target_find_by_code.htm", param, function(rs) {
			if (!rs) {
				$("#targetCodeInput").addClass("notExit");
			}
			$("#remainAmountInput").val(rs.collectAmount - (rs.finishAmount ? rs.finishAmount : 0));
		}, "json");

	});

	$("#btnQueryUser").click(function() {
		var param = {
			t : new Date(),
			mobile : $("#buyerMobileInput").val().trim()
		};
		if (!param.mobile) {
			$("#buyerMobileInput").focus();
			return;
		}
		$("#userNameInput").val("");
		$.post("user_find.htm", param, function(rs) {
			if (!rs) {
				alert("用户不存在!");
				return;
			}
			if (!rs.trueName || !rs.pid) {
				alert("该用户没有实名登记!")
				return;
			}
			$("#userNameInput").val(rs.trueName + "(" + rs.pid + ")");

		}, "json");
	});
	$("#btnBuy").click(function() {
		var param = ParameterTool.get();

		if (!param) {
			return;
		}
		if (!window.confirm("确认核对无误?")) {
			return;
		}
		param["pwd"] = window.prompt("确认密码");
		if (!param["pwd"]) {
			alert("确认密码错误!");
			return;
		}
		param["pwd"] = MD5(param["pwd"]);
		$("#btnBuy").prop("disabled", true);
		$.post("financing_target/negotiate_buy.htm", param, function(rs) {
			if (rs.code == "PWD_ERROR") {
				alert("确认密码错误!");
			} else if (rs.code == "SUCCESS") {
				$("#buyAmountInput").val("");
				$("#btnQueryTarget").click();
				alert("购买成功!");
			} else {
				alert("购买失败:" + rs.code);
			}
			$("#btnBuy").prop("disabled", false);
		}, "json");
	});
});

var ParameterTool = {
	get : function() {
		var param = {
			t : new Date(),
			buyAmount : $("#buyAmountInput").val().trim(),
			targetCode : $("#targetCodeInput").val().trim(),
			buyerMobile : $("#buyerMobileInput").val().trim()
		};
		if (!param.targetCode) {
			$("#targetCodeInput").focus();
			return;
		}
		if (!param.buyerMobile) {
			$("#buyerMobileInput").focus();
			return;
		}
		if (!param.buyAmount) {
			$("#buyAmountInput").focus();
			return;
		}

		var remainAmount = parseFloat($("#remainAmountInput").val().trim());
		if (remainAmount == 0) {
			alert("没有可够买金额!");
			return;
		}
		if (!param.buyAmount.match(moneyRegex)) {
			alert("输入的金额无效!");
			return;
		}
		if (parseFloat(param.buyAmount) > remainAmount) {
			alert("最多只能买 :" + remainAmount + " 元");
			return;
		}
		return param;
	}
};
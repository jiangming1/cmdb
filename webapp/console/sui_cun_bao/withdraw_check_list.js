$(function() {
	$.post("withdraw_check_list.htm", {
		t : new Date()
	}, function(data) {
		var tbody = $("#tbody");
		var mainTr = tbody.find(".mainTr");
		var itemTr = tbody.find(".itemTr");
		mainTr.remove();
		itemTr.remove();
		// alert(JSON.stringify(data));
		for ( var i in data) {
			var row = data[i];
			var newMainTr = null;
			var newItemTr = null;

			var existMainTr = $(".mainTr[withdraw_id='" + row["withdraw_id"] + "']");
			if (existMainTr.length > 0) {
				newMainTr = existMainTr;
			}
			var existItemTr = $(".itemTr[withdraw_id='" + row["withdraw_id"] + "']");
			if (existItemTr.length > 0) {
				newItemTr = existItemTr;
			}
			if (!newMainTr) {
				newMainTr = mainTr.clone();
				tbody.append(newMainTr);
				newMainTr.attr("withdraw_id", row["withdraw_id"]);
				newMainTr.find(".swithItem").attr("withdraw_id", row["withdraw_id"]);
				newMainTr.find(".h_type").html(row["type"]=="CA"?"复利":"-");
				newMainTr.find(".apply_name").html(row["apply_name"]);
				newMainTr.find(".apply_pid").html(row["apply_pid"]);
				newMainTr.find(".user_mobile").html(row["user_mobile"]);
				newMainTr.find(".apply_withdraw_principal").html(row["apply_withdraw_principal"]);
				newMainTr.find(".apply_withdraw_profit").html(row["apply_withdraw_profit"]);
				newMainTr.find(".apply_bank_name").html(empty(row["apply_bank_name"]));
				newMainTr.find(".apply_bank_card_no").html(empty(row["apply_bank_card_no"]));
				newMainTr.find(".apply_time").html(new Date(row["apply_time"]).toCNString());
				newMainTr.find(".opt_name").html(empty(row["opt_name"]));
				newMainTr.find(".opt_time").html(empty(row["opt_time"]));

				newMainTr.find(".subtract_remain_profit").html("-"+empty(row["subtract_remain_profit"]));
				
				newMainTr.find(".btnConfirm").attr("withdraw_id", row["withdraw_id"]); 
				newMainTr.addClass(row["type"]);
			}
			if (!newItemTr) {
				newItemTr = itemTr.clone();
				tbody.append(newItemTr);
				newItemTr.attr("withdraw_id", row["withdraw_id"]);
				newItemTr.find("tbody").find("tr").remove();
			}

			var newTr = itemTr.find("tbody").find("tr").clone();
			newItemTr.find("tbody").append(newTr);

			newTr.find(".pay_time").html(new Date(row["pay_time"]).toCNString());
			newTr.find(".target_name").html(row["target_name"]);
			newTr.find(".buy_amount").html(row["buy_amount"]);
			newTr.find(".annualized_rates").html(row["annualized_rates"]);
			newTr.find(".pay_name").html(row["pay_name"]);
			newTr.find(".pay_channel").html(row["pay_channel"]);
			newTr.find(".pay_pid").html(row["pay_pid"]);
			newTr.find(".bank_name").html(row["bank_name"]);
			newTr.find(".bank_card_no").html(row["bank_card_no"]);
			newTr.find(".withdraw_principal").html(row["withdraw_principal"]);
			newTr.find(".withdraw_profit").html(row["withdraw_profit"]);

		}

		$(".swithItem").click(function() {
			var withdraw_id = $(this).attr("withdraw_id");
			var itemTr = $(".itemTr[withdraw_id='" + withdraw_id + "']");
			if (itemTr.css("display") == "none") {
				$(this).removeClass("icon-plus");
				$(this).addClass("icon-minus");
			} else {
				$(this).addClass("icon-plus");
				$(this).removeClass("icon-minus");
			}
			itemTr.slideToggle();
		});

		$(".btnConfirm").click(function() {
			var p = {
				t : new Date(),
				withdrawId : $(this).attr("withdraw_id")
			};
			p["pwd"] = window.prompt("确认密码");
			if (!p["pwd"]) {
				return;
			}
			p["pwd"] = MD5(p["pwd"]);

			$.post("do_confirm_withdraw.htm", p, function(data) {
				if (data.code == "SUCCESS") {
					alert("操作成功!");
					$(".mainTr[withdraw_id='" + data.withdrawId + "']").remove();
					$(".itemTr[withdraw_id='" + data.withdrawId + "']").remove();
				} else if (data.code == "PWD_ERROR") {
					alert("密码错误");
				} else {
					alert("出错了:"+data.code);
				}
			}, "json");

		});
	}, "json");
});

function empty(obj) {
	if (!obj) {
		return "";
	}
	return obj;
}

Date.prototype.toCNString = function() {
	return this.getFullYear() + "-" + (this.getMonth() + 1) + "-" + this.getDate() + " " + this.getHours() + ":" + this.getMinutes() + ":" + this.getSeconds();
};
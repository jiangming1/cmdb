$(function() {
	AccountQuanzeList.load();
	$("#btnSearch").click(function() {
		AccountQuanzeList.load();
	});

	
	$("#btnExportExcel").click(
			function() {
				var beginTimeStr = $('#beginTime').datetimebox('getValue');
				var endTimeStr = $('#endTime').datetimebox('getValue');
				var sortStr = $('#sortStr option:selected') .val();
				if (confirm("确定要导出excel吗?")) {
					var listId = "ACCOUNT_BALANCE_ANALYSIS.accountQuanze";
					var myDate = new Date();
					var mytime = myDate.toCNString(); // 获取当前时间

						var excelname = "权责表" + mytime;
						window.open("../exportexcel.htm?listId=" + listId
								+ "&excelname=" + excelname + "&beginTimeStr="
								+ beginTimeStr + "&endTimeStr=" + endTimeStr
								+ "&sortStr=" + sortStr);
				}
			});
});

var AccountQuanzeList = {
		load : function() {
			var param = {
				t : new Date(),
				listId : "ACCOUNT_BALANCE_ANALYSIS.accountQuanze",
				beginTimeStr : $('#beginTime').datetimebox('getValue'),
				endTimeStr : $('#endTime').datetimebox('getValue'),
				sortStr : $('#sortStr option:selected') .val()
			};
			$.post("../query.htm", param, function(data) {
				var accountQuanzeTbody = $("#tbody");
				var total_new_buy = 0;
				var total_new_buy_profit =0;
				var total_exprience_profit = 0;
				var total_cash_coupon =0;
				var total_handling =0;
				var total_all_debt_profit =0;
				var total_all_debt =0;
				var total_withdraw_money = 0;
				if (!data) {
					tbody.html("<tr><td colspan='8' class='loading'>无数据</td></tr>");
					return;
				}
				accountQuanzeTbody.html("");
				for (var i in data.rows) {
					try {
						var row = data.rows[i];
						var newTr = $("<tr></tr>");
						newTr.append("<td><div class='tddiv'>" + row.date + "</div></td>");
						newTr.append("<td><div class='tddiv'>" + row.new_buy + "</div></td>");
						newTr.append("<td><div class='tddiv'>" + row.new_buy_profit + "</div></td>");
						newTr.append("<td><div class='tddiv'>" + row.new_buy_rate + "</div></td>");
						newTr.append("<td><div class='tddiv'>" + row.exprience_profit + "</div></td>");
						newTr.append("<td><div class='tddiv'>" + row.cash_coupon + "</div></td>");
						newTr.append("<td><div class='tddiv'>" + row.handling + "</div></td>");
						newTr.append("<td><div class='tddiv'>" + row.all_debt_profit + "</div></td>");
						newTr.append("<td><div class='tddiv'>" + row.all_debt + "</div></td>");
						newTr.append("<td><div class='tddiv'>" + row.all_rate + "</div></td>");
						newTr.append("<td><div class='tddiv'>" + row.withdraw_money + "</div></td>");
						newTr.append("<td><div class='tddiv'>" + row.all_buy + "</div></td>");
						accountQuanzeTbody.append(newTr);
						total_new_buy += row.new_buy;
						total_new_buy_profit += row.new_buy_profit;
						total_exprience_profit += row.exprience_profit;
						total_cash_coupon += row.cash_coupon;
						total_handling += row.handling;
						total_all_debt_profit += row.all_debt_profit;
						total_all_debt += row.all_debt;
						total_withdraw_money += row.withdraw_money;
					} catch (e) {
						alert(e);
					}
					
				}
				var allwidth = $(".tablebody").width();
				//console.log(allwidth+'----------------')
		 		$(".tddiv").css("width",allwidth*0.074+"px");
		 		$(".total_new_buy div").text(total_new_buy);
		 		$(".total_new_buy_profit div").text(total_new_buy_profit);
		 		$(".total_new_buy_rate div").text(total_new_buy_profit/(total_new_buy*36500+0.01));
		 		$(".total_exprience_profit div").text(total_exprience_profit);
		 		$(".total_cash_coupon div").text(total_cash_coupon);
		 		$(".total_handling div").text(total_handling);
		 		$(".total_all_debt_profit div").text(total_all_debt_profit);
		 		$(".total_all_debt div").text(total_all_debt);
		 		$(".total_withdraw_money div").text(total_withdraw_money);
		 		$(".total_all_rate div").text((total_exprience_profit+total_cash_coupon+total_handling+total_all_debt_profit)/(total_all_debt/100)*365);
			}, "json");	
		}
};


Date.prototype.toCNString = function() {
	return this.getFullYear() + (this.getMonth()>=9 ? this.getMonth() + 1 : "0" + (this.getMonth() + 1))  + (this.getDate()>9 ? this.getDate() : "0" + this.getDate())
	 + (this.getHours()>9 ? this.getHours() : "0" + this.getHours())  + (this.getMinutes()>9 ? this.getMinutes() : "0" + this.getMinutes()) + (this.getSeconds()>9 ? this.getSeconds() : "0" + this.getSeconds());
};

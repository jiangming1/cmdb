$(function() {
	InvestRecordService.load();
	$("#queryBtn").click(function() {
		InvestRecordService.load();
	});
	
	$("#exportBtn").click(function() {
//		window.open("export_invest_record.htm?beginTimeStr="+$('#beginTime').datetimebox('getValue')+"endTimeStr="+$('#endTime').datetimebox('getValue'));
		$("#beginTimeStr").val($('#beginTime').datetimebox('getValue'));
		$("#endTimeStr").val($('#endTime').datetimebox('getValue'));
		$("#timeTypeStr").val($('#timeType').val());
		$("#targetNameStr").val($('#targetName').val());
		$("#export_form").submit();
//		$.post("export_invest_record.htm", null, function(data) {
//			if (data && data.msg=="success") {
//				alert("导出成功!");
//			} else {
//				alert("导出失败!");
//			}
//		}, "json");
	});
});


var InvestRecordService = {
	load : function() {
		var oldPosition =$("#queryPosition").val();
		var param = {
			t : new Date(),
			beginTimeStr : $('#beginTime').datetimebox('getValue'),
			endTimeStr : $('#endTime').datetimebox('getValue'),
			timeTypeStr : $('#timeType').val(),
			targetNameStr : $('#targetName').val()
		};
		$.post("invest_record.htm", param, function(data) {
			var positionTbody = $("#positionTbody");
			if (!data) {
				positionTbody.html("<tr><td colspan='8' class='loading'>无数据</td></tr>");
				return;
			}
			positionTbody.html("");
			for (var i in data) {
				try {
					var row = data[i];
					var newTr = $("<tr></tr>");
					newTr.append("<td>" + (parseInt(i) + 1) + "</td>");
					newTr.append("<td>" + new Date(row.payTime).toCNString() + "</td>");
					newTr.append("<td>" + row.targetName + "</td>");
					newTr.append("<td>" + row.loginName + "</td>");
					newTr.append("<td>" + row.trueName + "</td>");
					newTr.append("<td>" + row.mobile + "</td>");
					newTr.append("<td>" + row.pid + "</td>");
					newTr.append("<td>" + row.buyAmount.toFixed(2) + "</td>");
					newTr.append("<td>" + row.cashCouponAmount.toFixed(2) + "</td>");
					newTr.append("<td>" + row.period + "</td>");
					newTr.append("<td>" + new Date(row.endProfit).toCNString() + "</td>");
					newTr.append("<td>" + row.annualizedRates.toFixed(2) + "</td>");
					newTr.append("<td>" + row.incrRate.toFixed(2) + "</td>");
					newTr.append("<td>" + row.principalInterest.toFixed(2) + "</td>");
					newTr.append("<td>" + row.bankName + "</td>");
					newTr.append("<td>" + row.bankCardNo + "</td>");
					positionTbody.append(newTr);
				} catch (e) {
					alert(e);
				}
			}
		}, "json");
	}
};

Date.prototype.toCNString = function() {
	return this.getFullYear() + "-" + (this.getMonth()>=9 ? this.getMonth() + 1 : "0" + (this.getMonth() + 1)) + "-" + (this.getDate()>9 ? this.getDate() : "0" + this.getDate()) + " " + (this.getHours()>9 ? this.getHours() : "0" + this.getHours()) + ":" + (this.getMinutes()>9 ? this.getMinutes() : "0" + this.getMinutes()) + ":" + (this.getSeconds()>9 ? this.getSeconds() : "0" + this.getSeconds());
};
Date.prototype.toShortTime = function() {
	return (this.getMonth()>=9 ? this.getMonth() + 1 : "0" + (this.getMonth() + 1)) + "-" + (this.getDate()>9 ? this.getDate() : "0" + this.getDate()) + " " + (this.getHours()>9 ? this.getHours() : "0" + this.getHours()) + ":" + (this.getMinutes()>9 ? this.getMinutes() : "0" + this.getMinutes());
};
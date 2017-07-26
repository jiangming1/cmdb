$(function() {

	$("#btnQuery").click(function() {
		var year = $("#input-year").val().trim();
		var month = $("#input-month").val().trim();
		var day = $("#input-day").val().trim();
		var now = new Date();

		year = year ? year : now.getFullYear();
		month = month ? month : now.getMonth() + 1;

		$("#input-year").val(year);
		$("#input-month").val(month);

		var beginDate = new Date();
		beginDate.setFullYear(parseInt(year), parseInt(month) - 1, 1);
		beginDate.setHours(0, 0, 0);
		var endDate = new Date();
		endDate.setFullYear(parseInt(year), parseInt(month) - 1, 1);
		endDate.setMonth(endDate.getMonth() + 1);
		endDate.setHours(0, 0, 0);
  
		if(day){ 
			beginDate.setDate(parseInt(day));
			endDate = new Date(beginDate.getTime());
			endDate.setDate(endDate.getDate()+1);
		}
		
		var p = {
			t : new Date(),
			st : beginDate.getTime(),
			et : endDate.getTime()
		};

		$.post("findCarSheetByDate.htm", p, function(data) {
			var tmpTr = $("#tabTemplate").find("tbody").find("tr");
			var tbody = $("#tbody");
			tbody.html("");
			for ( var i in data) {
				var row = data[i];
				var tr = tbody.find("[car='" + row.car_name + "']");
				if (tr.length == 0) {
					tr = tmpTr.clone();
					tr.find(".car_name").html(row.car_name);
					tr.attr("car", row.car_name);
					var place = null;
					var start_id = row.start_id ? row.start_id : "empty";
					var startSpan = row.start_id ? $("#tr1").find("[start_id='" + start_id + "']") : null;
					if (!row.start_id) {
						startSpan = $("#tr1").find("[start_id='empty']:first");
						startSpan.html("(匿名)");
						startSpan.attr("start_id", "empty");
					} else if (startSpan.length == 0) {
						startSpan = $("#tr1").find("[start_id='empty']:first");
						startSpan.html("(" + row.start_name + ")");
						startSpan.attr("start_id", row.start_id);

					}
					if (startSpan.length == 0) {
						//alert("工地列不够，可以手动增加");
					}

					var place = startSpan.attr("place");
					tr.find("[place='" + place + "'].end_name").html(row.end_name ? row.end_name : "匿名");
					tr.find("[place='" + place + "'].times").html(row.x_times);
					tr.find("[place='" + place + "'].price").html(row.x_price);
					tr.find("[place='" + place + "'].total_price").html(row.total_price);
					tbody.append(tr);
				} else {
					var place = null;
					var start_id = row.start_id ? row.start_id : "empty";
					var startSpan = row.start_id ? $("#tr1").find("[start_id='" + start_id + "']") : null;
					if (!row.start_id) {
						startSpan = $("#tr1").find("[start_id='empty']:first");
						startSpan.html("(匿名)");
						startSpan.attr("start_id", "empty");
					} else if (startSpan.length == 0) {
						startSpan = $("#tr1").find("[start_id='empty']:first");
						startSpan.html("(" + row.start_name + ")");
						startSpan.attr("start_id", row.start_id);

					}
					if (startSpan.length == 0) {
						alert("工地列不够，可以手动增加");
					}
					var place = startSpan.attr("place");
					tr.find("[place='" + place + "'].end_name").html(row.end_name ? row.end_name : "匿名");
					var oldTimes = tr.find("[place='" + place + "'].times").html();
					oldTimes = oldTimes ? parseInt(oldTimes) : 0;
					oldTimes += parseInt(row.x_times);
					tr.find("[place='" + place + "'].times").html(oldTimes);

					var price = parseFloat(tr.find("[place='" + place + "'].price").html());
					tr.find("[place='" + place + "'].price").html(price ? price : row.x_price);

					var totalPrice = tr.find("[place='" + place + "'].total_price").html();
					totalPrice = totalPrice ? parseFloat(totalPrice) : 0;
					totalPrice += parseFloat(row.total_price);

					tr.find("[place='" + place + "'].total_price").html(totalPrice);

				}
			}
			countTab();
		}, "json");
	});
});

var countTab = function() {
	var index = 0;
	$("#tbody").find("tr").each(function() {
		index++;
		var tr = $(this);
		tr.find(".index").html(index);
		var totalAmt = 0;
		tr.find(".times").each(function() {
			var t = $(this).html();
			if (t) {
				totalAmt += parseInt(t);
			}
		});
		tr.find(".c-times").html(totalAmt);

		var cTotalPrice = 0;
		tr.find(".total_price").each(function() {
			var t = $(this).html();
			if (t) {
				cTotalPrice += parseFloat(t);
			}
		});

		tr.find(".c-total_price").html(cTotalPrice);

	});

	for (var i = 1; i <= 5; i++) {
		var cTimes = 0;
		var cTotalPrice = 0;

		$("#tbody").find(".times[place='" + i + "']").each(function() {
			var t = $(this).html();
			if (t) {
				cTimes += parseInt(t);
			}

		});
		$("#tfoot").find(".times[place='" + i + "']").html(cTimes);

		$("#tbody").find(".total_price[place='" + i + "']").each(function() {
			var t = $(this).html();
			if (t) {
				cTotalPrice += parseFloat(t);
			}

		});

		$("#tfoot").find(".total_price[place='" + i + "']").html(cTotalPrice);

	}

	var ccTimes = 0;
	$("#tbody").find(".c-times").each(function() {
		var t = $(this).html();
		if (t) {
			ccTimes += parseInt(t);
		}
	});
	$("#tfoot").find(".c-times").html(ccTimes);

	var ccTotalPrice = 0;
	$("#tbody").find(".c-total_price").each(function() {
		var t = $(this).html();
		if (t) {
			ccTotalPrice += parseFloat(t);
		}
	});
	$("#tfoot").find(".c-total_price").html(ccTotalPrice);

};
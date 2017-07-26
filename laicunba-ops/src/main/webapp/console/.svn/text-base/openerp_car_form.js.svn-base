var grid0 = null;
var baseData = {
	car : [],
	driver : [],
	start : [],
	end : []
};
$(function() {
	var templateTr = $("#template").find("tr");
	var tbody = $("#tbody");
	for (var i = 0; i < 10; i++) {
		var newTr = templateTr.clone();
		newTr.find("input").attr("row", (i + 1));
		tbody.append(newTr);
	}
	tbody.find("input").click(function() {
		if (grid0) {
			grid0.removeClass("input-current");
		}
		grid0 = $(this);
		grid0.addClass("input-current");
	});

	$.post("findBaseData.htm", {
		t : new Date()
	}, function(data) {
		for ( var i in data) {
			var row = data[i];
			if (row.type == "driver") {
				baseData.driver.push(row);
			} else if (row.type == "start") {
				baseData.start.push(row);
			} else if (row.type == "end") {
				baseData.end.push(row);
			} else if (row.type == "car") {
				baseData.car.push(row);
			}

		}
		// alert(JSON.stringify(data));
	}, "json");

	$("#btnCopy").click(function() {

		$("#tbody").find("input[row='" + (parseInt(grid0.attr("row")) - 1) + "']").each(function() {
			var input = $(this);
			var destInput = $("input[col='" + input.attr("col") + "'][row='" + (parseInt(input.attr("row")) + 1) + "']");
			destInput.val(input.val());
			destInput.attr("data_id", input.attr("data_id"));
		});

	});

	$("#btnSave").click(function() {
		var okData = [];
		$("#tbody").find("tr").each(function() {
			var tr = $(this);
			var date = tr.find("input[col='1']").val().trim();
			var car = tr.find("input[col='2']").val().trim();
			var d1 = tr.find("input[col='3']").val().trim();
			var d2 = tr.find("input[col='4']").val().trim();
			var d3 = tr.find("input[col='5']").val().trim();
			var start = tr.find("input[col='6']").val().trim();
			var end = tr.find("input[col='7']").val().trim();
			var price = tr.find("input[col='8']").val().trim();
			var times = tr.find("input[col='9']").val().trim();
			if (!date || !car || !d1 || !start || !end) {
				return;
			}

			var d = {
				date : date,
				car_id : tr.find("input[col='2']").attr("data_id"),
				d1_id : tr.find("input[col='3']").attr("data_id"),
				d2_id : tr.find("input[col='4']").attr("data_id"),
				d3_id : tr.find("input[col='5']").attr("data_id"),
				start_id : tr.find("input[col='6']").attr("data_id"),
				end_id : tr.find("input[col='7']").attr("data_id"),
				price : tr.find("input[col='8']").attr("data_id"),
				times : tr.find("input[col='9']").attr("data_id")

			};
			if (!d.times) {
				d["times"] = 1;
			}
			if (!d.price) {
				d["price"] = 0;
			}
			okData.push(d);
		});
		// alert(JSON.stringify(okData));
		if (okData.length > 0) {
			$.post("saveCarForm.htm", {
				t : new Date(),
				data : JSON.stringify(okData)
			}, function(data) {
				if (data.code == "success") {
					$("#tbody").find("input").each(function() {
						var input = $(this);
						input.attr("data_id","");
						input.val("");
					});
					alert("保存成功");
				} else {

					alert(JSON.stringify(data));
				}
			}, "json");
		}
	});

});

var FillUtil = {
	onDateEnter : function(g) {
		if (!g.val().trim()) {
			g.val(new Date().toCNString());
		} else if (/^[\-]?[0-9]+$/.test(g.val().trim())) {
			var v = g.val().trim();
			v = parseInt(v);
			var date = new Date();
			date.setDate(date.getDate() + v);
			g.val(date.toCNString());
		}
	},
	onCarEnter : function(g) {
		var v = g.val().trim();

		selectListTool.clear();
		for ( var i in baseData.car) {
			var car = baseData.car[i];
			if (v == "" || car.x_name.indexOf(v) > -1) {
				selectListTool.show(g, car, "车辆 －"+car.x_name);
			}
		}
	},
	onDriverEnter : function(g) {

		var v = g.val().trim();

		selectListTool.clear();
		for ( var i in baseData.car) {
			var d = baseData.driver[i];
			if (v == "" || d.x_name.indexOf(v) > -1) {
				selectListTool.show(g, d, "司机 －"+d.x_name);
			}
		}

	},
	onStartEnter : function(g) {

		var v = g.val().trim();
		selectListTool.clear();
		for ( var i in baseData.car) {
			var d = baseData.start[i];
			if (d.x_name.indexOf(v) > -1 || v == "") {
				selectListTool.show(g, d, "起点 －"+d.x_name);
			}
		}
	},
	onEndEnter : function(g) {
		var v = g.val().trim();

		selectListTool.clear();
		for ( var i in baseData.car) {
			var d = baseData.end[i];
			if (d.x_name.indexOf(v) > -1 || v == "") {
				selectListTool.show(g, d, "终点 －"+d.x_name);
			}
		}
	},
	onPriceEnter : function(g) {

	},
	onTimesEnter : function(g) {
		var v = g.val().trim();
		if (!v) {
			g.val(1);
		}
	}
};

var selectListTool = {
	clear : function() {
		$("#selectComm").html("");
	},
	show : function(g, data, itemVal) {
		var ul = $("#selectComm");
		var li = $("<li></li>");
		li.html(itemVal);
		li.attr("data_id", data.id);
		ul.append(li);
		li.click(function() {
			grid0.val("[" + $(this).html() + "]");
			grid0.attr("data_id", $(this).attr("data_id"));

		});
	}
};

var KeybroadListen = {
	onKeyDown : function() {
		if (!grid0) {
			return;
		}
		var col = grid0.attr("col");
		if (col == "2") {
			FillUtil.onCarEnter(grid0);
		} else if (col == "3" || col == "4" || col == "5") {
			FillUtil.onDriverEnter(grid0);
		} else if (col == "6") {
			FillUtil.onStartEnter(grid0);
		} else if (col == "7") {
			FillUtil.onEndEnter(grid0);
		}

	},
	onEnter : function() {
		if (!grid0) {
			grid0 = $("#tbody").find("tr:first-child").find("td:first-child").find("input");
			grid0.addClass("input-current");
		}
		grid0.focus();
		var col = grid0.attr("col");
		if (col == "1") {
			FillUtil.onDateEnter(grid0);
		} else if (col == "2") {
			FillUtil.onCarEnter(grid0);
		} else if (col == "3" || col == "4" || col == "5") {
			FillUtil.onDriverEnter(grid0);
		} else if (col == "6") {
			FillUtil.onStartEnter(grid0);
		} else if (col == "7") {
			FillUtil.onEndEnter(grid0);
		} else if (col == "8") {
			FillUtil.onPriceEnter(grid0);
		} else if (col == "9") {
			FillUtil.onTimesEnter(grid0);
		}
	},
	onTab : function() {
		var g = this.getGrid0();
		g.parent().next().find("input").each(function() {
			grid0.removeClass("input-current");
			grid0 = $(this);
			grid0.addClass("input-current");
			// grid0.focus();

		});
	},
	onUp : function() {
		var g = this.getGrid0();
		$("input[col='" + g.attr("col") + "'][row='" + (parseInt(g.attr("row")) - 1) + "']").each(function() {
			grid0.removeClass("input-current");
			grid0 = $(this);
			grid0.addClass("input-current");
			grid0.focus();
		});
	},
	onDown : function() {
		var g = this.getGrid0();
		$("input[col='" + g.attr("col") + "'][row='" + (parseInt(g.attr("row")) + 1) + "']").each(function() {
			grid0.removeClass("input-current");
			grid0 = $(this);
			grid0.addClass("input-current");
			grid0.focus();
		});
	},
	onLeft : function() {
		var g = this.getGrid0();
		g.parent().prev().find("input").each(function() {
			grid0.removeClass("input-current");
			grid0 = $(this);
			grid0.addClass("input-current");
			grid0.focus();

		});
	},
	onRight : function() {
		var g = this.getGrid0();
		g.parent().next().find("input").each(function() {
			grid0.removeClass("input-current");
			grid0 = $(this);
			grid0.addClass("input-current");
			grid0.focus();

		});
	},
	getGrid0 : function() {
		if (!grid0) {
			grid0 = $("#tbody").find("tr:first-child").find("td:first-child").find("input");
			grid0.addClass("input-current");
		}
		return grid0;
	}

};

document.onkeyup = function(event) {

	KeybroadListen.onKeyDown();
};

document.onkeydown = function(event) {
	switch (event.keyCode) {
	case 13:
		KeybroadListen.onEnter();
		break;
	case 9:
		KeybroadListen.onTab();
		break;
	case 38:
		KeybroadListen.onUp();
		break;
	case 40:
		KeybroadListen.onDown();
		break;
	case 37:
		KeybroadListen.onLeft();
		break;
	case 39:
		KeybroadListen.onRight();
		break;
	}
};

Date.prototype.toCNString = function() {
	var d = new Date();

	var m = (this.getMonth() + 1) > 9 ? (this.getMonth() + 1) : "0" + (this.getMonth() + 1);
	var d = (this.getDate()) > 9 ? (this.getDate()) : "0" + (this.getDate());
	return this.getFullYear() + "-" + m + "-" + d;
}
var seriesList = [];
var colorsList = [];
$(function() {
	DataLoader.loadBankcardMonthIncome();
	DataLoader.load_demand_month_withdraw();
	DataLoader.load_fixbid_month_end_profit();
	DataLoader.draw();
});

var DataLoader = {
	loadBankcardMonthIncome : function() {
		var p = {
			t : new Date(),
			listId : "BID_ANALYSIS.bankcard_month_income"
		};

		$.ajax({
			type : 'POST',
			url : "../query.htm",
			data : p,
			async : false,
			success : function(data) {
				if (data.rows) {
					var ser = {
						name : '富友支付购买',
						data : []
					};
					for ( var i in data.rows) {
						var row = data.rows[i];
						var datestr = row.date.split("-");
						ser.data.push([ Date.UTC(parseInt(datestr[0]), parseInt(datestr[1]), 0), row.amount ]);
					}

					colorsList.push("red");
					seriesList.push(ser);
				}
			},
			dataType : "json"
		});

	},
	load_demand_month_withdraw : function() {
		var p = {
			t : new Date(),
			listId : "BID_ANALYSIS.demand_month_withdraw"
		};
		dopost2("../query.htm", p, function(data) {
			if (data.rows) {
				var ser = {
					name : '活期取现本金',
					data : []
				};
				var ser2 = {
					name : '活期取现收益',
					data : []
				};
				for ( var i in data.rows) {
					var row = data.rows[i];
					var datestr = row.date.split("-");
					ser.data.push([ Date.UTC(parseInt(datestr[0]), parseInt(datestr[1]) , 0), row.total_principal ]);
					ser2.data.push([ Date.UTC(parseInt(datestr[0]), parseInt(datestr[1]) , 0), row.total_profit ]);
				}

				colorsList.push("black");
				seriesList.push(ser);

				colorsList.push("blue");
				seriesList.push(ser2);
			}
		}, "json");
	},
	load_fixbid_month_end_profit : function() {
		var p = {
			t : new Date(),
			listId : "BID_ANALYSIS.fixbid_month_end_profit"
		};
		dopost2("../query.htm", p, function(data) {
			if (data.rows) {
				var ser = {
					name : '定期到期本金',
					data : []
				};
				var ser2 = {
					name : '定期到期收益',
					data : []
				};
				for ( var i in data.rows) {
					var row = data.rows[i];
					var datestr = row.date.split("-");
					ser.data.push([ Date.UTC(parseInt(datestr[0]), parseInt(datestr[1]) , 0), row.total_principal ]);
					ser2.data.push([ Date.UTC(parseInt(datestr[0]), parseInt(datestr[1]) , 0), row.total_profit ]);

				}

				colorsList.push("black");
				seriesList.push(ser);

				colorsList.push("blue");
				seriesList.push(ser2);
			}
		}, "json");
	},
	draw : function() {
		$('#cost_and_profit').highcharts({
			chart : {
				type : 'spline'
			},
			title : {
				text : '资金进出曲线'
			},
			subtitle : {
				text : ''
			},
			xAxis : {
				type : 'datetime',
				dateTimeLabelFormats : {
					month : '%m',
					year : '%Y'
				},
				title : {
					text : '时间'
				}
			},
			yAxis : {
				title : {
					text : '金额'
				},
				min : 0
			},
			tooltip : {
				headerFormat : '<b>{series.name}</b><br>',
				pointFormat : '{point.x:%Y-%m-%d}:{point.y:.0f}'
			},

			plotOptions : {
				spline : {
					marker : {
						enabled : true
					}
				}
			},

			series : seriesList,
			colors : colorsList
		});
	}
};

var dopost2 = function(url, p, success, datatype) {
	$.ajax({
		type : 'POST',
		url : url,
		data : p,
		async : false,
		success : success,
		dataType : datatype
	});
};
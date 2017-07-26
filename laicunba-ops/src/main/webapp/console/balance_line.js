$(function() {
	$.post("query.htm", {
		t : new Date(),
		listId : "BALANCE_COLLECTION.list"
	}, function(data) {
		var hBalance = [];
		var dBalance = [];
		var balance = [];
		var hProfit = [];
		var dProfit = [];
		var profit = [];
		var hRate = [];
		var dRate = [];
		var rate = [];
		var row = null;
		for ( var i in data.rows) {
			row = data.rows[i];
			var gmtCreate = new Date(row.gmt_create);
			hBalance.push([ gmtCreate, row.h_balance ]);
			dBalance.push([ gmtCreate, row.d_balance ]);
			balance.push([ gmtCreate, row.balance ]);

			hProfit.push([ gmtCreate, row.h_profit ]);
			dProfit.push([ gmtCreate, row.d_profit ]);
			profit.push([ gmtCreate, row.profit ]);

			hRate.push([ gmtCreate, row.h_rate ]);
			dRate.push([ gmtCreate, row.d_rate ]);
			rate.push([ gmtCreate, row.rate ]);

		}
		Highcharts.chart('balanceLine', {
			chart : {
				type : 'spline'
			},
			title : {
				text : '留存资金'
			},
			subtitle : {
				text : '采样频率 1次/h'
			},
			xAxis : {
				type : 'datetime',
				dateTimeLabelFormats : { // don't display the dummy year
					month : '%e. %b',
					year : '%b'
				},
				title : {
					text : '时间'
				}
			},
			yAxis : {
				title : {
					text : '存量本金(RMB)'
				},
				min : 0
			},
			tooltip : {
				headerFormat : '<b>{series.name}</b><br>',
				pointFormat : '{point.x:%e. %b}: {point.y:.2f} RMB'
			},

			plotOptions : {
				spline : {
					marker : {
						enabled : true
					}
				}
			},

			series : [ {
				name : '活期存量',
				data : hBalance
			}, {
				name : '定期存量',
				data : dBalance
			}, {
				name : '总存量',
				data : balance
			} ]
		});

		// profit

		Highcharts.chart('profitLine', {
			chart : {
				type : 'spline'
			},
			title : {
				text : '利息成本'
			},
			subtitle : {
				text : '采样频率 1次/h'
			},
			xAxis : {
				type : 'datetime',
				dateTimeLabelFormats : { // don't display the dummy year
					month : '%e. %b',
					year : '%b'
				},
				title : {
					text : '时间'
				}
			},
			yAxis : {
				title : {
					text : '利息(RMB)'
				},
				min : 0
			},
			tooltip : {
				headerFormat : '<b>{series.name}</b><br>',
				pointFormat : '{point.x:%e. %b}: {point.y:.2f} RMB'
			},

			plotOptions : {
				spline : {
					marker : {
						enabled : true
					}
				}
			},

			series : [ {
				name : '活期利息',
				data : hProfit
			}, {
				name : '定期利息',
				data : dProfit
			}, {
				name : '总利息',
				data : profit
			} ]
		});

		// rate

		Highcharts.chart('rateLine', {
			chart : {
				type : 'spline'
			},
			title : {
				text : '利率'
			},
			subtitle : {
				text : '采样频率 1次/h'
			},
			xAxis : {
				type : 'datetime',
				dateTimeLabelFormats : { // don't display the dummy year
					month : '%e. %b',
					year : '%b'
				},
				title : {
					text : '时间'
				}
			},
			yAxis : {
				title : {
					text : '利率(年化)'
				},
				min : 0
			},
			tooltip : {
				headerFormat : '<b>{series.name}</b><br>',
				pointFormat : '{point.x:%e. %b}: {point.y:.2f} %'
			},

			plotOptions : {
				spline : {
					marker : {
						enabled : true
					}
				}
			},

			series : [ {
				name : '活期利率',
				data : hRate
			}, {
				name : '定期利率',
				data : dRate
			}, {
				name : '总利率',
				data : rate
			} ]
		});

	}, "json");

});
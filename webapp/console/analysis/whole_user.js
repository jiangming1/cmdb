$(function() {
	var p = {
		t : new Date(),
		listId : "WHOLE_USER_ANALYSIS.user_increment",
		rows : 3000,
		noCount : "true"
	};
	$.post("../query.htm", p, function(data) {
		// alert(JSON.stringify(data));
		var dayMap = [];
		var seriesMap = [];
		for ( var i in data.rows) {
			var row = data.rows[i];
			if (row.type == 'day') {
				dayMap.push(row);
				if (!seriesMap["day"]) {
					seriesMap["day"] = [];
				}
				var dateTmp = row.date_str.split("-");
				seriesMap["day"].push([ Date.UTC(parseInt(dateTmp[0]), parseInt(dateTmp[1]) - 1, parseInt(dateTmp[2])), row.count ]);
			} else if (row.type == 'week') {
				if (!seriesMap["week"]) {
					seriesMap["week"] = [];
				}
				var dateTmp = row.date_str.split("-");
				seriesMap["week"].push([ Date.UTC(parseInt(dateTmp[0]), parseInt(dateTmp[1]) - 1, parseInt(dateTmp[2])), row.count ]);

			} else if (row.type == 'month') {
				if (!seriesMap["month"]) {
					seriesMap["month"] = [];
				}
				var dateTmp = row.date_str.split("-");
				seriesMap["month"].push([ Date.UTC(parseInt(dateTmp[0]), parseInt(dateTmp[1])), row.count ]);

			}
		}	

//		$("#exportExcel").click(function(){		
//			var jsonlist;
//			var excelname;
//			var myDate = new Date();
//			var mytime=myDate.toCNString();     //获取当前时间
//			var m = {
//					t : new Date(),
//					jsonlist:JSON.stringify(dayMap),
//					excelname:"注册人数"+mytime
//				};
//			
//				$.post("../exportexcel.htm", m, function(data001) {
//					if(data001.success){
//						alert("导出成功!");
//					}else{
//						alert("导出失败!");
//					}
//				}, "json");
//			});
		
		$('#incret_user').highcharts({
			chart : {
				type : 'spline'
			},
			title : {
				text : '新用户注册'
			},
			subtitle : {
				text : '日周月新增用户曲线图'
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
					text : '注册量 (人)'
				},
				min : 0
			},
			tooltip : {
				headerFormat : '<b>{series.name}</b><br>',
				pointFormat : '{point.x:%Y-%m-%d}新增{point.y:.0f}人'
			},

			plotOptions : {
				spline : {
					marker : {
						enabled : true
					}
				}
			},

			series : [ {
				name : '日量',
				data : seriesMap["day"]
			}, {
				name : '月量',
				data : seriesMap["month"]
			}, {
				name : '周量',
				data : seriesMap["week"]
			} ]
		});
	}, "json");

	
	p = {
			t : new Date(),
			listId : "WHOLE_USER_ANALYSIS.total_user"
		};
		$.post("../query.htm", p, function(data) {
			for ( var i in data.rows) {
				var row = data.rows[i];
			$("#total_user").text(row.totaluser+"人");
			}
		}, "json");
		
//	p = {
//		t : new Date(),
//		listId : "BID_ANALYSIS.fuiou_day_income",
//		rows : 3000,
//		noCount : "true"
//	};
//
//	$.post("../query.htm", p, function(data) {
//		var seriesMap = [];
//		for ( var i in data.rows) {
//			var row = data.rows[i];
//			if (row.type == 'day') {
//				if (!seriesMap["day"]) {
//					seriesMap["day"] = [];
//				}
//				var dateTmp = row.date_str.split("-");
//				seriesMap["day"].push([ Date.UTC(parseInt(dateTmp[0]), parseInt(dateTmp[1]) - 1, parseInt(dateTmp[2])), row.money ]);
//			}
//		}
//
//		$('#incret_fuiou').highcharts({
//			chart : {
//				type : 'spline'
//			},
//			title : {
//				text : '富友通道投资增量'
//			},
//			subtitle : {
//				text : '新增投资量曲线图'
//			},
//			xAxis : {
//				type : 'datetime',
//				dateTimeLabelFormats : {
//					month : '%m',
//					year : '%Y'
//				},
//				title : {
//					text : '时间'
//				}
//			},
//			yAxis : {
//				title : {
//					text : '金额'
//				},
//				min : 0
//			},
//			tooltip : {
//				headerFormat : '<b>{series.name}</b><br>',
//				pointFormat : '{point.x:%Y-%m-%d}新增投资{point.y:.2f}元'
//			},
//
//			plotOptions : {
//				spline : {
//					marker : {
//						enabled : true
//					}
//				}
//			},
//
//			series : [ {
//				name : '日量',
//				data : seriesMap["day"]
//			} ]
//		});
//	}, "json");
});

Date.prototype.toCNString = function() {
	return this.getFullYear() + (this.getMonth()>=9 ? this.getMonth() + 1 : "0" + (this.getMonth() + 1))  + (this.getDate()>9 ? this.getDate() : "0" + this.getDate())
	 + (this.getHours()>9 ? this.getHours() : "0" + this.getHours())  + (this.getMinutes()>9 ? this.getMinutes() : "0" + this.getMinutes()) + (this.getSeconds()>9 ? this.getSeconds() : "0" + this.getSeconds());
};
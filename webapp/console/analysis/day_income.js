$(function() {
	var p = {
		t : new Date(),
		listId : "BID_ANALYSIS.day_income",
		rows : 3000,
		noCount : "true"
	};
	$.post("../query.htm", p, function(data) {
		var seriesMap = [];
		for ( var i in data.rows) {
			var row = data.rows[i];
			if (row.type == 'day') {
				if (!seriesMap["day"]) {
					seriesMap["day"] = [];
				}
				var dateTmp = row.date_str.split("-");
				seriesMap["day"].push([ Date.UTC(parseInt(dateTmp[0]), parseInt(dateTmp[1]) - 1, parseInt(dateTmp[2])), row.money ]);
			}
		}
		
		Highcharts.setOptions({
	        colors: ['#ED561B']
	    });

		$('#incret_day_income').highcharts({
			chart : {
				type : 'spline'
			},
			title : {
				text : '每日购买总量'
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
					text : '金额(元)'
				},
				min : 0
			},
			tooltip : {
				headerFormat : '<b>{series.name}</b><br>',
				pointFormat : '{point.x:%Y-%m-%d}新增投资{point.y:.2f}元'
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
			} ]
		});
	}, "json");
	
	p = {
			t : new Date(),
			listId : "BID_ANALYSIS.total_income",
			rows : 3000,
			noCount : "true"
		};
		$.post("../query.htm", p, function(data) {
			for ( var i in data.rows) {
				var row = data.rows[i];
			$("#totalMoney").text(row.totalmoney+"元");
			}
		}, "json");
		
		$("#exportExcel").click(function(){
			 if(confirm("确定要导出excel吗?"))
			 {
			var listId = "BID_ANALYSIS.day_income";
			var myDate = new Date();
			var mytime=myDate.toCNString();     //获取当前时间
			var excelname="投资额"+mytime;
			var beginTimeStr = '';
			var endTimeStr = '';
			window.open("../exportexcel.htm?listId="+listId+"&excelname="+excelname
					+"&beginTimeStr="+beginTimeStr+"&endTimeStr="+endTimeStr);
			 }
			});
});

Date.prototype.toCNString = function() {
	return this.getFullYear() + (this.getMonth()>=9 ? this.getMonth() + 1 : "0" + (this.getMonth() + 1))  + (this.getDate()>9 ? this.getDate() : "0" + this.getDate())
	 + (this.getHours()>9 ? this.getHours() : "0" + this.getHours())  + (this.getMinutes()>9 ? this.getMinutes() : "0" + this.getMinutes()) + (this.getSeconds()>9 ? this.getSeconds() : "0" + this.getSeconds());
};
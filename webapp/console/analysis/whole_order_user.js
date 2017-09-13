$(function() {
	var p = {
		t : new Date(),
		listId : "WHOLE_ORDER_USER_ANALYSIS.order_user_increment"
	};
	$.post("../query.htm", p, function(data) {
//		$("#exportExcel").click(function(){		
//			var jsonlist;
//			var myDate = new Date();
//			var mytime=myDate.toCNString();     //获取当前时间
//			var m = {
//					t : new Date(),
//					jsonlist:JSON.stringify(data.rows),
//					excelname:"新增交易用户"+mytime			
//				};
//				$.post("../exportexcel.htm", m, function(data001) {
//					if(data001.success){
//						alert("导出成功!");
//					}else{
//						alert("导出失败!");
//					}
//				}, "json");
//			});
		var seriesMap = [];
		for ( var i in data.rows) {
			var row = data.rows[i];
			if (row.type == 'day') {
				if (!seriesMap["day"]) {
					seriesMap["day"] = [];
				}
				var dateTmp = row.date_str.split("-");
				seriesMap["day"].push([ Date.UTC(parseInt(dateTmp[0]), parseInt(dateTmp[1]) - 1, parseInt(dateTmp[2])), row.count ]);
			}
		}
		
		 Highcharts.setOptions({
		        colors: ['#50B432']
		    });
		
		$('#incret_order_user').highcharts({
			chart : {
				type : 'spline'
			},
			title : {
				text : '每日新增交易用户'
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
					text : '增加量(人)'
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
			} ]
		});
	}, "json");
	
	
	p = {
			t : new Date(),
			listId : "WHOLE_ORDER_USER_ANALYSIS.total_order_user",
			rows : 3000,
			noCount : "true"
		};
		$.post("../query.htm", p, function(data) {
			for ( var i in data.rows) {
				var row = data.rows[i];
			$("#total_order_user").text(row.totalorderuser);
			}
		}, "json");
		
		$("#exportExcel").click(function(){
			 if(confirm("确定要导出excel吗?"))
			 {
			var listId = "WHOLE_ORDER_USER_ANALYSIS.order_user_increment";
			var myDate = new Date();
			var mytime=myDate.toCNString();     //获取当前时间
			var excelname="每日新增投资用户"+mytime;
			var beginTimeStr = '';
			var endTimeStr = '';
			window.open("../exportexcel.htm?listId="+listId+"&excelname="+excelname
					+"&beginTimeStr="+beginTimeStr+"&endTimeStr="+endTimeStr);
			 }
			});
		$("#exportOrderInfoExcel").click(function(){
				 if(confirm("确定要导出excel吗?"))
				 {
				var listId = "WHOLE_ORDER_USER_ANALYSIS.order_user_info_increment";
				var myDate = new Date();
				var mytime=myDate.toCNString();     //获取当前时间
				var registChannel = $('.regist_channel_input').val();
				var buyChannel = $('.buy_channel_input').val();
				var excelname=registChannel+"新增投资用户详情"+mytime;
				var beginTimeRegist = $('#beginTimeRegist').datetimebox('getValue');
				var endTimeRegist = $('#endTimeRegist').datetimebox('getValue');
				var beginTimeBuy = $('#beginTimeBuy').datetimebox('getValue');
				var endTimeBuy = $('#endTimeBuy').datetimebox('getValue');
				window.open("../exportexcel.htm?listId="+listId+"&excelname="+excelname
						+"&beginTimeBuy="+beginTimeBuy+"&endTimeBuy="+endTimeBuy
						+"&buyChannel="+buyChannel+"&registChannel="+registChannel
						+"&beginTimeRegist="+beginTimeRegist+"&endTimeRegist="+endTimeRegist);
				 }
				});
});

Date.prototype.toCNString = function() {
	return this.getFullYear() + (this.getMonth()>=9 ? this.getMonth() + 1 : "0" + (this.getMonth() + 1))  + (this.getDate()>9 ? this.getDate() : "0" + this.getDate())
	 + (this.getHours()>9 ? this.getHours() : "0" + this.getHours())  + (this.getMinutes()>9 ? this.getMinutes() : "0" + this.getMinutes()) + (this.getSeconds()>9 ? this.getSeconds() : "0" + this.getSeconds());
};
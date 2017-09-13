$(function() {
	var p = {
		t : new Date(),
		listId : "WHOLE_USER_ANALYSIS.user_day_increment_liuliangbao"
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
				seriesMap["day"].push([ Date.UTC(parseInt(dateTmp[0]), parseInt(dateTmp[1]) - 1, parseInt(dateTmp[2])), row.count ]);
			}
		}
		
		 Highcharts.setOptions({
		        colors: ['#50B432']
		    });
		
		$('#incret_liuliangbao_user').highcharts({
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
					text : '流量宝每日注册量(人)'
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
			listId : "WHOLE_USER_ANALYSIS.total_liuliangbao_user",
			rows : 3000,
			noCount : "true"
		};
		$.post("../query.htm", p, function(data) {
			for ( var i in data.rows) {
				var row = data.rows[i];
			$("#total_liuliangbao_user").text(row.totalliuliangbaouser);
			}
		}, "json");
		
		$("#exportExcel").click(function(){
			 if(confirm("确定要导出excel吗?"))
			 {
			var listId = "WHOLE_USER_ANALYSIS.user_day_increment_liuliangbao_excel";
			var myDate = new Date();
			var mytime=myDate.toCNString();     //获取当前时间
			var excelname="每日流量宝注册用户"+mytime;
			var beginTimeStr = '';
			var endTimeStr = '';
			window.open("../exportexcel.htm?listId="+listId+"&excelname="+excelname
					+"&beginTimeStr="+beginTimeStr+"&endTimeStr="+endTimeStr);
			 }
			});
		
		$("#exportExcel1").click(function(){
			 if(confirm("确定要导出excel吗?"))
			 {
			var listId = "WHOLE_USER_ANALYSIS.userinfo_yesterday_liuliangbao";
			var myDate = new Date();
			var mytime=myDate.toCNString();     //获取当前时间
			var excelname="昨日流量宝注册用户"+mytime;
			var beginTimeStr = '';
			var endTimeStr = '';
			window.open("../exportexcel.htm?listId="+listId+"&excelname="+excelname
					+"&beginTimeStr="+beginTimeStr+"&endTimeStr="+endTimeStr);
			 }
			});
		
		$("#exportExcel2").click(function(){
			 if(confirm("确定要导出excel吗?"))
			 {
			var listId = "WHOLE_USER_ANALYSIS.user_buyinfo_yesterday";
			var myDate = new Date();
			var mytime=myDate.toCNString();     //获取当前时间
			var excelname="昨日用户交易行为"+mytime;
			var beginTimeStr = '';
			var endTimeStr = '';
			window.open("../exportexcel.htm?listId="+listId+"&excelname="+excelname
					+"&beginTimeStr="+beginTimeStr+"&endTimeStr="+endTimeStr);
			 }
			});
		
		
		$("#exportExcel3").click(function(){
			 if(confirm("确定要导出excel吗?"))
			 {
			var listId = "WHOLE_USER_ANALYSIS.user_buyinfo_beforetoday_liuliangbao";
			var myDate = new Date();
			var mytime=myDate.toCNString();     //获取当前时间
			var excelname="今日之前流量宝用户交易行为"+mytime;
			var beginTimeStr = '';
			var endTimeStr = '';
			window.open("../exportexcel.htm?listId="+listId+"&excelname="+excelname
					+"&beginTimeStr="+beginTimeStr+"&endTimeStr="+endTimeStr);
			 }
			});
		
		$("#exportExcel4").click(function(){
			 if(confirm("确定要导出excel吗?"))
			 {
			var listId = "WHOLE_USER_ANALYSIS.userinfo";
			var myDate = new Date();
			var mytime=myDate.toCNString();     //获取当前时间
			var excelname="流量宝注册用户"+mytime;
			var beginTimeStr = $('#beginTime').datetimebox('getValue');
			var endTimeStr = $('#endTime').datetimebox('getValue');
			var channel='liuliangbao_activity';
			window.open("../exportexcel.htm?listId="+listId+"&excelname="+excelname
					+"&beginTimeStr="+beginTimeStr+"&endTimeStr="+endTimeStr+"&channel="+channel);
			 }
			});
		
		$("#exportExcel5").click(function(){
			 if(confirm("确定要导出excel吗?"))
			 {
			var listId = "WHOLE_USER_ANALYSIS.user_buyinfo_liuliangbao";
			var myDate = new Date();
			var mytime=myDate.toCNString();     //获取当前时间
			var excelname="流量宝注册交易行为用户"+mytime;
			var beginTimeStr = $('#beginTime').datetimebox('getValue');
			var endTimeStr = $('#endTime').datetimebox('getValue');
			window.open("../exportexcel.htm?listId="+listId+"&excelname="+excelname
					+"&beginTimeStr="+beginTimeStr+"&endTimeStr="+endTimeStr);
			 }
			});
		
		$("#exportExcel6").click(function(){
			 if(confirm("确定要导出excel吗?"))
			 {
			var listId = "WHOLE_USER_ANALYSIS.user_buyinfo";
			var myDate = new Date();
			var mytime=myDate.toCNString();     //获取当前时间
			var excelname="用户交易行为"+mytime;
			var beginTimeStr = $('#beginTime').datetimebox('getValue');
			var endTimeStr = $('#endTime').datetimebox('getValue');
			var channel='liuliangbao_activity';
			window.open("../exportexcel.htm?listId="+listId+"&excelname="+excelname
					+"&beginTimeStr="+beginTimeStr+"&endTimeStr="+endTimeStr+"&channel="+channel+"&channelType=regist");
			 }
			});
		
});

Date.prototype.toCNString = function() {
	return this.getFullYear() + (this.getMonth()>=9 ? this.getMonth() + 1 : "0" + (this.getMonth() + 1))  + (this.getDate()>9 ? this.getDate() : "0" + this.getDate())
	 + (this.getHours()>9 ? this.getHours() : "0" + this.getHours())  + (this.getMinutes()>9 ? this.getMinutes() : "0" + this.getMinutes()) + (this.getSeconds()>9 ? this.getSeconds() : "0" + this.getSeconds());
};
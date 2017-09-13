$(function() {
	PlatformAccountPie.init();

});

var PlatformAccountPie = {
	init : function() {
		$.post("platformAccount.htm", {
			t : new Date()
		}, function(data) {
			var aList = [];
			var lList = [];
			if (!data) {
				return;
			}
			var abalance = 0;
			var lbalance = 0;
			for ( var i in data) {
				if (data[i].subjectType == "A") {
					aList.push({
						name : data[i].subjectName,
						y : data[i].balance
					});
					abalance += data[i].balance;
				} else {
					lList.push({
						name : data[i].subjectName,
						y : data[i].balance
					});
					lbalance += data[i].balance;
				}
			}
			if (aList.length > 0) {
				aList[0].sliced = true;
				aList[0].selected = true;
			}
			if (lList.length > 0) {
				lList[0].sliced = true;
				lList[0].selected = true;
			}

			$('#platformAccountApie').highcharts({
				chart : {
					plotBackgroundColor : null,
					plotBorderWidth : null,
					plotShadow : false,
					type : 'pie'
				},
				title : {
					text : '资产科目占比图'
				},
				tooltip : {
					pointFormat : '{series.name}:<b>{point.percentage:.1f}%</b><br/>RMB:{point.y}元'
				},
				plotOptions : {
					pie : {
						allowPointSelect : true,
						cursor : 'pointer',
						dataLabels : {
							enabled : true,
							format : '<b>{point.name}</b>:{point.percentage:.1f}%<br/>RMB:{point.y}元',
							style : {
								color : (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
							}
						}
					}
				},
				series : [ {
					name : '占比',
					colorByPoint : true,
					data : aList
				} ]

			});

			$('#platformAccountLpie').highcharts({
				chart : {
					plotBackgroundColor : null,
					plotBorderWidth : null,
					plotShadow : false,
					type : 'pie'
				},
				title : {
					text : '负债科目占比图'
				},
				tooltip : {
					pointFormat : '{series.name}:<b>{point.percentage:.1f}%</b><br/>RMB:{point.y}元'
				},
				plotOptions : {
					pie : {
						allowPointSelect : true,
						cursor : 'pointer',
						dataLabels : {
							enabled : true,
							format : '<b>{point.name}</b>:{point.percentage:.1f}%<br/>RMB:{point.y}元',
							style : {
								color : (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
							}
						}
					}
				},
				series : [ {
					name : '占比',
					colorByPoint : true,
					data : lList
				} ]

			});
			 
			if (Math.abs(abalance-lbalance)<0.001) {
				$("#balanceEqualDiv").find(".Msg").html("<h1 style='color:green'>等于</h1>");
				$("#balanceEqualDiv").css("display", "inline");
				$("#balanceEqualDiv").slideDown();
			} else {
				$("#balanceEqualDiv").find(".Msg").html("<h1 style='color:red'>不等于</h1>");
				$("#balanceEqualDiv").css("display", "inline");
				$("#balanceEqualDiv").slideDown();
			}
			 
		}, "json");

		$.post("totalBalance.htm", {
			t : new Date()
		}, function(data) {
			var safeIcon = $("#balanceEqualDiv").find(".safeIcon");
			if (data.total_balance == 0) {
				safeIcon.attr("src", "../static/imgs/safe.png?t=" + new Date());
				safeIcon.attr("title", "账户整体安全");
				
				 
			} else {
				safeIcon.attr("src", "../static/imgs/notsafe.png?t=" + new Date());
				safeIcon.attr("title", "总账或明细有[" + data.total_balance + "元]资金对不上!");
			}
		}, "json");

	}
};
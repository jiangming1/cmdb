$(function() {
	$.post("query.htm", {
		listId : 'USER_MODULE.bidAmountDegree',
		t : new Date()
	}, function(data) {
		var degree = {};
		for ( var i in data.rows) {
			degree[data.rows[i].amount_degree] = data.rows[i].count;
		}
		// alert(JSON.stringify(degree));
		degree["all"] = degree["all"] ? degree["all"] : 0;
		degree["1"] = degree["1"] ? degree["1"] : 0;
		degree["10000"] = degree["10000"] ? degree["10000"] : 0;
		degree["100000"] = degree["100000"] ? degree["100000"] : 0;
		degree["no_bid"] = degree["all"] - degree["1"] - degree["10000"] - degree["100000"];

		$('#buyAmount').highcharts({
			chart : {
				type : 'funnel',
				marginRight : 150
			},
			title : {
				text : '',
				x : -50
			},
			plotOptions : {
				series : {
					dataLabels : {
						enabled : true,
						format : '<b>{point.name}</b> ({point.y:,.0f})',
						color : (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black',
						softConnector : true
					},
					neckWidth : '30%',
					neckHeight : '30%'

				}
			},
			legend : {
				enabled : false
			},
			series : [ {
				name : '投资者',
				data : [ [ '未投资用户', degree["no_bid"] ], [ '首次投资', degree["1"] ], [ '投资>1万', degree["10000"] ], [ '投资>10万', degree["100000"] ] ]
			} ]
		});

	}, "json");

});

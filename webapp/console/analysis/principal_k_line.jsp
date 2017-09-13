<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



<script src="../../static/jquery-1.11.0.js"></script>
<script type="text/javascript" src="../../static/highcharts-4.2.1/highstock.js"></script>
<script type="text/javascript" src="../../static/highcharts-4.2.1/exporting.js"></script>


</head>
<body>
	<div id="container"></div>

</body>
<script type="text/javascript">
	$(function() {
		$.post('principal_k_line.htm', {
			t : new Date()
		}, function(data) {
			var kData=[];
			for(var i in data){
				kData.push([data[i].gmtCreate,data[i].openPrice,data[i].heightPrice,data[i].lowPrice,data[i].closedPrice]);
			}
			
			$('#container').highcharts('StockChart', {

				title : {
					text : '本金K线图'
				},

				rangeSelector : {
					buttons : [ {
						type : 'hour',
						count : 1,
						text : '1h'
					}, {
						type : 'day',
						count : 1,
						text : '1d'
					}, {
						type : 'month',
						count : 1,
						text : '1m'
					}, {
						type : 'year',
						count : 1,
						text : '1y'
					}, {
						type : 'all',
						text : 'All'
					} ],
					selected : 4,
					inputEnabled : false
				},

				series : [ {
					name : '资金存量',
					type : 'candlestick',
					data : kData,
					tooltip : {
						valueDecimals : 2
					}
				} ]
			});
		}, "json");
	});
</script>
</html>
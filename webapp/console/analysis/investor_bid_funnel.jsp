<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="../../static/jquery-1.11.0.js"></script>
<script src="../../static/highcharts-4.2.1/js/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/funnel.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
</head>
<body>
	<div id="buyAmount"></div>
	<script type="text/javascript">
		$('#buyAmount').highcharts({
			chart : {
				type : 'funnel',
				marginRight : 150
			},
			title : {
				text : '投资额度漏模型',
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
				data : [ [ '未投资用户', 900 ], [ '投资>1千', 300 ], [ '投资>1万', 300 ], [ '投资>10万', 20 ] ]
			} ]
		});
	</script>
</body>
</html>
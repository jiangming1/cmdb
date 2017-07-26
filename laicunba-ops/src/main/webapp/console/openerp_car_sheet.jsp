<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>车辆运行台账</title>
<script type="text/javascript" src="../js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="openerp_car_sheet.js?v=1"></script>
<style type="text/css">
#table1 td, #table1 th {
	border: 1px solid gray;
	border-left: 0px;
	border-top: 0px;
	height: 20px;
	padding: 0px 5px 0px 5px;
}

#table1 {
	border: 1px solid gray;
	border-right: 0px;
	border-bottom: 0px;
}

.times, .price, .total_price, .c-times, .c-total_price {
	text-align: right;
}

.trTitle td{
	width: 90px;
}
td,th{ 
font-size: 12px;
}
</style>
</head>
<body>

	<div style="text-align: center;">
		<input style="width: 100px" id="input-year" value="">年<input style="width: 50px" id="input-month">月<input style="width: 50px" id="input-day">日车辆运行台账
		<button id="btnQuery">查询</button>
	</div>
	<table id="table1" cellspacing=0 cellpadding=0>
		<thead>
			<tr id="tr1">
				<th rowspan="2">序号</th>
				<th rowspan="2">车号</th>
				<th colspan="4">工地<span class="start_name" place="1"
					start_id="empty"></span></th>

				<th colspan="4">工地<span class="start_name" place="2"
					start_id="empty"></span></th>

				<th colspan="4">工地<span class="start_name" place="3"
					start_id="empty"></span></th>

				<th colspan="4">工地<span class="start_name" place="4"
					start_id="empty"></span></th>

				<th colspan="4">工地<span class="start_name" place="5"
					start_id="empty"></span></th>


				<th colspan="4">工地<span class="start_name" place="6"
					start_id="empty"></span></th>
					
					
					
				<th colspan="4">工地<span class="start_name" place="7"
					start_id="empty"></span></th>
					
				<th colspan="4">工地<span class="start_name" place="8"
					start_id="empty"></span></th>
					
				<th colspan="4">工地<span class="start_name" place="9"
					start_id="empty"></span></th>
					
				<th colspan="4">工地<span class="start_name" place="10"
					start_id="empty"></span></th>				
									
				<th colspan="4">工地<span class="start_name" place="11"
					start_id="empty"></span></th>
									
				<th colspan="4">工地<span class="start_name" place="12"
					start_id="empty"></span></th>
					
										
				<th colspan="4">工地<span class="start_name" place="13"
					start_id="empty"></span></th>
				<th colspan="4">工地<span class="start_name" place="14"
					start_id="empty"></span></th>
				<th colspan="4">工地<span class="start_name" place="15"
					start_id="empty"></span></th>
				<th colspan="4">工地<span class="start_name" place="16"
					start_id="empty"></span></th>
				<th colspan="4">工地<span class="start_name" place="17"
					start_id="empty"></span></th>
				<th colspan="4">工地<span class="start_name" place="18"
					start_id="empty"></span></th>
				<th colspan="4">工地<span class="start_name" place="19"
					start_id="empty"></span></th>
				<th colspan="4">工地<span class="start_name" place="20"
					start_id="empty"></span></th> 
					
				<th colspan="2">合计</th>
			</tr>


			<tr class="trTitle">
				<th>卸车地点</th>
				<th>装车数</th>
				<th>单价</th>
				<th>金额</th>

				<th>卸车地点</th>
				<th>装车数</th>
				<th>单价</th>
				<th>金额</th>

				<th>卸车地点</th>
				<th>装车数</th>
				<th>单价</th>
				<th>金额</th>

				<th>卸车地点</th>
				<th>装车数</th>
				<th>单价</th>
				<th>金额</th>

				<th>卸车地点</th>
				<th>装车数</th>
				<th>单价</th>
				<th>金额</th>
				
				<th>卸车地点</th>
				<th>装车数</th>
				<th>单价</th>
				<th>金额</th>
				
				<th>卸车地点</th>
				<th>装车数</th>
				<th>单价</th>
				<th>金额</th>
				
				<th>卸车地点</th>
				<th>装车数</th>
				<th>单价</th>
				<th>金额</th>
				
				<th>卸车地点</th>
				<th>装车数</th>
				<th>单价</th>
				<th>金额</th>
				
				<th>卸车地点</th>
				<th>装车数</th>
				<th>单价</th>
				<th>金额</th>
				
				<th>卸车地点</th>
				<th>装车数</th>
				<th>单价</th>
				<th>金额</th>
				
				<th>卸车地点</th>
				<th>装车数</th>
				<th>单价</th>
				<th>金额</th>
				
				<th>卸车地点</th>
				<th>装车数</th>
				<th>单价</th>
				<th>金额</th>
				
				<th>卸车地点</th>
				<th>装车数</th>
				<th>单价</th>
				<th>金额</th>
				
				<th>卸车地点</th>
				<th>装车数</th>
				<th>单价</th>
				<th>金额</th>
				
				<th>卸车地点</th>
				<th>装车数</th>
				<th>单价</th>
				<th>金额</th>
				
				<th>卸车地点</th>
				<th>装车数</th>
				<th>单价</th>
				<th>金额</th>
				
				<th>卸车地点</th>
				<th>装车数</th>
				<th>单价</th>
				<th>金额</th>
				
				<th>卸车地点</th>
				<th>装车数</th>
				<th>单价</th>
				<th>金额</th>
				
				<th>卸车地点</th>
				<th>装车数</th>
				<th>单价</th>
				<th>金额</th>

				<th>装车数</th>
				<th>金额</th>


			</tr>

		</thead>
		<tbody id="tbody">

		</tbody>
		<tfoot id="tfoot">
			<tr>
				<td colspan="2">合计</td>
				<td place="1" class="end_name"></td>
				<td place="1" class="times"></td>
				<td place="1" class="price"></td>
				<td place="1" class="total_price"></td>

				<td place="2" class="end_name"></td>
				<td place="2" class="times"></td>
				<td place="2" class="price"></td>
				<td place="2" class="total_price"></td>

				<td place="3" class="end_name"></td>
				<td place="3" class="times"></td>
				<td place="3" class="price"></td>
				<td place="3" class="total_price"></td>

				<td place="4" class="end_name"></td>
				<td place="4" class="times"></td>
				<td place="4" class="price"></td>
				<td place="4" class="total_price"></td>

				<td place="5" class="end_name"></td>
				<td place="5" class="times"></td>
				<td place="5" class="price"></td>
				<td place="5" class="total_price"></td>
				
				
				<td place="6" class="end_name"></td>
				<td place="6" class="times"></td>
				<td place="6" class="price"></td>
				<td place="6" class="total_price"></td>
				
				
				<td place="7" class="end_name"></td>
				<td place="7" class="times"></td>
				<td place="7" class="price"></td>
				<td place="7" class="total_price"></td>
				
				
				<td place="8" class="end_name"></td>
				<td place="8" class="times"></td>
				<td place="8" class="price"></td>
				<td place="8" class="total_price"></td>
				
				
				<td place="9" class="end_name"></td>
				<td place="9" class="times"></td>
				<td place="9" class="price"></td>
				<td place="9" class="total_price"></td>
				
				
				<td place="10" class="end_name"></td>
				<td place="10" class="times"></td>
				<td place="10" class="price"></td>
				<td place="10" class="total_price"></td>
				
				
				<td place="11" class="end_name"></td>
				<td place="11" class="times"></td>
				<td place="11" class="price"></td>
				<td place="11" class="total_price"></td>
				
				
				<td place="12" class="end_name"></td>
				<td place="12" class="times"></td>
				<td place="12" class="price"></td>
				<td place="12" class="total_price"></td>
				
				
				<td place="13" class="end_name"></td>
				<td place="13" class="times"></td>
				<td place="13" class="price"></td>
				<td place="13" class="total_price"></td>
				
				
				<td place="14" class="end_name"></td>
				<td place="14" class="times"></td>
				<td place="14" class="price"></td>
				<td place="14" class="total_price"></td>
				
				
				<td place="15" class="end_name"></td>
				<td place="15" class="times"></td>
				<td place="15" class="price"></td>
				<td place="15" class="total_price"></td>
				
				
				<td place="16" class="end_name"></td>
				<td place="16" class="times"></td>
				<td place="16" class="price"></td>
				<td place="16" class="total_price"></td>
				
				
				<td place="17" class="end_name"></td>
				<td place="17" class="times"></td>
				<td place="17" class="price"></td>
				<td place="17" class="total_price"></td>
				
				
				<td place="18" class="end_name"></td>
				<td place="18" class="times"></td>
				<td place="18" class="price"></td>
				<td place="18" class="total_price"></td>
				
				
				<td place="19" class="end_name"></td>
				<td place="19" class="times"></td>
				<td place="19" class="price"></td>
				<td place="19" class="total_price"></td>
				
				
				<td place="20" class="end_name"></td>
				<td place="20" class="times"></td>
				<td place="20" class="price"></td>
				<td place="20" class="total_price"></td>


				<td class="c-times"></td>
				<td class="c-total_price"></td>
			</tr>

		</tfoot>
	</table>




	<table border="1" style="display: none;" id="tabTemplate">

		<tbody>
			<tr>
				<td class="index"></td>
				<td class="car_name"></td>
				<td place="1" class="end_name"></td>
				<td place="1" class="times"></td>
				<td place="1" class="price"></td>
				<td place="1" class="total_price"></td>

				<td place="2" class="end_name"></td>
				<td place="2" class="times"></td>
				<td place="2" class="price"></td>
				<td place="2" class="total_price"></td>

				<td place="3" class="end_name"></td>
				<td place="3" class="times"></td>
				<td place="3" class="price"></td>
				<td place="3" class="total_price"></td>

				<td place="4" class="end_name"></td>
				<td place="4" class="times"></td>
				<td place="4" class="price"></td>
				<td place="4" class="total_price"></td>

				<td place="5" class="end_name"></td>
				<td place="5" class="times"></td>
				<td place="5" class="price"></td>
				<td place="5" class="total_price"></td>

				
				<td place="6" class="end_name"></td>
				<td place="6" class="times"></td>
				<td place="6" class="price"></td>
				<td place="6" class="total_price"></td>
				
				
				<td place="7" class="end_name"></td>
				<td place="7" class="times"></td>
				<td place="7" class="price"></td>
				<td place="7" class="total_price"></td>
				
				
				<td place="8" class="end_name"></td>
				<td place="8" class="times"></td>
				<td place="8" class="price"></td>
				<td place="8" class="total_price"></td>
				
				
				<td place="9" class="end_name"></td>
				<td place="9" class="times"></td>
				<td place="9" class="price"></td>
				<td place="9" class="total_price"></td>
				
				
				<td place="10" class="end_name"></td>
				<td place="10" class="times"></td>
				<td place="10" class="price"></td>
				<td place="10" class="total_price"></td>
				
				
				<td place="11" class="end_name"></td>
				<td place="11" class="times"></td>
				<td place="11" class="price"></td>
				<td place="11" class="total_price"></td>
				
				
				<td place="12" class="end_name"></td>
				<td place="12" class="times"></td>
				<td place="12" class="price"></td>
				<td place="12" class="total_price"></td>
				
				
				<td place="13" class="end_name"></td>
				<td place="13" class="times"></td>
				<td place="13" class="price"></td>
				<td place="13" class="total_price"></td>
				
				
				<td place="14" class="end_name"></td>
				<td place="14" class="times"></td>
				<td place="14" class="price"></td>
				<td place="14" class="total_price"></td>
				
				
				<td place="15" class="end_name"></td>
				<td place="15" class="times"></td>
				<td place="15" class="price"></td>
				<td place="15" class="total_price"></td>
				
				
				<td place="16" class="end_name"></td>
				<td place="16" class="times"></td>
				<td place="16" class="price"></td>
				<td place="16" class="total_price"></td>
				
				
				<td place="17" class="end_name"></td>
				<td place="17" class="times"></td>
				<td place="17" class="price"></td>
				<td place="17" class="total_price"></td>
				
				
				<td place="18" class="end_name"></td>
				<td place="18" class="times"></td>
				<td place="18" class="price"></td>
				<td place="18" class="total_price"></td>
				
				
				<td place="19" class="end_name"></td>
				<td place="19" class="times"></td>
				<td place="19" class="price"></td>
				<td place="19" class="total_price"></td>
				
				
				<td place="20" class="end_name"></td>
				<td place="20" class="times"></td>
				<td place="20" class="price"></td>
				<td place="20" class="total_price"></td>

				<td class="c-times"></td>
				<td class="c-total_price"></td>
			</tr>
		</tbody>
		<tfoot>
		</tfoot>
	</table>
</body>
</html>
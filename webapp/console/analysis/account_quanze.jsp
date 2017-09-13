<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>系统权责表</title>
<link href="https://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../static/jquery-easyui-1.4.4/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="../../static/jquery-easyui-1.4.4/themes/icon.css">
<style>
#table{
	top: 0px;
 	background-image: linear-gradient(to bottom, #f3f3f3 0px, #e3e3e3 100%);
 	position:relative;
 	width:100%;
}
#top{
	top: 0px;
	position:fixed;
	width:98%;
	left:1%;
	background-color:#fff;
}
.tabletop{
	
	
}
#table th{
	width:8%;
	background-color:gray;
}
#table td{
	background-color:#FFF;
}

.explain{
	color:red;
	font-size:12px;
}
.tablebody{
	margin-top:245px;
	width:97.85%;
	margin-left:1.10%;
}
.tablebody td div{
	overflow:hidden;
}

.button_div{
	margin-left:20%;
}

</style>
</head>
<body>
<div id="table">
<div id="top">
			<div style="height: 85px;">
				<h4 style="clear: both; padding-left: 10px;">
					系统总账权责表 <span style="color: red; font-size: 12px;">(所有的资金显示均以权责形式显示的,并不是实际系统总账)</span>
				</h4>
				<div class="button_div">
					<select id="sortStr" style="margin-bottom: 0px;width:140px"/>
						<option value="asc">顺序</option>
						<option value="desc">倒序</option>
					</select>
					<span>开始时间</span> <input class="easyui-datetimebox" id="beginTime"
					data-options="showSeconds:false" style="width: 150px; height: 30px;">
				 <span>结束时间</span> <input class="easyui-datetimebox"
					id="endTime" data-options="showSeconds:false"
					style="width: 150px; height: 30px;">
					<button id="btnSearch">查询</button>
					<button id="btnExportExcel">导出excel</button>
				</div>
				
			</div>

			<table class="tabletop" border="1">
		 
	 <thead style="">
			<tr style="height:50px;">
				<th>日期</th>
			 	<th>新增购买</th>
			 	<th>新增购买利息</th>
			 	<th>新增购买年化利率</th>
			 	<th>被提现体验金利息</th>
			 	<th>发放的现金券</th>
			 	<th>手续费</th>
			 	<th>留存总利息</th>
			 	<th>留存量</th>
			 	<th>总利率</th>	
			 	<th>提现</th>
			 	<th>总购买量</th>
			</tr>
			<tr style="height:72px;">
				<th >名词解释</th>
			 	<td class="explain">当天的新增购买金额不包括红包，包括活转定、定转活(new_buy)</td>
			 	<td class="explain">昨日新增随存宝的利息加上今日新增存票宝的利息(new_buy_profit)</td>
			 	<td class="explain">新增购买年化利率(前两者的年化百分比)(new_buy_rate)</td>
			 	<td class="explain">被提现体验金利息(exprience_profit)</td>
			 	<td class="explain">发放的且使用的现金券(cash_coupon)</td>
			 	<td class="explain">当然提现和购买的手续费(5.23前后手术费有变化)(handling)</td>
			 	<td class="explain">当日留存量的利息(all_debt_profit)</td>
			 	<td class="explain">留存量(all_debt)</td>
			 	<td class="explain">(被提现体验金利息+发放的现金券+手续费+留存总利息)/留存量(all_rate)</td> 	
			 	<td class="explain">当日提现的钱(withdraw_money)</td>
			 	<td class="explain">总购买量(包括包括活转定、定转活和体验金利息自动购买)(all_buy)</td>
			</tr>
		</thead>
	</table>
	</div>
	<table border="1" class="tablebody">	 
		<tbody id="tbody" >
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
		<tfoot id="tfoot">
			<tr>
				<td class="date_id">总计</td>
				<td class="total_new_buy">
					<div class="tddiv"></div>
				</td>
				<td class="total_new_buy_profit">
					<div class="tddiv"></div>
				</td>
				<td class="total_new_buy_rate">
					<div class="tddiv"></div>
				</td>
				<td class="total_exprience_profit">
					<div class="tddiv"></div>
				</td>
				<td class="total_cash_coupon">
					<div class="tddiv"></div>
				</td>
				<td class="total_handling">
					<div class="tddiv"></div>
				</td>
				<td class="total_all_debt_profit">
					<div class="tddiv"></div>
				</td>
				
				<td class="total_all_debt">
					<div class="tddiv"></div>
				</td>
				<td class="total_all_rate">
					<div class="tddiv"></div>
				</td>
				<td class="total_withdraw_money">
					<div class="tddiv"></div>
				</td>
				<td class="total_all_buy">
					<div class="tddiv"></div>
				</td>
			</tr>
		</tfoot>
	</table>
	<div style="height:30px;"></div>
	<script src="../../static/jquery-1.11.0.js"></script>
	<script src="../../static/bootstrap2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../../static/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../../static/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
	
	<script src="account_quanze.js"></script>
	</div>
</html>
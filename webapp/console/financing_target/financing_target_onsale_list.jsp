<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta charset="utf-8"> 
<link href="../../static/bootstrap2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../static/jquery-easyui-1.4.4/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="../../static/jquery-easyui-1.4.4/themes/icon.css">

<link href="financing_target_onsale_list.css" rel="stylesheet">
<style type="text/css">
.has_reason{
	color: red;
}
</style>
</head>
<body class="easyui-layout">
	<div data-options="region:'west',split:true" style="width: 55%;">
		<div style="width: 100%; height: 100%;" class="easyui-layout">
			<div data-options="region:'north'" style="height: 46px; background-color: #eee; border: 0px; padding: 5px; border-bottom: 1px solid #ccc;">
				<div class="input-append">
					<input type="text" placeholder="标名、编号">
					<button class="btn" type="button">过滤</button>
					<button class="btn" type="button">详情</button>
					<button class="btn btn-warning" type="button" id="btnOffSale">下架</button>
				</div>
				<select id="statusSelect" style="width: 80px;">
					<option value='onsale'>在售中</option>
					<option value='offsale'>已下架</option>
				</select>
				<button id="btnMakeTag" class="btn" type="button" style="margin-bottom: 10px;">打标记</button>
				<button id="btnUpdate" class="btn" type="button" style="margin-bottom: 10px;">修改</button>
			</div>
			<div data-options="region:'center'" style="border: 0px;">

				<table class="table table-hover">
					<thead>
						<tr>
							<th>标名</th>
							<th>类型</th>
							<th>期限</th>
							<th>年化</th>
							<th>结束时间</th>
							<th>投资笔数</th>
							<th>融资金额</th>
							<th style="width: 60px;">进度</th>
						</tr>
					</thead>
					<tbody id="financingTbody">
						<tr>
							<td><div class="name"></div>
								<div class="tags"></div></td>
							<td class="type"></td>
							<td class="period"></td>
							<td class="annualizedRates">s</td>
							<td class="endDate"></td>
							<td class="bidCount">0</td>
							<td class="money" style="text-align: right;"></td>
							<td>
								<div class="progress progress-success finishBar">
									<div class="bar" style="width: 0%"></div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

		</div>

	</div>
	<div data-options="region:'center'" style="background-color: white;">
		<div class="easyui-layout" style="width: 100%; height: 100%; padding: 0px; margin: 0px;">
			<div data-options="region:'north'" style="height: 46px; background-color: #eee; border: 0px; padding: 5px; border-bottom: 1px solid #ccc;">
				<div class="input-append">
					<input type="text" placeholder="手机号码" id="keywordsInput">
					<button class="btn" id="btnSearch" type="button">查找</button>
				</div>
				<div id="conditionTag" style="display: none;">
					<span class="financingName">存票宝LC0091号</span><span class="btnRemove">×</span>
				</div>
			</div>
			<div data-options="region:'center'" style="border: 0px;">
				<table class="table table-hover">
					<thead>
						<tr>
							<th style="width: 30px;">&nbsp;</th> 
							<th>下单时间</th>
							<th>标名</th>
							<th>购买金额</th>
							<th>支付否</th>
							<th>姓名</th>
							<th>手机(账号)</th>
							<th>收益</th>
						</tr>
					</thead>
					<tbody id="bidVOListTbody">
						<tr> 
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
				</table>

			</div>
		</div>

	</div>
	<div id="tagManagerLayout">Dialog Content.</div>
	<script src="../../static/jquery-1.11.0.js"></script>
	<script src="../../static/bootstrap2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../../static/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
	<script src="financing_target_onsale_list.js?v=5"></script>
</body>
</html>
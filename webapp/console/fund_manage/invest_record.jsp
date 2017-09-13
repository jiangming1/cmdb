<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta charset="utf-8">
<title>资金记录</title>
<link href="http://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../static/jquery-easyui-1.4.4/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="../../static/jquery-easyui-1.4.4/themes/icon.css">
<style type="text/css">
.form-horizontal .controls {
	
}
.table th {
	text-align: center;
}
.table td {
	text-align: center;
}
</style>
</head>
<body class="easyui-layout">
	<div data-options="region:'north'"
		style="height: 46px; background-color: #eee; border: 0px; padding: 5px; border-bottom: 1px solid #ccc;">
		<div style="">
			<span>开始时间</span> <input class="easyui-datetimebox" id="beginTime"
				data-options="showSeconds:true" style="width: 150px; height: 30px;">
			<span>结束时间</span> <input class="easyui-datetimebox" id="endTime"
				data-options="showSeconds:true" style="width: 150px; height: 30px;">
				<select id="timeType" style="margin-bottom: 0px;width: 130px;">
				<option value="buyTime">购买时间</option>
				<option value="deadLine">到期时间</option>
			</select>
			<span>项目名称:</span><input id="targetName" style="width: 150px;">　
			<button class="btn" id="queryBtn">查询</button>　
			<button class="btn" id="exportBtn">导出Excel</button>
			<form id="export_form" action="export_invest_record.htm">
				<input type="hidden" id="beginTimeStr" name="beginTimeStr" />
				<input type="hidden" id="endTimeStr" name="endTimeStr" />
				<input type="hidden" id="timeTypeStr" name="timeTypeStr" />
				<input type="hidden" id="targetNameStr" name="targetNameStr" />
			</form>
		</div>
	</div>

	<div data-options="region:'center'" style="border: 0px;">
		<table class="table table-hover">
			<thead>
				<tr>
					<th style="width: 5%;">序号</th>
					<th style="width: 7%;">购买日期</th>
					<th style="width: 9%;">项目名称</th>
					<th style="width: 5%;">用户名</th>
					<th style="width: 6%;">投资人</th>
					<th style="width: 5%;">联系电话</th>
					<th style="width: 10%;">身份证</th>
					<th style="width: 6%;">投资金额</th>
					<th style="width: 5%;">现金券</th>
					<th style="width: 3%;">期限</th>
					<th style="width: 7%;">到期日期</th>
					<th style="width: 6%;">预期年化</th>
					<th style="width: 4%;">加息券</th>
					<th style="width: 6%;">到期本息</th>
					<th style="width: 6%;">银行</th>
					<th style="width: 10%;">银行卡</th>
				</tr>
			</thead>
			<tbody id="positionTbody">
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
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>
	<script src="../../static/jquery-1.11.0.js"></script>
	<script src="../../static/bootstrap2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../../static/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../../static/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
	<script src="invest_record.js?201609221910"></script>
</body>
</html>
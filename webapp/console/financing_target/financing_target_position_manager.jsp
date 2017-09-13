<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta charset="utf-8">
<title>标的展现计划</title>
<link href="https://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../static/jquery-easyui-1.4.4/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="../../static/jquery-easyui-1.4.4/themes/icon.css">
<style type="text/css">
.form-horizontal .controls {
	
}
</style>
</head>
<body class="easyui-layout">
	<div data-options="region:'north'" style="height: 46px; background-color: #eee; border: 0px; padding: 5px; border-bottom: 1px solid #ccc;">
		<div style="">
			<select id="queryPosition" style="margin-bottom: 0px;">
				<option></option>
				<option value="WX_HOME">微信端首页</option>
				<option value="WX_SCB">微信端随存宝</option>
				<option value="WX_ZONE_CPB">微信理财专区存票宝系列</option>
				<option value="APP_HOME">app首页</option>
				<option value="APP_ZONE_SCB">app理财专区,随存宝</option>
				<option value="APP_ZONE_CPB">app理财专区,存票宝系列</option>
				<option value="APP_SELLOUT_LIST">app售完列表 </option>
				<option value="APP_REPAYMENT_LIST">app已还款列表</option>
			</select>
			<button class="btn" id="btnShowCreateDialog">添加</button>
			<span style="color: red;font-size: 20px;">您可以使用自动上标计划来自动排期，<a href="../setting/publish_plan.jsp">点这里</a>!</span>
		</div>
		<div id="conditionTag" style="display: none;">
			<span class="financingName">存票宝LC0091号</span><span class="btnRemove">×</span>
		</div>
	</div>

	<div data-options="region:'center',split:false" style="border: 0px;" id="dg">
		<table class="table table-hover" data-options="rownumbers:true,singleSelect:true">
			<thead>
				<tr>
					<th style="width: 30px;">&nbsp;</th>
					<th>位置</th>
					<th>排序</th>
					<!-- <th>展现状态</th> -->
					<th>标的状态</th>
					<th>标的名称</th>
					<th>融资期限(天)</th>
					<th>融资金额</th>				
					<th>已完成金额</th>
					<th>开始展现时间</th>
					<th>结束展现时间</th>
					<th>操作</th>
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
				</tr>
			</tbody>
		</table>
	</div>
	<div id="dialog" style="display: none; padding: 10px;">
		<form class="form-horizontal" style="padding-right: 20px;">
			<div class="control-group">
				<label class="control-label">标的编号</label>
				<div class="controls">
					<input type="text" id="financingTargetCode">
					<button type="button" id="btn_queryFinancingTarget" class="btn">查询</button>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">排序字段</label>
				<div class="controls">
					<input type="text" id="sortNum" value="10" style="width: 80px;">可以为小数,越小越靠前 
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">标的名称</label>
				<div class="controls">
					<input type="hidden" id="financingTargetId" value="" />
					<input type="text" id="financingTargetName" disabled="disabled" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">位置</label>
				<div class="controls">
					<select id="position" style="margin-bottom: 0px;">
						<option></option>
						<option value="WX_HOME">微信端首页</option>
						<option value="WX_SCB">微信端随存宝</option> 
						<option value="WX_ZONE_CPB">微信理财专区存票宝系列</option> 
						<option value="APP_HOME">app首页</option>
						<option value="APP_ZONE_SCB">app理财专区,随存宝</option>
						<option value="APP_ZONE_CPB">app理财专区,存票宝系列</option>
						<option value="APP_SELLOUT_LIST">app售完列表 </option>
						<option value="APP_REPAYMENT_LIST">app已还款列表</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">开始</label>
				<div class="controls">
					<input class="easyui-datetimebox" id="beginTime" data-options="showSeconds:true" style="width: 150px; height: 30px;">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">结束</label>
				<div class="controls">
					<input class="easyui-datetimebox" id="endTime" data-options="showSeconds:true" style="width: 150px; height: 30px;">
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<button type="button" id="btn_submitAddPosition" style="display:block" class="btn btn-primary">确认</button>
					<button type="button" id="btn_submitUpdatePosition" style="display:none" class="btn btn-primary">修改</button>
				</div>
			</div>
		</form>
	</div>
	<script src="../../static/jquery-1.11.0.js"></script>
	<script src="../../static/bootstrap2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../../static/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../../static/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>

	<script src="financing_target_position_manager.js"></script>
</body>
</html>
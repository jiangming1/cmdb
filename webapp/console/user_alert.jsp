<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta charset="utf-8">
<title>用户ALERT</title>
<link href="https://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../static/jquery-easyui-1.4.4/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="../static/jquery-easyui-1.4.4/themes/icon.css">
</head>
<body class="easyui-layout">
		
		<div data-options="region:'north'" style="height: 46px; background-color: #eee; border: 0px; padding: 5px; border-bottom: 1px solid #ccc;">
		<div style="">
			<input id="mobile" placeholder="请输入手机号查询" />
			<select id="status" style="margin-bottom: 0px;width:140px"/>
				<option value="">请选择处理状态</option>
				<option value="treated">处理</option>
				<option value="untreated">未处理</option>
			</select>
			
			<select id="level" style="margin-bottom: 0px;width:140px"/>
				<option value="">请选择级别</option>
				<option value="info">info</option>
				<option value="warn">warn</option>
				<option value="error">error</option>
			</select>

			<span>开始时间</span> <input class="easyui-datetimebox" id="beginTime"
				data-options="showSeconds:true" style="width: 150px; height: 30px;">
			 <span>结束时间</span> <input class="easyui-datetimebox"
				id="endTime" data-options="showSeconds:true"
				style="width: 150px; height: 30px;">
				<span style='color:red;'>该时间是指发生时间</span>
			<button class="btn" id="btnSearch">查询</button>
			
		</div>
	</div>
		
		<div data-options="region:'center'" style="border: 0px;">
		<table class="table table-hover">
			<thead>
				<tr>
					<th style="width: 3%;">&nbsp;</th>
					<th style="width: 5%;">序号</th>
					<th style="width: 10%;">发生时间</th>
					<th style="width: 8%;">用户手机 </th>
					<th style="width: 7%;">级别</th>
					<th style="width: 7%;">是否处置</th>
					<th style="width: 15%;">处置备注</th>
					<th style="width: 10%;">处理时间</th>
					<th style="width: 25%;">日志内容</th>
					<th style="width: 7%;">操作</th>
				</tr>
			</thead>
			
			
			<tbody id="userAlertTbody">
				<tr>
				<th style="width: 30px;">&nbsp;</th>
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
		<div class="control-group">
			<textarea name="mytextarea" style="height:150px;width:400px" id="mytestarea"></textarea>
		</div>
		<div class="control-group;">
				<div class="controls">
					<button type="button" id="btn_update"  style="margin-left:45%;" class="btn btn-primary">确认</button>
				</div>
			</div>
	</div>
	<input type="hidden" id="alertid">

	<script src="../static/jquery-1.11.0.js"></script>
	<script src="../static/bootstrap2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../static/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../static/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
	
	<script src="user_alert.js"></script>
</body>
</html>
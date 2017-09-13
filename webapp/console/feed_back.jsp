<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta charset="utf-8">
<title>反馈吐槽</title>
<link href="https://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../static/jquery-easyui-1.4.4/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="../static/jquery-easyui-1.4.4/themes/icon.css">
<style type="text/css">
.form-horizontal .controls {
	
}
</style>
</head>
<body class="easyui-layout">
	<div data-options="region:'north'" style="height: 46px; background-color: #eee; border: 0px; padding: 5px; border-bottom: 1px solid #ccc;">
		<div style="">
			<input id="mobile" placeholder="请输入手机号查询" />
			<select id="status" style="margin-bottom: 0px;width:140px"/>
				<option value="">请选择处理状态</option>
				<option value="1">处理</option>
				<option value="0">未处理</option>
			</select>

			<span>开始时间</span> <input class="easyui-datetimebox" id="beginTime"
				data-options="showSeconds:true" style="width: 150px; height: 30px;">
			 <span>结束时间</span> <input class="easyui-datetimebox"
				id="endTime" data-options="showSeconds:true"
				style="width: 150px; height: 30px;">
			<button class="btn" id="btnSearch">查询</button>
		</div>
		<div id="conditionTag" style="display: none;">
			<span class="financingName">存票宝LC0091号</span><span class="btnRemove">×</span>
		</div>
	</div>

	<div data-options="region:'center'" style="border: 0px;">
		<table class="table table-hover">
			<thead>
				<tr>
					<th style="width: 3%;">&nbsp;</th>
					<th style="width: 5%;">序号</th>
					<th style="width: 7%;">用户名</th>
					<th style="width: 10%;">手机号</th>
					<th style="width: 12%;">吐槽时间</th>
					<th style="width: 35%;">吐槽内容</th>
					<th style="width: 10%;">处理状态</th>
					<th style="width: 10%;">操作</th>
				</tr>
			</thead>
			
			
			<tbody id="positionTbody">
				<tr>
				<th style="width: 30px;">&nbsp;</th>
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
	<div id="dialog" style="padding: 10px; display:none; position: absolute; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.3);">
		<div style="width: 400px;height: 300px; background-color: white; margin: 0px auto; margin-top: 100px; border: 2px solid gray; text-align: center;">
			<textarea id="feedbackContent" style="width: 90%; height: 25%; margin-top: 20px;" disabled="disabled"></textarea>
			<textarea id="replyContent" style="width: 90%; height: 25%; margin-top: 5px;" placeholder="请输入回复内容" ></textarea>
			<div>
				<button id="btnReply">留言</button>
				<button id="btnClose">关闭</button>
			</div>
		</div>
	</div>
	<script src="../static/jquery-1.11.0.js"></script>
	<script src="../static/bootstrap2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../static/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../static/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>

	<script src="feed_back.js"></script>
</body>
</html>
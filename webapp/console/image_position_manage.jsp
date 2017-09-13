<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta charset="utf-8">
<title>图片展现位置管理</title>
<link href="https://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../static/jquery-easyui-1.4.4/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="../static/jquery-easyui-1.4.4/themes/icon.css">
<style type="text/css">
#imageShow img {
    width:220px;
    height:85px;
	max-width: 220px;
    max-height: 85px;
}
</style>
</head>
<body class="easyui-layout">
	<div data-options="region:'north'" style="height: 46px; background-color: #eee; border: 0px; padding: 5px; border-bottom: 1px solid #ccc;">
		<div style="">
			<select id="queryPosition" style="margin-bottom: 0px;">
				<option></option>
				<option value="APP_HOME">app首页</option>
				<option value="WX_HOME">微信端首页</option>
			</select>
			<button class="btn" id="btnShowCreateDialog">添加</button>
		</div>
		<div id="conditionTag" style="display: none;">
<!-- 			<span class="financingName">存票宝LC0091号</span><span class="btnRemove">×</span> -->
		</div>
	</div>

	<div data-options="region:'center'" style="border: 0px;">
		<table class="table table-hover">
			<thead>
				<tr>
					<th style="width: 30px;">&nbsp;</th>
					<th>标题</th>
					<th>位置</th>
					<th>排序</th>
					<th>展现状态</th>
					<th>图片地址</th>
					<th>链接地址</th>
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
				</tr>
			</tbody>
		</table>
	</div>
	<div id="dialog" style="display: none; padding: 10px;width:477.5px;">
		<form class="form-horizontal" style="padding-right: 20px;">
			<div class="control-group">
				<label class="control-label">标题</label>
				<div class="controls">
					<input type="text" id="title"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">位置</label>
				<div class="controls">
					<select id="position" style="margin-bottom: 0px;">
						<option></option>
						<option value="APP_HOME">app首页</option>
						<option value="WX_HOME">微信端首页</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">排序</label>
				<div class="controls">
					<input type="number" id="sortNum" />
				</div> 
			</div>
			<div class="control-group">
				<label class="control-label">图片选择</label>
				<div class="controls">
					<input type="file" id="imageFile" accept="image/*" style="opacity:0;height: 85px; width: 220px;position: absolute;left: 196px;" />
					<div id="imageShow" style="width:220px;height:85px;"><img src="http://www.laicunba.com/exwebdocs-wx/gytemp3/images/banner5.png" style="width:220px;height:85px;" alt="选择图片" /></div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">链接地址</label>
				<div class="controls">
					<input type="text" id="linkUrl" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">开始时间</label>
				<div class="controls">
					<input class="easyui-datetimebox" id="beginTime" data-options="showSeconds:true" style="width: 200px; height: 30px;">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">结束时间</label>
				<div class="controls">
					<input class="easyui-datetimebox" id="endTime" data-options="showSeconds:true" style="width: 200px; height: 30px;">
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<button type="button" id="btn_submitAddPosition" class="btn btn-primary">确认</button>
				</div>
			</div>
		</form>
	</div>
	<script src="../static/jquery-1.11.0.js"></script>
	<script src="../static/bootstrap2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../static/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../static/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>

	<script src="image_position_manage.js"></script>
</body>
</html>
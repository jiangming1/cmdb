<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta charset="utf-8">
<title>任务管理</title>
<script src="../../static/jquery-1.11.0.js"></script>
<script src="../../static/md5.js"></script>
<script src="../../static/comm.js"></script>
<link rel="stylesheet" type="text/css" href="../../static/jquery-easyui-1.4.4/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="../../static/jquery-easyui-1.4.4/themes/icon.css">
<script type="text/javascript" src="../../static/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../static/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="task_manager.js"></script>
<style type="text/css">
.expired {
	color: red;
}

.expireing {
	color: blue;
}

.attentionPlase {
	padding-left: 20px;
	color: red;
	font-size: 20px;
}

.easyui-datebox2 {
	width: 100px;
}

.textbox {
	border-radius: 0px;
}
.has_cashed{
	background:url("../../static/imgs/has_cached.png");
}
</style>
</head>

<body class="easyui-layout">

	<div data-options="region:'center',split:true" style="background-color: #eee; border: 0px;">
		<table id="tt" class="easyui-datagrid" style="width: 100%; height: 100%;" data-options="rownumbers:true,singleSelect:true,url:'../query.htm?listId=TASK.list&countId=TASK.count',method:'post',toolbar:toolbar,pagination:true,rownumbers:true,sortName:'end_profit',sortOrder:'asc',fitColumns:true,onLoadSuccess:onLoadSuccess">
			<thead>
				<tr>

					<th field="id">任务编号</th>
					<th field="mobile">手机号码</th>
					<th field="true_name">姓名</th>
					<th field="type">任务类型</th>
					<th field="timer" data-options="formatter:cellTime">计划时间</th>
					<th field="run_time" data-options="formatter:cellTime">执行时间</th>
					<th field="status">状态</th>
					<th field="param">参数</th>
					<th field="result">结果</th> 
				</tr>
			</thead>
		</table>
	</div>
	<div id="conditionDiv" style="margin-left: 20px;">

		任务类型

		<select id="typeSelect">
			<option value=""></option>
			<option value="FUIOU_WITHDRAW">富友回款(打款)</option> 
			<option value="OTHER">其它</option> 
		</select>
		<select id="executedSelect">
			<option value=""></option>
			<option value="new">未执行</option>
			<option value="executed">已执行</option>  
		</select>
		<select id="successSelect"> 
			<option value=""></option>
			<option value="success">成功</option>
			<option value="fail">失败</option>
		</select>
		<input placeholder="手机号码" id="mobileInput" /> 计划时间<input id="gmtCreateBegin" class="easyui-datebox easyui-datebox2" />~<input id="gmtCreateEnd" class="easyui-datebox easyui-datebox2" /> 
		<button id="btnQuery">查找</button>
		<input id="gmtSendDate"  class="easyui-datebox easyui-datebox2" />
		<button id="btnFuiouWithdrawTask">执行所有富友提现任务</button>  
		<span style="color: red;"></span>
	</div> 
</body>

</html>
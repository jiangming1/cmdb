<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../../static/jquery-easyui-1.4.4/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="../../static/jquery-easyui-1.4.4/themes/icon.css">
<title>现金券管理</title>
<style type="text/css">
.topArea {
	background-image: linear-gradient(to bottom, #f3f3f3 0px, #e3e3e3 100%)
}

#mobileInput {
	width: 200px;
}

#quantityInput {
	width: 20px;
}

#mobileInput, #quantityInput, #summaryInput {
	height: 20px;
}
</style>
</head>
<body class="easyui-layout">
	<div data-options="region:'west',split:false" style="width: 40%;">
		<table id="tt1" class="easyui-datagrid" style="width: 100%; height: 100%;" data-options="rownumbers:true,singleSelect:true,url:'../query.htm?listId=ACTIVITY_MANAGER.activityList&countId=ACTIVITY_MANAGER.activityCount',method:'post',pagination:true,rownumbers:true,fitColumns:true,toolbar:cashCouponDefToolbar">
			<thead>
				<tr>
					<th field="gmt_create" data-options="formatter:dateFormat">创建时间</th>
					<th field="reward_type">类型</th> 
					<th field="name">活动名称</th>
					<th field="status">状态</th> 
					<th field="conditions">使用条件</th>
					<th field="begin_time" data-options="formatter:dateFormat">开始时间</th>
					<th field="end_time" data-options="formatter:dateFormat">结束时间</th> 
					<th field="reward_req">reward req</th>
					<th field="reward_type">reward type</th>
					<th field="id">id</th>

				</tr>
			</thead>
		</table>
	</div>
	<div data-options="region:'center'" style="background-color: white;">
		<table id="tt2" class="easyui-datagrid" style="width: 100%; height: 100%;" data-options="rownumbers:true,singleSelect:true,url:'../query.htm?listId=ACTIVITY_MANAGER.joinList&countId=ACTIVITY_MANAGER.joinCount',method:'post',pagination:true,rownumbers:true,fitColumns:true,toolbar:cashCouponToolbar">
			<thead>
				<tr>
					<th field="gmt_create" data-options="formatter:dateFormat">参与时间</th>
					<th field="name">活动</th>
					<th field="mobile">手机号码</th>
					<th field="true_name">姓名</th>
					<th field="status">状态</th> 
					<th field="reward_req">reward req</th>
					<th field="reward_type">reward type</th>
					<th field="reward_resp">reward resp</th>
					<th field="device">device</th> 
					<th field="app_ver">app ver</th>  
				</tr>
			</thead>
		</table>
	</div>
	<div id="cashCouponDatagridToolbarForm"> 
		<button id="btnGivePerson">暂停</button>
		<button id="btnBatchGivePerson">开始</button>
	</div>
	
	<div id="tt2ToolbarForm"> 
		<select style="height: 25px;" id="statusSelect">
			<option value=""></option>
			<option value="new">new</option>
			<option value="success">success</option>
			<option value="fail">fail</option>
		</select>
		<input placeholder="手机号码" id="mobileInput" />
		<button id="btnFind">查找</button>
		<button id="btnSendReward">发送奖励</button>
	</div>
	
	<script src="../../static/jquery-1.11.0.js"></script>
	<script src="../../static/bootstrap2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../../static/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
	<script src="../../static/md5.js"></script>
	<script src="../../static/comm.js"></script>
	<script src="activity_manager.js?v=1"></script>
</body>
</html>
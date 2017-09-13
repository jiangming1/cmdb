<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../static/jquery-easyui-1.4.4/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="../../static/jquery-easyui-1.4.4/themes/icon.css">
<title>加息券管理</title>
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
		<table id="cashCouponDatagrid" class="easyui-datagrid" style="width: 100%; height: 100%;" data-options="rownumbers:true,singleSelect:true,url:'../query.htm?listId=RATE_INCR_COUPON_MANAGER.defList&countId=RATE_INCR_COUPON_MANAGER.defCount',method:'post',pagination:true,rownumbers:true,fitColumns:true,toolbar:cashCouponDefToolbar">
			<thead>
				<tr>
					<th field="gmt_create" data-options="formatter:dateFormat">创建时间</th>
					<th field="name">名称</th>
					<th field="rate">加息</th>
					<th field="total_quantity">数量</th>
					<th field="used_quantity">发行量</th>
					<th field="conditions">使用条件</th>
					<th field="begin_time" data-options="formatter:dateFormat">开始时间</th>
					<th field="end_time" data-options="formatter:dateFormat">有效期</th>
					<th field="valid_day">有效天数</th>
					<th field="id">id</th>

				</tr>
			</thead>
		</table>
	</div>
	<div data-options="region:'center'" style="background-color: white;">
		<table id="tt2" class="easyui-datagrid" style="width: 100%; height: 100%;" data-options="rownumbers:true,singleSelect:true,url:'../query.htm?listId=RATE_INCR_COUPON_MANAGER.rateIncrCouponList&countId=RATE_INCR_COUPON_MANAGER.rateIncrCouponCount&status=apply',method:'post',pagination:true,rownumbers:true,fitColumns:true,toolbar:cashCouponToolbar">
			<thead>
				<tr>
					<th field="gmt_create" data-options="formatter:dateFormat">获取时间</th>
					<th field="name">名称</th>
					<th field="mobile">手机号码</th>
					<th field="rate">加息</th>
					<th field="status" >状态</th>
					<th field="conditions">使用条件</th>
					<th field="begin_time" data-options="formatter:dateFormat">有效开始</th>
					<th field="end_time" data-options="formatter:dateFormat">有效结束</th>
					<th field="summary">备注</th>
					<th field="bid_gmt_create" data-options="formatter:dateFormat">使用时间</th>
					<th field="buy_amount">购买金额</th>
					<th field="pay_name">付款人姓名</th>
					<th field="target_name">标的名称</th>
					<th field="target_period">标的周期</th>
				</tr>
			</thead>
		</table>
	</div>
	<div id="cashCouponDatagridToolbarForm">
		<input id="mobileInput" placeholder="赠于人手机号码" value="18367156949" style="width: 100px;" /> <input id="quantityInput" value="1" placeholder="数量" disabled="disabled" /> <input id="summaryInput" placeholder="备注" style="width: 50px;" />
		<input id="messageInput" placeholder="自定义短信"  />
		<button id="btnGivePerson">赠送</button>
		<button id="btnBatchGivePerson">批量赠送</button>
	</div>
	
	<div id="tt2ToolbarForm">
		<input id="keywordsInput" placeholder="手机号码" />
		<button id="btnFind">查询</button>
	</div>
	
	<script src="../../static/jquery-1.11.0.js"></script>
	<script src="../../static/bootstrap2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../../static/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
	<script src="../../static/md5.js"></script>
	<script src="../../static/comm.js"></script>
	<script src="rate_incr_coupon_manager.js?v=1"></script>
</body>
</html>
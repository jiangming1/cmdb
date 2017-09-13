<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>来存吧</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<style type="text/css">
body {
	background-color: #eee;
	padding: 10px; 
}

* {
	font-family: "微软雅黑"
}
</style>
</head>
<body>
	
	<c:if test="${param.device!=null&&param.device!='' }">
		<div style="padding: 10px; border: 1px dashed #ccc; ">
			可以以最低额度购买任何一个产品,将自动绑定银行卡,然后再提现!
		</div>
	</c:if>
	<c:if test="${param.device==null||param.device=='' }">
		<div style="margin-top: 20px;text-indent: 2em;">亲、您尚未绑定任何一张银行卡.请购买标的后自动绑卡</div>
		<div style="margin-top: 20px;text-indent: 2em;display: none;">亲、您尚未绑定任何一张银行卡.您可以通过以下按钮,购买100元随存宝后自动绑定银行卡(该100元钱会转入您的随存宝账户,绑卡成功后可以随时提现)</div>
		<c:if test="${financingTargetDO!=null }">
			<div style="width: 100%; display: none;">
				<a class="btn btn-primary" href="bid_form.htm?id=${financingTargetDO.id }&default_buy_amount=100&bind_card=true" style="margin-top: 10px; width: 100%;">我要绑卡</a>
			</div>
		</c:if>
		<c:if test="${financingTargetDO==null }">
			<button type="button" class="btn btn-primary" disabled="disabled" style="width: 100%; margin-top: 10px;">我要绑卡</button>
			<div style="text-align: left; color: red; width: 100%;">绑卡通道正在进行调整,暂不受理绑卡业务!</div>
		</c:if>
		<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
		<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function() {
	
			});
		</script>
	</c:if>
</body>
</html>
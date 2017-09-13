<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>批量发送现金券</title>
<script src="../../static/jquery-1.11.0.js"></script>
</head>
<body>
	<div style="font-size: 50px; text-align: center;">
		<span style="color: green;" id="finish_count">###</span><span style="color: gray">/</span><span id="total_count">###</span> <span id="status"></span>
	</div>
	<div style="text-align: center; line-height: 50px;">
		<button id="btnClearLock">异常中断,清理Lock信息</button>
		<div style="color: red;">这个按钮一般情况下情不要点击,不然可能会出现发送重复的情况</div>
	</div>
	<script type="text/javascript">
		window.setInterval(function() {
			Progress.refresh();
		}, 2000);
		var Progress = {
			refresh : function() {
				$.post("batch_send_coupon_progress.htm", {
					t : new Date()
				}, function(data) {
					$("#total_count").html(data.total_count);
					$("#finish_count").html(data.finish_count);
					$("#status").html("任务状态:" + (data.status && data.status == 1 ? "派发中..." : "完毕"));
				}, "json");
			}
		};
		$("#btnClearLock").click(function() {
			if (window.confirm("确认操作")) {
				$.post("batch_send_coupon_clear_lock.htm", {
					t : new Date()
				}, function() {
					alert("清理完毕");
				}, "json");
			}
		});
		Progress.refresh();
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<title>复利活期提现对账工具</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta charset="utf-8">
<link href="https://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../static/bootstrap-switch/css/bootstrap3/bootstrap-switch.min.css">
<style type="text/css">
body {
	margin: 20px;
}

.bootstrap-switch .bootstrap-switch-handle-off, .bootstrap-switch .bootstrap-switch-handle-on,
	.bootstrap-switch .bootstrap-switch-label {
	line-height: 10px;
}

.tagIcon {
	height: 25px;
}
</style>
</head>
<body>
	<table class="table">
		<tr>
			<td style="width: 200px;">
				<div>仅用于查询用户本次提现(已审核)到上次提现产生的复利活期利息</div><br/>
				<div class="switch switch-large">
					<input type="text" id="mobile" placeholder="请输入用户手机号码" />
					<input type="button" id="btn_query" value="查询" />
				</div>
				<div>该用户的复利活期利息为：<span id="profit">0.00</span>元</div>
			</td>
		</tr>
	</table>

	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="../../static/bootstrap2/js/bootstrap.min.js"></script>
	<script src="../../static/bootstrap-switch/docs/js/highlight.js"></script>
	<script src="../../static/bootstrap-switch/js/bootstrap-switch.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#btn_query").click(function() {
				var param = {
					t : new Date(),
					listId : "ACCOUNT_BALANCE_ANALYSIS.sumCurrentProfit",
					mobile : $("#mobile").val().trim()
				};
				if(!param.mobile) {
					return;
				}
				$("#btn_query").prop("disabled", true);
				$.post("../query.htm", param, function(data) {
					if(data.rows[0]) {
						$("#profit").text(data.rows[0].sum);
					}
					$("#btn_query").prop("disabled", false);
				}, "json");
			});
		});
	</script>
</body>
</html>



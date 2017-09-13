<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<title>生日礼物设置</title>
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
			<td style="width: 200px;">送现金券</td>
			<td>
				<div class="switch switch-large">
					<input class="switchBox" type="checkbox" value="ACT_REGIST"  />
				</div> <em>如果开启,用户生日当天会给他们送现金券!<br> 额度,有效期,使用规则等请与技术部沟通
			</em>
			</td>
		</tr>

	</table>


	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="../../static/bootstrap2/js/bootstrap.min.js"></script>
	<script src="../../static/bootstrap-switch/docs/js/highlight.js"></script>
	<script src="../../static/bootstrap-switch/js/bootstrap-switch.min.js"></script>
	<script type="text/javascript">
		$(function() {

			$("input[type=\"checkbox\"]").bootstrapSwitch();

			$.post("../registry_get.htm", {
				t : new Date(),
				id : "sys.birthday.gifts.cashcoupon"
			}, function(regist) {

				var switchs = $("input[type=\"checkbox\"]");
				for (var i = 0; i < switchs.length; i++) {
					if (regist.id) {
						$(switchs[i]).bootstrapSwitch("state", true);
					} else {
						$(switchs[i]).bootstrapSwitch("state", false);
					}
				}

				$("input[type=\"checkbox\"]").on('switchChange.bootstrapSwitch', function(event, state) {
					if (state) {
						$.post("../registry_create.htm", {
							t : new Date(),
							id : "sys.birthday.gifts.cashcoupon",
							value : "ok"
						}, function(rs) {
							if (!rs.success) {
								alert("出错了");
							}
						}, "json");
					} else {
						$.post("../registry_delete.htm", {
							t : new Date(),
							id : "sys.birthday.gifts.cashcoupon"
						}, function(rs) {
							if (!rs.success) {
								alert("出错了");
							}
						}, "json");
					}
				});

			}, "json");

		});
	</script>
</body>
</html>



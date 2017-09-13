<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
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
			<td style="width: 200px;">是否开启</td>
			<td>
				<div class="switch switch-large">
					<input class="switchBox" type="checkbox" value="ACT_REGIST" <c:if test="${setting['act.regist.open']=='true' }"> checked="checked" </c:if> />
				</div> <em>开启后,新注册用户将会拿到如下设置的体验金红包!</em>
			</td>
		</tr>
		<tr>
			<td>活动名</td>
			<td><input id="act-name" value="${setting['act.regist.name'] }" /></td>
		</tr>
		<tr>
			<td>金额</td>
			<td><input id="act-amount" value="${setting['act.regist.amount'] }" /></td>
		</tr>
		<tr>
			<td>说明</td>
			<td><textarea id="act-summary" style="width: 100%; height: 100%;">${setting['act.regist.summary'] }</textarea></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<button id="btnSave">保存</button>
			</td>
		</tr>
		<tr>
			<td>手机号码</td>
			<td><input id="mobile" /></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<button id="btnSendOne">发一个试试</button>
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

			$("#btnSave").click(function() {
				var p = {
					t : new Date(),
					name : $("#act-name").val().trim(),
					amount : $("#act-amount").val().trim(),
					summary : $("#act-summary").val().trim(),
					open : $("input[type=\"checkbox\"]").bootstrapSwitch("state")
				};
				$.post("grant_user_create_package_setting_save.htm", p, function(data) {
					alert("保存成功!");
				}, "json");
			});

			$("#btnSendOne").click(function() {
				var p = {
					t : new Date(),
					mobile : $("#mobile").val().trim()
				};
				if (!p.mobile) {
					$("#mobile").focus();
					return;
				}
				if (!window.confirm("确认放红包?")) {
					return;
				}
				$.post("grant_user_create_package.htm", p, function(data) {
					if (data.code == "USER_NOT_EXIST") {
						alert("用户不存在!");
					} else if (data.code == "SUCCESS") {
						$("#mobile").val("");
						alert("发放成功!");
					} else {
						alert(data.code);
					}
				}, "json");

			});
		});
	</script>
</body>
</html>



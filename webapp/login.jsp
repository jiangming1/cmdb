<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!doctype html>
<html lang="zh-CN">
<head>
<title>来存吧-管理员登录</title>
<script src="static/jquery-1.11.0.js"></script>
<script src="static/md5.js"></script>
</head>
<body style="height: 100%; padding: 0px; margin: 0px;">
	<table style="width: 100%; height: 100%; margin-top: 100px;">
		<tr>
			<td valign="middle" align="center">
				<div style="border: 1px solid #ccc; background-color: #eee; width: 500px; padding: 40px 0px 40px 0px;">

					<table style="">
						<tr>
							<td colspan="2" style="color: red"></td>
						</tr>
						<tr>
							<td>用户名:</td>
							<td><input id="loginName" type="text" /></td>
						</tr>
						<tr>
							<td>密码:</td>
							<td><input id="loginPwd" type="password" /></td>
						</tr>
						<tr>
							<td>验证码:</td>
							<td><input id="verifyCode" type="text" /></td>
						</tr>
						<tr>
							<td></td>
							<td><img id="imgVerifyCode" src="admin_login_verification_code.jhtm" height="30" /> <a id="aChangeVerifyCode" href="#">看不清?</a></td>
						</tr>
						<tr>
							<td></td>
							<td style="color: red;" id="errorMsg"></td>
						</tr>
						<tr>
							<td></td>
							<td><button id="btnLogin">登录</button></td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>
<script type="text/javascript">
	$("#aChangeVerifyCode").click(function() {
		$("#imgVerifyCode").attr("src", "admin_login_verification_code.jhtm?t=" + new Date());
	});
	$("#btnLogin").click(function() {
		$("#errorMsg").html("");

		var param = {
			t : new Date(),
			loginName : $("#loginName").val().trim(),
			loginPwd : $("#loginPwd").val().trim(),
			verifyCode : $("#verifyCode").val().trim()
		};
		if (!param.loginName) {
			$("#loginName").focus();
			return;
		}
		if (!param.loginPwd) {
			$("#loginPwd").focus();
			return;
		}
		if (!param.verifyCode) {
			$("#verifyCode").focus();
			return;
		}
		$("#btnLogin").prop("disabled", true);
		param.loginPwd = MD5(param.loginPwd);
		$.post("adminLogin.htm", param, function(data) {
			if (data.code == "ok") {
				window.location = "console/";
				return;
			} else if (data.code == "code_error") {
				$("#errorMsg").html("验证码错误!");
			} else if (data.code == "user_not_exist") {
				$("#errorMsg").html("用户不存在!");
			} else if (data.code == "pwd_error") {
				$("#errorMsg").html("密码错误!");
			}
			$("#btnLogin").prop("disabled", false);
		}, "json");
	});
</script>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>来存吧-登录</title>
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<style type="text/css">
body {
	background-color: #f3f3f3;
	font-family: "微软雅黑";
}

.tab1 {
	width: 100%;
}

.lgn-content {
	padding: 10px;
	padding-top: 20px;
}

.input1 {
	width: 100%;
	height: 40px;
}

.errorInfo {
	color: red;
}
.top_banner {
    width: 100%;
    height: 40px;
    line-height: 40px;
    color: #fff;
    background-color: #fe592b;
    text-align: center;
    font-size: 16px;
}
</style>
</head>
<body> 
	<div class="top_banner">登 录</div>
	<div class="lgn-content">
		<table class="tab1">
			<tr>
				<td style="width: 50%;"><img src="img/logo_m.png" style="width: 100%;" /></td>
				<td valign="bottom" style="text-align: right; padding-right: 10px;">没有账号，立即<a href="../regist.jsp" style="color:#ff511f;">注册</a></td>
			</tr>
		</table>
		<form action="../login.htm" method="post" onsubmit="return checkParam();">
			<input type="hidden" name="loginPwd" id="loginPwdMd5Input" />
			<div style="height: 30px;"></div>
			<input name="mobile" type="text" pattern="[0-9]*" class="input1 form-control" placeholder="请输入手机号码" id="mobileInput" value="${mobile }" />
			<div id="mobileInfo" class="errorInfo">${user_not_exist }</div>
			<div style="height: 10px;"></div>
			<input class="input1 form-control" placeholder="请输入登录密码" type="password" id="loginPwdInput" />
			<div id="pwdInfo" class="errorInfo">${pwd_error }</div>
			<div style="text-align: right; line-height: 50px;">
				<a href="../forget_loginpwd.jsp" style="color:#7b7b7b;">忘记密码?</a>
			</div>
			<div style="text-align: center;">
				<button id="btnLogin" class="btn btn-warning" type="submit" style="background-color: #ff5a2c; width: 80%; border: 1px solid #ff5a2c; height: 40px;">登录下载</button>
			</div>
		</form>
	</div>
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> 
	<script type="text/javascript" src="../../static/jquery.jcryption.3.1.0.js"></script>
	<script type="text/javascript">
		function checkParam() {
			$(".errorInfo").hide();
			var p = {
				t : new Date(),
				mobile : $("#mobileInput").val(),
				loginPwd : $("#loginPwdInput").val()
			};
			if (!p.mobile) {
				$("#mobileInput").focus();
				return false;
			}
			if (!p.loginPwd) {
				$("#loginPwdInput").focus();
				return false;
			}
			var jsEncrypt=new JSEncrypt();
			jsEncrypt.setPublicKey("${pubkey}");
			$("#loginPwdMd5Input").val(jsEncrypt.encrypt(p.loginPwd+"|"+new Date().getTime())); 
			return true;
		}
	</script>
</body>
</html>
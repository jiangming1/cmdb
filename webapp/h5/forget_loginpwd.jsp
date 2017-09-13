<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>来存吧-忘记密码</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<style type="text/css">
.tab1 {
	width: 100%;
}

body {
	padding: 10px;
	padding-top: 20px;
}

.input1 {
	width: 100%;
	height: 40px;
	margin-top: 10px;
	border-radius: 0px !important;
}

#btnGetVerfityCode {
	display: inline-block;
	width: 100%;
	height: 100%;
	line-height: 26px;
}

.errorInfo {
	color: red;
	float: left;
	display: none;
}
</style>
</head>
<body>
	<input type="hidden" value="${pubkey }" id="pubkeyInput" />
	<table class="tab1">
		<tr>
			<td style="width: 50%;"><img src="img/logo_m.png" style="width: 100%;" /></td>
			<td valign="bottom" style="text-align: right; padding-right: 10px;">已有账号，立即<a href="login.htm?tab=account">登录</a></td>
		</tr>
	</table>
	<div style="height: 30px;"></div>
	<input type="text" pattern="[0-9]*" class="input1 form-control" placeholder="请输入手机号码" id="mobileInput"  />
	<div class="input-group" style="margin-top: 10px; height: 40px;">
		<input type="text" pattern="[0-9]*" type="text" class="form-control" id="verifyCodeInput" placeholder="短信验证码" style="height: 40px; border-radius: 0px" />
		<div class="input-group-addon" style="border-radius: 0px">
			<a id="btnGetVerfityCode"> 获取短信验证码 </a>
		</div>
	</div>
	<input class="input1 form-control" id="newPwdInput" placeholder="新密码(6-16位字母或数字)" type="password" />
	<input class="input1 form-control" id="newPwd2Input" placeholder="确认新密码(6-16位字母或数字)" type="password" />
	<div class="errorInfo"></div>
	<div style="text-align: center; margin-top: 35px;">
		<button id="btnSubmit" class="btn btn-warning" style="background-color: #f37b1d; width: 100%; border: 1px solid #f37b1d; height: 40px;">提交</button>
	</div>
	<form id="loginForm" action="login.htm" method="post" style="display: none;">
		<input name="mobile"  />
		<input name="loginPwd"  /> 
	</form>
	
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="../static/md5.js"></script>
	<script type="text/javascript" src="../static/jquery.jcryption.3.1.0.js"></script>
	<script src="forget_loginpwd.js?v=1"></script>

</body>
</html>
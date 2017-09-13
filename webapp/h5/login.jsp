<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>来存吧-登录</title>
<link type="text/css" rel="stylesheet" href="css/lcb_wx_common.css">
<style type="text/css">
.tab1 {
	width: 100%;
}

body {
	padding-top: 20px;
}

.input1 {
	width: 100%;
	height: 40px;
}

.errorInfo {
	color: red;
}

.main-content {
	padding: 0 10px 10px 10px;
}

.main-content input[type="text"], .main-content input[type="password"]{
	height: 28px;
	padding: 1.7% 3.5%;
	width: 93%;
	border-radius: 5px;
    border: 1px solid #ccc;
}
</style>
</head>
<body> 
	<div class="main-content">
		<table class="tab1">
			<tr>
				<td style="width: 50%;"><img src="img/logo_m.png" style="width: 100%;" /></td>
				<td valign="bottom" style="text-align: right; padding-right: 10px;">没有账号，立即<a href="regist.jsp" style="color:#f00;font-size:20px;">注册</a></td>
			</tr>
		</table>
		<form action="login.htm" method="post" onsubmit="return checkParam();">
			<input type="hidden" id="returnUrl" name="returnUrl" value="${param.returnUrl}" />
			<input type="hidden" name="loginPwd" id="loginPwdMd5Input" />
			<div style="height: 30px;"></div>
			<input name="mobile" type="text" pattern="[0-9]*" class="input1 form-control" placeholder="请输入手机号码" id="mobileInput" value="${mobile }" />
			<div id="mobileInfo" class="errorInfo">${user_not_exist }</div>
			<div style="height: 10px;"></div>
			<input class="input1 form-control" placeholder="请输入登录密码" type="password" id="loginPwdInput" />
			<div id="pwdInfo" class="errorInfo">${pwd_error }</div>
			<div style="text-align: right; line-height: 50px;">
				<a href="forget_loginpwd.jsp" style="color:#999;">忘记密码?</a>
			</div>
			<div style="text-align: center;">
				<button id="btnLogin" class="btn btn-warning" type="submit" style="background-color: #ff7433; width: 80%; border: 1px solid #f37b1d; height: 40px; line-height:0px;">立即登录</button>
			</div>
		</form>
	</div>
	<jsp:include page="bottom.jsp"></jsp:include>
	<script src="js/jquery.min.js"></script>
	<script src="../static/md5.js"></script> 
	<script type="text/javascript" src="../static/jquery.jcryption.3.1.0.js"></script>
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
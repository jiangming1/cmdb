<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<link rel="shortcut icon" href="favicon.ico" /> 
<link rel="Bookmark" href="favicon.ico" />
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>注册</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="css/lcb_wx_common.css?201604141" />
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
	background-color: #ff5a2c;
	border: 0px;
}

.errorInfo {
	color: red;
}
</style>
</head>
<script type="text/javascript">

</script>
<body>
	<input id="pubkeyInput" value="${pubkey }" type="hidden" />
	<table class="tab1">
		<tr>
			<td style="width: 50%;"><img src="img/logo_m.png" style="width: 100%;" /></td>
			<td valign="bottom" style="text-align: right; padding-right: 10px;">已有账号，立即<a href="login.htm?tab=account">登录</a></td>
		</tr>
	</table>
	<div style="height: 30px;"></div>
	<input type="text" pattern="[0-9]*" class="input1 form-control" placeholder="请输入手机号码" id="mobileInput" onblur="lostFocus()" />
	<div id="mobileInputInfo" class="errorInfo"></div>
	<input class="input1 form-control" placeholder="请输入6-16位字母或数字密码" id="loginPwdInput" type="password" />
	
		<input type="text" pattern="[0-9]*"  class="input1 form-control" <c:if test="${param.invite_code!=null }"> disabled="disabled" </c:if> placeholder="请输入邀请码(选填)" id="inviteFromInput" value="${param.invite_code }" />
	<div id="imgVerifyCodeBox" style="display: none;">
		<div  style="margin-top: 10px;">
			<img id="imgVerifyCode" style="height: 30px;" /><a id="btnRefreshPicVerifyCode"> 看不清?</a>
		</div>
		<input type="text"  class="input1 form-control" placeholder="请输入图形验证码" id="picVerifyCodeInput" />
	</div>
	<div class="input-group" style="margin-top: 10px; height: 40px;">
		<input type="text" pattern="[0-9]*" id="verifyCodeInput" type="text" class="form-control" id="exampleInputAmount" placeholder="短信验证码" style="height: 40px; border-radius: 0px" />
		<div class="input-group-addon" style="border-radius: 0px;background-color:#ff5a2c;">
			<button  id="btnGetVerfityCode" style="color:#fff;">获取短信验证码</button>
		</div>
	</div>
	<div id="verifyCodeInputInfo" class="errorInfo"></div>
	<div style="text-align: center; margin-top: 20px;">
		<button id="btnRegist" class="btn btn-warning" style="background-color: #ff5a2c; width: 100%; border: 1px solid #f37b1d; height: 40px; padding: 0;">确认注册</button>
	</div>
	
	
	<form id="loginForm" action="login.htm" method="post" style="display: none;">
		<input name="mobile"  />
		<input name="loginPwd"  /> 
	</form>
	
	<jsp:include page="lcb_wx_common.jsp"></jsp:include>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="../static/md5.js"></script> 
	<script type="text/javascript" src="../static/jquery.jcryption.3.1.0.js"></script>
	<script src="regist.js?v=1"></script>
	<script type="text/javascript" src="lcb_wx_common.js"></script>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<link rel="shortcut icon" href="../../favicon.ico" /> 
<link rel="Bookmark" href="../../favicon.ico" />
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>来存吧-注册</title>
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="../css/lcb_wx_common.css?201604141" />
<style type="text/css">
body {
	background-color: #faf6b1;
	font-family: "微软雅黑";
	font-size: 1rem;
}

.reg-content {
	background: url(img/llb_reg_bg1.png) no-repeat;
    width: 100%;
    height: 310px;
    background-size: 100% 100%;
    padding: 10px 25px;
}
.reg-form {
	background: url(img/llb_reg_bg2.png) no-repeat;
	width: 100%;
	height: 100%;
    background-size: 100% 100%;
    padding: 5px 10px;
}
.form-row {
	padding: 2% 5%;
	width: 100%;
}
.form-row a{
	color: #fff;
	text-decoration: none;
}
.form-row-elmt{
	background-color: #fff;
	height: 40px;
	border-radius: 5px;
	width: 100%;
}
.form-row-elmt input{
	border: 0;
	width: 74%;
	height: 39px;
	padding: 0 0 0 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
}
.form-label{
	background-color: #faf6b1;
	display: inline-block;
	width: 20%;
	height: 40px;
	line-height: 40px;
	text-align: center;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
}
.label-split {
	background-color: #fff;
	display: inline-block;
	width: 2%;
	height: 40px;
	line-height: 40px;
}
.btn-vcode {
	float: right;
	width: 33%;
	height: 40px;
	line-height: 38px;
	background-color: #f3da67;
    border: 1px solid #ebb07a;
	border-radius: 5px;
	text-align: center;
}
.btn-vcode a {
	color: #6f4538;
	display: inline-block;
	width:100%;
	border: 0px;
}
.btn-reg {
	width: 60%;
	height: 40px;
	line-height: 38px;
	background-color: #ffe96f;
    border: 1px solid #e9ae78;
	border-radius: 5px;
	text-align: center;
	margin-left: 20%;
}
.btn-reg a {
	color: #ff482a;
	display: inline-block;
	width:100%;
}
.input-error::-webkit-input-placeholder {
    color:#f00;
}
.aboutus-title img{
	width: 100%;
}

.input1 {
	border: 0;
	height: 35px;
	padding: 0 0 0 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	width: 51%;
	margin-top: 10px;
}
</style>
</head>
<body>
	<input id="pubkeyInput" value="${pubkey }" type="hidden" />
	<div><img src="img/llb_reg_top.png" style="width: 100%;" /></div>
	<div class="reg-content">
		<div class="reg-form">
			<div class="form-row" style="padding-top: 10%;">
				<div class="form-row-elmt">
					<span class="form-label">手机号</span>
					<span style="background-color:#fff;">|</span>
					<input type="text" id="mobileInput" pattern="[0-9]*" placeholder="请输入手机号" onblur="lostFocus()"/>
				</div>
				<div id="imgVerifyCodeBox" style="display: none;">
				<input type="text" class="input1 form-control" placeholder="请输入图形验证码" id="picVerifyCodeInput" />
					<div style="margin-top: -33px; float:right;width:45%">
						<img id="imgVerifyCode" style="height: 31px;" />
						<a id="btnRefreshPicVerifyCode"> 看不清?</a>
					</div>					
				</div>
			</div>
			<div class="form-row" style="clear:both;height:50px;">
				<div class="form-row-elmt" style="width: 66%;float:left;">
					<span class="form-label" style="width:30%">验证码</span>
					<span style="background-color:#fff;">|</span>
					<input type="text" pattern="[0-9]*" id="verifyCodeInput" placeholder="请输入验证码" style="width:61%" />
				</div>
				<div class="btn-vcode"><a id="btnGetVerfityCode">获取验证码</a></div>
			</div>
			<div class="form-row">
				<div class="form-row-elmt">
					<span class="form-label">密　码</span>
					<span style="background-color:#fff;">|</span>
					<input type="password" id="loginPwdInput" class="" placeholder="请输入密码" />
				</div>
			</div>
			<div class="form-row" style="padding-right:0;margin-top:-2%;">
				<label>
					<input type="checkbox" checked="checked" style="color:#fff;" />
					<span style="font-size: 12px;color:#fff;">我已阅读并同意<a href="user_protocol.jsp">《来存吧用户使用协议》</a></span>
				</label>
			</div>
			<div class="btn-reg"><a id="btnRegist">立即注册</a></div>
		</div>
	</div>
	<div class="aboutus-title">
		<img src="img/llb_reg_why.png" />
	</div>
	<form id="loginForm" action="../login.htm" method="post">
		<input type="hidden" id="mobile" name="mobile" />
		<input type="hidden" id="loginPwd" name="loginPwd" />
		<input type="hidden" id="returnUrl" name="returnUrl" />
	</form>
	<jsp:include page="../lcb_wx_common.jsp"></jsp:include>
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="../../static/md5.js"></script>
	<script type="text/javascript" src="../../static/jquery.jcryption.3.1.0.js"></script>
	<script src="channel_reg.js?v=201606211711"></script>
	<script type="text/javascript" src="../lcb_wx_common.js?201604141"></script>
</body>
</html>
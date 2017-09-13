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

.logodiv img{
	width: 100%;
}

.contain{
	padding:20px;
}

.input1 {
	width: 100%;
	height: 40px;
	margin-top: 10px;
	border-radius: 5px !important;
}

#btnGetVerfityCodeNew {
	display: inline-block;
	width: 100%;
	height: 100%;
	line-height: 26px;
	background-color: #ff5a2c;
	border: 0px;
}
.introduce{
	margin-top:10%;
	text-indent:2em;
}

.invite_info{
	font-size:1.2em;
}

.errorInfo {
	color: red;
}
/* 注册弹出框的样式  */
.reg_alertbox{
	width: 90%;
	height: 60%;
	padding: 5% 0;
	margin: 0 auto; 
	text-align: center;
	position: fixed; 
	left: 5%; 
	top: 15%; 
	z-index: 100;
	background: #FFF;
	border-radius: 0.5rem;
	overflow: auto;
	display: none;
}
.btn_download{
	width: 60%;
	background: #ef491c; 
	padding: 1rem 0;
	margin: 1rem auto;
	text-align: center; 
	border-radius: 0.5rem; 
	border: 1px solid #ef491c; 
	color: #FFF !important;
	display: block;
}
.mask{
	position:fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: #000;
	opacity: 0.8;
	z-index: 99;
	display: none;
}
</style>
</head>
<body>
	<input id="pubkeyInput" value="${pubkey }" type="hidden" />
	<input type="hidden" id="channel" value="${param.channel }" />
	<div class="logodiv">
		<img src="img/regist_new_logo.png">
	</div>
	<div class="contain">
		<div style="height: 35px;"><p class="invite_info">您的好友${param.mobile}邀请你加入来存吧</p></div>
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
			<input type="text" pattern="[0-9]*" id="verifyCodeInput" type="text" class="form-control" id="exampleInputAmount" placeholder="短信验证码" style="height: 40px; border-radius: 5px;width:95%;" />
			<div class="input-group-addon" style="border-radius: 5px;background-color:#ff5a2c;">
				<div id="btnGetVerfityCodeNew" style="color:#fff;">立即获取</div>
			</div>
		</div>
		<div id="verifyCodeInputInfo" class="errorInfo"></div>
		<div style="text-align: center; margin-top: 20px;">
			<a id="btnRegistNew" class="btn btn-warning" style="background-color: #ff5a2c; width: 100%; border: 1px solid #f37b1d; height: 40px; padding: 0;">立即注册</a>
		</div>
		<p class="introduce">互联网金融平台<span style="color:#ef491c;">来存吧(laicunba.com)</span>,以安全、稳健、灵活为宗旨,整合最优质的银行、国企、央企、以及上市公司银行票据资产,通过创新金融模式和优化用户体验,为投资者实现财富稳定增值.</p>
	</div>
	<!-- 注册成功的弹出页面 -->
	<div class="mask"></div>
	<div class="reg_alertbox">
	     <div style="margin-top: 0.8rem;"><img src="img/regtipsyes.png" width="40%"></div>
	     <div style="color: #5c5c5b;margin-top: 0.8rem;">新人投资专享年化20%新手宝</div>	  
	     <div style="margin-top: 0.8rem;"><img src="img/reglogo.png" width="40%"></div>
	     <a class="btn_download" href="http://a.app.qq.com/o/simple.jsp?pkgname=com.example.lcb" >点击下载app</a>
	</div>  
	
	<jsp:include page="lcb_wx_common.jsp"></jsp:include>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="../static/md5.js"></script>
	<script type="text/javascript" src="../static/jquery.jcryption.3.1.0.js"></script>
	<script src="regist_new.js"></script>
	<script type="text/javascript" src="lcb_wx_common.js"></script>
</body>
</html>
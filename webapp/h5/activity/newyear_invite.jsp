<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>新有所享 老有所益</title>
<style type="text/css">
*{
	margin:0;
	padding:0;
}

.contain{
	position:relative;
}

.contain img{
	box-sizing: border-box;
	max-width: 100%;
	height: auto;
	vertical-align: middle;
	border: 0;
}
.button{
	position:absolute;
	width:100%;
	top:92%;
	text-align: center;
	margin-top: 5%;
}
</style>
</head>
<body>
<input type="hidden" id="loginStatus" value="${loginStatus }" />
<input type="hidden" id="device" value="${param.device }" />
<input type="hidden" id="app_token" value="${param.app_token }" />
<div class="contain">
	<img src="http://laicunba.b0.upaiyun.com/lcb/activity/new_year_invite_bg.jpg" width="100%" />
	<div class="button">
		<img src="img/btn_newyear_invite.png" width="75%" />
	</div>
</div>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$(".button").click(function() {
		var device = "${param.device}";
		var app_token = "${param.app_token}";
		if($("#loginStatus").val() == 0) {
			if(device) {
				window.location.href="../invite_info.htm?device=app&app_view=acc&_app_version=2.0&app_token="+app_token;
			} else {
				window.location.href="../login.htm?tab=account&returnUrl=invite_info.htm";
			}
		} else {
			if(device) {
				window.location.href="../invite_info.htm?device=app&app_view=acc&_app_version=2.0&app_token="+app_token;
			} else {
				window.location.href="../invite_info.htm";
			}
		}
	});
	
});
</script>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>10月邀请</title>
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
	top:90%;
}
</style>
</head>
<body>
<div class="contain">
	<img src="http://laicunba.b0.upaiyun.com/lcb/activity/october_invite/october_invite_content.jpg" width="100%" />
	<div class="button">
			<img src="http://laicunba.b0.upaiyun.com/lcb/activity/october_invite/button.png" width="100%" />
	</div>
</div>
<script src="../js/jquery.min.js"></script>
<script>
$(".button").click(function(){ 
	var device = '${param.device}';
	var app_token = '${param.app_token}';
	  var p = {
			  t :new Date(),
			  app_token:app_token
	  }
	  $.post("summer_travel_my_info.htm",p,function(data) {
		  if(data.userStatus == 0){
			  if(device) {
				  window.location.href="../invite_info.htm?device=app&_app_version=2.0&app_view=acc&app_token="+app_token;
			  }else{
				window.location.href="../login.htm?tab=account&returnUrl=invite_info.htm";
			  }
			}else{
				 if(device) {
					 window.location.href="../invite_info.htm?device=app&_app_version=2.0&app_view=acc&app_token="+app_token;
				 }else{
					 window.location.href="../invite_info.htm";
				 }
			}
	  }, "json");
});
	
</script>
</body>
</html>
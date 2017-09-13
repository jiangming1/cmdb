<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>新人宝活动</title>
<style>
*{
   padding: 0;
   margin: 0;
}
a{
   text-decoration: none;
   color: #FF7433;
}
li{
   list-style: none;
}
.word_list{
}
.word_list li{
   margin: 30px;
}
.message_list{
   display: block;
   background: #CCC; 
   text-align: center; 
   font-size: 16px;
   padding-top: 25px;
   padding-bottom: 35px; 
}
.message_list li{
   margin-top: 15px;
   padding: 0 10px;
   display: block;
}
</style>
</head>
<body style="background: #EBE7E7;">
<div style="width: 100%;">
    <img src="img/xrb_page_header.png" width="100%">
</div>
<div style="padding: 30px 20px 0;">
    <a href="javascript:void(0);" id="downloadBtn" rel="${version }"><img src="img/xrb_link.png" width="100%"></a>
</div>
<ul class="word_list">
    <li><img src="img/xrb_bank_licai.png" width=" 100%"></li>
    <li><img src="img/xrb_safe_finance.png" width=" 100%"></li>
    <li><img src="img/xrb_income_height.png" width=" 100%"></li>
</ul>
<ul class="message_list">
    <li>河南小虎网络科技有限公司</li>
</ul>
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#downloadBtn").click(function() {
			var ua = navigator.userAgent.toLowerCase();	
			if (/iphone|ipad|ipod/.test(ua)) {
			    window.location.href="https://itunes.apple.com/us/app/lai-cun-ba-li-cai-mai-gu-piao/id1087649876?mt=8&uo=4";
			} else if (/android/.test(ua)) {
			    var version = $(this).attr("rel");
			    window.location.href="http://laicunba.b0.upaiyun.com/apk/" + version + ".apk";
			}
		});
		
	});
</script>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>流量宝活动-查询牛币</title>
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<style type="text/css">
body {
	background-color: #ff480c;
	font-family: "微软雅黑";
}
.cx-content {
	background: url(img/llb_cx_bg.png) no-repeat;
	background-size: 100%;
	min-height: 500px;
}
.ctt-title {
	text-align: center;
	padding-top: 62%;
	font-size: 18px;
	font-weight: bold;
}
.ctt-info {
	padding-top: 4%;
	text-align: center;
	font-weight: bold;
}
.ctt-explain {
	color: #ea4517;
	width: 80%;
	margin-left: 10%;
	text-align: center;
	padding-top: 5%;
}
.btn-goback {
	text-align: center;
    margin-top: 7%;
}
.btn-goback a {
	background-color: #ff5a2c;
	color: #fff;
	font-size: 20px;
    display: inline-block;
    border-radius: 5px;
    width: 45%;
    height: 38px;
    line-height: 38px;
}
</style>
</head>
<body>
	<div class="cx-content">
		<div class="ctt-title">
			<span>查查我赚的牛币</span>
		</div>
		<div class="ctt-info">
			<span>您共赚牛币</span>
			<span>${acquiredLiuLiang }</span>
			<span>个</span>
		</div>
<!-- 		<div class="ctt-explain"> -->
<!-- 			<span>您赚得的流量将以牛币形式3个工作日内赠送</span><br/> -->
<!-- 			<span>牛币可在流量宝客户端兑换流量</span> -->
<!-- 		</div> -->
		<div class="btn-goback">
			<a href="http://nb.189.cn/webapp/zt/ztmb/laicunba.html">去赚牛币</a>
		</div>
	</div>
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function() {

		});
	</script>
</body>
</html>
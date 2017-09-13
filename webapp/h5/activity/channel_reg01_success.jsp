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
<title>流量宝活动-注册</title>
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="../css/lcb_wx_common.css?201604141" />
<style>
.channel01_btn{
    display: block;
    background: #3B93D0;
    width: 80%; 
    padding: 2%; 
    font-size: 2rem; 
    margin: 1.5rem auto; 
    border-radius: 0.5rem; 
    color: #FFF !important; 
    text-align: center; 
}
</style>
</head>
<body style="background: #EF3440;">
	<div>
	     <img src="img/channel01.png" width="100%" />
	     <a href="http://a.app.qq.com/o/simple.jsp?pkgname=com.example.lcb&ckey=CK1334922178597" class="channel01_btn">下载领取</a>
	</div>	
	<jsp:include page="../lcb_wx_common.jsp"></jsp:include>
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
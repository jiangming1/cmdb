<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>组团抢话费-注册成功页面</title>
<link type="text/css" rel="stylesheet" href="../css/phone_fare.css"/>
<script type="text/javascript" src="../js/jquery.min.js"></script>
</head>
<body style="background: #FFF;">
<div style="width: 100%;">
     <img src="img/group_sucess_header.png">
</div>
<div style=" width: 100%;color: #ef491c;text-align: center; font-size: 1.3rem;">新人投资专享20%年化新手宝</div>
<div style=" width: 100%;text-align: center;margin-top: 1.5rem; font-size: 1.2rem; color: #626262;">您已加入${fn:substring(param.inviterMobile, 0, 3)}****${fn:substring(param.inviterMobile, 7, 11)}的团</div>
<a href="group_active.htm" class="btn_link" style="width: 60%;">查看我的团</a>
<a href="http://a.app.qq.com/o/simple.jsp?pkgname=com.example.lcb" class="btn_link" style="width: 80%;">下载APP，投资年化20%新手标</a>
</body>
</html>
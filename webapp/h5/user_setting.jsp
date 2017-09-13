<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<link rel="stylesheet" href="css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="css/lcb_wx_common.css?201602291" />
<title>账户设置</title>
<style type="text/css">
body {
	background-color: #eee;
}

.tab1 {
	width: 100%;
	padding: 10px;
	background-color: white;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	margin: 10px 0;
}

.tab1 td {
	line-height: 50px;
}

.tab1 img {
	width: 25px;
}
.verified-card {
    width: 100%;
    height: 100%;
    background-color: #fdd9a8;
    padding: 15px 10px;
}
.verified-card span {
	font-size: 20px;
	margin: 5px 0;
    display: inline-block;
}
.unverified-card {
    width: 100%;
    height: 100%;
    padding: 15px 10px;
    background: url(img/setting1.png) no-repeat right;
    background-size: contain;
    background-color: #fff;
}
.unverified-card span {
	font-size: 20px;
	margin: 5px 0;
    display: inline-block;
    height: 115px;
    line-height:115px;
}
</style>
</head>
<body>
	<c:if test="${param.device==null||param.device=='' }">
		<div class="backBar">
			<table>
				<tr>
					<td style="width: 50px;"><a href="my_account.htm?tab=account&t=<%=new Date()%>"><img src="img/icon_fanhui.png" style="height: 40px;"></a></td>
					<td>账户设置</td>
					<td style="width: 50px;"></td>
				</tr>
			</table>
		</div>
	</c:if>
	<c:if test="${user.trueName!=null && user.trueName !='' && user.pid!=null && user.pid!=''}">
		<div class="verified-card">
			<span>姓&nbsp;　&nbsp;名：${user.trueName }</span><br/>
			<span>身&nbsp;份&nbsp;证：${user.pid }</span><br/>
			<span>手&nbsp;机&nbsp;号：${user.mobile }</span>
		</div>
	</c:if>
	<c:if test="${user.trueName==null || user.trueName =='' || user.pid==null || user.pid==''}">
		<div class="unverified-card">
			<span>手&nbsp;机&nbsp;号：${user.mobile }</span>
		</div>
	</c:if>
	<a href="user_loginpwd_modify.jsp">
		<table class="tab1">
			<tr>
				<td style="width: 80px; text-align: center;"><img src="img/lock.png" /></td>
				<td>修改登录密码</td>
				<td>〉</td>
			</tr>
		</table>
	</a>
	<div style="padding: 10px;">
		<a href="logout.htm" class="btn btn-warning" style="width: 100%; color:#FFF; background-color:#f0ad4e; font-size:18px;line-height:28px;">退出登录</a>

	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function() {

		});
	</script>
</body>
</html>
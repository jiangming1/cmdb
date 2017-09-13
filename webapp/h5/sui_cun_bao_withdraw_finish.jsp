<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>来存吧-提现完成</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<style type="text/css">
.backBar {
	
}

.backBar table {
	width: 100%;
	height: 50px;
	background-color: #FF7433;
	font-size: 20px;
}

.backBar table td {
	text-align: center;
	color: white;
}

.backBar a {
	display: inline-block;
	width: 100%;
	height: 100%;
	text-decoration: none;
	line-height: 50px;
	color: white;
}

body {
	padding: 0px;
	margin: 0px;
}
</style>
</head>
<%
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("MM月dd日");
	date.setDate(date.getDate() + 1);
	if (date.getDay() == 6) {
		date.setDate(date.getDate() + 2);
	} else if (date.getDay() == 0) {
		date.setDate(date.getDate() + 1);
	}
%>
<body>
	<c:if test="${param.device==null||param.device=='' }">
		<div class="backBar">
			<table>
				<tr>
					<td style="width: 50px;"><a href="sui_cun_bao_home.htm?t=<%=new Date()%>">〈</a></td>
					<td>提现详情</td>
					<td style="width: 50px;"></td>
				</tr>
			</table>
		</div>
	</c:if>
	<div style="margin: 10px;">
		<div style="text-align: center; margin-top: 50px;">
			<img src="img/ok.png" style="width: 30%;" />
		</div>
		<div style="line-height: 30px; text-align: center; font-weight: bold; margin-top: 20px;">提现申请已提交,等待银行确认</div>
		<div style="text-align: center; line-height: 30px; margin-top: 30px;">
			预计到账时间:&nbsp;<%=sdf.format(date)%>&nbsp;(节假日顺延)<br />请耐心等待...
		</div>
		<a href="sui_cun_bao_home.htm?app_view=scb_withdraw_finish" class="btn btn-warning" style="width: 100%; margin-top: 30px; background-color: #FF7433; border: 1px solid #FF7433;">完成</a>
	</div>
</body>
</html>
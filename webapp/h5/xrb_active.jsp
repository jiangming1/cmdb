<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<style>
*{
	margin: 0;
	padding: 0;
}
.backBar table {
	width: 100%;
	height: 50px;
	background-color: #444;
	font-size: 20px;
}

.backBar table td {
	text-align: center;
	color: #C5A556;
}

.backBar a {
	display: inline-block;
	width: 100%;
	height: 100%;
	text-decoration: none;
	line-height: 50px;
	color: #C5A556;
}
.xrb_problem{
	padding: 10px 20px;
}
.xrb_problem h3{
	text-align: center; 
	color: #b96a23; 
	margin-bottom: 10px;
}
.xrb_problem p{
	color: #b96a23;
}
.xrb_problem p a{
	text-decoration: none;
	color: #F5A556;
}
</style>
</head>
<body style=" background: #FFE184;">
<c:if test="${param.device==null||param.device=='' }">
<div class="backBar">
     <table >
		<tbody>
			<tr>
				<td style="width:50px;"><a href="my_account.htm?tab=account&t=<%=new Date()%>">〈</a></td>
				<td>新人宝活动</td>
				<td style="width:50px;"></td>			
			</tr>
		</tbody>
	</table>
</div>
</c:if>
<div style="width: 100%;">
     <img src="img/xrb_header.png" width="100%">
</div>
<div style="padding: 0 20px;">
     <a href="#">
        <img src="img/xrb_licai.png" width="100%;">
     </a>
</div>
<div style="padding: 0 10px;">
     <img src="img/xrb_rule.png" width="100%">
</div>
<div class="xrb_problem">
     <h3>如有疑问</h3>
     <p>如有疑问，请致电<a href="tel: 400-6191520">400-6191-520</a>,或登录来存吧官网<a href="http://www.laicunba.com" target="_blank">www.laicunba.com</a></p>
</div>
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>来存吧</title>
<style type="text/css">
* {
	padding: 0px;
	margin: 0px;
}
a{
    text-decoration: none;
}
img{
	box-sizing: border-box;
    max-width: 100%;
    height: auto;
    vertical-align: middle;
    border: 0;
}
table{
	border-collapse:collapse;
	border-spacing:0;
}
.backBar {
	width:100%;
	height: 50px;
}

.backBar table {
	width: 100%;
	height: 50px;
	background-color: #FFF;
	font-size: 20px;
	color: #000;
}

.backBar table td {
	text-align: center;
	border-bottom: 1px solid #E6E6E6;
}

.backBar a {
	display: inline-block;
	width: 100%;	
	height: 100%;
	line-height: 50px;
	text-decoration: none;
}
.tab1 {
	width: 90%;
	margin:0 auto;
	border-bottom: 1px solid #ddd;
}

.tab1 td {
	line-height: 40px;
}

.tab1 .td1{
	color:#666;
	font-size: 13px;
}

.tab1 .td2 {
	text-align: right;
	color:#4d4d4d;
	font-size: 12px;
}

.c {
	
}
</style>
</head>
<body>
	<c:if test="${param.device==null||param.device=='' }">
		<div class="backBar">
		    <table>
		        <tbody>
		            <tr>
		               <td style="width:50px;"><a href="my_account.htm?tab=account&t=<%=new Date()%>"><img src="img/icon_fanhui.png" style="height: 40px;"></a></td>
		               <td>关于我们</td>
		               <td style="width:50px;"></td>            
		            </tr>
		        </tbody>
		    </table>
		</div>
    </c:if>
	<div style="text-align: center; margin-top: 20px;">
		<img src="img/abountuslogo.png" style="width: 45%;" />
	</div>
	<div class="c" >
		<table class="tab1">
			<tr>
				<td class="td1">公司名称</td>
				<td class="td2">杭州满溢网络科技有限公司</td>
			</tr>
		</table>
		<table class="tab1">
			<tr>
				<td class="td1">网站</td>
				<td class="td2">www.laicunba.com</td>
			</tr>
		</table>
		<table class="tab1">
			<tr>
				<td class="td1">邮箱</td>
				<td class="td2">services@laicunba.com</td>
			</tr>
		</table>
		<table class="tab1">
			<tr>
				<td class="td1">电话</td>
				<td class="td2"><a href="tel:4006191520" style="color: #FF5A2C;">400-6191-520(9:00~17:30)</a></td>
			</tr>
		</table>
		<table class="tab1">
			<tr>
				<td class="td1">问题反馈群</td>
				<td class="td2">473119359</td>
			</tr>
		</table>
		<table class="tab1">
			<tr>
				<td class="td1">微信服务号</td>
				<td class="td2">来存吧（ID:laicunba）</td>
			</tr>
		</table>
	</div>
</body>
<script>
	var version = '${param._app_version}';
	if(version!=null&&version!=''){
		document.getElementById('version').innerHTML='v'+version;
	}
</script>
</html>
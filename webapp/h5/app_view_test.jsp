<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>app_view测试</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp">
<link rel="stylesheet" type="text/css" href="css/mycss.css">
<script src="js/jquery.min.js"></script>
</head>
<body>
<c:if test="${param.device==null||param.device=='' }">
<div class="backBar">
    <table>
        <tbody>
            <tr>
               <td style="width:50px;"><a href="my_account.htm?tab=account&t=<%=new Date()%>">〈</a></td>
               <td>app_view测试</td>
               <td style="width:50px;"></td>            
            </tr>
        </tbody>
    </table>
</div>
</c:if>
<div class="help_con">
	<h5><a href="home.htm?tab=home&app_view=home&t=<%=new Date() %>">1、首页(app_view=home)</a></h5>
	<h5><a href="financial_zone.htm?tab=zone&app_view=zone&t=<%=new Date() %>">2、理财专区(app_view=zone)</a></h5>
	<h5><a href="my_account.htm?tab=account&app_view=acc&t=<%=new Date() %>">3、我的账户(app_view=acc)</a></h5>
	<h5><a href="sui_cun_bao_home.htm?app_view=scb&t=<%=new Date() %>">4、随存宝(app_view=scb)</a></h5>
	<h5><a href="financial_detail.htm?id=d07ec97b-08f5-4571-95c6-2c7de6ce01b0&app_view=detail&t=<%=new Date() %>">5、标的详情(app_view=detail)</a></h5>
	<h5><a href="invite_info.htm?device=app&app_view=login&t=<%=new Date() %>">6、未登录则(app_view=login)</a></h5>
</div>
</body>
</html>
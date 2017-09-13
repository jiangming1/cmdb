<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>详情</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
	<script src="js/jquery.min.js"></script>
</head>
<style>
body {
	background-color:#f2f2f2;
}

*{
	font-family: "微软雅黑";
	margin:0;
	padding:0;
	color:#4d4d4d;
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
.title{
	width:100%;
	height:100px;
	text-align:center;
	line-height: 90px;
	font-size:1.3em;
}
.gmtTime{
	position:relative;
	width:100%;
	text-align:center;
	top:-65px;
	font-size:0.7em;
}

.content{
	width:90%;
	background-color:#fff;
	margin:0 auto;
	padding:10px 5px 10px 9px;
	height:auto;
	color:#4d4d4d;
	font-size:0.9em;
	border-top:1px solid rgba(255,90,44,0.6);
	border-bottom:1px solid rgba(255,90,44,0.6);
	box-shadow:-1px 1px 5px #cecece,1px -1px 5px #cecece;
	overflow:auto;
	
}
</style>
<body>
	<c:if test="${param.device==null||param.device=='' }">
		<div class="backBar">
			<table>
				<tr>
					<td style="width: 50px;">〈</td>
					<td>详情</td>
					<td style="width: 50px;"></td>
				</tr>
			</table>
		</div>
	</c:if>
	<div class="title">${notificationDO.title}<br>
	<div class="gmtTime"><fmt:formatDate value="${notificationDO.gmtWrite}" pattern="yyyy/MM/dd HH:mm"/></div>
	</div>
	<div class="content">${notificationDO.content}</div>
</body>
<script type="text/javascript">
	var divheight = $(window).height();
		$(".content").css("height",divheight-180+"px");
</script>
</html>
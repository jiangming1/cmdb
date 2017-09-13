<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>新手宝</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="css/lcb_wx_common.css?201602291" />
<style type="text/css">
* {
	font-family: "微软雅黑";
}
.tips-content {
	width: 100%;
	padding-top: 111px;
	text-align: center;
}

.tips-text1 {
	padding-top: 40px;
	color: #4d4d4d;
	font-size: 18px;
}

.tips-text2 {
	padding-top: 20px;
	color: #999;
	font-size: 16px;
}
</style>
</head>
<body>
	<c:if test="${param.device==null||param.device=='' }">
		<div class="backBar">
			<table>
				<tr>
					<td style="width: 50px;"><a href="financial_zone.htm?tab=zone&t=<%=new Date()%>">〈</a></td>
					<td>新手宝</td>
					<td style="width: 50px;"></td>
				</tr>
			</table>
		</div>
	</c:if>
	<div class="tips-content">
		<img src="img/old_driver.png" style="width: 50%;" />
		<div class="tips-text1">
			<span>卖完了,去看看其它的吧!</span>
		</div>
		<div class="tips-text2">
			<span>3秒后返回理财专区</span>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	var time = 3;
	$(function() {
		setInterval(function() {
			if(time > 1) {
				time--;
				$(".tips-text2 span").text(time + "秒后返回理财专区");
			} else {
				window.location.href = "financial_zone.htm?tab=zone&app_view=zone&t=<%=new Date()%>";
			}
		}, 1000);
	});
</script>
</html>
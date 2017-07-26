<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>生产环境请求监控(生产2)</title>
<script type="text/javascript" src="../js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="request_listener.js"></script>
<style type="text/css">
body {
	background-color: black;
	color: white;
}

ul {
	padding: 0px;
	list-style: none;
}

.count, .time {
	display: inline-block;
	width: 80px;
}

.secend, #ipCount {
	color: gray;
}
</style>
</head>
<body>
	<table style="width: 100%;">
		<tr>
			<c:if test="${param.hide!='uri' }">
				<td valign="top">
					<div>
						Request Visit Top (<span class="secend" id="requestSecend">0</span>)"
						&nbsp;&nbsp;&nbsp;<span id="URIVisitCount">0</span>
						&nbsp;&nbsp;&nbsp; <span id="URIVisitTime">0</span>
						&nbsp;&nbsp;&nbsp; <span id="CPUUsed">0</span>
					</div>
					<ul id="URITOP">
					</ul>
				</td>
			</c:if>
			<c:if test="${param.hide!='ip' }">
				<td valign="top">
					<div>
						(<span id="ipCount">0</span>) IPs Visit Top (<span class="secend">0</span>)"
					</div>
					<ul id="IPTOP">
					</ul>
				</td>
			</c:if>
		</tr>
	</table>

</body>
</html>
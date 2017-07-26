<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据库查询</title>
<script type="text/javascript" src="../js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="product_version.js"></script>
<style type="text/css">
.case_name {
	font-weight: bold;
	color: teal;
}

td {
	padding: 6px;
	border: 1px solid gray;
	border-top: 0px;
	border-left: 0px;
}

* {
	font-family: "微软雅黑";
}

th {
	border: 1px solid gray;
	border-top: 0px;
	border-left: 0px;
	padding: 6px;
}

.value {
	color: gray;
	text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.65);
}

.column {
	font-weight: bold;
	display: inline-block;
	margin-right: 10px;
	margin-left: 10px;
	color: #000033;
}
</style>
</head>
<body>

	<c:forEach var="features" items="${product_version_list }">
		<h4>版本: ${features[0].product_name }(${features[0].version_code }) ,状态: ${features[0].version_status }</h4>
		<table border="0" style="margin-top: 20px; border: 1px solid gray;" cellspacing="0" cellpadding="0">
			<thead>
				<tr>
					<th>序</th>
					<th>类型</th>
					<th>Feature名称</th>
					<th>状态</th>
					<th>优先级</th>
					<th>设计完?</th>
					<th>开发完?</th>
					<th>测试完?</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${features }" var="feature" varStatus="index">
					<tr>
						<td class="">${index.index+1 }</td>
						<td class=""><c:choose>
								<c:when test="${feature.type=='new_feature' }">新功能</c:when>
								<c:when test="${feature.type=='bug' }">BUG</c:when>
								<c:when test="${feature.type=='upgrade' }">改进</c:when>
								<c:otherwise>${feature.type }</c:otherwise>
							</c:choose></td>
						<td><span class="case_name ">【${feature.case_name }】</span> <span class="value">${feature.feature_name }</span></td>
						<td>${feature.status }</td>
						<td>${feature.priority }</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:forEach>
</body>
</html>
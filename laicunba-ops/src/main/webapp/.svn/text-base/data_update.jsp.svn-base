<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="data_update.js"></script>
<style type="text/css">
body {
	
}

#sqlSummary {
	width: 100%;
}

#sqlInput {
	width: 100%;
	height: 90px;
}
</style>
</head>
<body>
	<div style="font-weight: bold;">数据订证</div>
	<input id="sqlSummary" placeholder="备注说明" />
	<textarea id="sqlInput" placeholder="请填写update,insert,delete语句,请保证只能更新少于10条数据"></textarea>
	<button id="btnSave">提交订证申请</button> 需要查询?<a href="dbQuery.jsp">请移步这里</a>
	<table border="1" style="margin-top: 50px;">
		<thead>
			<tr>
				<th>创建时间</th>
				<th>说明</th>
				<th>SQL</th>
				<th>状态</th>
				<th>影响行数</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${updateSqlDOList }" var="sql">
				<tr>
					<td>${sql.gmtCreate }</td>
					<td>${sql.summary }</td>
					<td>${sql.sql }</td>
					<td>${sql.status }</td>
					<td>${sql.effectRows }</td> 
					<td> 
						<c:if test="${empty sql.status}">
							<button class="btnExecute" sql_id="${sql.id }">执行</button>
						</c:if> 
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
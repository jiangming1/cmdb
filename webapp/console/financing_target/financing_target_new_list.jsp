<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta charset="utf-8">
<link href="https://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
.money {
	text-align: right !important;
}
</style>
</head>
<body style="padding: 10px;">


	<table class="table table-hover">
		<thead>
			<tr>
				<th>序</th>
				<th>标的名称</th>
				<th>融资金额</th>
				<th>理财期限</th>
				<th>年化利率</th>
				<th>起投金额</th>
				<th>每人限购</th>
				<th>计息方式</th>
				<th>开始时间</th>
				<th>结束时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${financingTargetDOList }" var="financingTargetDO" varStatus="row">
				<tr data_id="${financingTargetDO.id }">
					<td>${row.index+1 }</td>
					<td>${financingTargetDO.name }(${financingTargetDO.code })</td>
					<td class="money">${financingTargetDO.collectAmount }</td>
					<td>${financingTargetDO.period }天</td>
					<td>${financingTargetDO.annualizedRates }%</td>
					<td class="money">${financingTargetDO.minAmount }元</td>
					<td class="money">${financingTargetDO.limitAmount }元</td>
					<td>${financingTargetDO.interestWay }</td>
					<td><fmt:formatDate value="${financingTargetDO.beginDate }" type="date" /></td>
					<td><fmt:formatDate value="${financingTargetDO.endDate }" type="date" /></td>
					<td>
						<button class="btn btn-primary btn2Checking">送审</button>
						<button class="btn btn-danger btnGiveUp">废弃</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<script src="../../static/jquery-1.11.0.js"></script>
	<script src="../../static/bootstrap2/js/bootstrap.min.js"></script>
	<script src="financing_target_new_list.js"></script>
</body>
</html>
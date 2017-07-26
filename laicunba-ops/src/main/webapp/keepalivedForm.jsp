<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<script type="text/javascript">
	$(function() {
		$("#btnBack").click(function() {
			window.history.back();
		});
	});
</script>
<style type="text/css">
#table1 td {
	padding: 5px;
}
</style>
</head>
<body>
	<button id="btnBack">返回</button>
	<form action="saveKeepalivedPoint.htm" method="post">
		<input type="hidden" name="key" value="${param.id }" />
		<input type="hidden" name="env" value="${param.env }" />
		<table id="table1" border="1">
			<tr>
				<td>KEY</td>
				<td>${param.id }</td>
			</tr>
			<tr>
				<td>名称</td>
				<td><input type="text" name="cnName" value="${keepalivedPoint.cnName }" /></td>
			</tr>
			<tr>
				<td>用户类型</td>
				<td><select name="userType">
						<option>投资者</option>
						<option>运营</option>
						<option>清算</option>
						<option>财务</option>
						<option>定时器</option>
						<option>其它</option>
					</select></td>
			</tr>
			<tr>
				<td>等级</td>
				<td><select name="level">
						<option>一般</option>
						<option>重要</option>
						<option>重要(与钱相关)</option>
						<option>轻</option>
					</select></td>
			</tr>
			<tr>
				<td>类型</td>
				<td><select name="type">
						<option>功能</option>
						<option>缺陷</option>
					</select></td>
			</tr>
			<tr>
				<td>负责人</td>
				<td><input name="owner" type="text" value="${keepalivedPoint.owner }" /></td>
			</tr>
			<tr>
				<td>阈值</td>
				<td><input name="interval" type="text" value="0" value="${keepalivedPoint.interval }" /></td>
			</tr>
			<tr>
				<td></td>
				<td><button type="submit">保存</button></td>
			</tr>
		</table>
	</form>
</body>
</html>
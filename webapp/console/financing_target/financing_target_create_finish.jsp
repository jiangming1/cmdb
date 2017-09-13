<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta charset="utf-8">
<link href="https://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="padding: 10px;">
	<input type="hidden" id="targetIdInput" value="${financingTargetDO.id }" />
	<c:if test="${financingTargetDO.status=='new' || financingTargetDO.status=='checking' }">
		<button id="btnCheck" class="btn btn-primary">审核并发布</button>
	</c:if>
	<c:if test="${financingTargetDO.status=='new'   }">
		<button id="btn2Checking" target_id="${financingTargetDO.id }" class="btn">送审</button>
	</c:if>
	<a class="btn" href="financing_target_create.jsp">继续创建</a>

	<script src="../../static/jquery-1.11.0.js"></script>
	<script src="../../static/md5.js"></script>
	<script src="../../static/bootstrap2/js/bootstrap.min.js"></script>
	<script src="financing_target_create_finish.js"></script>
</body>
</html>
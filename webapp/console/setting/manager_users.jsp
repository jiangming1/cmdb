<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<title>工作人员,权限管理</title>
<style type="text/css">
html, body {
	height: 100%;
	margin: 0px;
	padding: 0px;
}

.select {
	width: 100%;
	height: 300px;
	background-color: #eee;
}

#table1 td {
	vertical-align: top;
}

#tr2 td {
	vertical-align: bottom;
}

.select-usr, .select-action {
	background-color: #BCD2EE;
}

.select-action-all {
	background-color: #FFFACD;
}
#titleTr td{ 
	vertical-align: middle;
}
#titleTr {
	height: 35px;
}
</style>
</head>
<body>
	<div style="width: 2200px; height: 100%;">
		<table id="table1" style="height: 100%;" cellspacing="0" cellpadding="0">
			<tbody>
				<tr id="titleTr">
					<td>&nbsp;角色
						<button id="btnCreateRole">创建</button>
						<button id="btnDropRole">删除</button>
					</td>
					<td>用户
						<button id="btnCreateUsr">创建</button>
						<button id="btnDropUsr">删除</button>
						<button id="btnResetUsrPwd">重置密码</button>
					</td>
					<td>一级菜单
						<button id="btnMenuCreate">+</button>
						<button id="btnMenuDrop">-</button>
					</td>
					<td>二级菜单
						<button id="btnMenu2Create">+</button>
						<button id="btnMenu2Drop">-</button>
					</td>
					<td>拥有的权限
						<button id="btnDrop">删除权限</button>
					</td>
					<td>可授权限
						<button id="btnGrant">授权</button>
						<button id="btnSynActionTab">同步Action表</button>
					</td>
				</tr>

				<tr id="tr2">
					<td style="width: 200px;"><select id="select-role" class="select select-role" multiple="multiple"></select></td>
					<td style="width: 250px;"><select class="select select-usr" multiple="multiple">
						</select></td>
					<td style="width: 200px;"><select class="select select-0-level-menu" multiple="multiple"></select></td>
					<td style="width: 450px;"><select class="select select-1-level-menu" multiple="multiple"></select></td>
					<td style="width: 600px;"><select class="select select-action" multiple="multiple"></select></td>
					<td style="width: 600px;"><select class="select select-action-all" multiple="multiple"></select></td>

				</tr>
			</tbody>
		</table>
	</div>
</body>
<script src="../../static/jquery-1.11.0.js"></script>
<script src="manager_users.js"></script>
</html>
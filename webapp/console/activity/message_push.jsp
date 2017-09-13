<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>发送推送消息</title>
<style type="text/css">
#messageTable {
	width: 100%;
	height: 100%;
}

#leftScreen {
	width: 300px;
	padding: 10px;
}

#leftScreen input, #leftScreen  textarea {
	width: 95%;
}

#messageList th, #messageList td {
	text-align: left;
	border-bottom: 1px solid gray;
	padding: 5px;
}

#messageList table {
	width: 100%;
}
</style>
</head>
<body>
	<input type="hidden" id="inputH5Root" value="${h5path}" />
	<div style="height: 50px;" id="formSwitch">
		<input type="radio" name="radio1" value="1" />模版消息推送 <input type="radio" name="radio1" value="2" />自定义发送(高级)
	</div>
	<table id="messageTable" border="1">
		<tr>
			<td valign="top" id="leftScreen"><input type="text" placeholder="ID" id="inputId" /> <input type="text" placeholder="标题" id="inputTitle" />
				<div style="display: none;">变量: TrueName:真实姓名,Mobile:手机号码</div> <textarea id="inputMsg" style="height: 350px;" placeholder="请输入内容"></textarea>

				<div>
					<button id="btnSaveMessage">保存</button>

					<button id="btnSendAllUsr">推送所有用户</button>
				</div>
				<div>
					<input placeholder="手机号码" id="mobileInput"></input>
					<textarea style="height: 40px; display: none;" id="jpushIdInput" placeholder="pushId,pushId"></textarea>
					<button id="btnSend2User">推送指定用户</button>
				</div></td>
			<td valign="top" id="messageList">
				<table cellspacing="0" cellpadding="0">
					<thead>
						<tr>
							<th></th>
							<th>ID</th>
							<th>日期</th>
							<th>标题</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="templateTbody">
						<tr>
							<td><input type="radio" name="radioId" class="radio" /></td>
							<td class="id">ID</td>
							<td class="gmtCreate">日期</td>
							<td class="title">标题</td>
							<td>
								<button class="btnDel">删除</button>
							</td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
	</table>
	<table id="form2" style="display: none;">
		<tr>
			<td></td>
			<td><h4>消息推送</h4></td>
		</tr>
		<tr>
			<td>手机号码</td>
			<td><input id="mobileInput" /></td>
		</tr>
		<tr>
			<td>title</td>
			<td><input id="titleInput" /></td>
		</tr>
		<tr>
			<td>subTitle</td>
			<td><input id="subTitleInput" /></td>
		</tr>
		<tr>
			<td>href</td>
			<td><input id="hrefInput" /></td>
		</tr>
		<tr>
			<td>app_view</td>
			<td><select id="appViewSelect">
					<option value=""></option>
					<option value="home">home-首页</option>
					<option value="d">d-定期理财</option>
					<option value="h">h-活期理财</option>
					<option value="account">account-我的</option>
					<option value="invite">invite-邀请好友</option>
					<option value="coupon">coupon-红包</option>
					<option value="feedback">feedback-意见返馈</option>
					<option value="detail">detail , 标的ID-标的详情</option>
				</select></td>
		</tr>
		<tr id="targetIdTr" style="display: none;">
			<td>标的ID</td>
			<td><input id="targetIdInput" /></td>
		</tr>
		<tr>
			<td></td>
			<td><button id="btnSubmit">确认推送指定用户</button><button id="btnSubmit2allusr">确认推送给所有用户</button></td>
		</tr>
	</table>
</body>
<script src="../../static/jquery-1.11.0.js"></script>
<script src="message_push.js"></script>
<script type="text/javascript">
	$(function() {

		$("#formSwitch").find("input").click(function() {
			if ($(this).val() == "1") {
				$("#messageTable").show();
				$("#form2").hide();
			} else {
				$("#messageTable").hide();
				$("#form2").show();
			}
		});

		$("#appViewSelect").change(function() {
			if ($(this).val() == 'detail') {
				$("#targetIdTr").show();
			} else {
				$("#targetIdTr").hide();

			}
		});


	});
</script>
</html>
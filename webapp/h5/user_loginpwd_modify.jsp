<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>来存吧-修改登录密码</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="css/lcb_wx_common.css?201604141" />
<style type="text/css">
body {
	background-color: #eee;
	padding: 10px;
	font-family: "微软雅黑";
}

.input1 {
	width: 100%;
	margin-top: 10px;
}

#btnUpdatePwd {
	width: 100%;
	margin-top: 10px;
}

.errorInfo {
	color: red;
	float: left;
	display: none;
}
.pwd-fgt {
	margin-top: 10px;
	font-weight: bold;
	text-align:right;
}
.pwd-fgt a {
	color: #45a1fd;
	font-weight: bold;
}
.pwd-tips {
	width: 100%;
	text-align:center;
	padding: 10px 0;
}
</style>
</head>
<body>
	<input class="input1 form-control" placeholder="原密码" type="password" id="oldPwdInput" />
	<input class="input1 form-control" placeholder="新密码" type="password" id="newPwd1Input" />
	<input class="input1 form-control" placeholder="确认新密码" type="password" id="newPwd2Input" />
	<div class="errorInfo"></div>
	<div class="pwd-fgt"><a href="forget_loginpwd.jsp">忘记密码</a></div>
	<div class="pwd-tips"><span>密码为6-16位字符，建议使用数字、字母组合</span></div>
	<button class="btn btn-warning" id="btnUpdatePwd" style="color: #fff; background-color: #f0ad4e; border-color: #eea236; line-height: 0;">修改密码</button>
	<jsp:include page="lcb_wx_common.jsp"></jsp:include>
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="../static/md5.js"></script>
	<script type="text/javascript" src="lcb_wx_common.js?201604141"></script>
	<script type="text/javascript">
		$(function() {
			$("#btnUpdatePwd").click(function() {
				var p = {
					t : new Date(),
					oldPwd : $("#oldPwdInput").val(),
					newPwd : $("#newPwd1Input").val(),
					newPwd2 : $("#newPwd2Input").val()
				};

				if (!p.oldPwd) {
					$(".errorInfo").text("原密码不允许为空").show();
					$("#oldPwdInput").focus();
					return;
				}
				if (!p.newPwd) {
					$(".errorInfo").text("新密码不允许为空").show();
					$("#newPwd1Input").focus();
					return;
				}
				if(p.newPwd.length < 6 || p.newPwd.length > 16 || !(/^[A-Za-z0-9]+$/.test(p.newPwd))) {
					$(".errorInfo").text("新密码长度应为6-16位的数字或字母").show();
					$("#newPwd1Input").focus();
					return;
				}
				if (!p.newPwd2) {
					$(".errorInfo").text("确认密码不允许为空").show();
					$("#newPwd2Input").focus();
					return;
				}
				if (p.newPwd != p.newPwd2) {
					$(".errorInfo").text("确认密码输入错误!").show();
					$("#newPwd2Input").focus();
					return;
				}
				$(".errorInfo").text("").hide();
				p.oldPwd = MD5(p.oldPwd);
				p.newPwd = MD5(p.newPwd);

				$.post("modify_loginpwd.htm", p, function(data) {
					if (data.code == "NOT_LOGIN") {
						$(".errorInfo").text("登录超时，请重新登录").show();
						window.location = "login.htm?tab=account&returnUrl=user_loginpwd_modify.jsp&t=" + new Date();
					} else if (data.code == "OLD_PWD_ERROR") {
						$(".errorInfo").text("原密码输入错误!").show();
						$("#oldPwdInput").focus();
					} else if (data.code == "THE_SAME_PWD") {
						$(".errorInfo").text("新密码不允许和原密码相同!").show();
						$("#newPwdInput").focus();
					} else if (data.code == "true") {
						alertT(1, "修改密码", "密码修改成功！");
						setTimeout(function() {
							window.location = "my_account.htm?tab=account&t=" + new Date();
						}, 4001);
					}
				}, "json");
			});
		});
	</script>
</body>
</html>
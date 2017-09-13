<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="../../static/jquery-1.11.0.js"></script>
<script src="../../static/md5.js"></script>
</head>
<body>
	<h4>开通复利账户</h4>
	<div style="font-size: 20px; color: red">客服请不要操作该功能,用户可以自己在APP上操作</div>
	<input id="mobile" />
	<br />
	<button id="btnConfirm">开通,并将所有的随存宝转入复利活期账户</button>
</body>
<script type="text/javascript">
	$(function() {

		$("#btnConfirm").click(function() {

			var checkPwd = window.prompt("确认密码");
			if (!checkPwd) {
				return;
			}
			var p = {
				t : new Date(),
				mobile : $("#mobile").val().trim(),
				pwd : MD5(checkPwd)
			};
			$.post("do_init_and_transfer_bid_scb_2_current_account.htm", p, function(data) {
				alert(JSON.stringify(data));
			}, "json");
		});
	});
</script>
</html>
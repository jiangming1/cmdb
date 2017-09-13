<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<title>暂停交易设置</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta charset="utf-8">
<style type="text/css">
body {
	margin: 20px;
}

.btn {
	height: 50px;
	width: 200px;
}

#divOpend, #divClosed {
	display: none;
}
</style>
</head>
<body>
	<span style="font-size: 20px; color: blue;">本功能用于暂停用户的主要更新类操作(比如:购买,提现,定活转换,新用户注册,找回密码,设置密码等),不影响登录,查看利息</span>
	<div style="font-size: 20px; color: red;">注意,不要随意开启,用于数据迁移,或者特殊情况处置(比如黑客攻击)</div>
	<div style="text-align: center; margin-top: 30px;">
		<div style="color: yellow;font-size: 40px;">有0~60秒的本地缓存延时</div>
		<div>购买页面弹出层内容:</div>
		<textarea style="width: 300px; height: 50px;" id="bidPopMsg"></textarea>
		<div id="divOpend">
			<div style="font-size: 30px;">
				[状态]<span style="color: green;">交易正常进行</span>
			</div>
			<button class="btn" id="btnClose">关闭</button>
		</div>
		<div id="divClosed">
			<div style="font-size: 30px;">
				[状态]<span style="color: red;">交易已关闭</span>
			</div>
			<button class="btn" id="btnOpen">开启</button>
		</div>
	</div>
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

	<script type="text/javascript">
		$.post("get_transfer_status.htm", {
			t : new Date()
		}, function(data) { 
			if(data.bidPopMsg&&data.bidPopMsg!="1"){
				$("#divClosed").show();
				$("#bidPopMsg").val(data.bidPopMsg);
			}else{ 
				$("#divOpend").show();
			}
		}, "json");
		$("#btnClose").click(function() {
			var p = {
				t : new Date(),
				bidPopMsg : $("#bidPopMsg").val().trim()
			};
			if (!p.bidPopMsg) {
				$("#bidPopMsg").focus();
				return;
			}
			if (window.confirm("确认关闭交易?")) {
				$.post("close_transfer.htm", p, function(data) {
					if (data.success) {
						$("#divClosed").show();
						$("#divOpend").hide();
					} else {
						alert(JSON.stringify(data));
					}
				}, "json");
			}
		});
		
		$("#btnOpen").click(function() {
			var p = {
				t : new Date() 
			}; 
			if (window.confirm("确认开启交易?")) {
				$.post("open_transfer.htm", p, function(data) {
					if (data.success) {
						$("#divClosed").hide();
						$("#divOpend").show();
					} else {
						alert(JSON.stringify(data));
					}
				}, "json");
			}
		});
	</script>
</body>
</html>



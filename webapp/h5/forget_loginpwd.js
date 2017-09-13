var pubkey=null;
$(function() {
	pubkey = $("#pubkeyInput").val().trim();
	$("#btnGetVerfityCode").click(function() {
		if (/^[0-9]+$/.test($(this).html().trim())) {
			return;
		}
		var p = {
			t : new Date(),
			verifyType : "RESET_LOGINPWD",
			mobile : $("#mobileInput").val()
		};
		if (!p.mobile) {
			$("#mobileInput").focus();
			return;
		}
		if (!/^1[0-9]{10}$/.test(p.mobile)) {
			$(".errorInfo").text("手机号不正确!").show();
			return;
		}
		$.post("../api/send_mobile_verifycode.htm", p, function(data) {
			if (data.code == "SUCCESS") {

				$("#btnGetVerfityCode").html("60");
				TimmerTool.timmerId = window.setInterval(TimmerTool.countRemaining, 1000);
			}else if(data.code=="PIC_VERIFYCODE_ERROR"){
				alert("验证码错误");
			}else if(data.code=="MSG_AMOUNT_LIMITED"){
				alert("您发太多次了,请稍后再试");
			}else{
				alert(data.code);
			}
		}, "json");
	});

	$("#btnSubmit").click(function() {
		$(".errorInfo").html("");
		var p = {
			t : new Date(),
			mobile : $("#mobileInput").val(),
			verifyCode : $("#verifyCodeInput").val(),
			newPwd : $("#newPwdInput").val(),
			newPwd2 : $("#newPwd2Input").val()
		};
		if (!p.mobile) {
			$("#mobileInput").focus();
			return;
		}
		if (!/^1[0-9]{10}$/.test(p.mobile)) {
			$(".errorInfo").text("手机号不正确!").show();
			return;
		}
		if (!p.verifyCode) {
			$("#verifyCodeInput").focus();
			return;
		}
		if (!p.newPwd) {
			$(".errorInfo").text("新密码不允许为空").show();
			$("#newPwdInput").focus();
			return;
		}
		if(p.newPwd.length < 6 || p.newPwd.length > 16 || !(/^[A-Za-z0-9]+$/.test(p.newPwd))) {
			$(".errorInfo").text("新密码长度应为6-16位的数字或字母").show();
			$("#newPwdInput").focus();
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
		var jsEncrypt=new JSEncrypt();
		jsEncrypt.setPublicKey(pubkey);
		p.newPwd = jsEncrypt.encrypt(p.newPwd+"|"+new Date().getTime());
		
		$.post("reset_loginpwd.htm", p, function(data) {
			if (data.code == "VERIFY_CODE_ERROR") {
				$(".errorInfo").text("验证码错误").show();
			} else if (data.code == "USER_NOT_EXIST") {
				$(".errorInfo").text("用户不存在").show();
			} else if (data.code == "true") {
				
				var jsEncrypt=new JSEncrypt();
				jsEncrypt.setPublicKey(pubkey);
				var loginPwd = jsEncrypt.encrypt($("#newPwdInput").val().trim()+"|"+new Date().getTime());
				var loginForm = $("#loginForm");
				loginForm.find("[name='mobile']").val(data.mobile);
				loginForm.find("[name='loginPwd']").val(loginPwd);
				loginForm.submit();
				
			}
		}, "json");
	});

});

var TimmerTool = {
	timmerId : null,
	i : 60,
	countRemaining : function() {
		var str = $("#btnGetVerfityCode").html();
		if (!/^[0-9]+$/.test(str)) {
			TimmerTool.i = 60;
		}
		TimmerTool.i = TimmerTool.i - 1;
		if (TimmerTool.i <= 0) {
			window.clearInterval(TimmerTool.timmerId);
			$("#btnGetVerfityCode").html("获取短信验证码");
			return;
		}
		$("#btnGetVerfityCode").html(TimmerTool.i);
	}
};
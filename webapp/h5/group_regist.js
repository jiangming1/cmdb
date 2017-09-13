$(function() {
	$("#btnGetVerfityCodeNew").click(function() {
		if (/^[0-9]+$/.test($(this).html().trim())) {
			return;
		}
		var p = {
			t : new Date(),
			verifyType : "REGIST",
			mobile : $("#mobileInput").val()
		};
		if (!p.mobile) {
			$("#mobileInput").focus();
			return;
		}
		if (!/^1[0-9]{10}$/.test(p.mobile)) {
			alertT(3, "注册账户", "手机号不正确!");
			return;
		}

/*		$("#btnGetVerfityCodeNew").html("60");*/
		TimmerToolNew.timmerId = window.setInterval(TimmerToolNew.countRemaining, 1000);
		$.post("../api/send_mobile_verifycode.htm", p, function(data) {

		}, "json");
	});

	$("#btnRegistNew").click(function() {
		$(".errorInfo").html("");
		var p = {
			t : new Date(),
			mobile : $("#mobileInput").val(),
			inviteFrom : $("#inviteFromInput").val(),
			loginPwd : $("#loginPwdInput").val().trim(),
			verifyCode : $("#verifyCodeInput").val()
		};
		if (!p.mobile) {
			$("#mobileInput").focus();
			return;
		}
		if (!/^1[0-9]{10}$/.test(p.mobile)) {
			alertT(3, "注册账户", "手机号不正确!");
			return;
		}
		if (!p.loginPwd) {
			$("#loginPwdInput").focus();
			return;
		}
		if (!p.verifyCode) {
			$("#verifyCodeInput").focus();
			return;
		}

		p.loginPwd = MD5(p.loginPwd);
		$.post("regist.htm", p, function(data) {
			if (data.code == "VERIFY_CODE_ERROR") {
				$("#verifyCodeInputInfo").html("验证码错误");
			} else if (data.code == "USER_EXIST") {
				$("#mobileInputInfo").html("该手机已注册");
			} else if (data.code == "true") {
				window.location.href="group_reg_success.jsp";
			}
		}, "json");
	});
	
});

var TimmerToolNew = {
		timmerId : null,
		i : 60,
		countRemaining : function() {
			var str = $("#btnGetVerfityCodeNew").html();
			if (!/^[0-9]+$/.test(str)) {
				TimmerToolNew.i = 60;
			}
			TimmerToolNew.i = TimmerToolNew.i - 1;
			if (new Number(TimmerToolNew.i) <= 0) {
				window.clearInterval(TimmerToolNew.timmerId);
				$("#btnGetVerfityCodeNew").html("再次获取");
				return;
			}
			$("#btnGetVerfityCodeNew").html(TimmerToolNew.i);
		}
	};
var PicVerifyService={
	refresh:function(){
		var param = {
				t:new Date(),
				mobile:$("#mobileInput").val().trim()
			};
		if(!param.mobile){
			$("#mobileInput").focus();
			return ;
		}
		$.post("../api/get_pic_verifycode.jhtm",param,function(data){ 
			if(data!="none"){ 
				$("#imgVerifyCode").prop("src","data:image/png;base64,"+data);
				$("#imgVerifyCodeBox").show();
				PicVerifyService.needRefresh=false;
			}else{
				PicVerifyService.needPicVerifyCode=false;
			}
		},"text"); 
	},
	needPicVerifyCode:true,
	needRefresh:true
};

$(function() {
	$("#btnGetVerfityCode").click(function() {
		if (/^[0-9]+$/.test($(this).html().trim())) {
			return;
		}
		
		
		var p = {
			t : new Date(),
			verifyType : "REGIST",
			mobile : $("#mobileInput").val(),
			picVerifyCode:$("#picVerifyCodeInput").val().trim()
		};
		if (!p.mobile) {
			$("#mobileInput").focus();
			return;
		}
		if (!/^1[0-9]{10}$/.test(p.mobile)) {
			alertT(3, "注册账户", "手机号不正确!");
			return;
		} 
		
		if(PicVerifyService.needPicVerifyCode&&PicVerifyService.needRefresh){
			PicVerifyService.refresh();
			$("#picVerifyCodeInput").val("");
			$("#picVerifyCodeInput").focus();
			return ;
		}
		
		if (PicVerifyService.needPicVerifyCode&&!p.picVerifyCode) {
			$("#picVerifyCodeInput").focus();
			return;
		}
		$.post("judge.htm", p, function(data) {
			if (data.code == "USER_EXIST") {
				$("#mobileInputInfo").html("该手机已注册");
				$("#mobileInput").focus();
			}else{
        $("#btnGetVerfityCode").prop("disabled",true);
		$.post("../api/send_mobile_verifycode.htm", p, function(data) {
			if(data.code=="SUCCESS"){ 
				TimmerTool.timmerId = window.setInterval(TimmerTool.countRemaining, 1000);
				return ;
			}else if(data.code=="PIC_VERIFYCODE_ERROR"){
				alert("验证码错误");
			}else if(data.code=="MSG_AMOUNT_LIMITED"){
				alert("您发太多次了,请稍后再试");
			}else{
				//alert(data.code);
			}
			$("#btnGetVerfityCode").prop("disabled",false);
		}, "json");
			}
		}, "json");
	});
	
	
 
	$("#btnRefreshPicVerifyCode").click(function(){
		PicVerifyService.refresh();
	});
	
	$("#btnRegist").click(function() {
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
 
		var jsEncrypt=new JSEncrypt();
		jsEncrypt.setPublicKey($("#pubkeyInput").val().trim());
		p.loginPwd = jsEncrypt.encrypt(p.loginPwd+"|"+new Date().getTime()); 

		
		$.post("regist.htm", p, function(data) { 
			
			if (data.code == "VERIFY_CODE_ERROR") {
				$("#verifyCodeInputInfo").html("验证码错误");
			} else if (data.code == "USER_EXIST") {
				$("#mobileInputInfo").html("该手机已注册");
			} else if (data.code == "true") {
				
				var jsEncrypt=new JSEncrypt();
				jsEncrypt.setPublicKey($("#pubkeyInput").val().trim());
				var loginPwd = jsEncrypt.encrypt($("#loginPwdInput").val().trim()+"|"+new Date().getTime()); 
				var loginForm = $("#loginForm");
				loginForm.find("[name='mobile']").val(data.mobile);
				loginForm.find("[name='loginPwd']").val(loginPwd);
				loginForm.submit();

			}

		}, "json");
	});

	
});

function lostFocus(){
	$(".errorInfo").html("");
	var p = {
		t : new Date(),
		mobile : $("#mobileInput").val(),
	};
	if (!p.mobile) {
		$("#mobileInput").focus();
		return;
	}
	$.post("judge.htm", p, function(data) {
		if (data.code == "USER_EXIST") {
			$("#mobileInputInfo").html("该手机已注册");
			$("#mobileInput").focus();
		}else{
			PicVerifyService.refresh();
		}
	}, "json");
	
}

var TimmerTool = {
	timmerId : null,
	i : 60,
	countRemaining : function() {
		var str = $("#btnGetVerfityCode").html();
		if (!/^[0-9]+$/.test(str)) {
			TimmerTool.i = 59;
		}
		TimmerTool.i = TimmerTool.i - 1;
		if (TimmerTool.i <= 0) {
			window.clearInterval(TimmerTool.timmerId);
			$("#btnGetVerfityCode").html("获取短信验证码");
			$("#btnGetVerfityCode").prop("disabled",false);
			PicVerifyService.needRefresh=true;
			return;
		}
		$("#btnGetVerfityCode").html(TimmerTool.i);
	}
};


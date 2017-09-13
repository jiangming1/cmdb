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
		$(".reg-form").css('background','url(img/llb_reg_bg202.png) no-repeat');
		$(".reg-form").css('background-size','100%');
		$(".form-row_llb").css('padding-top','17%');
		$(".reg-content").css('height','370px')
		$.post("../../api/get_pic_verifycode.jhtm",param,function(data){ 
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
			alertT(3, "注册账户", "手机号不允许为空!");
			$("#mobileInput").focus();
			return;
		}
		if (!/^[1][34578][0-9]{9}$/.test(p.mobile)) {
			alertT(3, "注册账户", "手机号不正确!");
			$("#mobileInput").focus();
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


		$("#btnGetVerfityCode").prop("disabled",true);
		$.post("../../api/send_mobile_verifycode.htm", p, function(data) {
			if(data.code=="SUCCESS"){ 
				TimmerTool.timmerId = window.setInterval(TimmerTool.countRemaining, 1000);
				return ;
			}else if(data.code=="PIC_VERIFYCODE_ERROR"){
				alertT(2, "注册账户", "验证码错误!");
			}else if(data.code=="MSG_AMOUNT_LIMITED"){
				alertT(2, "注册账户", "您的短信发送频率超限!");
			}else{
				alert(data.code);
			}
			$("#btnGetVerfityCode").prop("disabled",false);
		}, "json");
	});
	
	$("#btnRefreshPicVerifyCode").click(function(){
		PicVerifyService.refresh();
	});

	$("#btnRegist").click(function() {
		var p = {
			t : new Date(),
			mobile : $("#mobileInput").val(),
			loginPwd : $("#loginPwdInput").val().trim(),
			verifyCode : $("#verifyCodeInput").val(),
			_channel : "liuliangbao_activity"
		};
		if (!p.mobile) {
			alertT(3, "注册账户", "手机号不允许为空!");
			$("#mobileInput").focus();
			return;
		}
		if (!/^[1][34578][0-9]{9}$/.test(p.mobile)) {
			alertT(3, "注册账户", "手机号不正确!");
			$("#mobileInput").focus();
			return;
		}
		if (!p.loginPwd) {
			alertT(3, "注册账户", "手机号不正确!");
			$("#loginPwdInput").focus();
			return;
		}
		if (!p.verifyCode) {
			alertT(3, "注册账户", "验证码不允许为空!");
			$("#verifyCodeInput").focus();
			return;
		}
 
		
		var jsEncrypt=new JSEncrypt();
		jsEncrypt.setPublicKey($("#pubkeyInput").val().trim());
		p.loginPwd = jsEncrypt.encrypt(p.loginPwd+"|"+new Date().getTime());
		
		$.post("../../api/user_regist_20.htm", p, function(data) {
			if(data.code=="SUCCESS") {
				
				var jsEncrypt=new JSEncrypt();
				jsEncrypt.setPublicKey($("#pubkeyInput").val().trim());
				var loginPwd = jsEncrypt.encrypt($("#loginPwdInput").val().trim()+"|"+new Date().getTime());
				
				$("#mobile").val(p.mobile);
				$("#loginPwd").val(loginPwd);
				$("#returnUrl").val("/h5/financial_zone.htm?tab=zone&t="+new Date());
				alertT(1, "注册账户", "恭喜您，注册成功!");
				setTimeout(function() {
					$("#loginForm").submit();
				}, 4001);
			} else if(data.code=="MOBILE_ERROR") {
				alertT(2, "注册账户", "注册失败：手机号码错误");
			} else if(data.code=="USER_EXIST") {
				alertT(2, "注册账户", "注册失败：该手机已注册");
			} else if(data.code=="VERIFY_CODE_ERROR") {
				alertT(2, "注册账户", "注册失败：验证码错误");
			} else if(data.code=="MOBILE_ERROR") {
				alertT(2, "注册账户", "注册失败：手机号码错误");
			} else if(data.code=="PARAM_ERROR") {
				alertT(2, "注册账户", "注册失败：参数错误");
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
		alertT(3, "注册账户", "注册手机号不允许为空");
		return;
	}
	$.post("../judge.htm", p, function(data) {
		if (data.code == "USER_EXIST") {
			alertT(2, "注册账户", "注册失败：该手机已注册");
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
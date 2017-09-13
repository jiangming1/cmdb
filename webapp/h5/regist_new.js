var pubkey=null;
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
	pubkey=$("#pubkeyInput").val().trim();
	$("#btnGetVerfityCodeNew").click(function() {
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
/*		$("#btnGetVerfityCodeNew").html("60");*/
		$("#btnGetVerfityCode").prop("disabled",true);
		$.post("../api/send_mobile_verifycode.htm", p, function(data) {
			if(data.code=="SUCCESS"){ 
				TimmerToolNew.timmerId = window.setInterval(TimmerToolNew.countRemaining, 1000);
				return ;
			}else if(data.code=="PIC_VERIFYCODE_ERROR"){
				alertT(2, "注册账户", "验证码错误!");
			}else if(data.code=="MSG_AMOUNT_LIMITED"){
				alertT(2, "注册账户", "您的短信发送频率超限!");
			}else{
				alert(data.code);
			}
			$("#btnGetVerfityCodeNew").prop("disabled",false);

		}, "json");
			}
		}, "json");
	});

	$("#btnRefreshPicVerifyCode").click(function(){
		PicVerifyService.refresh();
	});
	
	$("#btnRegistNew").click(function() {
		$(".errorInfo").html("");
		var p = {
			t : new Date(),
			mobile : $("#mobileInput").val(),
			inviteFrom : $("#inviteFromInput").val(),
			loginPwd : $("#loginPwdInput").val().trim(),
			verifyCode : $("#verifyCodeInput").val(),
			channel : $("#channel").val()
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
		jsEncrypt.setPublicKey(pubkey); 
		p.loginPwd = jsEncrypt.encrypt(p.loginPwd+"|"+new Date().getTime())
		
		$.post("regist.htm", p, function(data) {
			if (data.code == "VERIFY_CODE_ERROR") {
				$("#verifyCodeInputInfo").html("验证码错误");
			} else if (data.code == "USER_EXIST") {
				$("#mobileInputInfo").html("该手机已注册");
			} else if (data.code == "true") {
				$(".mask").attr("style","display:block");
				$(".reg_alertbox").attr("style","display:block");
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
		}
		else{
			PicVerifyService.refresh();
		}
	}, "json");
}


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
				$("#btnGetVerfityCodeNew").prop("disabled",false);
				PicVerifyService.needRefresh=true;
				return;
			}
			$("#btnGetVerfityCodeNew").html(TimmerToolNew.i);
		}
	};
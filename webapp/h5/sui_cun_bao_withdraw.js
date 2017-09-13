$(function() {
	$.post("sui_cun_bao_get_merged_profit.htm", {
		t : new Date(),
		app_token:$("#app_token").val()
	}, function(profit) {
		if (!profit) {
			$(".totalProfit").html("0.00");
			$(".principal").html("0.00");
			return;
		}
		$(".totalProfit").html(profit.totalProfit ? profit.totalProfit : "0.00");
		$(".principal").html(profit.principal ? profit.principal : "0.00");
		var totalMoney=profit.principal ? profit.principal:0;
		if(profit.totalProfit){
			totalMoney =parseFloat(totalMoney)+  parseFloat(profit.totalProfit);
			 
		}  
		$("#withdrawMoneyInput").attr("placeholder","最多"+totalMoney.toFixed(2));
		
		if(profit.htype&&profit.htype=="CURRENT_ACCOUNT"){
//			if(!profit.balance){
//				alert("好像balance显示错误");
//				return ;
//			}
			$("#withdrawMoneyInput").attr("placeholder","最多"+profit.balance.toFixed(2)); 
			$(".current_account").find(".balance").html(profit.balance.toFixed(2));
			$(".current_account").show();
		}else{
			$(".cpb").show();
		}
		
	}, "json");

	$("#withdrawMoneyInput").change(function() {
		if(true){
			return ;
		}
		var p = {
			t : new Date(),
			withdrawAmount : $(this).val().trim(),
			isTry : true,
			app_token:$("#app_token").val()
		};
		if (!StringUtil.isMoney(p.withdrawAmount)) {
			$(this).val("");
			$(this).focus();
			return;
		}
		/*
		$.post("sui_cun_bao_withdraw.htm", p, function(data) {
			if (!data || !data.code) {
				$("#withdrawMoneyInput").val("0.00");
				$(".withdrawProfit").html("0.00");
				$(".principalAndProfit").html("0.00");
				return;
			}
			if (data.code == "SUCCESS") {
				$(".withdrawProfit").html(data.withdrawProfit);
				$(".principalAndProfit").html(parseFloat(data.withdrawProfit) + parseFloat(p.withdrawAmount));
			} else if (data.code == "AMOUNT_ERROR") {
				alertT(3, "随存宝提现", "请最少提现100元!");
			} else if (data.code == "NOT_HAS_ENOUGH_MONEY") {
				alertT(3, "随存宝提现", "金额不足!");
			} else {
				alertT(3, "随存宝提现", "出错了:" + data.code);
			}
		}, "json");
		*/
	});

	$("#btnWithdraw").click(function() {

		var userBankId = $("#bankCardSelect").val();
		if (userBankId && userBankId.split("_").length == 2) {
			userBankId = userBankId.split("_")[1];
		}
		var p = {
			t : new Date(),
			withdrawAmount : $("#withdrawMoneyInput").val().trim(),
			isTry : false,
			userBankId : userBankId,
			app_token:$("#app_token").val(),
			imgVerifyCode:$("#imgVerifyCodeInput").val().trim()
		};
		if (!StringUtil.isMoney(p.withdrawAmount)) {
			$("#withdrawMoneyInput").val("");
			$("#withdrawMoneyInput").focus();
			return;
		} 
		if(!p.imgVerifyCode){ 
			$("#imgVerifyCodeInput").focus();
			return;
		}
		p.withdrawAmount = parseFloat(p.withdrawAmount);

		if (p.withdrawAmount < 100) {
			alertT(3, "随存宝提现", "请输入不少于100元的金额");
			return;
		}
		$(this).prop("disabled", true);
		$(this).val("提现中...");
		$.post("sui_cun_bao_withdraw.htm", p, function(data) {
			if (!data || !data.code) {
				alertT(3, "随存宝提现", "您可能没有登录!");
				return;
			}
			if (data.code == "SUCCESS") {
				//alert("申请成功!");
//				alertT(1, "随存宝提现", "申请成功!");
				$("#withdrawMoneyInput").val(""); 
				window.location="sui_cun_bao_withdraw_finish.jsp?device="+$("#deviceInput").val();
				return;
			} else if (data.code == "AMOUNT_ERROR") {
				alertT(2, "随存宝提现", "请最少提现100元!");
			} else if (data.code == "NOT_HAS_ENOUGH_MONEY"||data.code=="BALANCE_NOT_ENOUGH") {
				alertT(2, "随存宝提现", "金额不足!");
			}else if (data.code == "VERIFY_CODE_ERROR") {
				alertT(2, "随存宝提现", "验证码错误!");
				$("#imgVerifyCodeInput").val("");
				$("#btnRefresh").click();
				$("#imgVerifyCodeInput").focus();
			} else {
				alertT(2, "随存宝提现", "出错了:" + data.code);
			}

			$("#btnWithdraw").prop("disabled", false);
			$("#btnWithdraw").val("提现");
		}, "json");

	});

	$.post("get_my_bank_card.htm", {
		t : new Date(),
		app_token:$("#app_token").val()
	}, function(bankCardList) {
		if (!bankCardList || bankCardList.length == 0) {
			$("#cardSelectTable").hide();
			return;
		}
		var bankCardSelect = $("#bankCardSelect");
		bankCardSelect.html("");
		for ( var i in bankCardList) {
			var card = bankCardList[i];
			var bank = BankCardVerifyTool.findBank(card["bankCode"]);
			if (!bank) {
				continue;
			}
			if (!card["bankCardNo"] || card["bankCardNo"].length < 5) {
				continue;
			}
			var shortCard = card["bankCardNo"].substring(card["bankCardNo"].length - 4, card["bankCardNo"].length);
			bankCardSelect.append("<option   value='" + bank.code + "_" + card["id"] + "'>" + bank.name + "     &nbsp;&nbsp;尾号 (" + shortCard + ")</option>");
		}

		$("#bankLogo").attr("src", "bank_logo/" + $("#bankCardSelect").val().split("_")[0] + ".png");

	}, "json");

	$("#bankCardSelect").change(function() {
		$("#bankLogo").attr("src", "bank_logo/" + $(this).val().split("_")[0] + ".png");
	});
	
	
	$("#btnRefresh").click(function(){
		$.post("../api/get_pic_verifycode.jhtm",{
			t:new Date(),
			mobile:$("#mobileInput").val().trim()
		},function(data){ 
			if(data!="none"){ 
				$("#imgVerifyCode").prop("src","data:image/png;base64,"+data);
				$("#imgVerifyCodeBox").show(); 
			}
			
		},"text");
	});
	
	$("#btnRefresh").click();

	
});

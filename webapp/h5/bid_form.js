$(function() {
	var newCardPolicy="";
	var transfer_status = $("#transfer_status_input").val().trim();
	if (transfer_status && transfer_status != "1") {
		$("#runingLayout").find(".alertContent").html(transfer_status);
		$("#runingLayout").show();
	}

	Submitor.init();
	// TouchConfirmPad.show({});

	$("#colseBtn").click(function() {
		TouchConfirmPad.hide();
	});

	CashCouponSelecter.init();

	$("#borrowAgreementBtn").click(
			function() {
				window.location.href = "pledge_borrow_agreement.htm?app_token=" + $("#app_token").val() + "&tid=" + $("#tid").val() + "&buyAmount=" + $("#buyAmountInput").val()
						+ "&name=&pid=&bankName=&bankCardNum=";
			});

	$(".btnKaiguan").click(function() {
		var btnKaiguan = $(this);
		if ($(this).attr("status") == "current") {
			$(this).attr("status", "bank");
			$(this).attr("src", "../static/imgs/icon_kaiguan_guan.png");

		} else {
			$(this).attr("status", "current");
			$(this).attr("src", "../static/imgs/icon_kaiguan_kai.png");
		}

	});

	BankCardVerifyTool.init(function() {
		BankSelector.init();
		HistoryCardSelect.init();
	});

	$("#cashCouponSelectDiv").find("select").change(function() {
		if ($(this).val()) {
			$("#rateIncrCouponSelectDiv").find("select").val("");
		}
	});
	$("#rateIncrCouponSelectDiv").find("select").change(function() {
		if ($(this).val()) {
			$("#cashCouponSelectDiv").find("select").val("");
		}
	});
});

var HistoryCardSelect = {
	init : function() {
		// get_my_bank_card
		$.post("get_my_bank_card.htm", {
			t : new Date(),
			app_token : $("#app_token").val()
		}, function(cards) {
			if (!cards || cards.length == 0) {
				$("#historyBankTab").hide();
				return;
			}
			var historyBankTab = $("#historyBankTab");
			var cardTemplate = historyBankTab.find(".bank");
			var newBankInfo = historyBankTab.find("#newBankInfo");

			cardTemplate.remove();
			newBankInfo.remove();
			var hasOneCard = false;
			for ( var i in cards) {

				hasOneCard = true;
				var card = cards[i];
				var cardTr = cardTemplate.clone();

				var radio = cardTr.find("input");
				radio.attr("bank_code", card.bankCode);
				radio.attr("bank_name", card.bankName);
				radio.attr("bank_card_no", card.bankCardNo);
				radio.attr("holder", card.holder);
				radio.attr("pid", card.pid);

				var bankIcon = cardTr.find(".bankIcon");
				bankIcon.attr("src", "bank_logo/" + card.bankCode + ".png");

				var shortCard = card.bankCardNo && card.bankCardNo.length > 5 ? card.bankCardNo.substring(card.bankCardNo.length - 4, card.bankCardNo.length) : "0000";
				var limit = "";
				try {
					var bank = BankCardVerifyTool.findBank(card.bankCode);
					limit += "单笔<span style='color:red'>" + bank.singleTip + "</span>&nbsp;&nbsp;";
					limit += "单日<span style='color:red'>" + bank.dayTip + "</span>&nbsp;&nbsp;";
					limit += "单月<span style='color:red'>" + bank.monthTip + "</span>";
				} catch (e) {
				}
				cardTr.find(".bankInfo").html(card.bankName + " &nbsp;&nbsp;尾号 (" + shortCard + ") <br/> " + limit);
				historyBankTab.append(cardTr);
			}

			$("#newBankInfoTable").hide();
			newCardPolicy =$("#newCardPolicy").val().trim();
			if("*"==newCardPolicy||/^[,0-9]+$/.test(newCardPolicy)){
				historyBankTab.append(newBankInfo);
			} 
			

			historyBankTab.find(".historyBankRadio").click(function() {
				$("#newBankInfoTable").hide();
			});
			historyBankTab.find(".scp").click(function() {
				$("#newBankInfoTable").hide();
			});
			$(historyBankTab.find(".historyBankRadio")[0]).prop("checked", true);

			newBankInfo.find("input").click(function() {
				$("#newBankInfoTable").show();
			});

		}, "json");
	}
};
var Submitor = {
	init : function() {
		$("#btnSubmit").click(function() {

			var param = {
				t : new Date(),
				buyAmount : $("#buyAmountInput").val().trim(),
				name : $("#nameInput").val().trim(),
				pid : $("#pidInput").val().trim().toUpperCase(),
				bankCardNo : $("#bankCardNoInput").val().trim(),
				financingTargetId : $("#financingTargetIdInput").val().trim(),
				bankNo : $("#bankSelect").val(),
				userId : $("#userIdInput").val(),
				bankName : "",
				_channel : $("#channelInput").val(),
				pay_type : "bank",
				cashCouponId : $("#cashCouponSelectDiv").find("select").val().trim(),
				rateIncrCouponId : $("#rateIncrCouponSelectDiv").find("select").val().trim(),
				agreementCheck : $("#agreementCheck").is(':checked'),
				transferType : $(".btnKaiguan").attr("status"),
				way : $("#bankSelect").find("option:selected").attr("way")
			};
			//第二张卡的情况下
			//newCardPolicy
			if($(".inputLine.bank").length>0){
				if(param.bankCardNo&&newCardPolicy!="*"){
					if(newCardPolicy=="-"){
						alertT(3, "支付", "不能绑定多张银行卡");
						return ;
					}
					
					if(/^[0-9,]+$/.test(newCardPolicy)){
						var isAllowCard=false;
						var allowCards = newCardPolicy.split(",");
						for(var i in allowCards){
							if(allowCards[i].trim()==param.bankCardNo.trim()){
								isAllowCard=true;
							}
						}
						if(!isAllowCard){
							alertT(3, "支付", "请核对该卡是否申请开通绑定");
							return ;
						}
					}

				}
			}
			// alert(JSON.stringify(param));
			var cardRadio = $("#historyBankTab").find(":checked");
			if (cardRadio.attr("bank_card_no")) {
				param.pid = cardRadio.attr("pid");
				param.name = cardRadio.attr("holder");
				param.bankCardNo = cardRadio.attr("bank_card_no");
				param.bankNo = cardRadio.attr("bank_code");
				param.bankName = cardRadio.attr("bank_name");
				param.way = BankSelector.getWayByCode(cardRadio.attr("bank_code"));
			}
			param.pay_type = cardRadio.val();
			if (!param.agreementCheck) {
				alertT(3, "购买理财产品", "请阅读并同意协议和委托书");
				return;
			}
			if (!param.bankNo) {
				$("#bankSelect").focus();
				return;
			}
			param["bankName"] = BankSelector.getNameByCode(param.bankNo);

			if (!StringUtil.isMoney(param.buyAmount)) {
				$("#buyAmountInput").val("");
				$("#buyAmountInput").focus();
				return;
			}
			try {
				var minAmount = $("#minAmount").val();
				if (/^[0-9.]+$/.test(minAmount)) {
					minAmount = parseFloat(minAmount);
				} else {
					minAmount = 1;
				}
				if (parseFloat(param.buyAmount) < minAmount) {
					alertT(3, "购买理财产品", "投资额至少大于" + minAmount + "元");
					return;
				}
				if ($("#limitAmount").val()) {
					if (parseFloat(param.buyAmount) > parseFloat($("#limitAmount").val())) {
						alertT(3, "购买理财产品", "超过限额(" + $("#limitAmount").val() + ")元");
						return;
					}
				}
			} catch (e) {
				$("#buyAmountInput").val("");
				$("#buyAmountInput").focus();
				return;
			}

			if (param.pay_type == "scb") {
				TouchConfirmPad.show(param);
				return;
			}

			if (StringUtil.isEmpty(param.name)) {
				$("#nameInput").focus();
				return;
			}
			if (StringUtil.isEmpty(param.pid)) {
				$("#pidInput").focus();
				return;
			}
			if (StringUtil.isEmpty(param.bankCardNo)) {
				$("#bankCardNoInput").focus();
				return;
			}

			if (!BankCardVerifyTool.theCardIsTheBank(param.bankCardNo, param.bankNo)) {
				alertT(3, "购买理财产品", "卡号与银行对不上!");
				return;
			}
			$("#runingLayout").show();
			$.post("bid_form_create_fuiou_order.htm", param, function(order) {
				if (!order) {
					alertT(3, "购买理财产品", "出错了");
					return;
				}
				if (order.code == "SUCCESS") {
					if (order.baofoo_wap_pay_form) {
						$("#baofooWapPayLayout").html(order.baofoo_wap_pay_form);
						$("#baofooWapPayLayout").find("form").submit();
					} else {
						var formPay = $("#formPay");
						formPay.find("[name='orderid']").val(order.fuiouOrderId);
						formPay.find("[name='ono']").val(order.bankCardNo);
						formPay.find("[name='name']").val(order.name);
						formPay.find("[name='sfz']").val(order.pid);
						formPay.find("[name='md5']").val(order.sign);
						formPay.submit();
					}
					return;

				} else if (order.code == "AGREEMENT_CHECK_FALSE") {
					alertT(3, "购买理财产品", "请阅读并同意协议和委托书!");
					$("#buyAmountInput").focus();
				} else if (order.code == "COLLECT_AMOUNT_NOT_ENOUGH") {
					alertT(3, "购买理财产品", "可购份额不足!");
					$("#buyAmountInput").focus();
				} else if (order.code == "BANK_CARD_CANT_USED") {
					alertT(3, "购买理财产品", "只能用自己的银行卡!");
				} else if (order.code == "BUY_AMOUNT_CONDITION_ERROR") {
					alertT(3, "购买理财产品", "该现金券不满足金额条件!");
				} else if (order.code == "PERIOD_CONDITION_ERROR") {
					alertT(3, "购买理财产品", "该现金券不满足周期条件!");
				} else if (order.code == "TARGET_TYPE_CONDITION_ERROR") {
					alertT(3, "购买理财产品", "该现金券不能购买此标的!");
				} else if (order.code == "RATE_INCR_BUY_AMOUNT_CONDITION_ERROR") {
					alertT(3, "购买理财产品", "金额不满足加息券条件!");
				} else if (order.code == "RATE_INCR_PERIOD_CONDITION_ERROR") {
					alertT(3, "购买理财产品", "周期不满足加息券条件!");
				} else if (order.code == "RATE_INCR_TARGET_TYPE_CONDITION_ERROR") {
					alertT(3, "购买理财产品", "该加息券不能购买此标的!");
				} else {
					alertT(3, "购买理财产品", "出错了!:" + order.code);
				}
				$("#runingLayout").hide();
			}, "json");

		});

	}
};
var BankSelector = {
	getNameByCode : function(code) {
		if (this.bankMap[code]) {
			return this.bankMap[code].name;
		}
		return null;
	},
	getWayByCode : function(code) {
		if (this.bankMap[code]) {
			return this.bankMap[code].way ? this.bankMap[code].way : "fuiou";
		}
		return null;
	},
	init : function() {
		var bankSelect = $("#bankSelect");
		bankSelect.html("");
		for ( var i in BankCardVerifyTool.bankList) {
			var bank = BankCardVerifyTool.bankList[i];
			var option = $("<option></option>");
			bankSelect.append(option);
			if (!bank.name) {
				continue;
			}
			option.html(bank.name);
			option.attr("value", bank.code);
			option.attr("dayTip", bank.dayTip);
			option.attr("singleTip", bank.singleTip);
			option.attr("singleMoney", bank.singleMoney);
			option.attr("monthTip", bank.monthTip);
			option.attr("way", bank.way ? bank.way : "fuiou");
			this.bankMap[bank.code] = bank;
		}

		bankSelect.change(function() {
			if (!$(this).val()) {
				return;
			}
			var bank = BankSelector.bankMap[$(this).val()];
			$(".singleTip").html(bank.singleTip);
			$(".dayTip").html(bank.dayTip);
			$(".monthTip").html(bank.monthTip);
			$("#bankIcon").attr("src", "bank_logo/" + bank.code + ".png");

		});

	},
	bankMap : {}

};

var TouchConfirmPad = {
	progress : 0,
	upInterval_id : null,
	downInterval_id : null,
	status : "up",
	btnDown : function() {
		$("#btnTouchPay").attr("src", "img/btn_touch_pay_1.png");
	},
	btnUp : function() {
		$("#btnTouchPay").attr("src", "img/btn_touch_pay_0.png");
	},
	hide : function() {
		$("#touchConfirmPadDiv").hide();
		this.progress = 0;
		$("#touchProgress").css("width", "0%");
		$("#touchPayStatus").html('长按3秒进行支付');
		this.status = 'up';
		this.btnUp();
	},
	initPad : function(param) {
		var touchArea = document.getElementById("btnTouchPay");
		touchArea.addEventListener('touchstart', function(event) {
			if (event.targetTouches.length == 1) {
				event.preventDefault();// 阻止浏览器默认事件，重要
				var touch = event.targetTouches[0];
				TouchConfirmPad.btnDown();
				if (TouchConfirmPad.status == "do_submit") {
					return;
				}
				TouchConfirmPad.upInterval_id = window.setInterval(function() {
					TouchConfirmPad.progress++;
					$("#touchProgress").css("width", TouchConfirmPad.progress + "%");

					if (TouchConfirmPad.progress >= 100) {
						window.clearInterval(TouchConfirmPad.upInterval_id);
						TouchConfirmPad.upInterval_id = null;
						TouchConfirmPad.submit(param);

					}
				}, 20);
			}

		}, false);

		touchArea.addEventListener('touchend', function(event) {

			if (event.targetTouches.length == 0) {
				event.preventDefault();// 阻止浏览器默认事件，重要
				if (TouchConfirmPad.upInterval_id) {
					window.clearInterval(TouchConfirmPad.upInterval_id);
					TouchConfirmPad.btnUp();
					TouchConfirmPad.upInterval_id = null;

					TouchConfirmPad.downInterval_id = window.setInterval(function() {
						TouchConfirmPad.progress = TouchConfirmPad.progress - 3;
						$("#touchProgress").css("width", TouchConfirmPad.progress + "%");
						if (TouchConfirmPad.progress <= 0) {
							window.clearInterval(TouchConfirmPad.downInterval_id);
						}
					}, 2);

				}
			}

		}, false);
	},
	initd : 0,
	request_param : null,
	show : function(param) {
		this.request_param = param;
		$("#touchConfirmPadDiv").show();
		if (this.initd == 0) {
			this.initPad(param);
			this.initd = 1;
		}

	},
	submit : function(param) {
		param = this.request_param;
		if (TouchConfirmPad.status == "do_submit") {
			return;
		}
		$("#touchPayStatus").html('请稍等,支付中...');
		TouchConfirmPad.status = "do_submit";
		var p = {
			t : new Date(),
			targetId : param.financingTargetId,
			buyAmount : param.buyAmount,
			cashCouponId : $("#cashCouponSelectDiv").find("select").val().trim(),
			transferType : $(".btnKaiguan").attr("status"),
			rateIncrCouponId : $("#rateIncrCouponSelectDiv").find("select").val().trim()
		};

		if ($("#app_token").val().trim()) {
			p.app_token = $("#app_token").val().trim();
		}
		$.post("bid_pay_with_scb.htm", p, function(data) {
			if (data.code == "SUCCESS") {
				$("#touchPayStatus").html('支付成功');
				window.location = "scb_pay_result.htm?certificateId=" + data.certificateId;
			} else if (data.code == "AMOUNT_LESS") {

				$("#touchPayStatus").html('购买不能低于1000元');
			} else if (data.code == "NOT_HAS_ENOUGH_PRINCIPAL") {
				$("#touchPayStatus").html('可购买份额不足');
			} else if (data.code == "NOT_HAS_ENOUGH_MONEY") {
				$("#touchPayStatus").html('余额不足');
			} else if (data.code == "BUY_AMOUNT_CONDITION_ERROR") {
				$("#touchPayStatus").html('购买数额未满足现金券要求');
			} else if (data.code == "RATE_INCR_BUY_AMOUNT_CONDITION_ERROR") {
				$("#touchPayStatus").html('金额不满足加息券条件!');
			} else if (data.code == "RATE_INCR_PERIOD_CONDITION_ERROR") {
				$("#touchPayStatus").html('周期不满足加息券条件!');
			} else if (data.code == "RATE_INCR_TARGET_TYPE_CONDITION_ERROR") {
				$("#touchPayStatus").html('该加息券不能购买此标的!');
			} else if (data.code == "BALANCE_NOT_ENOUGH") {
				$("#touchPayStatus").html('随存宝金额不足!');
			} else if (data.code == "FINANCING_TARGET_STOCK_NOT_ENOUGH") {
				$("#touchPayStatus").html('剩余额度足！');
			}else {
				$("#touchPayStatus").html("交易失败:" + data.code);
			}

		}, "json");
	}
};

var StringUtil = {
	REGEX_MONEY : /(^[0-9]+$)|(^[0-9]+\.[0-9]{1,2}$)/g,
	isMoney : function(moneyStr) {
		if (!moneyStr) {
			return false;
		}
		return moneyStr.match(this.REGEX_MONEY);
	},
	isEmpty : function(str) {
		if (!str) {
			return true;
		}
		if (str.trim() == "") {
			return true;
		}
		return false;
	}
};

var CashCouponSelecter = {
	loadCashCoupon : function(couponList) {
		// alert(JSON.stringify(couponList));
		var cashCouponSelectDiv = $("#cashCouponSelectDiv");
		cashCouponSelectDiv.show();
		for ( var i in couponList) {
			var row = couponList[i];
			try {
				var conditionRight = true;
				if (row.conditions) {
					var conditions = eval('(' + row.conditions + ')');
					for ( var index in conditions) {
						var condition = conditions[index];
						conditionRight = true;
						if (condition["target_type"]) {
							if (condition["target_type"] != $("#targetTypeInput").val().trim()) {
								conditionRight = false;
							}

						}
						if (condition["period"]) {
							if (parseInt(condition["period"]) > parseInt($("#periodInput").val().trim())) {
								conditionRight = false;
							}
						}
						if (conditionRight) {
							break;
						}
					}
					// alert(JSON.stringify(conditions));
				}
				if (conditionRight) {
					cashCouponSelectDiv.find("select").append('<option value="' + row.id + '">(' + row.amount + '元)&nbsp;' + row.name + '</option>');
				}

			} catch (e) {
				alert(e);
			}
		}

		if (cashCouponSelectDiv.find("select").find("option").length == 1) {
			cashCouponSelectDiv.hide();
		}
	},
	loadRateIncrCoupon : function(rateIncrList) {
		// alert(JSON.stringify(rateIncrList));
		var rateIncrCouponSelectDiv = $("#rateIncrCouponSelectDiv");
		rateIncrCouponSelectDiv.show();
		for ( var i in rateIncrList) {
			var row = rateIncrList[i];
			try {
				var conditionRight = true;
				if (row.conditions) {
					var conditions = eval('(' + row.conditions + ')');
					for ( var index in conditions) {
						var condition = conditions[index];
						conditionRight = true;
						if (condition["target_type"]) {
							if (condition["target_type"] != $("#targetTypeInput").val().trim()) {
								conditionRight = false;
							}

						}
						if (condition["period"]) {
							if (parseInt(condition["period"]) > parseInt($("#periodInput").val().trim())) {
								conditionRight = false;
							}
						}
						if (conditionRight) {
							break;
						}
					}
					// alert(JSON.stringify(conditions));
				}
				if (conditionRight) {
					rateIncrCouponSelectDiv.find("select").append('<option value="' + row.id + '">(+' + row.rate + '%)&nbsp;' + row.name + '</option>');
				}

			} catch (e) {
				alert(e);
			}
		}

		if (rateIncrCouponSelectDiv.find("select").find("option").length == 1) {
			rateIncrCouponSelectDiv.hide();
		}
	},
	init : function() {
		$.post("find_useable_coupon.htm", {
			t : new Date(),
			app_token : $("#app_token").val()
		}, function(data) {
			if (!data || data.length == 0) {
				return;
			}
			var cashCoponList = [];
			var rateIncrCoponList = [];
			for ( var i in data) {
				var copon = data[i];
				if (copon.rate) {
					rateIncrCoponList.push(copon);
					continue;
				}
				if (copon.amount) {
					cashCoponList.push(copon);
					continue;
				}
			}
			CashCouponSelecter.loadCashCoupon(cashCoponList);
			CashCouponSelecter.loadRateIncrCoupon(rateIncrCoponList);

		}, "json");
	}
};

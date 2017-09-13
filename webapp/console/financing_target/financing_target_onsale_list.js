$(function() {
	FinancingTargetService.load();
	FinancingTargetBidCanvas.loadByFinancingTargetId(null);

	$("#conditionTag").find(".btnRemove").click(function() {
		$("#conditionTag").hide();
		$("#financingTbody").find("tr").removeClass("financingTargetSelected");
		$("#bidVOListTbody").html("");
		FinancingTargetBidCanvas.loadByFinancingTargetId(null);
	});

	// 下架
	$("#btnOffSale").click(function() {
		var selectedTr = $(".financingTargetSelected");
		if (selectedTr.length == 0) {
			alert("请选择要下架的标的!");
			return;
		}

		if (!window.confirm("确认下架?")) {
			return;
		}
		$.post("financing_target_offsale.htm", {
			t : new Date(),
			id : selectedTr.attr("financing_target_id")
		}, function(data) {
			if (data.code == "CLOSED_SUCCESS") {
				alert("无购买数据,已作废");
				$("#financingTbody").find("tr[financing_target_id='" + data.id + "']").remove();
			} else if (data.code == "OFFSALE_SUCCESS") {
				alert("下架成功!");
				$("#financingTbody").find("tr[financing_target_id='" + data.id + "']").remove();

			} else {
				alert("出错了:" + data.code);
			}
		}, "json");

	});

	$("#statusSelect").change(function() {
		$("#financingTbody").html("");
		FinancingTargetService.load();
	});

	$("#btnSearch").click(function() {

		window.open("../analysis/investor_detail.htm?mobile=" + $("#keywordsInput").val().trim());
	});
	
	
	//修改标的
	$("#btnUpdate").click(function() {
		var selectedTr = $(".financingTargetSelected");
		if (selectedTr.length == 0) {
			alert("请选择要修改的标的!");
			return;
		}

		if (!window.confirm("确认修改?")) {
			return;
		}
		
		var id = selectedTr.attr("financing_target_id");
		window.open("financing_target_findById.htm?id="+id);
	});

});

var MakeTagService = {
	init : function() {
		$("#btnMakeTag").click(function() {
			var selectedTr = $(".financingTargetSelected");
			if (selectedTr.length == 0) {
				alert("请选择标的!");
				return;
			}
			$('#tagManagerLayout').dialog({
				title : selectedTr.find(".name").html(),
				width : "50%",
				height : "60%",
				closed : false,
				cache : false,
				content : '<iframe class="tagIframe" src="financing_target_tag_manager.jsp?id=' + selectedTr.attr("financing_target_id") + '"></iframe>',
				modal : true
			});

		});

		$.post("onsale_tags.htm", {
			t : new Date()
		}, function(tags) {
			try {

				for ( var i in tags) {
					if (MakeTagService.tags[tags[i].tag]) {
						var span = $('<span class="label label-success">' + MakeTagService.tags[tags[i].tag].name + '</span>');
						$("tr[financing_target_id='" + tags[i].financingTargetId + "']").find(".tags").append(span);

					} else {

						var tagIcon = $("<img class='tagIcon' src='../../static/imgs/" + tags[i].tag.toLowerCase() + ".png' />");
						$("tr[financing_target_id='" + tags[i].financingTargetId + "']").find(".tags").append(tagIcon);
					}

				}
			} catch (e) {
				alert(e);
			}
		}, "json");

	},
	tags : {
		ACT_REGIST : {
			name : "注册-体验金"
		},
		ACT_FIRST_BUY : {
			name : "下单-体验金"
		},
		ACT_INVITE : {
			name : "推广-体验金"
		},
		PROFIT_AUTOBUY : {
			name : "收益自动买"
		},
		FIX_BID_2_DEMAND : {
			name : "定期转活期"
		},
		BIND_CARD : {
			name : "绑卡"
		},
		INVITE_REGIST : {
			name : "邀请注册-体验金"
		},
		INVITE_LESS_5000 : {
			name : "邀请人福利标 > 1(任意金额)"
		},
		INVITE_MORE_5000 : {
			name : "邀请人福利标 5000 ~ 1000"
		},
		INVITE_10000 : {
			name : "邀请人福利标 > 10000"
		},
		BUY_GIVE_COUPON : {
			name : "购买送现金券"
		},
		ANNIVERSARY_CELEBRATION : {
			name : "周年庆加息标"
		},
		ACTIVITY_INCRRATE : {
			name : "活动加息标"
		},
		TAG_ACT_EXPR : {
			name : "活动-体验金"
		}
	}
};

var FinancingTargetService = {
	trTemplate : null,
	load : function() {
		var param = {
			t : new Date(),
			status : $("#statusSelect").val()
		};

		$.post("financing_target_findby_status.htm", param, function(data) {
			if (!data) {
				return;
			}
			var financingTbody = $("#financingTbody");
			var trTemplate = financingTbody.find("tr");
			if (trTemplate.length != 0) {
				FinancingTargetService.trTemplate = trTemplate;
			} else {
				trTemplate = FinancingTargetService.trTemplate;
			}
			trTemplate.remove();
			for ( var i in data) {
				var row = data[i];
				var tr = trTemplate.clone();
				tr.find(".name").html(row.name);
				if (row.status == 'offsale') {
					tr.addClass("offsale");
				}
				if (row.type == "SCB") {
					tr.find(".type").html("<span title='随存宝' class='badge badge-important'>活</span>");
				}
				if (row.type == "CPB") { 
					//alert(JSON.stringify(row.newInvestor));
					tr.find(".type").html("<span title='存票宝' class='badge badge-success'>定" + (row.newInvestor ? "·新" : "") + "</span>");
				}
				tr.attr("financing_target_id", row.id);
				tr.find(".bidCount").html(row.bidCount);
				if (row.code) {
					tr.find(".name").append("(" + row.code + ")");
				}
				tr.find(".period").html(row.period + "天");
				tr.find(".annualizedRates").html(row.annualizedRates + "%");
				if (row.endDate) {
					var fullTimeStr = new Date(row.endDate).toCNString();
					tr.find(".endDate").html("<span title='" + fullTimeStr + "'> " + new Date(row.endDate).toShortTime() + "</span>");
				}
				tr.find(".money").html(row.finishAmount + "元/" + row.collectAmount + "元");
				tr.find(".bar").css("width", (row.finishAmount / row.collectAmount) * 100 + "%");
				financingTbody.append(tr);

				tr.dblclick(function() {
					$("#financingTbody").find("tr").removeClass("financingTargetSelected");
					$(this).addClass("financingTargetSelected");
					FinancingTargetBidCanvas.loadByFinancingTargetId($(this).attr("financing_target_id"));

					var financingName = $(this).find(".name").html().trim();
					if (financingName.length > 7) {
						financingName = financingName.substring(0, 6);
					}
					$("#conditionTag").find(".financingName").html(financingName);
					$("#conditionTag").show();
				});
			}

			MakeTagService.init();
		}, "json");
	}
};

var FinancingTargetBidCanvas = {
	loadByFinancingTargetId : function(financingTargetId) {
		var param = {
			t : new Date(),
			financingTargetId : financingTargetId
		}
		$("#bidVOListTbody").html("<tr><td colspan='8' class='loading'>加载中...</td></tr>");
		$.post("financing_target_bid_find.htm", param, function(bidVOList) {
			// alert(JSON.stringify(bidVOList));
			var bidVOListTbody = $("#bidVOListTbody");
			if (!bidVOList || bidVOList.length == 0) {
				bidVOListTbody.html("<tr><td colspan='8' class='loading'>无数据</td></tr>");
				return;
			}
			bidVOListTbody.html("");
			for ( var i in bidVOList) {
				try {
					var bidVO = bidVOList[i];
					var newTr = $("<tr></tr>");

					newTr.append("<td>" + (parseInt(i) + 1) + "</td>");

					newTr.append("<td>" + new Date(bidVO.gmtCreate).toShortTime() + "<br>" + bidVO.channel + "</td>");
					newTr.append("<td>" + bidVO.targetName + "</td>");
					newTr.append("<td>" + bidVO.buyAmount + "</td>");
					
					if(bidVO.pay){
						newTr.append("<td>是</td>");
					}else{
						if(bidVO.summary){
							newTr.append("<td class='has_reason' title='原因:"+(bidVO.summary)+"'>否!</td>"); 
						}else{
							newTr.append("<td >否</td>");
						}
						
						
					}
					newTr.append("<td>" + bidVO.trueName + "</td>");
					newTr.append("<td><a target='_blank' href='../analysis/investor_detail.htm?mobile=" + bidVO.mobile + "'>" + bidVO.mobile + "</a></td>");
					newTr.append("<td>" + "" + "</td>");
					bidVOListTbody.append(newTr);
				} catch (e) {
					alert(e);
				}
			}
		}, "json");
	}
};
Date.prototype.toCNString = function() {
	return this.getFullYear() + "-" + (this.getMonth() >= 9 ? this.getMonth() + 1 : "0" + (this.getMonth() + 1)) + "-" + (this.getDate() > 9 ? this.getDate() : "0" + this.getDate()) + " "
			+ (this.getHours() > 9 ? this.getHours() : "0" + this.getHours()) + ":" + (this.getMinutes() > 9 ? this.getMinutes() : "0" + this.getMinutes()) + ":"
			+ (this.getSeconds() > 9 ? this.getSeconds() : "0" + this.getSeconds());
};
Date.prototype.toShortTime = function() {
	return (this.getMonth() >= 9 ? this.getMonth() + 1 : "0" + (this.getMonth() + 1)) + "-" + (this.getDate() > 9 ? this.getDate() : "0" + this.getDate()) + " "
			+ (this.getHours() > 9 ? this.getHours() : "0" + this.getHours()) + ":" + (this.getMinutes() > 9 ? this.getMinutes() : "0" + this.getMinutes());
};
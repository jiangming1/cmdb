var Activity = {};
Activity.data = {};
Activity.category = {};
Activity.award = {};
Activity.data.initparam = {
	appToken : "",
	activityId : ""
};
/**
 * 活动数据緩存
 */
Activity.data.cache = null;
Activity.data.bidinfo = {};
Activity.data.actProfile = null;
Activity.ready = function(appToken, activityId, dataCode, param, callback) {
	Activity.data.initparam.appToken = appToken;
	Activity.data.initparam.activityId = activityId;
	Activity.data.get(dataCode, param, callback);
};
/**
 * 数据部分
 * 
 * @returns {Boolean}
 */
Activity.data.get = function(dataCode, param, callBack) {
	if (param == null) {
		param = {};
	}
	if (Activity.data.initparam.appToken) {
		param["app_token"] = Activity.data.initparam.appToken;
	}
	param["activityId"] = Activity.data.initparam.activityId;
	param["t"] = new Date();
	param["dataCode"] = dataCode;
	$.post("data_query.htm", param, function(data) {
		Activity.data.docached(data);
		if (callBack) {
			callBack(data);
		}
	}, "json");

};
Activity.data.docached = function(data) {
	Activity.data.cache = data;
	console.log("cached -->" + JSON.stringify(data))
	if (Activity.data.cache["BID_INFO"]) {
		for ( var i in Activity.data.cache["BID_INFO"]) {
			var d = Activity.data.cache["BID_INFO"][i];
			Activity.data.bidinfo[d.pay_mark] = d;
		}
	}
	if (data["ACT_INFO"]) {
		Activity.data.actProfile = data["ACT_INFO"];
		//alert(JSON.stringify(data["ACT_INFO"]));
	}
};
Activity.join = function(subActId,p, callback) {
	if(!p){
		p={};
	}
	p["t"]=new Date();
	p["actId"]=Activity.data.initparam.activityId;
	p["subActId"]=subActId;
	p["app_token"]=Activity.data.initparam.appToken;
	 

	$.post("join.htm", p, function(data) {
		callback(data);
	}, "json");
};
Activity.conditions = {

	time : function(alreadyCallBack, notOpenCallBack, finishedCallBack) {
		if (!Activity.data.actProfile) {
			return;
		}
		var beginTime = new Date(Activity.data.actProfile.beginTime).getTime();
		var endTime = new Date(Activity.data.actProfile.endTime).getTime();
		var nowTime = new Date().getTime();
		if (nowTime > beginTime && nowTime < endTime && alreadyCallBack) {
			alreadyCallBack();
			return;
		}
		if (nowTime < beginTime && notOpenCallBack) {
			notOpenCallBack();
			return;
		}
		if (nowTime > endTime && finishedCallBack) {
			finishedCallBack();
		}
	},
	/**
	 * 检查权限
	 */
	check : function(actBtnId) {
		if (!Activity.data.cache) {
			return true;
		}
		if (!Activity.data.actProfile) {
			return false;
		}
		if (!Activity.data.actProfile.conditions) {
			return true;
		}
		var conditions = eval('(' + Activity.data.actProfile.conditions + ')')[actBtnId];
		if (!conditions||conditions.length==0) {
			return true;
		} 
		console.log("conditions:"+conditions);
		for ( var i in conditions) {
			var cgroup = conditions[i];
			var hasFalse = false;
			for ( var rulekey in cgroup) {
				var ruleVal = cgroup[rulekey];
				if (rulekey == "true_name_exist") {
					// 是否实名
					if (!Activity.data.cache["ACC_INFO"]) {
						hasFalse = true;
						console.log("没有ACC_INFO信息")
						break;
					}
					var ACC_INFO = Activity.data.cache["ACC_INFO"][0];
					if (ruleVal) {
						if (!ACC_INFO["true_name"]) {
							hasFalse = true;
							break;
						}
					}
					if (!ruleVal) {
						if (ACC_INFO["true_name"]) {
							hasFalse = true;
							break;
						}
					}
					console.log("check true_name_exist --> ok");

				} else if (rulekey == "bank_bid_count_more") {
					// 银行卡购买笔数
					var amt = parseFloat(ruleVal.split(",")[2]);
					var bankBidInfo = Activity.data.bidinfo["BANK"];
					if (!bankBidInfo) {
						hasFalse = true;
						break;
					}
					if (bankBidInfo.count < amt) {
						console.log("bank_bid_count_more 不满足条件,要求:" + amt + ",实际:" + bankBidInfo.count);
						hasFalse = true;
						break;
					}
					console.log("check bank_bid_count_more --> ok");

				} else if (rulekey == "bank_bid_amt_more") {

					// 银行卡购买数量
					var amt = parseFloat(ruleVal.split(",")[2]);
					var bankBidInfo = Activity.data.bidinfo["BANK"];
					if (!bankBidInfo) {
						hasFalse = true;
						break;
					}
					if (bankBidInfo.buy_amt < amt) {
						console.log("bank_bid_amt_more 不满足条件,要求:" + amt + ",实际:" + bankBidInfo.buy_amt);
						hasFalse = true;
						break;
					}
					console.log("check bank_bid_amt_more --> ok");
				} else if (rulekey == "user_vcoin_more1") {
					var vcoin = parseFloat(ruleVal.split(",")[2]);
					var bankBidInfo = Activity.data.bidinfo["BANK"];
					if (!bankBidInfo) {
						hasFalse = true;
						break;
					}
					if (bankBidInfo.buy_amt < vcoin) {
						console.log("user_vcoin_more 不满足条件,要求:" + amt + ",实际:" + bankBidInfo.buy_amt);
						hasFalse = true;
						break;
					}
					console.log("check user_vcoin_more --> ok");

				} else if (rulekey == "invite_regist_count_more") {
					console.log("check invite_regist_count_more --> 暂没实现");
					hasFalse = true;
					break;
				} else if (rulekey == "invite_buy_count_more") {
					console.log("check invite_buy_count_more --> 暂没实现");
					hasFalse = true;
					break;
				} else if (rulekey == "invite_buy_amt_more") {
					console.log("check invite_buy_amt_more --> 暂没实现");
					hasFalse = true;
					break;
				}
			}
			if (!hasFalse) {
				return true;
			}
		}
		return false;
	},
	joined:function(subActId){
		if(!Activity.data.cache["JOIN_INFO"]){
			return false;
		}
		for(var i in Activity.data.cache["JOIN_INFO"]){
			var joinRow = Activity.data.cache["JOIN_INFO"][i];
			if(joinRow.sub_act_id==subActId){
				return true;
			}
		}
		return false;
	}
};

DateTimeUtil = {
	parse : function(t) {
		return new Date(Date.parse(t.replace(/-/g, "/")));
	}
};
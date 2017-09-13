$(function() {

	Activity.ready(null, "20161111", "INVITE_BID_TOP_INFO,FRIEND_INFO", {
		"beginDate" : "2016-01-01",
		"iBeginCreateTime":"2016-01-01 00:00:00",
		"iEndCreateTime":"2017-01-01 00:00:00",
		"iBeginBuyTime":"2016-01-01 00:00:00",
		"iEndBuyTime":"2017-01-01 00:00:00",
		"iBidType":"CPB",
		"iBidCount":"0",
		"iBidAmount":"0",
		"fBeginCreateTime":"2016-01-01 00:00:00",
		"fEndCreateTime":"2017-01-01 00:00:00",
		"fBeginBuyTime":"2016-01-01 00:00:00",
		"fEndBuyTime":"2017-01-01 00:00:00"
	}, function(data) { 
		if (Activity.conditions.check("001")) {
			$("#btn001").prop("disabled", "");
			$("#btn001").html("欢迎您参与该活动");
			$("#btn001").click(function() {
				Activity.join("001", function(joinData) {
					alert(JSON.stringify(joinData));
					alert("谢谢您参与该话动");
				});
			});
		} else {
			$("#btn001").html("您暂时没权限参与此活动");
			$("#btn001").prop("disabled", "disabled");
		}

		Activity.conditions.time(function() {

		});

	});

});
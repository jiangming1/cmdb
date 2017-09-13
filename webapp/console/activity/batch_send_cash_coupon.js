var intervalId = null;
$(function() {
	$("#btnStart").click(function() {
		$.post("start_send_cash.htm", {
			t : new Date(),
			couponDefId : $("#couponDefId").val().trim(),
			userType : $("#userType").val().trim(),
			amount : $("#amount").val().trim()
		}, function(data) {
			alert(JSON.stringify(data));
			intervalId = window.setInterval(function() {
				$.post("batch_send_cash_coupon_count.htm", {
					t : new Date()
				}, function(data) {
					$("#countSpan").html(data.count);
					var percent = data.count / parseInt($("#userCount").html().trim()) * 100;
					if (percent > 100) {
						percent = 100;
					}
					$("#progressBar").css("width", percent + "%");
				}, "json");
			}, 5000);
		}, "json");
	});

});
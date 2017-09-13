$(function() {
	$(".btn2Checking").click(function() {
		if (!window.confirm("确认送审")) {
			return;
		}
		var dataId = $(this).parent().parent().attr("data_id");
		var param = {
			t : new Date(),
			id : dataId
		};
		$.post("financing_target_status_2_checking.htm", param, function(data) {
			if (data.code == "SUCCESS") {
				alert("送审成功!");
				$("[data_id='" + data.id + "']").remove();
			} else {
				alert("失败:" + data.code);
			}
		}, "json");
	});

	$(".btnGiveUp").click(function() {
		if (!window.confirm("确认废弃")) {
			return;
		}
		var dataId = $(this).parent().parent().attr("data_id");
		var param = {
			t : new Date(),
			id : dataId
		};
		$.post("financing_target_status_2_closed.htm", param, function(data) {
			if (data.code == "SUCCESS") {
				alert("成功作废!");
				$("[data_id='" + data.id + "']").remove();
			} else {
				alert("失败:" + data.code);
			}
		}, "json");
	});
});
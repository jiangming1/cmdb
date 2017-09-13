$(function() {

	$(".btnPass").click(function() {
		var checkPwd = window.prompt("请输入密码确认");
		if (!checkPwd) {
			return;
		}
		var dataId = $(this).parent().parent().attr("data_id");
		var param = {
			t : new Date(),
			pwd : MD5(checkPwd),
			id : dataId
		};

		$.post("financing_target_publish.htm", param, function(data) {
			if (data.code == "SUCCESS") {
				alert("发布成功!");
				$("[data_id='" + data.id + "']").remove();
			} else if ("pwd_error" == data.code) {
				alert("密码错了");
			} else {
				alert("出错了:" + data.code);

			}
		}, "json");

	});

	$(".btnRefuse").click(function() {
		if (!window.confirm("确认拒绝")) {
			return;
		}
		var dataId = $(this).parent().parent().attr("data_id");
		var param = {
			t : new Date(),
			id : dataId
		};
		$.post("financing_target_status_2_new.htm", param, function(data) {
			if (data.code == "SUCCESS") {
				alert("成功拒绝!");
				$("[data_id='" + data.id + "']").remove();
			} else {
				alert("失败:" + data.code);
			}
		}, "json");
	});
});
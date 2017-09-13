$(function() {

	$("#btnCheck").click(function() {
		var checkPwd = window.prompt("请输入密码确认");
		if (!checkPwd) {
			return;
		}
		var param = {
			t : new Date(),
			pwd : MD5(checkPwd),
			id : $("#targetIdInput").val()
		};

		$.post("financing_target_publish.htm", param, function(data) {
			if (data.code == "SUCCESS") {
				alert("发布成功!");
				window.location.reload(true);
			} else if ("pwd_error" == data.code) {
				alert("密码错了");
			} else {

				alert("出错了:" + data.code);

			}
		}, "json");

	});

	$("#btn2Checking").click(function() {
		var param = {
			t : new Date(),
			id : $(this).attr("target_id")
		};
		$.post("financing_target_status_2_checking.htm", param, function(data) {
			if (data.code == "SUCCESS") {
				alert("送审成功!");
				window.location.reload(true);
			} else {
				alert("送审失败:" + data.code);
			}
		}, "json");
	});
});
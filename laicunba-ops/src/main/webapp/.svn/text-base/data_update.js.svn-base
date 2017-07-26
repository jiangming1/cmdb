$(function() {
	$("#btnSave").click(function() {
		var p = {
			t : new Date(),
			summary : $("#sqlSummary").val().trim(),
			sql : $("#sqlInput").val().trim()
		};
		if(!p.summary){
			$("#sqlSummary").focus();
			return;
		}
		if(!p.sql){
			$("#sqlInput").focus();
			return;
		}
		$.post("saveSQL.htm", p, function(data) {
			if (data.success == true) {
				alert("申请成功");
			} else {
				alert(JSON.stringify(data));
			}
		}, "json");
	});

	$(".btnExecute").click(function() {
		var pwd = window.prompt("请输入证正密码", "");
		if (!pwd) {
			return;
		}

		$.post("executeUpdateSQL.htm", {
			t : new Date(),
			id : $(this).attr("sql_id"),
			pwd : pwd
		}, function(data) {
			alert(JSON.stringify(data));
		}, "json");
	});
});
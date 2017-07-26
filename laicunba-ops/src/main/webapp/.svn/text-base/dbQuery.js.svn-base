$(function() {

	$("#btnQuery").click(function() {
		var sql = $("#sqlInput").val().trim();
		var db = $("#dbSelect").val().trim();
		var paremeter = {
			t : new Date(),
			querySQL : sql,
			db : db
		};
		$("#thead").html("<tr><th>结果</th></tr>");
		$("#tbody").html("<tr><td>加载中...</td></tr>");
		$.post("executeQuery.htm", paremeter, function(data) {
			data = data[0];
			if (data.reason) {
				$("#tbody").html("<tr><td>" + data.reason + "</td></tr>");
				$("#thead").html("<tr><th>出错了</th></tr>");
				return;
			}
			if (data.data) {
				$("#thead").html("<tr></tr>");
				if (data.data.length > 0) {
					var headTr = $("#thead").find("tr");
					headTr.append("<th>序</th>");
					for ( var key in data.data[0]) {
						headTr.append("<th>" + key + "</th>");
					}
				}
				$("#tbody").html("");
				var tbody = $("#tbody");
				for ( var index in data.data) {
					var tr = $("<tr></tr>");
					tr.append("<td>" + (parseInt(index) + 1) + "</td>");
					for ( var key in data.data[index]) {
						tr.append("<td>" + data.data[index][key] + "</td>");
					}
					tbody.append(tr);
				}
			} else {
				$("#tbody").html("<tr><td>查无数据!</td></tr>");
				$("#thead").html("<tr><th>结果</th></tr>");
			}
		}, "json");

	});
});
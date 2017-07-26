var msgList = [];
var msgMap = {};
$(function() {
	var tbody = $("#msgList").find("tbody");
	tbody.html("");
	window.setInterval(function() {
		$.post("../executeQuery.htm", {
			t : new Date(),
			"querySQL" : "SELECT id,CONTENT, LEVEL, gmt_create, user_id FROM lcb_alert WHERE status IS NULL AND ( LEVEL = 'error' OR LEVEL = 'warn' ) ORDER BY LEVEL ASC, gmt_create DESC limit 15"
		}, function(data) {
			msgList = [];
			msgMap = {};
			data = data[0].data;
			var newMsgMap = {};
			for ( var i in data) {
				var row = data[i];
				newMsgMap[row.id] = row;
				if (msgMap[row.id]) {
					continue;
				}
				msgMap[row.id] = row;
				msgList.push({
					id : row.id,
					level : row.level == "error" ? "异常" : row.level == "warn" ? "警告" : row.level,
					content : row.content,
					time : row.gmt_create.substring(10, 16)
				});
			}

			var tbody = $("#msgList").find("tbody");
			tbody.find("tr").attr("del", "1");
			for ( var i in msgList) {
				var msg = msgList[i];
				if (tbody.find("[alert_id='" + msg.id + "']").length >= 1) {
					tbody.find("[alert_id='" + msg.id + "']").removeAttr("del");
					continue;
				}
				var tr = $("<tr></tr>");
				tr.append('<td class="level">' + msg.level + '</td>');
				tr.append('<td class="time">' + msg.time + '&nbsp;</td>');
				tr.append('<td class="content"><div class="scroll" sleep="3">' + msg.content + '</div></td>');
				if (msg.level == "异常") {
					tr.addClass("error");
				}
				tr.attr("alert_id", msg.id);
				tbody.append(tr);
			}
			tbody.find("tr[del='1']").remove();

		}, "json");
	}, 3000);

	window.setInterval(function() {
		$(".scroll").each(function() {
			var node = $(this);
			if (!node.attr("cur")) {
				node.attr("cur", "1");
			} else {
				node.attr("cur", parseInt(node.attr("cur")) + 1);
			}
			var sleep = parseInt(node.attr("sleep"));
			var cur = parseInt(node.attr("cur"));
			if (cur >= sleep) {
				var top = parseInt(node.css("top"));
				var height = node.height();
				if (height == 60) {
					return;
				}
				if (top == 0 - (height - 60)) {
					top = 0;
					node.fadeOut("normal", function() {
						$(this).animate({
							top : "0px"
						});
						$(this).fadeIn("normal", function() {
							var node = $(this);
							node.attr("cur", "1");
						});
					});
				} else {
					top -= 60;
					node.animate({
						top : top + "px"
					});
				}

			}
		});
	}, 1500);

});

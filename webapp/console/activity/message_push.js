$(function() {

	$("#btnSaveMessage").click(function() {
		var p = {
			t : new Date(),
			msgId : $("#inputId").val().trim(),
			title : $("#inputTitle").val().trim(),
			content : $("#inputMsg").val().trim()
		};
		$.post("message_save.htm", p, function(data) {
			if (data.success) {
				alert("保存成功");
				var tr = $("tr[msgid='" + "sys.jpush.msg." + data.msgId + "']");
				if (tr.length == 0) {
					var newTr = trTemplate.clone();
					newTr.attr("msgid", "sys.jpush.msg." + data.msgId);
					newTr.find(".radio").val("sys.jpush.msg." + data.msgId);
					newTr.find(".id").html(data.msgId);
					newTr.find(".title").html(data.title);
					newTr.find(".content").html(data.content);
					newTr.find(".gmtCreate").html(data.gmtCreate);
					newTr.find(".btnDel").attr("msgid", "sys.jpush.msg." + data.msgId);
					$("#templateTbody").append(newTr);
					addEventListener();
				}

			} else {
				alert(JSON.stringify(data));
			}
		}, "json");

	});

	var trTemplate = $("#templateTbody").find("tr");
	trTemplate.remove();
	$.post("message_list.htm", {
		t : new Date()
	}, function(data) {
		try {
			data = data[0];
			for ( var key in data) {
				var val = data[key];
				var newTr = trTemplate.clone();
				var msg = eval('(' + val + ')');
				newTr.attr("msgid", key);
				newTr.find(".radio").val(key);
				newTr.find(".id").html(msg.msgId);
				newTr.find(".title").html(msg.title);
				newTr.find(".content").html(msg.content);
				newTr.find(".gmtCreate").html(msg.gmtCreate);
				newTr.find(".btnDel").attr("msgid", key);

				$("#templateTbody").append(newTr);
			}
			addEventListener();
		} catch (e) {
			alert(e);
		}
	}, "json");

	$("#btnSend2User").click(function() {
		var p = {
			t : new Date(),
			mobile : $("#mobileInput").val().trim(),
			msgId : $("#inputId").val().trim(),
			title : $("#inputTitle").val().trim(),
			subTitle : $("#inputTitle").val().trim(),
			href : $("#inputH5Root").val() + "/h5/activity/message.htm?device=android&msgId=" + $("#inputId").val().trim(),
			isnotificate : true,
			content : $("#inputMsg").val().trim()
		};
		$.post("message_push.htm", p, function(data) {
			alert(JSON.stringify(data));
		}, "json");
	});

	$("#btnSendAllUsr").click(function() {
		if (!window.confirm("确认推送所有用户?")) {
			return;
		}
		var p = {
			t : new Date(),
			allusr : "1",
			msgId : $("#inputId").val().trim(),
			title : "来存吧理财",
			subTitle : $("#inputTitle").val().trim(),
			href : $("#inputH5Root").val() + "/h5/activity/message.htm?device=android&msgId=" + $("#inputId").val().trim(),
			isnotificate : true,
			content : $("#inputMsg").val().trim()
		};
		$.post("message_push.htm", p, function(data) {
			alert(JSON.stringify(data));
		}, "json");

	});

	$("#btnSubmit").click(function() {
		var p = {
			t : new Date(),
			mobile : $("#mobileInput").val().trim(),
			title : "来存吧理财",
			subTitle : $("#subTitleInput").val().trim(),
			href : $("#hrefInput").val().trim(),
			appView : $("#appViewSelect").val().trim(),
			targetId : $("#targetIdInput").val().trim()
		};
		if (!window.confirm("确认发送?")) {
			return;
		}
		$.post("message_push.htm", p, function(data) {

			alert(JSON.stringify(data));

		}, "json");
	});

	$("#btnSubmit2allusr").click(function() {
		var p = {
			t : new Date(),
			allusr : "1",
			mobile : $("#mobileInput").val().trim(),
			title : "来存吧理财",
			subTitle : $("#subTitleInput").val().trim(),
			href : $("#hrefInput").val().trim(),
			appView : $("#appViewSelect").val().trim(),
			targetId : $("#targetIdInput").val().trim()
		};
		if (!window.confirm("确认推送所有用户?")) {
			return;
		}
		$.post("message_push.htm", p, function(data) {

			alert(JSON.stringify(data));

		}, "json");

	});

});

var addEventListener = function() {
	$("#templateTbody").find(".radio").unbind();
	$("#templateTbody").find(".btnDel").unbind();
	$("#templateTbody").find(".radio").click(function() {
		$.post("message_get.htm", {
			t : new Date(),
			msgId : $(this).val()
		}, function(msg) {
			msg = eval('(' + msg.val + ')');
			$("#inputId").val(msg.msgId);
			$("#inputTitle").val(msg.title);
			$("#inputMsg").val(msg.content);
		}, "json");
	});

	$("#templateTbody").find(".btnDel").click(function() {
		if (!window.confirm("确认删除!")) {
			return;
		}
		$.post("message_del.htm", {
			t : new Date(),
			msgId : $(this).attr("msgid")
		}, function(data) {
			if (data.success) {
				$("tr[msgid='" + data.msgId + "']").remove();
				alert(删除成功);
			} else {
				alert(JSON.stringify(data));
			}
		}, "json");

	});

}

$(function() {
	UserAlertList.load();
	$("#btnSearch").click(function() {
		UserAlertList.load();
	});

});

var UserAlertList = {
		load : function() {
			var param = {
				t : new Date(),
				mobile : $("#mobile").val(),
				status : $('#status option:selected') .val(),
				beginTimeStr : $('#beginTime').datetimebox('getValue'),
				endTimeStr : $('#endTime').datetimebox('getValue'),
				level : $('#level option:selected') .val()
			};
			$.post("user_alert_list.htm", param, function(data) {
				var userAlertTbody = $("#userAlertTbody");
				if (!data) {
					userAlertTbody.html("<tr><td colspan='8' class='loading'>无数据</td></tr>");
					return;
				}
				userAlertTbody.html("");
				for (var i in data) {
					try {
						var row = data[i];
						var newTr = $("<tr></tr>");
						newTr.append("<th>" + "&nbsp;" + "</th>");
						newTr.append("<td>" + (parseInt(i) + 1) + "</td>");
						newTr.append("<td>" + row.begin_time + "</td>");
						newTr.append("<td>" + row.mobile + "</td>");
						newTr.append("<td>" + row.level + "</td>");
						newTr.append("<td>" + row.status + "</td>");
						newTr.append("<td>" + row.summary + "</td>");
					if(row.status=="treated"){
						newTr.append("<td>" + row.revise_time + "</td>");
						}
					else{
							newTr.append("<td>"+null+"</td>");
						}
						newTr.append("<td>" + row.content + "</td>");
					if(row.status=="untreated"){
							newTr.append("<td>" +  "<a onclick='updateById(\""+row.id+"\",\""+row.summary+"\")'>立即处理</a>"  +"</td>");
						}
					else{	
							newTr.append("<td>已经处理 </td>");
						}
						userAlertTbody.append(newTr);
					} catch (e) {
						alert(e);
					}
				}
			}, "json");	
		}
};



function updateById(userid,summaryold){
	$("#dialog").show();
	$("#mytestarea").html(summaryold);
	$("#alertid").val(userid);
	$("#dialog").dialog({
		title : '更改处理状态', 
		closed : false,
		cache : false,
		modal : true,
		t : new Date()
	});
}

$("#btn_update").click(function(){
	var param = {
			t : new Date(),
			summary : $("#mytestarea").val(),
			status : 'treated',
			alertid : $("#alertid").val()
		};
		$.post("user_alert_update.htm", param, function(data) {
			if(data.result=='success'){
				alert("修改成功");
				$('#dialog').dialog('close');
				UserAlertList.load();
			}else if(data.result=='error'){
				alert("修改失败");
				$('#dialog').dialog('close');
			}
		}, "json");	
	});


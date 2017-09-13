$(function() {
	FeedBackService.load();
	$("#btnSearch").click(function() {
		FeedBackService.load();
	});
	
	$("#btnClose").click(function(){
		
		$("#dialog").hide();
	});
	
	$("#btnReply").click(function(){
		var p={
				t:new Date(),
				replyContent:$("#replyContent").val().trim(),
				id:$("#feedbackContent").attr("fid"),
				status:"0"
		};
		if(!p.replyContent){
			$("#replyContent").focus();
			return ;
		}
		$.post("feed_back_update.htm",p,function(data){
			$("#dialog").hide();
			var tr = $("tr[fid='"+data.id+"']"); 
			tr.find(".status").html("");
			tr.find(".opt").html("");
			if(!data.success){
				alert(JSON.stringify(data));
			}
		},"json");
		
	});
});

var FeedBackService = {
		load : function() {
			var param = {
				t : new Date(),
				mobile : $("#mobile").val(),
				status : $('#status option:selected') .val(),
				beginTimeStr : $('#beginTime').datetimebox('getValue'),
				endTimeStr : $('#endTime').datetimebox('getValue')
			};
			$.post("feed_back_list.htm", param, function(data) {
				var positionTbody = $("#positionTbody");
				if (!data) {
					positionTbody.html("<tr><td colspan='8' class='loading'>无数据</td></tr>");
					return;
				}
				positionTbody.html("");
				for (var i in data) {
					try {
						var row = data[i];
						var newTr = $("<tr></tr>");
						newTr.attr("fid",row.id);
						newTr.append("<th style='width: 30px;'>" + "&nbsp;" + "</th>");
						newTr.append("<td style='width: 50px;'>" + (parseInt(i) + 1) + "</td>");
						newTr.append("<td style='width: 70px;'>" + row.trueName + "</td>");
						newTr.append("<td style='width: 100px;'>" + row.mobile + "</td>");
						newTr.append("<td style='width: 120px;'>" + row.feedBackTime + "</td>");
						newTr.append("<td style='width: 350px;' class='content'>" + row.content + "</td>");
						if(row.status=="0"){
							newTr.append("<td style='width: 100px;' class='status'>未处理</td>");
							newTr.append("<td class='opt'>" +  "<a onclick='updateById(\""+row.status+"\",\""+row.id+"\")'>立即处理</a>"  +"</td>");
						}else{
							newTr.append("<td style='width: 100px;'>已处理</td>");
							newTr.append("<td>" + "<a onclick='updateById(\""+row.status+"\",\""+row.id+"\")'>更改成未处理</a>" +"</td>");
						}
						positionTbody.append(newTr);
					} catch (e) {
						alert(e);
					}
				}
			}, "json");	
		}


};

function updateById(status,fBid){
	var dialog = $("#dialog");
	var tr = $("tr[fid='"+fBid+"']"); 
	$("#feedbackContent").val(tr.find(".content").html());
	$("#feedbackContent").attr("fid",fBid);
	$("#replyContent").val("");
	dialog.show();
	
//	if(confirm("是否确认修改处理状态!")){
//		var param = {
//				t : new Date(),
//				status:status,
//				id:fBid
//		}
//		$.post("feed_back_update.htm", param, function(data) {
//			if(data.success){
//				FeedBackService.load();
//			}else{
//				alert("处理失败！");
//			}
//		}, "json");
//	}else{
//		return;
//	}
}
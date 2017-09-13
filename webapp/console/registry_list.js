$(function() {
	RegistryService.load();
	
});

var RegistryService = {
		load : function() {
			var param = {
				t : new Date()
			};
			$.post("registry_list.htm", param, function(data) {
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
						newTr.append("<th style='width: 30px;'>" + "&nbsp;" + "</th>");
						newTr.append("<td>" + row.id + "</td>");
						newTr.append("<td>" + row.val + "</td>");
						newTr.append("<td>" + row.visible + "</td>");
						newTr.append("<td>" + row.summary + "</td>");
						newTr.append("<td>" + "<a onclick='deleteById(\""+row.id+"\")'>删除</a>" + "</td>");
						positionTbody.append(newTr);
					} catch (e) {
						alert(e);
					}
				}
			}, "json");	
		}
};

function deleteById(rid){
	if(confirm("是否确认删除!")){
		var param = {
				t : new Date(),
				id:rid
		}
		$.post("registry_delete.htm", param, function(data) {
			if(!data){
				alert("删除失败！");
			}
		}, "json");	
		}
};

$(function() {
	FinancingTargetPositionService.load();
	$("#btnShowCreateDialog").click(function() {
		$("#dialog").show();
		$("#btn_submitAddPosition").attr("style","display:block");
		$("#btn_submitUpdatePosition").attr("style","display:none");
		$("#position").val($('#queryPosition option:selected') .val());
		
		$("#dialog").dialog({
			title : '安排展现', 
			closed : false,
			cache : false,
			modal : true
		});
	});

	$("#btn_queryFinancingTarget").click(function() {
		var code = $("#financingTargetCode").val();
		if(!code) {
			alert("请输入标的编号！");
			return;
		}
		var param = {
			t : new Date(),
			code : code
		};
		$.post("financing_target_find_by_code.htm", param, function(data) {
			if (data) {
				$("#financingTargetId").val(data.id);
				$("#financingTargetName").val(data.name);
			}else{
				alert("无此标的！");
			}
		}, "json");
	});
	
	$("#btn_submitAddPosition").click(function() {
		if (isEmpty($("#financingTargetId"))) {
			alert("请输入编号！");
			return;
		}
		if (isEmpty($("#position"))) {
			alert("请确定展示位置！");
			return;
		}
		if (!$("#beginTime").datetimebox('getValue')) {
			alert("请确定起始时间！");
			return;
		}
		if (!$("#endTime").datetimebox('getValue')) {
			alert("请确定结束时间！");
			return;
		}
		if($("#beginTime").datetimebox('getValue')>$("#endTime").datetimebox('getValue')){
			alert("起始时间必须在结束时间之前！");
			return;
		}
		var param = {
			t : new Date(),
			financingTargetId : $("#financingTargetId").val().trim(),
			position : $("#position").val().trim(),
			beginTimeStr : $('#beginTime').datetimebox('getValue'),
			endTimeStr : $('#endTime').datetimebox('getValue')
		};
		
		$("#btnCreate").prop("disabled", true);
		$.post("financing_target_position_create.htm", param, function(data) {
			if (data.success) {
				alert("创建成功!");
				window.location.reload();
			} else {
				$("#btnCreate").prop("disabled", false);
				alert("创建失败!");
			}

		}, "json");
	});
	
	$("#queryPosition").change(function() {
		FinancingTargetPositionService.load();
	});

	
});

function isEmpty(input, type) {
	input.removeClass("dataError");
	var v = input.val().trim();
	if (!v) {
		input.focus();
		return true;
	}
	if (!type) {
		return false;
	}
	input.addClass("dataError");
	input.focus();
	return true;
}

var FinancingTargetPositionService = {
	load : function() {
		var oldPosition =$("#queryPosition").val();
		var param = {
			t : new Date(),
			position : $("#queryPosition").val()
		};
		$.post("financing_target_position_list.htm", param, function(data) {
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
					newTr.append("<td>" + (parseInt(i) + 1) + "</td>");
//					newTr.append("<td>" + new Date(row.gmtCreate).toShortTime() + "</td>");
					newTr.append("<td>" + row.position + "</td>");
					newTr.append("<td>" + row.sortNum + "</td>");
//					newTr.append("<td>" + (row.pay ? "是" : "否") + "</td>");
//					newTr.append("<td>" + row.displayStatus + "</td>");
					newTr.append("<td>" + row.targetStatus + "</td>");
					newTr.append("<td>" + row.targetName + "</td>");
					newTr.append("<td>" + row.period + "</td>");
					newTr.append("<td>" + row.collectAmount + "</td>");
					newTr.append("<td>" + row.finishAmount + "</td>");
					newTr.append("<td>" + new Date(row.beginTime).toCNString() + "</td>");
					newTr.append("<td>" + new Date(row.emdTime).toCNString() + "</td>");
					newTr.append("<td>" + "<a onclick='deleteById(\""+oldPosition+"\",\""+row.id+"\")'>删除</a>" + "</td>");
					newTr.append("<td>" + "<a onclick='updatefirst(\""+row.position+"\",\""+row.targetName+"\",\""+row.code+"\",\""+row.id+"\",\""+new Date(row.beginTime).toCNString()+"\",\""+new Date(row.emdTime).toCNString()+"\")'>修改</a>" + "</td>");
					positionTbody.append(newTr);
				} catch (e) {
					alert(e);
				}
			}
		}, "json");
	}
};


//删除后并回显
function deleteById(position,fTPid){
	var oldPosition =$("#queryPosition").val();
	if(confirm("是否确认删除!")){
		var param = {
				t : new Date(),
				position : position,
				id:fTPid
		}
		$.post("financing_target_position_delete.htm", param, function(data) {		
					var positionTbody = $("#positionTbody");
					positionTbody.html("");
					if(data==false){
						alert('删除失败，可能没有权限');
						return;
					}else{
						FinancingTargetPositionService.load();
//						for (var i in data) {
//						try {
//							var row = data[i];
//							var newTr = $("<tr></tr>");
//							newTr.append("<td>" + (parseInt(i) + 1) + "</td>");
////							newTr.append("<td>" + new Date(row.gmtCreate).toShortTime() + "</td>");
//							newTr.append("<td>" + row.position + "</td>");
//							newTr.append("<td>" + row.sortNum + "</td>");
////							newTr.append("<td>" + (row.pay ? "是" : "否") + "</td>");
////							newTr.append("<td>" + row.displayStatus + "</td>");
//							newTr.append("<td>" + row.targetStatus + "</td>");
//							newTr.append("<td>" + row.targetName + "</td>");
//							newTr.append("<td>" + row.period + "</td>");
//							newTr.append("<td>" + row.collectAmount + "</td>");
//							newTr.append("<td>" + row.finishAmount + "</td>");
//							newTr.append("<td>" + new Date(row.beginTime).toCNString() + "</td>");
//							newTr.append("<td>" + new Date(row.emdTime).toCNString() + "</td>");
//							newTr.append("<td>" + "<a onclick='deleteById(\""+oldPosition+"\",\""+row.id+"\")'>删除</a>" + "</td>");
//							newTr.append("<td>" + "<a onclick='updatefirst(\""+row.position+"\",\""+row.targetName+"\",\""+row.code+"\",\""+row.id+"\",\""+new Date(row.beginTime).toCNString()+"\",\""+new Date(row.emdTime).toCNString()+"\")'>修改</a>" + "</td>");
//							positionTbody.append(newTr);
//						} catch (e) {
//							alert(e);
//						}
//					}
				}
		}, "json");
	}else{
		return ;
	}
}


//更新方法  
function updatefirst(position,name,code,fTPid,bt,et) {
	$("#dialog").show();
	$("#btn_submitAddPosition").attr("style","display:none");
	$("#btn_submitUpdatePosition").attr("style","display:block");
	$("#financingTargetCode").attr("value",code);
//	$("#financingTargetName").attr("value",name); //回显名称
	$("#position").val(position);	
//	$('#beginTime').datebox('setValue', bt);//回显起始时间
//	$('#endTime').datebox('setValue', et);//回显结束时间
	$("#dialog").dialog({
		title : '更改内容', 
		closed : false,
		cache : false,
		modal : true,
		t : new Date()
	});
	
	$("#btn_submitUpdatePosition").click(function() {
		if (isEmpty($("#financingTargetId"))) {
			alert("请输入编号!");
			return;
		}
		if (isEmpty($("#position"))) {
			alert("请输入位置！");
			return;
		}
		if (!$("#beginTime").datetimebox('getValue')) {
			alert("请输入起始时间！");
			return;
		}
		if (!$("#endTime").datetimebox('getValue')) {
			alert("请输入结束时间！");
			return;
		}
		if($("#beginTime").datetimebox('getValue')>$("#endTime").datetimebox('getValue')){
			alert("起始时间大于结束时间！");
			return;
		}
		var param = {
			t : new Date(),
			id : fTPid,
			financingTargetId : $("#financingTargetId").val().trim(),
			position : $("#position").val().trim(),
			beginTimeStr : $('#beginTime').datetimebox('getValue'),
			endTimeStr : $('#endTime').datetimebox('getValue')			
		};
		$("#btnCreate").prop("disabled", true);
		$.post("financing_target_position_update.htm", param, function(data) {
			if (data.success) {
				alert("修改成功!");
				$('#dialog').dialog('close');
				FinancingTargetPositionService.load();
			} else {
				$("#btnCreate").prop("disabled", false);
				alert("修改失败!");
				return;
			}
		}, "json");
	});
};

Date.prototype.toCNString = function() {
	return this.getFullYear() + "-" + (this.getMonth()>=9 ? this.getMonth() + 1 : "0" + (this.getMonth() + 1)) + "-" + (this.getDate()>9 ? this.getDate() : "0" + this.getDate()) + " " + (this.getHours()>9 ? this.getHours() : "0" + this.getHours()) + ":" + (this.getMinutes()>9 ? this.getMinutes() : "0" + this.getMinutes()) + ":" + (this.getSeconds()>9 ? this.getSeconds() : "0" + this.getSeconds());
};
Date.prototype.toShortTime = function() {
	return (this.getMonth()>=9 ? this.getMonth() + 1 : "0" + (this.getMonth() + 1)) + "-" + (this.getDate()>9 ? this.getDate() : "0" + this.getDate()) + " " + (this.getHours()>9 ? this.getHours() : "0" + this.getHours()) + ":" + (this.getMinutes()>9 ? this.getMinutes() : "0" + this.getMinutes());
};
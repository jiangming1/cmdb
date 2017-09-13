$(function() {
	ImagePositionService.load();
	$("#btnShowCreateDialog").click(function() {
		$("#dialog").show();
		$("#dialog").dialog({
			title : '添加图片位置', 
			closed : false,
			cache : false,
			modal : true
		});
	});
	
	$("#imageFile").change(function(e) {
		e.stopPropagation();
		if(!$(this).val()) {
			return false;
		}
		$("#imageShow").empty();
		previewImage(this, "#imageShow", 220, 85);
	});
	
	$("#btn_submitAddPosition").click(function() {
		if (isEmpty($("#title"))) {
			return;
		}
		if (isEmpty($("#position"))) {
			return;
		}
		if (isEmpty($("#sortNum"))) {
			return;
		}
		if (isEmpty($("#imageFile"))) {
			return;
		}
		if (isEmpty($("#linkUrl"))) {
			return;
		}
		if (!$("#beginTime").datetimebox('getValue')) {
			return;
		}
		if (!$("#endTime").datetimebox('getValue')) {
			return;
		}
		var param = {
			t : new Date(),
			title : $("#title").val().trim(),
			imageFile : $("#imageFile").val(),
			linkUrl : $('#linkUrl').val().trim(),
			position : $("#position").val().trim(),
			sortNum : $('#sortNum').val().trim(),
			beginTimeStr : $('#beginTime').datetimebox('getValue'),
			endTimeStr : $('#endTime').datetimebox('getValue')
		};
		
		$("#btnCreate").prop("disabled", true);
		$.post("image_position_create.htm", param, function(data) {
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
		ImagePositionService.load();
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

var ImagePositionService = {
	load : function() {
		var param = {
			t : new Date(),
			position : $("#queryPosition").val()
		};
		$.post("image_position_list.htm", param, function(data) {
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
					newTr.append("<td>" + (parseInt(i) + 1) + "</td>");// TODO 未完成（2016-01-21）
//					newTr.append("<td>" + new Date(row.gmtCreate).toShortTime() + "</td>");
					newTr.append("<td>" + row.position + "</td>");
					newTr.append("<td>" + row.position + "</td>");
					newTr.append("<td>" + row.sortNum + "</td>");
//					newTr.append("<td>" + (row.pay ? "是" : "否") + "</td>");
					newTr.append("<td>" + row.displayStatus + "</td>");
					newTr.append("<td>" + row.targetStatus + "</td>");
					newTr.append("<td>" + row.targetName + "</td>");
					newTr.append("<td>" + row.collectAmount + "</td>");
					newTr.append("<td>" + row.finishAmount + "</td>");
					newTr.append("<td>" + new Date(row.beginTime).toCNString() + "</td>");
					newTr.append("<td>" + new Date(row.emdTime).toCNString() + "</td>");
					newTr.append("<td>" + "" + "</td>");
					positionTbody.append(newTr);
				} catch (e) {
					alert(e);
				}
			}
		}, "json");
	}
};
Date.prototype.toCNString = function() {
	return this.getFullYear() + "-" + (this.getMonth()>=9 ? this.getMonth() + 1 : "0" + (this.getMonth() + 1)) + "-" + (this.getDate()>9 ? this.getDate() : "0" + this.getDate()) + " " + (this.getHours()>9 ? this.getHours() : "0" + this.getHours()) + ":" + (this.getMinutes()>9 ? this.getMinutes() : "0" + this.getMinutes()) + ":" + (this.getSeconds()>9 ? this.getSeconds() : "0" + this.getSeconds());
};
Date.prototype.toShortTime = function() {
	return (this.getMonth()>=9 ? this.getMonth() + 1 : "0" + (this.getMonth() + 1)) + "-" + (this.getDate()>9 ? this.getDate() : "0" + this.getDate()) + " " + (this.getHours()>9 ? this.getHours() : "0" + this.getHours()) + ":" + (this.getMinutes()>9 ? this.getMinutes() : "0" + this.getMinutes());
};

function previewImage(obj, prev, width, height){
	var files = obj.files,
	img = new Image();
	if(window.URL){
		//File API
	  //alert("window.URL===="+files[0].name + "," + files[0].size + " bytes");
      img.src = window.URL.createObjectURL(files[0]); //创建一个object URL，并不是你的本地路径
      img.width = width;
      img.height = height;
      img.onload = function(e) {
         window.URL.revokeObjectURL(this.src); //图片加载后，释放object URL
      }
      jQuery(prev).append(img);
	}else if(window.FileReader){
		//opera不支持createObjectURL/revokeObjectURL方法。我们用FileReader对象来处理
		var reader = new FileReader();
		reader.onload = function(e){
			//alert("window.FileReader===="+files[0].name + "," +e.total + " bytes");
			img.src = this.result;
			img.src="data:application/octet-stream;"+this.result.substr(this.result.indexOf("base64,"));
			img.onload = function () { // binding onload event
				// TODO 加载预览
			}
			
			img.onerror=function(){
				//TODO 显示预览失败
			}
			img.width = width;
		    img.height = height;
			$(prev).append(img);
		}
		reader.readAsDataURL(files[0]);
	}else{
		//ie
		obj.select();
		obj.blur();
		var nfile = document.selection.createRange().text;
		document.selection.empty();
		img.src = nfile;
		img.width = width;
	    img.height = height;
		img.onload=function(){
		      //alert("else===="+nfile+","+img.fileSize + " bytes");
		}
		$(prev).append(img);
		$(prev).css("filter","progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src='"+ nfile + "')");
		//fileList.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='image',src='"+nfile+"')";
	}
}
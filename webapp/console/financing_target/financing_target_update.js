if (CKEDITOR.env.ie && CKEDITOR.env.version < 9)
	CKEDITOR.tools.enableHtml5Elements(document);
$(function() {
	DescriptionTool.initEditor();
	var picpaths  = $("#pics").val().trim();
	$("#btnUpdate").click(function() {
		FinancingTargetService.update(picpaths);
	});

	$('#file_upload').uploadify({
		'formData' : {
			'timestamp' : new Date()
		},
		'queueID' : 'queue',
		'fileObjName' : 'file_n',
		'buttonText' : '上传图片',
		'swf' : '../../static/uploadify/uploadify.swf',
		'uploader' : 'pic_upload.htm',
		'onUploadSuccess' : function(file, data, response) {
			var data = eval("(" + data + ")");
			if (data.pic) {
				PicPreviewBox.basePath = data["pic_root_path"];
				PicPreviewBox.show(data.pic);
				PicPreviewBox.sort();
				picpaths = JSON.stringify(PicPreviewBox.getPics());
			}
		}
	});
	PicPreviewBox.init();
});

var FinancingTargetService = {
	update : function(picpaths) {
		var param = {
			t : new Date(),
			id : $("#id").val().trim(),
			status : $("#status").val().trim(),
			bidCount : $("#bidCount").val().trim(),
			finishAmount : $("#finishAmount").val().trim(),
			name : $("#targetName").val().trim(),
			collectAmount : $("#collectAmount").val().trim(),
			period : $("#period").val().trim(),
			annualizedRates : $("#annualizedRates").val().trim(),
			minAmount : $("#minAmount").val().trim(),
			limitAmount : $("#limitAmount").val().trim(),
			description : CKEDITOR.instances.editor.getData(),
			beginDateStr : $('#beginDate').datetimebox('getValue'),
			endDateStr : $('#endDate').datetimebox('getValue'),
			interestWay : $("#interestWay").val(),
			code : $("#code").val(),
			type : $("#type").val(),
			pics : picpaths,
			cashMark : $("#cashMark").val(),
			draftBank : $("#draftBank").val(),
			draftAmount : $("#draftAmount").val(),
			draftNo : $("#draftNo").val(), 
			newInvestor : $("#newInvestor").val(),
			incrRate : $("#incrRate").val(),
			targetMark : $("#targetMark").val(),
			cityAddress : $("#cityAddress").val()
		};
		if (isEmpty($("#targetName"))) {
			return;
		}
		if (isEmpty($("#collectAmount"), "money")) {
			return;
		}
		if (isEmpty($("#period"), "int")) {
			return;
		}
		if (isEmpty($("#annualizedRates"), "rates")) {
			return;
		}
		if (isEmpty($("#minAmount"), "money")) {
			return;
		}
		if (isEmpty($("#limitAmount"), "money")) {
			return;
		}
		$("#btnUpdate").prop("disabled", true);
		$.post("financing_target_update.htm", param, function(data) {
				if(data.code=="SUCCESS"){
					alert("修改成功");
				}else{
					alert("修改失败");
				}
		}, "json");
	}
};
var moneyRegex = /(^[0-9]+$)|(^[0-9]+\.[0-9]{1,2}$)/g;
var intRegex = /(^[0-9]+$)/g;
var ratesRegex = /(^[0-9]+$)|(^[0-9]+\.[0-9]{1,2}$)/g;
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
	if (type && type == "money" && v.match(moneyRegex)) {
		return false;
	}
	if (type && type == "int" && v.match(intRegex)) {
		return false;
	}
	if (type && type == "rates" && v.match(ratesRegex)) {
		return false;
	}
	input.addClass("dataError");
	input.focus();
	return true;
}

var DescriptionTool = {
	initEditor : function() {
		CKEDITOR.config.height = 150;
		CKEDITOR.config.width = 'auto';
		initSample();
	}
};
var initSample = (function() {
	var wysiwygareaAvailable = isWysiwygareaAvailable(), isBBCodeBuiltIn = !!CKEDITOR.plugins.get('bbcode');

	return function() {
		var editorElement = CKEDITOR.document.getById('editor');

		// :(((
		if (isBBCodeBuiltIn) {
			editorElement.setHtml('Hello world!\n\n' + 'I\'m an instance of [url=http://ckeditor.com]CKEditor[/url].');
		}

		// Depending on the wysiwygare plugin availability initialize classic or
		// inline editor.
		if (wysiwygareaAvailable) {
			CKEDITOR.replace('editor');
		} else {
			editorElement.setAttribute('contenteditable', 'true');
			CKEDITOR.inline('editor');

			// TODO we can consider displaying some info box that
			// without wysiwygarea the classic editor may not work.
		}
	};

	function isWysiwygareaAvailable() {
		// If in development mode, then the wysiwygarea must be available.
		// Split REV into two strings so builder does not replace it :D.
		if (CKEDITOR.revision == ('%RE' + 'V%')) {
			return true;
		}

		return !!CKEDITOR.plugins.get('wysiwygarea');
	}
})();

var PicPreviewBox = {
	basePath : null,
	getPics : function() {
		var imgIds = [];
		var imgList = $("#mainPicUl").find("img[pic='true']");
		for (var i = 0; i < imgList.length; i++) {
			imgIds.push({
				path : $(imgList[i]).attr("path"),
				id : $(imgList[i]).attr("pic_id"),
				sortNum : $(imgList[i]).attr("sort_num")
			});
		}
		return imgIds;
	},
	init : function() {
		$("#mainPicUl").find(".icon-remove").click(function() {
			if (!window.confirm("确认删除")) {
				return;
			}
			var imgNode = $(this).parent().parent().find(".img-polaroid");
			var p = {
				pic_id : imgNode.attr("pic_id"),
				t : new Date()
			};
			if (!p.pic_id) {
				return;
			}
			$.post("pic/del.htm", p, function(data) {
				if (!data.success) {
					alert("删除失败!");
					return;
				}
				var imgNode = $("img[pic_id='" + data["pic_id"] + "']");
				PicPreviewBox.clearImgSite(imgNode);
				PicPreviewBox.sort();
			}, "json");
		});

		// 右移
		$("#mainPicUl").find(".icon-circle-arrow-right").click(function() {
			var imgLi = $(this).parent().parent();
			var nextLi = imgLi.next();
			var pic1 = imgLi.find("img[pic='true']");
			var pic2 = nextLi.find("img[pic='true']");
			if (pic1.length == 0 || pic2.length == 0) {
				return;
			}
			var p = {
				pic1_id : pic1.attr("pic_id"),
				pic1_sort_num : pic1.attr("sort_num"),
				pic2_id : pic2.attr("pic_id"),
				pic2_sort_num : pic2.attr("sort_num"),
				t : new Date()
			};
			pic1.attr("sort_num", p.pic2_sort_num);
			pic2.attr("sort_num", p.pic1_sort_num);
			PicPreviewBox.sort();

		});
		// 左移
		$("#mainPicUl").find(".icon-circle-arrow-left").click(function() {
			var imgLi = $(this).parent().parent();
			var pic1 = imgLi.find("img[pic='true']");
			var pic2 = imgLi.prev().find("img[pic='true']");
			if (pic1.length == 0 || pic2.length == 0) {
				return;
			}
			var p = {
				pic1_id : pic1.attr("pic_id"),
				pic1_sort_num : pic1.attr("sort_num"),
				pic2_id : pic2.attr("pic_id"),
				pic2_sort_num : pic2.attr("sort_num"),
				t : new Date()
			};
			pic1.attr("sort_num", p.pic2_sort_num);
			pic2.attr("sort_num", p.pic1_sort_num);
			PicPreviewBox.sort();

		});

		// 初始化图片
		// if (photoInfo_str && pic_base_url) {
		// this.basePath = pic_base_url;
		// var photoInfo = eval('(' + photoInfo_str + ')');
		// for ( var i in photoInfo) {
		// this.show(photoInfo[i]);
		// }
		// }
	},
	show : function(pic) {
		var imgs = $("#mainPicUl").find("img.img-polaroid");
		for (var i = 0; i < imgs.length; i++) {
			var imgNode = $(imgs[i]);
			if (!imgNode.attr("pic_id")) {
				imgNode.attr("pic_id", pic["id"]);
				imgNode.attr("src", this.basePath + pic["path"]);
				imgNode.attr("path", pic["path"]);
				imgNode.attr("sort_num", new Date().getTime());
				imgNode.attr("pic", "true");
				break;
			}
		}

	},
	clearImgSite : function(imgNode) {
		imgNode.removeAttr("pic_id");
		imgNode.attr("src", "../../static/imgs/no_img.png");
		imgNode.removeAttr("sort_num");
		imgNode.removeAttr("pic");
	},
	sort : function() {
		var existImgList = $("#mainPicUl").find("img[pic='true']");
		if (existImgList.length == 0) {
			return;
		}
		var picList = [];
		for (var i = 0; i < existImgList.length; i++) {
			var img = $(existImgList[i]);
			picList.push({
				id : img.attr("pic_id"),
				path : img.attr("path"),
				sortNum : parseInt(img.attr("sort_num"))
			});
			this.clearImgSite(img);
		}
		// 排序
		for (var i = 0; i < picList.length; i++) {
			for (var j = 0; j < picList.length - 1; j++) {
				var pic1 = picList[j];
				var pic2 = picList[j + 1];
				if (pic1.sortNum > pic2.sortNum) {
					var tmp = pic1;
					picList[j] = picList[j + 1];
					picList[j + 1] = tmp;
				}
			}
		}
		for (var i = 0; i < picList.length; i++) {
			this.show(picList[i]);
		}

	}

};
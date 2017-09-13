$(function() {
	var localURL=window.location.href;
	localURL=localURL.split("/");
	localURL=localURL[localURL.length-1]; 
	var apiUl = $("#left").find("ul");
	for ( var i in ApiList) {
		var api = ApiList[i];
		var li = $("<li><a href='" + api.href + "'>" + (parseInt(i) + 1) + "、" + api.name + "</a></li>");
		if(localURL==api.href){
			li.addClass("current-page");
		}
		apiUl.append(li);
	}
	try {

		APITestTool.makeTestBtn();

	} catch (e) {
		alert(e);
	}

	// add comm parameter link
	$(".paramtab").find("tbody").append("<tr><td colspan='5'><a href='index.html#comm_param' target='_blank'>公共参数部分</a></td></tr>");
});

function iframeAutoHeight(iframeId) {

	var ifm = document.getElementById(iframeId);
	var subWeb = document.frames ? document.frames[iframeId].document : ifm.contentDocument;
	if (ifm != null && subWeb != null) {
		ifm.height = subWeb.body.scrollHeight;
		ifm.width = subWeb.body.scrollWidth;
	}
}

var APITestTool = {
	apiurl : "",
	makeTestBtn : function() {
		var urlBox = $("#docContent").find("blockquote");
		var apiUrl = urlBox.find("p").html();
		if (!apiUrl) {
			return;
		}
		apiUrl = apiUrl.trim();
		if (apiUrl.length < 5 || apiUrl.substring(0, 4) != "/api") {
			return;
		}
		this.apiurl = apiUrl;
		var testBtn = $("<button>测试</button>");
		testBtn.addClass("testBtn");
		urlBox.append(testBtn);
		testBtn.click(function() {
			var testForm = $("#testForm");
			if (testForm.length == 0) {
				testForm = $("<div></div>");
				testForm.attr("id", "testForm");
				$("body").append(testForm);
			}
			testForm.slideDown();
			testForm.html("");
			var paremeterList = $(".paramtab").find("tr");
			for (var i = 0; i < paremeterList.length; i++) {
				var firstTd = $(paremeterList[i]).find("td:first");
				if (firstTd.length == 0) {
					continue;
				}
				var paramName = firstTd.html().trim();
				var span = $("<span>" + paramName + "</span>");
				var input = $("<input />");
				input.attr("name", paramName);
				testForm.append(span);
				testForm.append(input);
			}
			var executeBtn = $("<button>执行</button>");
			testForm.append(executeBtn);
			testForm.append("<span id='testResult'></span>");
			executeBtn.click(function() {
				var inputList = $("#testForm").find("input");
				var param = {
					t : new Date()
				};
				for (var i = 0; i < inputList.length; i++) {
					var input = $(inputList[i]);
					param[input.attr("name")] = input.val().trim();
				}
				// alert(JSON.stringify(param));
				// alert(APITestTool.apiurl);
				var url = window.location.href.split("api_doc")[0] + APITestTool.apiurl.substring(1);

				$.post(url, param, function(data) {
					$("#testResult").html(JSON.stringify(data));
					$("#testResult").show();
				}, "json");
			});
		});
	}
};
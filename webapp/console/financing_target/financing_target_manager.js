$(function() {

	$("#mainIframe").prop("src", $("#statusBar").find("li.current").attr("src") + "?t=" + new Date());

	$("#statusBar").find("li").click(function() {
		$("#statusBar").find("li").removeClass("current");
		$(this).addClass("current");
		$("#mainIframe").prop("src", $(this).attr("src") + "?t=" + new Date());
	});

	// 加载各状态标的数量
	$.post("financing_target_status_count.htm", {
		t : new Date()
	}, function(data) {
		$(".badge").html("0");
		if (!data) {
			return;
		}
		for ( var key in data) {
			$(".badge." + key).html(data[key]);
		}

	}, "json");
});

function iframeOnload() {
	$("#mainIframe").css("height", ($("body").height() - 55) + "px");

}
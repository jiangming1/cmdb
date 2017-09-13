$(function() {

	$(".progress").each(function() {
		ProgressCanvasTool.show(this, $(this).attr("percent"));
	});
	
	$("#topLayout a").click(function () {
		$("#topLayout .selected").removeClass("selected");
		$(this).addClass("selected");
		if($(this).attr("rel")=="saleout") {
			$("#repaymentDiv").hide();
			$("#saleoutDiv").show();
		} else if($(this).attr("rel")=="repayment") {
			$("#saleoutDiv").hide();
			$("#repaymentDiv").show();
		}
	});

});

var ProgressCanvasTool = {
	show : function(canvas, percent) {
		percent = parseFloat(percent);
		var cxt = canvas.getContext("2d");
		var circle = {
			x : 100,
			y : 100,
			half_width : 76
		};
		cxt.fillStyle = "#FF0000";
		cxt.beginPath();
		cxt.arc(circle.x, circle.y, circle.half_width, 0, 7, false);
		cxt.lineWidth = 6;
		cxt.strokeStyle = "#fbe1d7";
		cxt.stroke();
		cxt.closePath();

		cxt.beginPath();
		cxt.arc(circle.x, circle.y, circle.half_width, 0, 6.3 * (Math.floor(percent)/100), false);
		cxt.lineWidth = 6;
		cxt.strokeStyle = "#ff7b4d";
		cxt.stroke();
		cxt.closePath();

		cxt.font = "40px Calibri";
		cxt.fillStyle = "#fe5014";
		var percentText = Math.floor(percent) + "%";
		var xLeft = 0;
		if (percentText.length == 4) {
			xLeft = 35;
		} else if (percentText.length == 3) {
			xLeft = 30;
		} else if (percentText.length == 2) {
			xLeft = 20;
		}
		cxt.fillText(percentText, circle.x - xLeft, circle.y + 10);
	}
};

$(function() {

	setInterval(function() {
		Listener.req();
	}, 1000);

	setInterval(function() {
		$(".secend").each(function() {
			$(this).html(parseInt($(this).html()) + 1)
		});
		$("#ipCount").html($("#IPTOP").find("li").length);
		var count = 0;
		$("#URITOP").find(".count").each(function() {
			count += parseInt($(this).html());
		});
		$("#URIVisitCount").html(count);
		
		
		var times = 0;
		$("#URITOP").find(".time").each(function() {
			times += parseInt($(this).html());
		});
		$("#URIVisitTime").html(times);
		
		
		
		$("#CPUUsed").html((times / (parseFloat($("#requestSecend").html()) * 1000 * 2 )).toFixed(6));
		
	}, 1000);

	setInterval(function() {

		var uriLis = $("#URITOP").find("li");
		uriLis.attr("sorted", "0");
		uriLis.each(function() {
			var li = $(this);
			if (li.attr("sorted") == "1") {
				return;
			}
			li.attr("sorted", "1");
			var tmpLi = null;
			for (var i = 0; i < uriLis.length; i++) {
				tmpLi = $(uriLis[i]);
				if (li.attr("uri") == tmpLi.attr("uri")) {
					continue;
				}
				if (parseInt(li.find(".time").html()) > parseInt(tmpLi.find(".time").html())) {
					li.insertBefore(tmpLi);
				} else {
					tmpLi.insertBefore(li);
				}
			}
		});

		var iplist = $("#IPTOP").find("li");
		iplist.attr("sorted", "0");
		iplist.each(function() {
			var li = $(this);
			if (li.attr("sorted") == "1") {
				return;
			}
			li.attr("sorted", "1");
			var tmpLi = null;
			for (var i = 0; i < iplist.length; i++) {
				tmpLi = $(iplist[i]);
				if (li.attr("ip") == tmpLi.attr("ip")) {
					continue;
				}
				if (parseInt(li.find(".count").html()) > parseInt(tmpLi.find(".count").html())) {
					li.insertBefore(tmpLi);
				} else {
					tmpLi.insertBefore(li);
				}
			}
		});

	}, 1500);

	var a = [];
	a.push("1");
	a.push("2");
	a.push("3");
	// alert(a);
	// alert(a.slice(-10,10));
});

var URIMap = {};

var Listener = {
	req : function() {
		$.post("get_request.htm", {
			t : new Date()
		}, function(data) {
			if (data.length == 0) {
				return;
			}
			var line = null;
			var columns = null;
			var uriTop = $("#URITOP");
			var ipTop = $("#IPTOP");
			var uriLi = null;
			var ipLi = null;
			var tmpArray = null;
			for ( var i in data) {
				line = data[i].trim();
				if (!line) {
					continue;
				}
				columns = line.split(",");

				uriLi = uriTop.find("[uri='" + columns[2] + "']");
				if (uriLi.length == 0) {
					uriLi = $("<li><span class='count'>1</span><span class='time'></span><span class='uri'></span></li>");
					uriLi.attr("uri", columns[2]);
					uriLi.find(".time").html(columns[1]);
					uriLi.find(".uri").html(columns[2]);
					uriTop.append(uriLi);
				} else {
					uriLi.find(".count").html(parseInt(uriLi.find(".count").html()) + 1);
					uriLi.find(".time").html(parseInt(uriLi.find(".time").html()) + parseInt(columns[1]));
				}
				ipLi = ipTop.find("[ip='" + columns[0] + "']");
				if (ipLi.length == 0) {
					ipLi = $('<li><span class="count">1</span><span class="ip"></span></li>');
					ipLi.find(".ip").html(columns[0]);
					ipLi.attr("ip", columns[0]);
					ipTop.append(ipLi);
				} else {
					ipLi.find(".count").html(parseInt(ipLi.find(".count").html()) + 1)
				}

			}
			// alert(JSON.stringify(data));
		}, "json");
	}
};
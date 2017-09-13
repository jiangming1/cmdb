/**
 * 活动js
 */
$(function() {

	$.post("activity/activity_find.htm", {
		t : new Date()
	}, function(data) {
		ActivityScreen.show(data);
	}, "json")
});

var ActivityScreen = {
	show : function(item) {
		if (!item || !item.type) {
			return;
		}
		var screen = $("<div id='activityLayout'><div class='activity-body'><div class='act-head'></div><div class='activity-content'></div></div></div>");
		var contentDiv = screen.find(".activity-content");
		screen.find(".act-head").append("<div class='activity-close'><a  href='javascript:return false;'>╳</a></div>");
		screen.find(".act-head").find("a").click(function() {
			$("#activityLayout").hide();
		});

		contentDiv.append("<div class='activity-name'>" + item.name + "</div>");
		contentDiv.append("<div class='activity-block'></div>");
		contentDiv.append("<div class='activity-amount'>" + item.amount + "元</div>");
		contentDiv.append("<div class='activity-a'>仅限7天新手标使用</div>");
		// contentDiv.append("<div class='activity-open'><a
		// href='javascript:return false;'><img /></a></div>");
		contentDiv.append("<div class='activity-open'><a href='javascript:return false;'><img src='img/ljlq_1.png'/></a></div>");
		var btnOpen = contentDiv.find(".activity-open").find("a");
		btnOpen.attr("item_id", item.id);
		//btnOpen.find("img").attr("src", "img/open.png");
		btnOpen.click(function() {
			var p = {
				t : new Date(),
				packageItemId : $(this).attr("item_id")
			};

			$.post("activity/open_red_package.htm", p, function(data) {
				if (data.code == 'SUCCESS') {
					ActivityScreen.opened(data);
				} else if (data.code == 'CANT_FIND_TARGET') {
					alert("抢疯了,小二在准备更多体验金.");
				} else {
					alert(data.code);
				}
			}, "json");

		});
		$($("body")[0]).append(screen);
		//ActivityScreen.opened(item);

	},
	opened : function(rs) {
		var contentDiv = $("#activityLayout").find(".activity-content");
		if (contentDiv.length == 0) {
			return;
		}
		$("#activityLayout").find(".activity-body").addClass("act-opend");
		contentDiv.html("");

		contentDiv.append("<div class='act-line act-top-block'></div>");
		contentDiv.append("<div class='act-line act-amount'>" + rs.amount + "元</div>");
		contentDiv.append("<div class='act-line act-summary'><span class='ok'>领取成功</span><br/>体验金已在您的账户开始计息</div>");
		contentDiv.append("<div class='act-line act-2account'><a href='my_account.htm'><img src='img/qkk_1.png'/></a></div>");

	}
};
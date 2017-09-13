$(function() {
	FeedBackService.initUserList();
	$(window).keydown(function(event) {
		if(event.keyCode == 13) {
			replyUserFeedBack();
		}
	});
	
	$(".btn-sent").click(replyUserFeedBack);
	
});
var FeedBackService = {
	initUserList : function() {
		$.post("feed_back_user_list.htm",'', function(data){
			if(data) {
				for(var i in data){
					var list = $("<li class='item' rel='" + data[i].user_id + "'></li>");
					list.append("<img src='../h5/img/userhead.png'>");
					if(data[i].true_name) {
						list.append("<h2 class='user_id'>" + data[i].true_name + "</h2>");
					} else {
						list.append("<h2 class='user_id'></h2>");
					}
					if(data[i].mobile) {
						list.append("<h4 class='user_phone'>" + data[i].mobile + "</h4>");
					} else {
						list.append("<h4 class='user_phone'></h4>");
					}
					if(data[i].noReplyCount > 0) {
						list.append("<span class='no_read_message'>" + data[i].noReplyCount + "</span>");
					}
					$(".user-list").append(list);
					$(".item").eq(0).click();
				}
				
				$(".item").eq(0).addClass("active");
	    		$(".title").text($(".active").find("h2").text());
	    		FeedBackService.loadChatList(data[0].user_id);
				// 为.item绑定事件：点击左侧列表   添加背景颜色及右侧显示聊天记录
		    	$(".item").click(toLoadChatList);
			}
		},"json");
	},
	loadChatList: function(userId) {
		var param = {
			t : new Date(),
			userId : userId
		};
		$.post("user_chat_list.htm", param, function(data){
			if(data) {
				$(".chat-con-wrap").html("");
				$(".chat-con-wrap").scrollTop(0);
				for(var i in data){
//					<div class="message-time" style="text-align: center;margin: 5px auto;">15:20</div>
//					<div class="customer" style="float: left;margin: 5px;">
//						<table>
//							<tr>
//								<td style="vertical-align: top"><img src="../h5/img/userhead.png" style="width: 30px;height: 30px;"></td>
//								<td><div class="feedback" style="">请问,我星期一就提现了,为什么现在还不收账呢请问,我星期一就提现了,为什么现在还不收账呢请问,我星期一就提现了,为什么现在还不收账呢请问,我星期一就提现了,为什么现在还不收账呢?</div></td>
//							</tr>
//						</table>
//					</div>
//					<div class="custom_service" style="float: right;margin: 5px;">
//						<table>
//							<tr>
//								<td><div class="feedbackreply" style="">请问,我星期一就提现了,为什么现在还不收账呢请问,我星期一就提现了,为什么现在还不收账呢请问,我星期一就提现了,为什么现在还不收账呢请问,我星期一就提现了,为什么现在还不收账呢?</div></td>
//								<td style="vertical-align: top"><img src="../h5/img/service.png" style="width: 30px;height: 30px;"></td>
//							</tr>
//						</table>
//					</div>
					var html = '';
					if(data[i].content && data[i].content.trim()) {
						if(data[i].gmt_create && i == 0) {
							html += '<div class="message-time clearfix" rel="' + data[i].gmt_create + '" style="text-align: center;margin: 5px auto;">' + new Date(data[i].gmt_create).toCNString() + '</div>';
						} else if(data[i].gmt_create && data[i - 1].gmt_create && Math.floor(data[i].gmt_create/86400000) - Math.floor(data[i - 1].gmt_create/86400000) > 0) {
							html += '<div class="message-time clearfix" rel="' + data[i].gmt_create + '" style="text-align: center;margin: 5px auto;">' + new Date(data[i].gmt_create).toCNString() + '</div>';
						} else if(data[i].gmt_create && data[i - 1].gmt_create && data[i].gmt_create - data[i - 1].gmt_create > 300000) {
							html += '<div class="message-time clearfix" rel="' + data[i].gmt_create + '" style="text-align: center;margin: 5px auto;">' + new Date(data[i].gmt_create).toShortTime() + '</div>';
						} else {
							html += '<div class="message-time clearfix" rel="' + data[i].gmt_create + '" style="text-align: center;margin: 5px auto;"></div>';
						}
						
						if(data[i].status && data[i].status == "feed") {
							html += '<div class="customer clearfix" rel="' + data[i].id + '" style="float: left; margin: 1%; width: 98%;">' +
										'<table>' +
											'<tr>' +
												'<td style="vertical-align: top"><img src="../h5/img/userhead.png" style="width: 30px;height: 30px;"></td>' +
												'<td><div class="feedback" style="">' + data[i].content + '</div></td>' +
											'</tr>' +
										'</table>' +
									'</div>';
						} else if(data[i].status && data[i].status == "reply") {
							html += '<div class="custom_service clearfix" style="float: right; margin: 1%; width: 98%;">' +
										'<table style="float: right;">' +
											'<tr>' +
												'<td><div class="feedbackreply" style="">' + data[i].content + '</div></td>' +
												'<td style="vertical-align: top"><img src="../h5/img/service.png" style="width: 30px;height: 30px;"></td>' +
											'</tr>' +
										'</table>' +
									'</div>';
						}
						
					}
//					if(data[i].content && data[i].content.trim()) {
//						if(data[i].reply_time && data[i].gmt_create && Math.floor(data[i].reply_time/86400000) - Math.floor(data[i].gmt_create/86400000) > 0) {
//							html += '<div class="message-time clearfix" style="text-align: center;margin: 5px auto;">' + new Date(data[i].reply_time).toCNString() + '</div>'
//						} else if(data[i].reply_time && data[i].gmt_create && data[i].reply_time - data[i].gmt_create > 300000) {
//							html += '<div class="message-time clearfix" style="text-align: center;margin: 5px auto;">' + new Date(data[i].reply_time).toShortTime() + '</div>'
//						}
//						
//					}
					$(".chat-con-wrap").append(html);
				}
				$(".chat-con-wrap").scrollTop($(".chat-con-wrap .clearfix:last").position().top);
			}
		},"json");
	}

};

function toLoadChatList() {
	$(".title").text($(this).find("h2").text());
	$(this).addClass("active").siblings().removeClass("active");
	$(this).addClass("prevent").siblings().removeClass("prevent");
	FeedBackService.loadChatList($(this).attr("rel"));
}

function replyUserFeedBack() {
	var param = {
		t : new Date(),
		userId : $(".active").attr("rel"),
		feedBackId : $(".chat-con-wrap .customer:last").attr("rel"),
		replyContent : $(".btn-sent").siblings().find("textarea").val()
	};
	if(!param.userId) {
		return ;
	}
	if(!param.replyContent){
		$("#replyContent").focus();
		return ;
	}
	$.post("reply_user_feed_back.htm", param, function(data){
		if(data.code == "success") {
//			$(".chat-con-wrap").scrollTop(0);
//			$(".btn-sent").siblings().find("textarea").val("");
//			var lastTime = $(".chat-con-wrap .message-time:last").attr("rel");
//			var nowTime = param.t.getTime();
//			var html = "";
//			if(nowTime && lastTime && Math.floor(nowTime/86400000) - Math.floor(lastTime/86400000) > 0) {
//				html += '<div class="message-time clearfix" style="text-align: center;margin: 5px auto;">' + new Date(nowTime).toCNString() + '</div>';
//			} else if(nowTime && lastTime && nowTime - lastTime > 300000) {
//				html += '<div class="message-time clearfix" style="text-align: center;margin: 5px auto;">' + new Date(nowTime).toShortTime() + '</div>';
//			}
//			
//			if(param.replyContent) {
//				html += '<div class="custom_service clearfix" style="float: right; margin: 1%; width: 98%;">' +
//							'<table style="float: right;">' +
//								'<tr>' +
//									'<td><div class="feedbackreply" style="">' + param.replyContent + '</div></td>' +
//									'<td style="vertical-align: top"><img src="../h5/img/service.png" style="width: 30px;height: 30px;"></td>' +
//								'</tr>' +
//							'</table>' +
//						'</div>';
//			}
//			$(".chat-con-wrap").append(html);
//			$(".chat-con-wrap").scrollTop($(".chat-con-wrap .clearfix:last").position().top);
			
			$(".btn-sent").siblings().find("textarea").val("");
			FeedBackService.loadChatList(param.userId);
		} else {
			alert(data.msg);
		}
	},"json");
}

Date.prototype.toCNString = function() {
	return this.getFullYear() + "-" + (this.getMonth()>=9 ? this.getMonth() + 1 : "0" + (this.getMonth() + 1)) + "-" + (this.getDate()>9 ? this.getDate() : "0" + this.getDate()) + " " + (this.getHours()>9 ? this.getHours() : "0" + this.getHours()) + ":" + (this.getMinutes()>9 ? this.getMinutes() : "0" + this.getMinutes()) + ":" + (this.getSeconds()>9 ? this.getSeconds() : "0" + this.getSeconds());
};
Date.prototype.toShortTime = function() {
	return (this.getHours()>9 ? this.getHours() : "0" + this.getHours()) + ":" + (this.getMinutes()>9 ? this.getMinutes() : "0" + this.getMinutes());
};
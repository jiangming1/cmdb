<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>意见反馈</title>
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<style type="text/css">
.feedback, .feedbackrepay {
	margin-top: 5px;
}

.splitime {
	text-align: center;
	color: #ccc;
}

.feedback .content {
	background-color: #a0e75a;
	border-radius: 3px;
	padding: 10px;
	border: 1px solid #8bce60;
	float: right;
}

.feedbackrepay .content {
	background-color: #ffffff;
	border-radius: 3px;
	padding: 10px;
	border: 1px solid #dedede;
	float: left;
}

.head {
	width: 40px;
}

.smartip {
	margin: 10px;
	padding: 10px;
	background-color: #ddd;
	border-radius: 6px;
	font-size: 9px;
	color: gray;
}

body, html {
	height: 100%;
}
.template{
	display: none;
}
</style>
</head>
<body style="background-color: #eee;">
	<c:if test="${param.device==null||param.device=='' }">
		<div class="backBar">
			<table>
				<tbody>
					<tr>
						<td style="width: 50px;"><a href="my_account.htm?tab=account&t=<%=new Date()%>">
								<img src="img/icon_fanhui.png" style="height: 40px;">
							</a></td>
						<td>意见反馈</td>
						<td style="width: 50px;"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</c:if>
	<div id="feedbackForm" style="background-color: #eee;padding: 10px; position: fixed; bottom: 0px; width: 100%; border-top: 1px solid #ccc; height: 50px; z-index: 100;">
		<table style="width: 100%;">
			<tr>
				<td><input placeholder="" id="content" class="form-control" style="width: 99%;" /></td>
				<td style="width: 100px;"><button class="btn btn-success" style="width: 100%;" id="btnSubmit">留言</button></td>
			</tr>
		</table>
	</div>
	<table style="width: 100%; height: 100%;">
		<tr>
			<td>
				<div style="height: 100%; overflow: hidden; padding-bottom: 20px;" id="chartPad">
					<div class="splitime template">2016-10-08 17:39</div>
					<div class="feedback template">
						<table style="width: 100%;">
							<tr>
								<td style="padding-left: 10px;" valign="top"><span class="content">请问,我星期一就提现了,为什么现在还不收账呢?</span></td>
								<td style="width: 7px; text-align: center;" valign="top"><img style="position: relative; left: -1px;" src="img/right_arrow.png" /></td>
								<td style="width: 60px; text-align: center;" valign="top">我</td>
							</tr>
						</table>
					</div>
					<div class="feedbackrepay template">
						<table style="width: 100%;">
							<tr>
								<td style="width: 60px; text-align: center;" valign="top"><img class="head" src="img/logo.jpg" /></td>
								<td style="width: 6px; text-align: center;" valign="top"><img style="position: relative; right: -1px;" src="img/left_arrow.png" /></td>
								<td style="padding-right: 10px;" valign="top"><span class="content">法定节假日顺延!</span></td>
							</tr>
						</table>
					</div>
					<div class="smartip template">系统提示:客服将会在24小时内对您的留言作出回复.感谢您的关注!</div>
				</div>
				<a name="chatbottom"></a>
			</td>
		</tr>
		<tr style="height: 50px;">
			<td></td>
		</tr>
	</table>

	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		var beforeData = "";
		var templateSplitime = null;
		var templateFeedback = null;
		var templateFeedbackrepay = null;
		var templateSmartip = null;
		$(function() {
			templateSplitime = $("#chartPad").find(".template.splitime").removeClass("template").remove();
			templateFeedback = $("#chartPad").find(".template.feedback").removeClass("template").remove();
			templateFeedbackrepay = $("#chartPad").find(".template.feedbackrepay").removeClass("template").remove();
			templateSmartip = $("#chartPad").find(".template.smartip").removeClass("template").remove();
			$("#btnSubmit").click(function() {
				var p = {
					t : new Date(),
					content : $("#content").val().trim(),
					app_token : "${param.app_token}"
				};
				if (!p.content) {
					$("#content").focus();
					return;
				}
				$.post("submit_feed_back.htm", p, function(data) {
					if (data.code != 'SUCCESS') {
						alert("出错了:" + data.code);
						return;
					}
					$("#content").val("");
					$("#content").focus();
					var feedback = templateFeedback.clone();
					feedback.find(".content").html(data.content);
					var chartPad=$("#chartPad");
					chartPad.append(feedback);
					if(chartPad.find(".smartip").length==0){
						chartPad.append(templateSmartip.clone());
					}
					window.location="#chatbottom";
				}, "json");
			});
			window.setInterval(function(){
				
				Chart.showFeedback();
				
			},3000);
			

			Chart.showFeedback();

		});
		var Chart = {
			showFeedback : function() {
				$.post("list_feed_back.htm", {
					t : new Date(),
					app_token : "${param.app_token}"
				}, function(data) {
					if(beforeData==JSON.stringify(data)){
						return ;
					}
					beforeData=JSON.stringify(data);
					var chartPad = $("#chartPad");
					chartPad.html("");
					var preTime = null;
					for ( var i in data) {
						var msg = data[i];

						if (!preTime || msg.reply_time - preTime > 600000) {
							var d = new Date(msg.reply_time);
							var splitime = templateSplitime.clone();
							splitime.html((d.getMonth() + 1) + "-" + d.getDate() + " " + d.getHours() + ":" + d.getMinutes());
							chartPad.append(splitime);
							preTime = msg.reply_time;
						}

						var feedback = chartPad.find(".feedback[fbid='" + msg.id + "']");
						if (feedback.length == 0) {
							feedback = templateFeedback.clone();
							feedback.attr("fbid", msg.id);
							feedback.find(".content").html(msg.content);
							chartPad.append(feedback);
						}

						//alert(msg.reply_id);
						if (msg.reply_id) {
							var feedbackrepay = templateFeedbackrepay.clone();
							feedbackrepay.find(".content").html(msg.reply_content);
							chartPad.append(feedbackrepay);
						}

					}
					window.location="#chatbottom";
					//alert(JSON.stringify(data));
				}, "json");
			}
		};
	</script>
</body>
</html>
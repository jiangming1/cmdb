<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>客服使用聊天窗口</title>
<style type="text/css">
*{
	margin: 0;
	padding: 0;
}
a {
	text-decoration: none;
}
img{
	box-sizing: border-box;
	max-width: 100%;
	height: auto;
	vertical-align: middle;
	border: 0;
}
table{
	border-collapse:collapse;
	border-spacing:0;
}
li{
	list-style: none;
}
.fl{
	float: left;
}
.fr{
	float: right;
}
.clearfix:before,.clearfix:after {
	display: table;
	content: " ";
	line-height: 0;
	width: 100%;
	visibility: hidden;
}
.clearfix:after { 
	clear: both; 
} 
.wrap{
	width: 816px;
	position: fixed;
	top: 50px;
	height: 600px;
	border: 1px solid #999;
	box-shadow: 2px 2px 3px #DDD,-2px -2px 3px #DDD;
}
.user-list{
	background: #EAEAEA;
	height: 100%;
	overflow: auto;
	width: 186px;	
}
.item{
	padding: 8px 8px 8px 56px;
	min-height: 40px;
	position: relative;
}
.item:hover{
	background: #DAD8D8;
}
.item img{
	position: absolute;
	left: 8px;
	top: 8px;
	max-width: 40px;
	max-height: 40px;
	width: 100%;
	height: 100%;
}
.item h2{
	font-size: 16px;
/*	margin: 0 0 4px 0; */
}
.item h4{
	font-size: 12px;
}
.no_read_message{
	min-width: 20px;
	height: 20px;
/*	padding: 0 4px; */
	line-height: 20px;
	border-radius: 10px;
	background: #FF5A2C;
	color: #FFF;
	position: absolute;
	right: 4px;
	top: 18px;
	text-align: center;
	font-size: 12px;
}
.title{
	height: 55px;
	line-height: 56px;
	border-bottom: 1px solid #D6D2D1;
	padding-left: 50px;
}
.active{
	background: #cacdd3 !important;
}
.feedbackreply,.feedback{
	max-width: 500px;	
	padding: 5px;
	border-radius: 8px;
	position: relative;
}
.feedbackreply{
	margin-right: 10px;
	border: 1px solid #9EEA6A;
	background: #9EEA6A;
}
.feedback{
	margin-left: 10px;
	border: 1px solid #E7E7E7;
	background: #E7E7E7;
}
.feedbackreply:after{
	display: block;
	content: " ";
	width:0;
	height:0;
	border-width:6px;
	border-style:dashed dashed dashed solid;
	font-size: 0;
	line-height: 0;
	border-color:transparent transparent transparent #9EEA6A;/*透明 灰 透明 透明 */
	position: absolute;
	right: -12px;
	top: 6px;
}
.feedback:after{
	display: block;
	content: " ";
	width:0;
	height:0;
	border-width:6px;
	border-style:dashed solid dashed dashed;
	border-color:transparent #E7E7E7 transparent transparent;/*透明 灰 透明 透明 */
	font-size: 0;
	line-height: 0;
	position: absolute;
	left: -12px;
	top: 6px;
}
.txtarea{
	border: 1px solid #444;
	border-radius: 5px 0 0 5px;
	box-shadow: 0 2px 0 #fff;
}
.btn-sent{
	background: #56BDF3;
	margin-right: 20px;
	width: 50px;
	text-align: center;
	height: 30px;
	line-height: 30px;
	border-radius: 5px;
}
.btn-sent:hover{
	background: #FF5A2C;
	color: #FFF;
	cursor: pointer;
}
.user_id {
	height: 18px;
}
.prevent {
    pointer-events: none;
}
</style>
</head>
<body>
	<div class="clearfix wrap">
		<ul class="fl user-list"><!-- 用户列表	下面为模板	-->
<!--		<li class="item"> -->
<!--			<img src="../h5/img/userhead.png"> -->
<!--			<h2 class="user_id">江宁</h2> -->
<!--			<h4 class="user_phone">18949987422</h4> -->
<!--			<span class="no_read_message">9</span> -->
<!--		</li>		-->
		</ul>
		<div class="fr" style="height: 600px;width: 628px;"><!-- - 聊天记录框 - -->
		<div class="title"></div>
		<div class="chat-con-wrap clearfix" style="height: 442px;overflow: auto;">
<!-- 			<div class="message-time" style="text-align: center;margin: 5px auto;">15:20</div> -->
<!-- 			<div class="customer" style="float: left;margin: 5px; width: 100%;"> -->
<!-- 				<table> -->
<!-- 					<tr> -->
<!-- 						<td style="vertical-align: top"><img src="../h5/img/userhead.png" style="width: 30px;height: 30px;"></td> -->
<!-- 						<td><div class="feedback" style="">请问,我星期一就提现了,为什么现在还不收账呢请问,我星期一就提现了,为什么现在还不收账呢请问,我星期一就提现了,为什么现在还不收账呢请问,我星期一就提现了,为什么现在还不收账呢?</div></td> -->
<!-- 					</tr> -->
<!-- 				</table> -->
<!-- 			</div> -->
<!-- 			<div class="custom_service" style="float: right;margin: 5px;"> -->
<!-- 				<table> -->
<!-- 					<tr> -->
<!-- 						<td><div class="feedbackreply" style="">请问,我星期一就提现了,为什么现在还不收账呢请问,我星期一就提现了,为什么现在还不收账呢请问,我星期一就提现了,为什么现在还不收账呢请问,我星期一就提现了,为什么现在还不收账呢?</div></td> -->
<!-- 						<td style="vertical-align: top"><img src="../h5/img/service.png" style="width: 30px;height: 30px;"></td> -->
<!-- 					</tr> -->
<!-- 				</table> -->
<!-- 			</div> -->
		</div>
		<div class="clearfix reply" style="max-height: 100px;border-top: 1px solid #D6D2D1;padding-top: 10px;">
			<div style=""><textarea rows="3" style="resize: none;width: 606px;height: 50px;outline: none;border: none;font-size: 16px;padding: 0 10px;" ></textarea></div>
			<div class="fr btn-sent">回复</div>
		</div>
		</div>
	</div>

	<script type="text/javascript" src="../h5/js/jquery.min.js"></script>
	<script type="text/javascript" src="web_chat.js?v=201611071738"></script>
	<script type="text/javascript">
		$(function(){
			//窗口可以拖动 
			var width = $(window).width();
			var height = $(window).height();
			$(".wrap").css({
				"left": (width/2 - 408) + "px",
			});
			$(".user-list,.title").mousedown(function(e){
				var abs_x = e.clientX - $('.wrap').offset().left; //鼠标到左边的距离 - 获取div左边的距离（包含外边距）
				var abs_y = e.clientY - $('.wrap').offset().top; //鼠标到顶部的距离 - 获取div顶部的距离（包含外边距）
				$(document).mousemove(function(e){
					var now_left = e.clientX;
					var now_top = e.clientY;
					var left = now_left - abs_x;
					var top = now_top- abs_y;
					if(left < 0){
						left = 0;
					}else if(left > width - 816){
						left = width - 816;
					};
					if(top < 0){
						top = 0;
					}else if(top > height - 600){
						top = height - 600;
					};
					$(".wrap").css({
						"left": left,
						"top": top,
					});
				}).mouseup(function(e){
					$(document).unbind("mousemove");
					$(document).unbind("mouseup");
				});
				return false;
			});
		});
	</script>
</body>
</html>
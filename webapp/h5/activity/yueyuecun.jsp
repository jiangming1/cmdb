<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>月月存活动-首页</title>
<style>
*{
	margin: 0;
	padding: 0;
}
img{
	box-sizing: border-box;
	max-width: 100%;
	height: auto;
	vertical-align: middle;
	border: 0;
}
li{
	list-style: none;
	text-align: center;
}
a{
    text-decoration: none;
    color: #FFF;
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
.btn-select{
	position: absolute;
	font-size: 12px;	
	z-index: 3;	
}
.btn-default{
	display: block;
	text-align: center;
	font-style:normal;
	background: #FFF;
	box-sizing: border-box;
	border: 1px solid #FFF;
	border-radius: 6px 0 0 6px;
}
.btn-drop,.btn-get,.btn-href{
	position: absolute;
	display: block;
}
.mask,.mask1{
	position: fixed;
	width: 100%;
	height: 100%;
	left: 0;
	top: 0;
	background: rgba(255,255,255,0);
	display: none;
	z-index: 2;
}
.mask1{
    background: rgba(0,0,0,0.6);
	z-index: 101;
}
.alert{
    position: absolute;
    width: 80%;
    left: 5%;
    padding: 5% 5% 10%;
    top: 35%;
    background: #FFF;
    border-radius: 8px;
    z-index: 102;
    display: none;
}
.btn-sure{
    width: 35%;
    padding: 3% 0;
    text-align: center;
    border-radius: 12px;   
}
.btn-use{
    width: 60%;
    padding: 3% 0;
    text-align: center;
    border-radius: 12px;
    margin: 20px auto;
    background: #4a6fda;
    display: none;
}
.alert-joined{
	position: absolute;
	z-index: 10;
    background: rgba(0,0,0,0.6);
    top: 0px;
    height: 100%;
    width: 100%;
    display: none;
}
#alert-joined-box{
	width: 300px;
	height: 100px;
	background-color: white;
	line-height: 80px;
	text-align: center;
    border-radius: 5px;
    margin: 0px auto;
    margin-top: 200px;
}
</style>
</head>
<body>
<input type="hidden" id="device" value="${param.device }" />
<input type="hidden" id="app_token" value="${param.app_token }" />
<div class="wrap" style="width: 100%;position: relative;">
	<img src="http://laicunba.b0.upaiyun.com/lcb/activity/monthly_invest/yuecun.png">
	<div class="btn-select">
		<cite class="btn-default">0.5%加息券30天1000元以上使用</cite>
		<ul style="display: none;background: #FFF; border-radius: 5px 0px 0px 5px;">
			<li selectid="30" defid="yyc1">0.5%加息券30天1000元以上使用</li>
			<li selectid="50" defid="yyc2">1%加息券50天3000元以上使用</li>
			<li selectid="80" defid="yyc3">2%加息券80天5000元以上使用</li>
		</ul>
		<input type="hidden" value="30" id="inputselect"/>
	</div>
	<div class="btn-drop" style="z-index:100;"></div>
	<div class="btn-get"></div>
	<a class="btn-href" href="../financial_zone.htm?tab=zone&app_view=zone"></a>
	<div class="mask"></div>
	<div class="mask1"></div>
     <div class="alert" style="">
          <div style="text-align: center;color: #1d3d7a;">
               <h2 id="alert-title">确认领取</h2>
               <div style="margin: 20px 0;"><img src="img/rate-half.png" id="rate-img" style="width: 40%;"></div>
               <div id="rate-txt">30天1000元以上使用</div>
          </div>
          <div class="clearfix" style="margin-top: 20px;" id="verify-area">
               <div class="fl btn-sure btn-close" style="margin-left: 10%;background: #929393;">不领了</div>
               <div class="fr btn-sure" style="margin-right: 10%;background: #4a6fda;"><a href="javascript:void(0);" id="btn-sure">确定</a></div>
          </div>
          <div class="btn-use"><a href="../financial_zone.htm?tab=zone&app_view=zone">去使用</a></div>
     </div>
     <div class="alert-joined" style="display: none;">
     	<div id="alert-joined-box">本月您已领取过</div>
     </div>
</div>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script src="activity.js"></script>
<script type="text/javascript">
$(function(){
	
	$(".alert-joined,#alert-joined-box").click(function(){
		$(".alert-joined").hide(); 
	});
	
	Activity.ready($("#app_token").val(), "20170117", "JOIN_INFO", {
		t:new Date()
	}, function(data){
		if(Activity.conditions.joined("001")){
  			$(".btn-get").click(function() {
  				$(".alert-joined").show(); 
  			}); 
			
	 
			
		}else{
			
			
			$("#btn-sure").click(function(){ 
				Activity.join("001",{ 
					defid:$("#inputselect").attr("defid")?$("#inputselect").attr("defid"):"yyc1"
				}, function(jdata){
					if(jdata.code=="SUCCESS"){
						$("#verify-area").hide();
						$("#alert-title").text("领取成功");
						$(".btn-use").show();
					}else if(jdata.code=="token_error"){
						
						if(!$("#device").val()){
							console.log("h5 login");
							window.location.href="../login.htm?tab=account&returnUrl=activity/monthly_invest.htm";
						}else{
							console.log("app login");
							window.location.href="monthly_invest.htm?app_view=login";
						}
						 
					}else if(jdata.code=="HAS_NO_CHANGE"){
						$(".mask1,.alert").hide();
						$(".alert-joined").show(); 
						
					}else{ 
						alert(JSON.stringify(jdata));
					}
				}); 
			});
			
			
			$(".btn-get").click(function() {
				var period = $("#inputselect").val();
				if(period == 30) {
					$("#rate-img").attr("src","img/rate-half.png");
					$("#rate-txt").text("30天1000元以上使用");
				} else if(period == 50) {
					$("#rate-img").attr("src","img/rate-one.png");
					$("#rate-txt").text("50天3000元以上使用");
				} else if(period == 80) {
					$("#rate-img").attr("src","img/rate-two.png");
					$("#rate-txt").text("80天5000元以上使用");
				}
		 		$(".mask1,.alert").show();
			});
			
		}
	
	});
});

$(function(){
	 
	jQuery.divselect = function(divselectid,inputselectid) {
		var inputselect = $(inputselectid);
		$(".btn-drop").click(function(){
			var ul = $(divselectid + " ul");
			if(ul.css("display")=="none"){
				ul.slideDown("fast");
			}else{ 
				ul.slideUp("fast"); 
			}; 
			$(".mask").show();
		});
		$(divselectid+" ul li").click(function(){
			var txt = $(this).text();
			$(divselectid+" cite").html(txt);
			var value = $(this).attr("selectid");
			inputselect.val(value); 
			inputselect.attr("defid",$(this).attr("defid"));
			$(divselectid+" ul").hide();
			$(".mask").hide();
		}); 
		$(".mask").click(function(){
			$(".mask").hide();
			$(divselectid+" ul").hide();
		});
		$(".mask1").click(function(){
			$(".mask1, .alert").hide();
			window.location.reload();
		});
	}; 
	$(function(){ 
		$.divselect(".btn-select","#inputselect"); 
	});
	var ratio=$(window).width()/750;
	function rdist(num){
		return Math.floor(ratio*num) + "px";
	};
	$(".btn-select").css({
		width: rdist(405),
		left: rdist(90),
		top: rdist(556),
	});
	$(".btn-select li,.btn-default").css({
		height: rdist(63),
		lineHeight: rdist(63),
	});
	$(".btn-select .btn-default").css({
		height:rdist(63),		
	});
	$(".btn-drop").css({
		width: rdist(452),
		height: rdist(63),
		left: rdist(90),
		top: rdist(556),
	});
	$(".btn-get").css({
		width: rdist(113),
		height: rdist(63),
		right: rdist(78),
		top: rdist(556),
	});
	$(".btn-href").css({
		width: rdist(303),
		height: rdist(63),
		left: rdist(235),
		top: rdist(730),
	});
	
	var alertHeight = $(".alert").height();
	$(".alert").css("margin-top","-"+(alertHeight/2)+"px")
	$(".btn-close").click(function(){
		$(".alert,.mask1").hide();
	})
	

	
	$("#btn-surexx").click(function() {
		var param = {
			t : new Date(),
			period : $("#inputselect").val(),
			app_token : $("#app_token").val()
		};
		$.post("monthly_receive_rate_incr.htm", param, function(data){
			if(data.code=="SUCCESS") {
				$("#verify-area").hide();
				$("#alert-title").text("领取成功");
				$(".btn-use").show();
			} else if(data.code=="LOGIN_TIME_OUT") {
				if($("#device").val()) {
					window.location.href="monthly_invest.htm?app_view=login";
				} else {
					if("${param.from_h5}"=='true'){
						console.log("h5 login");
						window.location.href="../login.htm?tab=account&returnUrl=activity/monthly_invest.htm";
					}else{
						console.log("app login");
						window.location.href="monthly_invest.htm?app_view=login";
					}
					
				}
			} else {
				$("#verify-area").hide();
				$(".btn-use").show();
				$("#alert-title").text("领取失败");
				$("#rate-txt").text(data.msg);
			}
		},"json");
	});
}); 
</script>
</body>
</html>
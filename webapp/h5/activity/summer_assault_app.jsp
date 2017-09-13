<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>暑假突击战</title>
<link rel='stylesheet' href='../css/summer_assault.css'>
<script src="../js/jquery.min.js"></script>
	<script>
		$(function() {
			$(".meter > span").each(function() {
				$(this)
					.data("origWidth", $(this).width())
					.width(0)
					.animate({
						width: $(this).data("origWidth")
					}, 1200);
				
					$(".jinduchi").animate({
							left: "87.8%"},1200);
			});
			$(".rule img").click(function(){
				$(".mask,.detail_con,.close").fadeIn();		
			});
			$(".close img").click(function(){
				$(".mask,.detail_con,.close").fadeOut();
			});
		});

	</script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

.contain {
	width:100%;
	position: relative;
	
} 


#page-wrap {
	position:absolute;
	width:71%;
	top:51%;
	left:18.5%;
	font: 18px Georgia, serif;
	text-align: center;
	line-height: 16px;
	color: #eee;
	font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
}
.jinduchi{
	position:absolute;
	top:0px;
	left:0px;
	margin-left:-10px;
	margin-top:-9px;
}
.jinduchi img{
	width:23px;
}
.words{
	position:absolute;
	color:#eee;
	top:33%;
	left:22%;
	font-weight:900;
	font-size:1.3em;
}
.btn001{
	position:absolute;
	top:22.5%;
	left:7%;
	width: 22%;
	 height: 7%;
	 border-radius: 50%; 
	 -moz-border-radius: 50%;
	 -webkit-border-radius: 50%;
}
.btn002{
	position:absolute;
	top:22.5%;
	left:39%;
	width: 22%;
	 height: 7%;
	 border-radius: 50%; 
	 -moz-border-radius: 50%;
	 -webkit-border-radius: 50%;
}
.btn003{
	position:absolute;
	top:22.5%;
	left:71%;
	 width: 22%;
	 height: 7%;
	 border-radius: 50%; 
	 -moz-border-radius: 50%;
	 -webkit-border-radius: 50%;
}

.rule{
     position: fixed;
	 right: -20px; 
	 bottom: 30%;
}
.rule img{
	height:50px;
}
.mask{
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background: rgba(0,0,0,0.25);
	z-index: 9;
	display: none;
}
.detail_con{
	background:#eee;
	z-index: 8; 
	position: fixed; 
	display: none;
	left:6%;
	top:5%;
	width: 80%;
	height: 80%;
	overflow:auto; 
	padding: 4%;
	border-radius: 8px;
}
.close{
	position: fixed;
	z-index: 10; 
	right: -5%;
	top: 1%;
	display: none;
}

.close img{
	width:70%;
}
.detail_header{
	 border-bottom: 1px solid #CCC; 
	 text-align: center; 
	 font-size: 22px; 
	 padding: 5px; 
	 margin-bottom: 10px; 
	 color: #C5A556;
}
.detail_header_list{
	list-style: decimal;
}
.detail_header_list tr td{
	color: #595757;
	font-size: 12px;
	line-height: 18px;	
}

.td-a a{
	color: #FF7433 !important;
}
.td-1{
	vertical-align: top;
}
</style>
</head>
<body style="background-color: #061670;">
<div class="contain">
	 <img src="img/summerassaultapp.jpg" width="100%" />
	<div>
		<a class="btn001"></a>
		<a class="btn002"></a>
		<a class="btn003"></a>
	</div>
	<div id="page-wrap">	
		<div class="meter red">
			<span style="width:88.8%;font-size:12px;">请到“来存吧”微信公众号查看能量值</span>
			<i class="jinduchi"><img src="img/13.png"></i>
		</div>
	</div>
	</div>
</body>
</html>
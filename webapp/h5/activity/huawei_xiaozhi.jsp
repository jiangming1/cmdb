<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>华为小知</title>
</head>
<style>
*{
	margin:0;
	padding:0;
	font-family: "微软雅黑";
}
.dole_btn_div{
	width:100%;
	position:fixed;
	bottom:0;
	left:0;
	background:rgba(134,124,108,1);
	height:66px;
	margin:0 auto;
	line-height:10%;
}
.input_mobile{
	width:60%;
	position:fixed;
	bottom:1.5%;
	left:2%;
	height:45px;
	background:#FFF;
	border-radius:1rem 0 0 1rem;
	border:0;
	outline:none;
	font-size:1em;
	padding-left:3%;
}
.btn_dole{
	width:35%;
	position:fixed;
	bottom:1.5%;
	left:62%;
	height:45px;
	color:#fff;
	background:#FD2F17;
	font-size:1.3em;
	border-radius:0 1rem 1rem 0;
	border:0;
	outline:none;
}

.result_div{
	z-index:11;
	display:none;
}
.result_img{
	width:100%;
	position:fixed;
	bottom:0.5%;
	z-index:11;
	
	
}
.down_app{
	left:12.5%;
	width:75%;
	position:fixed;
	bottom:37%;
	z-index:11;

}

.close{
	position:absolute;
	width:17px;
	height:17px;
	left:81%;
	top:13%;
}
.mask{
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background: rgba(0,0,0,0.2);
	z-index: 9;
	display:none;
}

.remind_content_div{
	position:absolute;
	width:100%;
	text-align:center;
	bottom:51%;
	z-index:11;
	font-size:0.9em;
	color:#7e7e7e;
	display:none;
}
</style>
<body>
<img src="http://laicunba.b0.upaiyun.com/lcb/huawei_xiaozhi.jpg" width="100%;" />
<div class="dole_btn_div">
		<input class="input_mobile"/>
		<button class="btn_dole">立即领取</button>
</div>
<div class="result_div">
<div class="result_img">
<img src=""  width="100%;"/>
	<div class="close"></div>
	<div class="remind_content_div">下载来存吧并使用<span></span>注册</br>可在“我的账户>投资总额”查看</div>
</div>

<div class="down_app"><a href="http://laicunba.b0.upaiyun.com/lcb/laicunba_10.apk" ><img src="img/down_app.png" width="100%;"/></a></div>

</div>
<div class="mask"></div>
<script src="../js/jquery.min.js"></script>
<script>
$(".btn_dole").click(function() {
	var p ={
			t:new Date(),
			mobile:$(".input_mobile").val(),
	}
	if (!p.mobile) {
		$(".input_mobile").focus();
		return;
	}
	$.post("../judge.htm", p,function(data) {
		if (data.code == "USER_EXIST") {
			$(".result_img img").attr("src","img/already_regist.png");
			$(".result_div,.mask").show();
		}
		else{
			$(".result_img img").attr("src","img/registing.png");
			$(".remind_content_div span").html(p.mobile);
			$(".result_div,.mask,.remind_content_div").show();
		}
	}, "json");
	
	
});
$(".close").click(function(){
	$(".result_div,.mask,.remind_content_div").hide();
})
</script>
</body>
</html>
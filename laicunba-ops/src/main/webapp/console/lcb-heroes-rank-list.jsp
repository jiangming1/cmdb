<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%> 
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>来存吧英雄排行榜</title>
<script type="text/javascript" src="../js/jquery-1.11.0.js"></script>
<head>
<style type="text/css">
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
   background: url(img/hero-list-bg.png) no-repeat bottom;
   width: 100%;
   height: 100vh;
   position: relative;
   background-size: 100%;
}
.container{
   width: 776px; 
   height: 585px;
   position: absolute;
   left: 50%; 
   top: 50%;
   margin-left: -400px;
   margin-top: -305px;
   background: url(img/hero-list-box.png) no-repeat;
   background-size: 100%;
   padding: 15px;
}
.wrapper{
   position: absolute;
   top: 52px; 
   left: 35px;
   width: 752px;
   height: 513px;
   opacity: 1;
   overflow: hidden;
}
/*定义滚动条宽高及背景，宽高分别对应横竖滚动条的尺寸.暂支持chrome*/
.main::-webkit-scrollbar{
   width: 15px;
   background: #111312;
}
/*定义滚动条的轨道，内阴影及圆角*/
.main::-webkit-scrollbar-track{
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
    border-radius: 10px;
    background-color: #111312;
}
/*定义滑块，内阴影及圆角*/
.main::-webkit-scrollbar-thumb{
    /*width: 10px;*/
    height: 20px;
    border-radius: 10px;
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
    background-color: #163537;
}

.nav{
   width: 732px;
   height: 53px;
   background: url(img/nav-bg.png) no-repeat;
   background-size: 100%;
}
.nav-ul li{
   float: left;
   color: #FFF;
   line-height: 53px;
   text-align: center;
}
.nav-item{
   width: 55px;
}
.nav-item1{
   width: 105px;
}
.nav-item2{
   width: 290px;
}
.main{
   overflow: auto;
   height: 450px;
   margin-top: 10px;
}
.main-ul>li{
   margin-bottom: 5px;
}
.main-ul-fl,.main-ul-fr{
   height: 70px;
}
.main-ul-fl li,.main-ul-fr li{
   float: left;
   color: #FFF;
   text-align: center;
}
.main-ul-fl li{
   line-height: 70px;
}
.main-item{
   width: 55px;
}
.main-name{
   position: relative;
   line-height: normal !important;
}
.main-name img{
   position: absolute;
   left: 10px;
   top: 8px;
   max-width: 34px;
   max-height: 34px;
   width: 100%;
   height: 100%;
   z-index: 2;
}
.main-name h2{
   font-size: 12px;
   margin-top: 42px;
}
.day{
   margin-left: 32px;
}
.main-item1{
   width: 105px;
}
.box-fl{
   float: left;
   width: 435px;
   height: 70px;
   background: url(img/box-fl-bg.png) no-repeat;
   background-size: 100%;
}
.box-fr{
   float: left;
   width: 290px;
   height: 70px;
   margin-left: 5px;
   background: url(img/box-fr-bg.png) no-repeat;
   background-size: 100%;
}
.flower-con{
   font-size: 12px;
   width: 160px;
   margin-top: 10px;
}
.btn-pay{
   line-height: 70px;
   width: 130px;
   text-align: center;
}
.main-item1 img ,.btn-pay img {
   width: 83px;
}
.balance,.money{
   color: #FF6B60;
}
.wrapper-hide{
   height: 0;
   opacity: 0;
   transition: all 1s;
}
.wrapper-show{
   height: 513px;
   opacity: 1;
   transition: all 1s 1s;
}
.raiders-con{
   width: 732px;
   height: 513px;
   position: absolute;
   left: 37px;
   top: -513px;
   background: #09201e;
   border: 2px solid #103534;
   opacity: 0;
}
.raiders-con-up{
   top: 66px;
   opacity: 1;
   transition: all 1s 1s;
}
.raiders-con-down{
   top: -513px;
   opacity: 0;
   transition: all 1s;
}
.route-item{
   width: 600px;
   margin: 0 auto 30px; 
   color: #FFF;
}
.route-item li{
   list-style: decimal;
   list-style-position: outside;
   
   line-height: 35px;
}
</style>
</head>
<body style="background: #151921;">
<div class="wrap"                                                                                                                                                                                                                                                                                                        >
     <div class="container">
          <div class="wrapper" style="">
               <div class="nav">
                    <ul class="nav-ul clearfix">
                        <li class="nav-item" style="margin-left: 15px;">排行</li>
                        <li class="nav-item">英雄</li>
                        <li class="nav-item" style="margin-left: 32px;">今天</li>
                        <li class="nav-item">本周</li>
                        <li class="nav-item">本月</li>
                        <li class="nav-item1">赠</li>
                        <li class="nav-item2">结算</li>
                    </ul>
               </div>
               <div class="main">
                    <ul class="main-ul">
                        <li class="search clearfix">
                            <div class="box-fl">
                                 <ul class="main-ul-fl">
                                     <li class="main-item" style="margin-left: 15px;">1</li>
                                     <li class="main-item main-name">
                                         <img src="img/logo.png" width="34px" height="34px" style="border-radius: 50%;"> 
                                         <h2 class="user-name">-</h2>                
                                     </li>
                                     <li class="main-item score day">-</li>
                                     <li class="main-item score week">-</li>
                                     <li class="main-item score month">-</li>
                                     <li class="main-item1"><img src="img/btn-give-a.png"></li>
                                 </ul>
                            </div>
                            <div class="box-fr">
                                 <ul class="main-ul-fr">
                                     <li class="flower-con">
                                         <div>未结算小红花[<span class="balance">0</span>]朵</div>
                                         <div>[<span class="alipay"></span>]</div>
                                         <div>转[<span class="money">0.00</span>]元</div>
                                     </li>
                                     <li class="btn-pay"><img src="img/btn-close-a.png"></li>
                                 </ul>
                            </div>
                        </li>                                                             
                    </ul>
               </div>
          </div>
          <div class="raiders-icon" style="position: absolute;right: 45px;top: 12px;">
               <img src="img/raiders-icon.png" style="width: 50px;">
          </div>
          <div class="raiders-con">
               <div style="margin: 20px;text-align: center;"><img src="img/raiders-sign.png"></div>
               <p style="margin: 30px 0 5px 50px;color: #FFF;">赚取小红花途径： </p>
               <ul class="route-item">                  
                   <li>提交了代码</li>
                   <li>提交BUG并经指派人确认</li>
                   <li>修复BUG并经测试人员确认已修复</li>
                   <li>确认完成了某个需求（大家可以做某项工作或改进的时候，自己登记到禅道上去，完成之后自己确认一下）</li>
               </ul>
               <div class="btn-stop" style="text-align: center;"><img src="img/btn-stop-a.png" style="width: 90px;"></div>
          </div>
          
     </div>
</div>
<script type="text/javascript" src="../js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="lcb-heroes-rank-list.js"></script>
</body>
</html>
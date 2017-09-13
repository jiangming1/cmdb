<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width,initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<title>投资日历</title>
<link href="css/calendar.css?v=201610311551" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/Calendar.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/fun.js?v=201611081038"></script>
<style type="text/css">
.backBar{
	width: 100%;
	margin-bottom: 10px;
}
.backBar table {
	width: 100%;
	height: 50px;
	background-color: #FFF;
	font-size: 20px;
}

.backBar table td {
	text-align: center;
}

.backBar a {
	display: inline-block;
	width: 100%;
	height: 100%;
	text-decoration: none;
	line-height: 50px;
	text-align: left;
}
</style>
</head>
<body style="background-color: #f2f2f4;">
<input type="hidden" id="device" value="${param.device }" />
<input type="hidden" id="app_token" value="${param.app_token }" />
<c:if test="${param.device==null||param.device=='' }">
	<div class="backBar">
		<table>
			<tr>
				<td style="width: 50px;"><a href="javascript:history.go(-1);"><img src="img/icon_fanhui.png" style="height: 40px;"></a></td>
				<td>投资日历</td>
				<td style="width: 50px;"></td>
			</tr>
		</table>
	</div>
</c:if>
<div class="calendar">
	<div class="outer clearfix" id="calendarcontainer"> </div>
</div>	

<script type="text/javascript">
	var myDate = new Date();
	var year=myDate.getFullYear();
	//alert(year);
	var mouth=myDate.getMonth()+1;
	//c:容器,y:年,m:月,a:出发时间json,f:是否显示双日历,fu:回调调
	var para={'c':'calendarcontainer',
		'y':year,
		'm':mouth,
		'a':{
			 'd1':'2015-11-01',//最早时间
			 'd2':'2020-12-31'//最晚时间
		 },
		'f':0,//显示双日历用1，单日历用0
		'clickfu':function (to) {//回调函数，to为点击对象，点击日期是调用的函数,参数to为点击的日期的节点对象，可以把用户选定的日期通过此函数存入服务端或cookies，具体请自行编写
			if(to.id && ($("#"+to.id).attr("ref") || $("#"+to.id+" span").hasClass("cur"))){
				$("#"+para.c+" ul").remove();
				$(".cur-cur").removeClass("cur-cur").addClass("cur");
// 				$(".invest-cur").removeClass("invest-cur").addClass("invest");
				$(".expired-cur").removeClass("expired-cur").addClass("expired");
// 				$(".invest_expired-cur").removeClass("invest_expired-cur").addClass("invest_expired");
				
				if($("#"+to.id).attr("ref")){
					if($("#"+to.id+" span").hasClass("cur")) {
						$("#"+to.id+" span").removeClass("cur").addClass("cur-cur");
						$("#"+to.id+" span").removeClass($("#"+to.id).attr("ref")).addClass($("#"+to.id).attr("ref") + "-cur");
					} else {
						$("#"+to.id+" span").removeClass($("#"+to.id).attr("ref")).addClass($("#"+to.id).attr("ref") + "-cur");
					}
					var param = {
		 				t : new Date(),
		 				queryDate : to.id,
		 				app_token : $('#app_token').val()
		 			};
					$.post("get_invest_list.htm", param, function(data){
						var list = data.msg;
						var html = '';
						for(var i in list) {
							if(list[i].status == 'invest'){  // 购买标的 
// 								html +='<ul class="expired-detail"><li><span class="fl">'+list[i].targetName+'</span><span class="fr"><span class="orange-dot"></span>投资</span></li>';
// 								html +='<li><span class="fl"><img src="img/benjin.png">本金</span><span class="fr">'+list[i].buyAmount+'元</span></li>';
// 								html +='<li><span class="fl"><img src="img/shouyi.png">收益</span><span class="fr">'+list[i].profit+'元</span></li>';
// 								html +='<li><span class="fl"><img src="img/gongji.png">共计</span><span class="fr" style="color:#ff5526;">'+list[i].total+'元</span></li>';
// 								html +='<li><span class="fl"><img src="img/daoqi.png">到期时间</span><span class="fr"">'+list[i].endProfit+'</span></li></ul>';
							} else {
								html +='<ul class="expired-detail"><li><span class="fl">'+list[i].targetName+'</span><span class="fr"><span class="green-dot"></span>到期</span></li>';
								html +='<li><span class="fl"><img src="img/benjin.png">本金</span><span class="fr">'+list[i].buyAmount+'元</span></li>';
								html +='<li><span class="fl"><img src="img/shouyi.png">收益</span><span class="fr">'+list[i].profit+'元</span></li>';
								html +='<li><span class="fl"><img src="img/gongji.png">共计</span><span class="fr" style="color:#ff5526;">'+list[i].total+'元</span></li></ul>';
							}
						}
						$("#"+para.c).append(html);
						$(".expired-detail li").addClass("clearfix");
					},"json");
				} else if($("#"+to.id+" span").hasClass("cur")) {
					$("#"+to.id+" span").removeClass("cur").addClass("cur-cur");
				}
			}
		},
		'showFu':function(d){	//回调函数，d为要显示的当前日期，主要用于判断是否要在该日期的格子里显示出指定的内容，在日期格子里额外显示内容的函数,返回值必须为字符串，参数d为显示的日期对象（日期类型）
			var t=new Date();
			if(t.toLocaleDateString()==d.toLocaleDateString()){
				return "<br/>今天";
			} else {
				return "";
			}
		}
	}
	
	CreateCalendar(para,"para"); //参数前一个是对象，后一个是对象名称

</script>
</body>
</html>

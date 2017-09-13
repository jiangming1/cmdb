<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<link type="text/css" rel="stylesheet" href="css/lcb_wx_common.css?201601241"/>
<title>我的账户</title>
<script src="js/jquery.min.js"></script>
<link type="text/css" rel="stylesheet" href="activity.css">
<script src="activity.js?v=201604141"></script>
<style type="text/css">
#topDiv {
	text-align: center;
	padding-top:4px;
	padding-bottom:4px;
	background-color:#F90;
	color: white;
}

#table1 td {
	text-align: center;
	padding: 10px 0px 10px 0px;
	color: white;
}

#itemDiv table {
	width: 100%;
	background-color: white;
	border-bottom: 1px solid #ccc;
}

#itemDiv table td {
	padding: 8px 0;
}

#itemDiv table .td1 {
	width: 50px;
	text-align: center;
}

#itemDiv table .td3 {
	width: 30px;
	text-align: center;
}

.icon {
	height: 36px;
}

#phoneMsg {
	margin-top: 10px;
	margin-bottom: 10px;
}

#phoneMsg td {
	color: gray;
}

#itemDiv a {
	color: #000;
}

#itemDiv a:HOVER {
	background-color: #eee;
}
</style>
</head>
<body style="background-color: #eee">
	<div id="topDiv" style="background:url(img/topBg_0.png) no-repeat top left;background-size: cover;">
		<div style="font-size: 20px; padding-top: 10px;">当前收益(元)</div>
		<div style="font-size: 30px; padding-bottom: 10px;" id="cunPiaoBaoTotalProfit">#.##</div>
	</div>
	<table id="table1" style="width: 100%; border-bottom: 1px solid #ccc;background:url(img/topbg1.png) no-repeat top left;background-size: cover;">
		<tr>
			<td style="width:50%;border-right:1px solid #FF7E32;background:url(img/triangle1.png) no-repeat bottom right;">
				<a href="cun_piao_bao_balance_group.htm" style="color:#fff;">
					<span style="margin-top:12px;">投资总额(元)</span><br/>
					<span id="cunPiaoBaoPrincipal">#.##</span>
				</a>
			</td>
			<td style="background:url(img/triangle1.png) no-repeat bottom right;">
				<a href="javascript:void(0);" style="color:#fff;">
					<span style="margin-top:12px;">今日收益(元)</span><br/>
					<span id="cunPiaoBaoDayProfit">#.##</span>
				</a>
			</td>
		</tr>
	</table>

	<div id="itemDiv">
<!-- 		<a href="sui_cun_bao_home.htm"> -->
<!-- 			<table style="margin-top: 10px;"> -->
<!-- 				<tr> -->
<!-- 					<td class="td1"><img class="icon" src="img/ico-scb.png" /></td> -->
<!-- 					<td> -->
<!-- 						<div style="float: left;"> -->
<!-- 							随存宝（随存随取） -->
<!--  							<span style="font-size: 12px; color: #ccc;">(随存随取)</span> -->
<!-- 						</div> -->
<!--						<div style="float: right;" id="suiCunBaoMoney">#.##</div> -->
<!-- 					</td> -->
<!-- 					<td class="td3">〉</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</a> -->
		<a href="invest_calendar.htm">
			<table style="margin-top: 10px;">
				<tr>
					<td class="td1"><img class="icon" src="img/icon-calendar.png" /></td>
					<td>投资日历</td>
					<td class="td3">〉</td>
				</tr>
			</table>
		</a>
		<a href="cun_piao_bao_balance_group.htm">
			<table>
				<tr>
					<td class="td1"><img class="icon" src="img/icon-record.png" /></td>
					<td>交易记录</td>
					<td class="td3">〉</td>
				</tr>
			</table>
		</a>
		<a href="invite_info.htm?channel=">
			<table>
				<tr>
					<td class="td1"><img class="icon" src="img/icon-invite.png" /></td>
					<td>邀请返现</td>
					<td class="td3">〉</td>
				</tr>
			</table>
		</a>
		<a href="red_package_list.htm" >
			<table>
				<tr>
					<td class="td1"><img class="icon" src="img/icon-coupon.png" /></td>
					<td>我的红包</td>
					<td class="td3">〉</td>
				</tr>
			</table>
		</a>
		<a href="user_setting.htm">
			<table>
				<tr>
					<td class="td1"><img class="icon" src="img/icon-setting.png" /></td>
					<td>账号设置</td>
					<td class="td3">〉</td>
				</tr>
			</table>
		</a>

		<a href="security_guarantee.htm" style="display: none;">
			<table style="margin-top: 10px;">
				<tr>
					<td class="td1"><img class="icon" src="img/icon-security.png" /></td>
					<td>安全保障</td>
					<td class="td3">〉</td>
				</tr>
			</table>
		</a>
		<a href="legality.htm" style="display: none;">
			<table>
				<tr>
					<td class="td1"><img class="icon" src="img/icon-legal.png" /></td>
					<td>合法合规</td>
					<td class="td3">〉</td>
				</tr>
			</table>
		</a>
		<a href="help_center.htm">
			<table style="margin-top: 10px;">
				<tr>
					<td class="td1"><img class="icon" src="img/icon-help.png" /></td>
					<td>帮助中心</td>
					<td class="td3">〉</td>
				</tr>
			</table>
		</a>
		<a href="feed_back.htm" style="display:none;">
			<table>
				<tr>
					<td class="td1"><img class="icon" src="img/icon-feedback.png" /></td>
					<td>意见反馈</td>
					<td class="td3">〉</td>
				</tr>
			</table>
		</a>
		<a href="about_us.htm">
			<table>
				<tr>
					<td class="td1"><img class="icon" src="img/icon-about.png" /></td>
					<td>关于我们</td>
					<td class="td3">〉</td>
				</tr>
			</table>
		</a>
	</div>
	<table id="phoneMsg" style="width: 100%; display: none;">
		<tr>
			<td style="width: 42%; text-align: right;">客服电话:</td>
			<td><a href="tel:4006191520" style="color: #fba325;">400-6191-520</a></td>
		</tr>
		<tr>
			<td style="text-align: right;">客服时间:</td>
			<td>每日09:00-21:00</td>
		</tr>
	</table>
	<div style="height: 60px;"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
	<jsp:include page="lcb_wx_common.jsp"></jsp:include>
	<script type="text/javascript">
		$(function() {
			$.post("sui_cun_bao_get_merged_profit.htm", {
				t : new Date()
			}, function(data) {
				if (data && data.totalMoney) {
					$("#suiCunBaoMoney").html(data.totalMoney);
				} else {
					$("#suiCunBaoMoney").html("0.00");
				}
			}, "json");

			$.post("cun_piao_bao_get_merged_profit.htm", {
				t : new Date()
			}, function(data) {
				if (data && data.principal) {
					$("#cunPiaoBaoPrincipal").html(data.principal);
				}
				if (data && data.totalProfit) {
// 					$("#cunPiaoBaoTotalProfit").html(data.totalProfit);
					setTime(data.totalProfit);
				}
				if (data && data.dayProfit) {
					$("#cunPiaoBaoDayProfit").html(data.dayProfit);
				}
			}, "json");

		});
		
		var countdown = 100;
		var timeo;
		function setTime(money) {
// 			countdown = Number(money) * 100;
			if (countdown == 0) {
				$("#cunPiaoBaoTotalProfit").html(money);
				countdown = 100;
				clearTimeout(timeo);
			} else {
				countdown--;
				$("#cunPiaoBaoTotalProfit").html(((Number(money) * 100 - countdown*Number(money))/100).toFixed(2));
				timeo = setTimeout(function() { 
					setTime(money);
				}, 15);
			}
		}
	</script>
</body>
</html>
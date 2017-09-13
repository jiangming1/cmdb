<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>购买结果</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" href="css/bootstrap.min.css">
<style type="text/css">
#header {
	width: 100%;
	height: 50px;
	line-height: 50px;
	background-color: black;
	color: white;
	position: fixed;
	top: 0px;
	font-size: 2rem;
	text-align: center;
}

* {
	font-family: "微软雅黑";
	font-size: 1.6rem;
}

#tab1 {
	width: 100%;
	margin: 10px;
}

#tab1 td {
	padding: 5px;
}

.column {
	text-align: right;
	vertical-align: top;
}

#tabBtn {
	width: 100%;
}

#tabBtn td {
	text-align: center;
}
.td-1{
    vertical-align: top;
}
#tabBtn td a {
	width: 80%;
	font-size: 1em;
}

.red_package_tips{
	width: 80%; 
	position: fixed; 
	left: 6%; 
	top: 42%;
	z-index: 100; 
	background: #EFEFEF;
	padding: 4%;
	border-radius: 0.5rem;	
}
.rule_con{
	color: #999;
	margin-top: 1rem;
}
.mask{
	position:fixed;
	left:0;
	top:0;
	width:100%;
	height:100%;
	background-color:#000;
	opacity:0.8;
	z-index:99;
}
.btn_sure{
    width: 60%;
    height: 30px;
    line-height: 30px;
    margin: 20px auto;
    background: #FF5A2C;
    border-radius: 8px;
    text-align: center;
    color: #FFF; 
}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${code=='SUCCESS' || code=='FINANCING_TARGET_BID_HAS_PAYED' }">
<!-- 			<div id="header">购买结果</div> -->
			<div style="width: 100%; padding: 50px 10px 10px 10px;">
				<div>
					<div style="text-align: center; width: 100%;">
						<img src="img/results.png" />
					</div>
					<div style="text-align: center; width: 100%;">购买成功</div>

				</div>
 
				<div style="margin: 10px; text-align: center;">
					请在“
					<span style="color: #fe5c02;">我的账户-交易记录</span>
					”中查看订单详情，如有疑问 请致电<a href="tel:400-6191-520">400-6191-520</a>
				</div>

				<table id="tabBtn">
					<tr>
						<td><a class="btn btn-warning" href="financial_zone.htm?tab=zone&app_view=zone">继续理财</a></td>
						<td><c:choose>
								<c:when test="${financingTargetBid.type=='SCB' }">
									<a class="btn btn-success" href="sui_cun_bao_home.htm?app_view=scb">查看资产</a>
								</c:when>
								<c:otherwise>
									<a class="btn btn-success" href="my_account.htm?tab=account&app_view=acc">查看资产</a>
								</c:otherwise>
							</c:choose></td>
					</tr>
				</table>
			</div>
		</c:when>
		<c:otherwise>
			<div>下单失败</div>

			<div class="am-u-sm-6">
				<a href="financial_zone.htm?tab=zone&app_view=zone">
					<button class="am-btn am-radius whitecolor am-padding-horizontal-xl" style="background: #ff7532">继续理财</button>
				</a>
			</div>
		</c:otherwise>
	</c:choose>
<!-- 	<div class="mask"></div> -->
<!-- 	<div class="red_package_tips"> -->
<!-- 	    <div style="text-align: center;padding-bottom: 5px;border-bottom: 1px solid #ddd;">邀请有奖励哦</div> -->
<!-- 		<table class="rule_con"> -->
<!-- 			<tr> -->
<!-- 				<td class="td-1">1）&nbsp;</td> -->
<!-- 				<td>好友注册成功并首次投资定期理财，您将获得30元现金券1张（投资5000元60天以上订单可使用）</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td class="td-1">2）&nbsp;</td> -->
<!-- 				<td>获得的现金券可在&nbsp;我的账户-我的红包&nbsp;中查看</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td class="td-1">3）&nbsp;</td> -->
<!-- 				<td>您的好友将获得：<br/>18888理财金收益+20%新手宝投标资格</td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
<!-- 		<div class="btn_sure">确&nbsp;定</div> -->
<!-- 	</div> -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
	$(function(){
		var height = $(".red_package_tips").height()/2;
		$(".red_package_tips").css({
			"marginTop": "-" + height + "px",
		});
		$(".inviteaction").click(function() {
			$(".mask,.maskimg").fadeIn();
		})
		$(".mask,.maskimg,.btn_sure").click(function() {
			$(".mask,.maskimg,.red_package_tips").fadeOut();
		})
		$(".btn-invite-rule").click(function(){
			$(".mask,.red_package_tips").fadeIn();
		})
		
		//支持app老版本的分享按钮
		var version = '${param._app_version}';
		if(version!=null&&version!=''){
			$('#shareanew').attr('href','invite_info.htm?app_view=share&title=要理财,来存吧!&url=http://8.laicunba.com/h5/regist_new.jsp&summary=来存吧票据理财,注册即送18888元理财金,新手宝7天年化收益率达20%!100万小伙伴的选择,让你的每笔财富增值!');
		}
	});
		
	</script>
</body>
</html>

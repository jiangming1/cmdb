<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>我的红包</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="css/lcb_wx_common.css?201602291" />
<style type="text/css">
.package {
	height: 80px;
	background-color: #CC0000;
	width: 90%;
	margin: 0px auto;
	border-radius: 5px;
	margin-top: 20px;
	padding: 5px;
}

.package table {
	width: 100%;
	height: 100%;
}

.package td {
	color: white;
	font-family: "微软雅黑";
}

.package .name {
	
}

.package .amount {
	font-size: 20px;
}

body {
	background-color: white;
}

.package img {
	height: 40px;
}

.used, .expired {
	background-color: #ccc;
}

.used td {
	background-color: #ccc;
}

.coupon {
	width: 90%;
	height: 90px;
	background: url("img/22_07.png") no-repeat;
	background-size: 100%;
	margin: 5px auto;
	background-position: bottom;
}

.coupon .name {
	width: 62%;
	padding: 10px 10px 10px 10px;
	vertical-align: bottom;
}

.coupon .amount {
	text-align: center;
	color: #db453d;
	font-family: "STXihei"
}

.rate-incr {
	width: 90%;
	height: 90px;
	background: url("img/22_10.png") no-repeat;
	background-size: 100%;
	margin: 5px auto;
	background-position: bottom;
}

.rate-incr .amount {
	text-align: center;
	color: #f17f6b;
}

.btn-coupon {
	width: 50%;
	height: 100%;
	line-height: 40px; 
	text-align: center;
	float: left;
}
.btn-cash{
	border: 1px solid #ff5a2c;
	border-top-left-radius:5px;
	border-bottom-left-radius:5px;
	border-right: 0px;
	color: #ff7d59;
	background-color: white;
}
.btn-rate{ 
	border: 1px solid #ff5a2c;
	border-top-right-radius:5px;
	border-bottom-right-radius:5px;
	border-left: 0px;
	color: #ff7d59;
	background-color: white;
}

.btn-cash-enable{
	background-color: #ff5a2c;
	color: white;
}

.btn-rate-enable{
	background-color: #ff5a2c;
	color: white;
}
</style>
</head>
<body>
	<c:if test="${param.device==null||param.device=='' }">
		<div class="backBar">
			<table>
				<tr>
					<td style="width: 50px;"><a href="my_account.htm?tab=account&t=<%=new Date()%>"><img src="img/icon_fanhui.png" style="height: 40px;"></a></td>
					<td>我的红包</td>
					<td style="width: 50px;"></td>
				</tr>
			</table>
		</div>
	</c:if>
	
	<div style="width: 80%; height: 40px; margin: 0px auto; margin-top: 20px; margin-bottom: 20px; ">
		<div id="btn-coupon-cash" class="btn-coupon btn-cash btn-cash-enable">现金券</div>
		<div id="btn-coupon-rate" class="btn-coupon btn-rate">加息券</div>
	</div>
	
	<div id="cashcoupon-list">
		<c:forEach items="${cashCouponDOList }" var="coupon">
			<table class="coupon cash-incr">
				<tr>
					<td class="name"><div style="color: #ffcec0; height:40px;">${coupon.name }</div>
						<div style="color: #bd3528;">
							有效期 &nbsp;&nbsp;
							<fmt:formatDate value="${coupon.endTime }" pattern="yyyy-MM-dd" />
						</div></td>
					<td class="amount"><span style="font-size: 30px;"><fmt:formatNumber value="${coupon.amount }" /></span>元</td>
				</tr>
			</table>
		</c:forEach>
		<c:if test="${empty cashCouponDOList  }">
			<table style="width: 100%;margin-top: 30%;">
				<tbody>
				    <tr>
				        <td style="text-align: center;"><img src="img/no-ticket.png" style="width: 40%;"></td>
				    </tr>
					<tr>
						<td style="width: 30px; text-align: center; color: #b3b3b3; padding-left: 0px; height: 50px; font-size: 16px;">没有可用现金券</td>
					</tr>
				</tbody>
			</table>
		</c:if>
	</div>

	<div id="ratecoupon-list" style="display: none;">
		<c:forEach items="${rateIncrCouponDOList }" var="coupon">
			<table class="coupon rate-incr">
				<tr>
					<td class="name"><div style="color: #ffcec0; height:40px;">${coupon.name }</div>
						<div style="color: #bd3528;">
							有效期 &nbsp;&nbsp;
							<fmt:formatDate value="${coupon.endTime }" pattern="yyyy-MM-dd" />
						</div></td>
					<td class="amount">+<span style="font-size: 35px;"><fmt:formatNumber value="${coupon.rate }" /></span> %
					</td>
				</tr>
			</table>
		</c:forEach>
	
		<c:if test="${empty rateIncrCouponDOList  }">
			<table style="width: 100%;margin-top: 30%;">
				<tbody>
				    <tr>
				        <td style="text-align: center;"><img src="img/no-ticket.png" style="width: 40%;"></td>
				    </tr>
					<tr>
						<td style="width: 30px; text-align: center; color: #b3b3b3; padding-left: 0px; height: 50px; font-size: 16px;">没有可用加息券</td>
					</tr>
				</tbody>
			</table>
		</c:if>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".cash-incr").height($(".cash-incr").width()*199/706);	    
			$("#btn-coupon-cash").click(function(){
				$("#cashcoupon-list").show();
				$("#ratecoupon-list").hide(); 
				$("#btn-coupon-rate").removeClass("btn-rate-enable");
				$("#btn-coupon-cash").addClass("btn-cash-enable");
			});
			$("#btn-coupon-rate").click(function(){
				$("#cashcoupon-list").hide();
				$("#ratecoupon-list").show(); 
				$("#btn-coupon-rate").addClass("btn-rate-enable");
				$("#btn-coupon-cash").removeClass("btn-cash-enable");
				/* 解决现金券为空时加息券的显示bug  */
				$(".rate-incr").height($(".rate-incr").width()*199/706);
			});
		});
	</script>
</body>
</html>
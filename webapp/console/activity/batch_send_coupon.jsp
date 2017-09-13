<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>批量发送现金券</title>
<style type="text/css">
html, body {
	height: 100%;
	margin: 0px;
}

#mobileInput {
	width: 90%;
	height: 400px;
}
</style>
</head>
<body>
	<form action="start_send_coupon.htm" method="post">
		<input type="hidden" name="couponType" value="${param.coupon_type }" /> <input type="hidden" name="defId" value="${param.def_id }" />
		<div> 
			<c:choose>
				<c:when test="${param.coupon_type=='cash_coupon' }">
					将向以下用户赠送编号为:[<span style="color: blue; font-size: 20px;">${param.def_id }</span>]的现金券, <span style="color: red;">请注意现金券的正确性</span>,
					<a href="cash_coupon_manager.jsp">重新选择现金券</a>
				</c:when>
				<c:when test="${param.coupon_type=='rate_coupon' }">
				将向以下用户赠送编号为:[<span style="color: blue; font-size: 20px;">${param.def_id }</span>]的加息券, <span style="color: red;">请注意加息券的正确性</span>,
					<a href="rate_incr_coupon_manager.jsp">重新选择加息券</a>
				</c:when>
			</c:choose>
		</div>
		<div style="border: 1px dashed gray; padding: 10px;">
			短信: <input style="width: 80%;" id="templateContent" />
			<button id="btnUpdateMessageTempate" type="button">修改</button>
			<div>
				<span style="color: red">注意:这个短信是用在所有发券的地方,修改短信后,应该向自己的手机发一个券试试,确定能正常收到!</span>
				<c:if test="${param.coupon_type=='rate_coupon' }">
				[couponName]  加息券名字,[EndTime] 结束日期
			</c:if>
				<c:if test="${param.coupon_type=='cash_coupon' }">
				[cashCouponName]  现金券名字,[EndTime] 结束日期
			</c:if>
			</div>
		</div>
		<table style="width: 100%;">
			<tr>
				<td valign="top"><textarea id="mobileInput" name="mobiles" placeholder="一行一个手机号码,或一行N个用空格隔开,最多1万个手机号码"></textarea></td>
			</tr>
			<tr>
				<td><input type="text" name="summary" placeholder="备注信息" /></td>
			</tr>
			<tr>
				<td>
					<button type="submit">提交,并开始发送</button>
				</td>
			</tr>
		</table>
	</form>
</body>
<script src="../../static/jquery-1.11.0.js"></script>
<script type="text/javascript">
	$(function() {
		var coupon_type = "${param.coupon_type}";
		$.post("../setting/get_template.htm", {
			t : new Date(),
			code : coupon_type == 'rate_coupon' ? "GIVE_RATE_INCR_COUPON" : "GIVE_CASH_COUPON"

		}, function(data) {
			$("#templateContent").val(data.template);
			$("#templateContent").attr("coupon_id", data.id);
		}, "json");
		
		$("#btnUpdateMessageTempate").click(function(){
			var p={
					t:new Date(),
					content:$("#templateContent").val().trim(),
					id:$("#templateContent").attr("coupon_id")
			};
			$.post("../setting/save_template.htm",p,function(data){
				alert(JSON.stringify(data));
			},"json");
			
		});
	});
</script>
</html>
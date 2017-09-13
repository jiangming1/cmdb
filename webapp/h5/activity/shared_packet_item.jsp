<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>分享红包</title>
<script src="../js/jquery.min.js"></script>
<style type="text/css">
body {
	background-color: #ff613c;
	<c:if test="${not empty sharedPacketItemDO }">
		background-image:url("http://laicunba.b0.upaiyun.com/lcb/activity/shared_packet/beijing2.png");
	</c:if> 
	<c:if test="${ empty sharedPacketItemDO }">
		background-image:url("http://laicunba.b0.upaiyun.com/lcb/activity/shared_packet/beijing4.png");
	</c:if> 
	
	background-repeat: no-repeat;
	background-size: 100%;
	margin: 0px;
	padding: 0px;
}

#bg1 {
	width: 100%;
	height: 100px;
	background-image:url("http://laicunba.b0.upaiyun.com/lcb/activity/shared_packet/2_03.png");
	background-size: 100%;
}

#hb1 {
	width: 90%;
	height: 200px;
	background-image:
		url("http://laicunba.b0.upaiyun.com/lcb/activity/shared_packet/2_06.png");
	background-size: 100%;
	margin: 0px auto;
}

#rule1 {
	color: white;
	list-style: decimal;
	font-size: 12px;
	margin-top: 20px; 
	margin-bottom: 50px;
}

#table1 {
	width: 90%;
	margin: 0px auto;
	margin-top: 20px;
}

#table1 td {
	color: white;
}

#btnDownload {
	width: 90%;
	height: 40px;
	line-height: 40px;
	border-radius: 20px;
	background-color: #ffcc42;
	border: 0px;
	color: white;
	padding: 0px;
	font-size: 20px;
}

#couponDiv {
	height: 90px;
	width: 90%;
	margin:0px auto; 

}
#div1{
	height: 390px;
	width: 100%;
	margin:0px auto; 
	background-image:
		url("img/bg1.png");
	background-size: 100%; 
	background-repeat: no-repeat;
	
}
#amtTab{
	background-image:url("http://laicunba.b0.upaiyun.com/lcb/activity/shared_packet/jiaxiquan.png");
	background-size: 100%; 
	background-repeat: no-repeat;
	
}
</style>
</head>
<body>
	<c:if test="${not empty sharedPacketItemDO }">
		<div style="text-align: center;">
			<div style="color: #e2452c; font-weight: bold; line-height: 30px; font-size: 20px; margin-top: 30px;">-恭喜您获得红包-</div>
			<div style="color: #e2452c; font-size: 15px;">
				红包已放入:<span style="color: #000">${sharedPacketItemDO.mobile }</span>
			</div>
			<div style="color: #e2452c; font-size: 12px;">下载APP后即可使用</div>
		</div>

	</c:if>
	<c:if test="${ empty sharedPacketItemDO }">
		<div style="text-align: center;">
			<div style="color: #e2452c; font-weight: bold; line-height: 30px; font-size: 20px; margin-top: 30px;">&nbsp;</div>
			<div style="color: #e2452c; font-size: 15px;">
				&nbsp;
			</div>
			<div style="color: #e2452c; font-size: 12px;">&nbsp;</div>
		</div>
	</c:if>
	<div style="height: 250px;margin-top: 24px;">
			 <c:if test="${not empty sharedPacketItemDO }">
			   
		        <div id="div1">
		        	<div style="height:18px;"></div>
				 	<table id="amtTab" style="width: 90%;margin: 0px auto;height: 90px; margin-top: 35px;">
				 		<tr>
				 			<td style="text-align: center;color:white;">
				 				${sharedPacketDO.name }
				 			</td>
				 			<td width="120px" style="font-size: 18px;color: #ff613c; text-align: center;">¥${sharedPacketItemDO.amount }元</td>
				 		</tr>
				 	</table>		        
		        </div>

			 </c:if>
	</div>
	<div style="text-align: center; margin-top: 50px;">
		<button id="btnDownload" onclick="window.location='${apkurl}'">下载来存吧客户端</button>
	</div>
	<div style="background-color: #ff613c;">
	<div style="width: 90%; margin: 0px auto; border-top: 1px dashed white; margin-top: 20px;"></div>
	<div style="width: 90%; margin: 0px auto; margin-top: 20px; color: white; text-align: center;">看看朋友们运气如何</div>
	<table id="table1">
		<c:forEach items="${itemDOList }" var="itemDO">
			<tr>
				<td>***${fn:substring(itemDO.mobile,7,11) }</td>
				<td><fmt:formatDate value="${itemDO.gmtCreate }" pattern="MM-dd HH:mm" /></td>
				<td style="text-align: right;">${itemDO.amount }元</td>
			</tr>
		</c:forEach>
	</table>
 	<div style="height:50px;" >&nbsp;</div>
	</div>
</body>
</html>
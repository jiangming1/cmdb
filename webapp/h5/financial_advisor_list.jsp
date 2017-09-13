<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<link type="text/css" rel="stylesheet" href="css/lcb_wx_common.css?201601241"/>
<link type="text/css" rel="stylesheet" href="financial_zone.css"/>
<title>来存吧-理财顾问</title>
<script src="js/jquery.min.js"></script>
</head>
<body style="background-color: #eee;">
	<div id="topLayout">
		<div>
			<a href="financial_zone.htm?tab=zone" style="color:#FF7433;">理财产品</a>
		</div>
		<div class="curentBtn">
			<a href="financial_advisor_list.htm?tab=zone" style="background-color:#FF7433;color:#FFF;">理财顾问</a>
		</div>
	</div>
	<div style="height: 10px;"></div>
	<table class="advisor">
		<tr>
			<td rowspan="4"><img class="head" src="img/professor4.jpg" /></td>
			<td>婷婷</td>
		</tr>
		<tr>
			<td>理财规划师</td>
		</tr>
		<tr>
			<td>6年理财从业经验</td>
		</tr>
		<tr>
			<td>
				<a href="tel:0571-56261643">
                    <button style="border:1px solid #FF7433;background-color:#FFF;border-radius:8px;padding:8px 33px;color:#FF7433;">咨询电话</button>
                </a>
			</td>
		</tr>
	</table>
	<table class="advisor">
		<tr>
			<td rowspan="4"><img class="head" src="img/professor5.jpg" /></td>
			<td>晓珍</td>
		</tr>
		<tr>
			<td>理财规划师</td>
		</tr>
		<tr>
			<td>3年理财从业经验</td>
		</tr>
		<tr>
			<td>
				<a href="tel:0571-56261664">
                    <button style="border:1px solid #FF7433;background-color:#FFF;border-radius:8px;padding:8px 33px;color:#FF7433;">咨询电话</button>
                </a>
			</td>
		</tr>
	</table>
	<table class="advisor">
		<tr>
			<td rowspan="4"><img class="head" src="img/professor6.jpg" /></td>
			<td>晴晴</td>
		</tr>
		<tr>
			<td>理财规划师</td>
		</tr>
		<tr>
			<td>3年理财从业经验</td>
		</tr>
		<tr>
			<td>
				<a href="tel:0571-56926231">
                    <button style="border:1px solid #FF7433;background-color:#FFF;border-radius:8px;padding:8px 33px;color:#FF7433;">咨询电话</button>
                </a>
			</td>
		</tr>
	</table> 
	<div style="height: 100px;"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
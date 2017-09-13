<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta charset="utf-8">
<link href="https://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
#statusBar {
	position: fixed;
	top: 0px;
	width: 100%;
	height: 40px;
	background-color: #f3f3f3;
	border-bottom: 1px solid #d3d3d3;
	box-shadow: 0 2px 3px rgba(0, 0, 0, 0.15), 0 -1px 0 0 #fcfcfc inset;
}

#statusBar ul {
	padding: 0px;
	margin: 0px;
	list-style: none;
}

#statusBar ul li {
	float: left;
	line-height: 40px;
	padding: 0px 30px 0px 30px;
	cursor: pointer;
}

#statusBar ul li:HOVER {
	background-color: #ccc;
}

#statusBar ul li span {
	margin-left: 5px;
}

#statusBar ul .current {
	background-color: white;
}

#mainIframe {
	width: 100%;
	height: 100%;
}

html, body {
	width: 100%;
	height: 100%;
	padding: 0px;
	margin: 0px;
}
</style>
</head>
<body>
	<div id="statusBar">
		<ul>
			<li src="financing_target_create.jsp" >创建</li>
			<li src="financing_target_new_list.htm" >草稿<span class="badge new"></span></li>
			<li src="financing_target_checking_list.htm" >审核中<span class="badge badge-important checking"></span></li>
			<li src="financing_target_onsale_list.jsp" class="current">融资中<span class="badge badge-success onsale"></span></li>
			<li src="../financing_target_archive.jsp">历史存档<span class="badge archive"></span></li>
			<li src="../financing_target_giveup.jsp">废弃标的<span class="badge closed"></span></li>
		</ul>
	</div>
	<div style="height: 50px;"></div>
	<iframe frameborder="0" id="mainIframe" onload="iframeOnload()"></iframe>

	<script src="../../static/jquery-1.11.0.js"></script>
	<script src="../../static/bootstrap2/js/bootstrap.min.js"></script>
	<script src="financing_target_manager.js"></script>
</body>
</html>
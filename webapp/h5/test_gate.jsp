<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>来存吧-敬请期待</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<link type="text/css" rel="stylesheet" href="css/lcb_wx_common.css?201604141" />
</head>
<body>
	<div style="text-align: center; width: 100%; line-height: 50px;">敬请期待</div>

	<div style="width: 90%; margin: 0px auto; margin-top: 100px;">
		<input type="text" style="width: 100%;" placeholder="请输入内测口令" id="testPwd" />
		<button style="width: 100%; margin-top: 10px;" class="btn" id="btnSkipTest">进入内测</button>
	</div>
	<jsp:include page="lcb_wx_common.jsp"></jsp:include>
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="lcb_wx_common.js?201604131"></script>
	<script type="text/javascript">
		$(function() {
			$("#btnSkipTest").click(function() {
				if ($("#testPwd").val().trim() == "2016") {
					window.location = "sui_cun_bao_detail_test.htm";
				} else if ($("#testPwd").val().trim() == "6688") {
					window.location = "financial_zone.htm";
				} else {
					alertT(3, "内测", "口令错误");
				}
			});
		});
	</script>
</body>
</html>
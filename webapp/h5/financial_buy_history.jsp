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
<title>来存吧</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<style type="text/css">
body {
	padding: 0px;
	background-color: white;
}

* {
	font-family: "微软雅黑"
}

.block {
	border-top: 2px solid #ccc;
	border-bottom: 2px solid #ccc;
	background-color: white;
	padding: 0px 20px 20px 20px;
}

.block .title {
	line-height: 50px;
	font-weight: bold;
	font-size: 20px;
}

.block .hr {
	height: 2px;
	border-bottom: 1px solid #eee;
	font-size: 0px;
	margin-bottom: 10px;
}

.backBar {
	
}

.backBar table {
	width: 100%;
	height: 50px;
	background-color: #FFF;
	font-size: 20px;
	font-weight: bold;
}

.backBar table td {
	text-align: center;
    border-bottom: 1px solid #E6E6E6;
}

.backBar a {
	display: inline-block;
	width: 100%;
	height: 100%;
	text-decoration: none;
	line-height: 50px;
}
</style>
</head>
<body>
	<input type="hidden" id="pageIndex" value="${page.pageIndex }" />
	<input type="hidden" id="pageCount" value="${page.pageCount }" />
	<c:if test="${param.device==null||param.device=='' }">
		<div class="backBar">
			<table>
				<tr>
					<td style="width: 50px;"><a href="financial_detail.htm?id=${param.id }"><img src="img/icon_fanhui.png" style="height: 40px;"></a></td>
					<td>投资记录</td>
					<td style="width: 50px;"></td>
				</tr>
			</table>
		</div>
	</c:if>
	<table class="table">
		<thead>
			<tr>
				<th style="text-align: center;">时间</th>
				<th style="text-align: center;">投资人</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${bidVOList != null && fn:length(bidVOList) > 0 }">
					<c:forEach items="${bidVOList }" var="vo">
						<tr>
							<td style="text-align: center;"><fmt:formatDate value="${vo.payTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td style="text-align: center;">${fn:substring(vo.mobile, 0, 3)}****${fn:substring(vo.mobile, 7, 11)}</td>
						</tr>
					</c:forEach>
					<c:choose>
						<c:when test="${page.pageIndex < page.pageCount }">
							<tr>
								<td colspan="2" style="text-align: center;">上拉加载更多...</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="2" style="text-align: center;">数据已全部加载...</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="2" style="text-align: center;">暂无投资记录...</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../static/comm.js"></script>
	<script type="text/javascript">
		var _scrollTop = document.body.scrollTop;
		$(function() {
			$(window).scroll(function() {
				var pageIndex = new Number($("#pageIndex").val());
				var pageCount = new Number($("#pageCount").val());
				if((pageIndex < pageCount) && ((pageIndex == 1 && document.body.scrollTop - _scrollTop >= (document.body.scrollHeight - window.screen.height + 50)) || (pageIndex > 1 && document.body.scrollTop - _scrollTop >= window.screen.height))) { 
					_scrollTop = document.body.scrollTop;
					var param = {
						t : new Date(),
						targetId : "${param.id }",
						pageIndex : pageIndex + 1
					};
					$.post("financial_buy_history_more.htm", param, function(data){
						data = JSON.parse(data);
						if(data.code == "SUCCESS"){
							var page = JSON.parse(data.page);
							var list = JSON.parse(data.list);
							var html = "";
							for(var i in list) {
								html += '<tr>' +
											'<td style="text-align: center;">' + new Date(list[i].payTime).toCNString() + '</td>' +
											'<td style="text-align: center;">' + list[i].mobile + '</td>' +
										'</tr>';
							}
							if(page.pageIndex < page.pageCount) {
								html += '<tr>' +
											'<td colspan="2" style="text-align: center;">上拉加载更多...</td>' +
										'</tr>';
							} else {
								html += '<tr>' +
											'<td colspan="2" style="text-align: center;">数据已全部加载...</td>' +
										'</tr>';
							}
							$(".table tr:last").remove();
							$(".table").append(html);
							$("#pageIndex").val(page.pageIndex);
// 						} else {
// 							console.log("---------------------------------");
						}
					});
				}
			});

		});
	</script>
</body>
</html>
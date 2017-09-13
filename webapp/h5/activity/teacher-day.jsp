<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta name = "format-detection" content = "telephone=no"><!-- 防止ios将数字识别成手机号码，不会影响真正电话号码的识别。-->
<meta charset="utf-8">
<title>教师节快乐</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	font-family: "微软雅黑";
	font-size: 15px;
}
img{
	box-sizing: border-box;
	max-width: 100%;
	height: auto;
	vertical-align: middle;
	border: 0;
}
a{
	color: #FFF;
	text-decoration: none;
}
input{
	border: none;
	outline: none;
}
.clearfix:before,.clearfix:after {
	display: table;
	content: " ";
	line-height: 0;
	width: 100%;
	visibility: hidden;
}
.clearfix:after { 
	clear: both; 
}
.wrap{
	background: url(img/wrap-bg.png) repeat; 
	width: 94%;
	padding: 2% 3% 5%;
}
.target-info{
	width: 98%;
	margin: 0 auto;
	background: url(img/con-bg.png) no-repeat top center;
	background-size: 100%;
	padding-top: 10%;
}
.target-box{
	width: 100%;
	height: 48%;
	background: #FFF;
	border-radius: 0.3rem;
}
.btn-href{
	display: block;
	background: #FE5F5F;
	color: #FFF;
	height: 38px;
	line-height: 40px;
	border-radius: 5px;
	box-shadow: 0 3px 0 #FD4E4E;
	width: 110px;
}
.btn-href-sallout{
	display: block;
	background: #999;
	color: #FFF;
	height: 40px;
	line-height: 40px;
	border-radius: 5px;
	box-shadow: 0 3px 0 #888;
	width: 110px;
}
.color-red{
	color: #FD4444;
}
.color-red td{
	font-size: 16px;
}
.rule-con{
	margin-top: 1rem;
	margin-bottom: 1rem;
}
table.rule-con tr td{
	line-height: 30px;
	height: 30px;
	font-size: 16px;
}
.ver-top{
	vertical-align: top;
}
.ver-bottom{
	vertical-align: bottom;
}
.ver-top span{
	display: block;
	width: 16px;
	height: 16px;
	line-height: 16px;
	border-radius: 50%;
	background-color: #533726;
	color: #FFF;
	text-align: center;
	margin-top: 7px;
	font-size: 14px;
}
</style>
</head>
<body>
<div class="header"><img src="http://laicunba.b0.upaiyun.com/lcb/teachers_day_banner2.png"></div>
<div class="wrap">
	<div><img src="img/teacher-font.png"></div>
	<div class="target-info">
		<div style="width: 90%;height: 80%;margin: 0 auto;background: #60bdfa;padding: 2%;border-radius: 0.3rem;">
			<div class="target-box" style="margin-bottom: 2%;">
				<table style="width: 100%;height: 100%;text-align: center;">
					<c:choose>
						<c:when test="${target60 != null }">
							<tr>
								<td class="ver-bottom" width="34%">预期年化</td>
								<td class="ver-bottom" width="27%">理财期限</td>
								<td rowspan="2">
									<c:choose>
										<c:when test="${target60.status!='onsale' || target60.finishAmount>=target60.collectAmount }">
											<a href="javascript:void(0);" class="btn-href-sallout" onclick="sellOutAlert(${target60.annualizedRates },${target60.period })">已售罄</a>
										</c:when>
										<c:otherwise>
											<a href="../financial_detail.htm?app_view=detail&id=${target60.id }" class="btn-href">购买返加息券</a>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr class="color-red">
								<td><fmt:formatNumber value="${target60.annualizedRates - 1 }" pattern="##.##" minFractionDigits="1" />%+1%</td>
								<td>${target60.period }天</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td class="ver-bottom" width="34%">预期年化</td>
								<td class="ver-bottom" width="27%">理财期限</td>
								<td rowspan="2">
									<a href="javascript:void(0);" class="btn-href-sallout">已售罄</a>
								</td>
							</tr>
							<tr class="color-red">
								<td>10.0%+1%</td>
								<td>60天</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
			<div class="target-box">
				<table style="width: 100%;height: 100%;text-align: center;">
					<c:choose>
						<c:when test="${target90 != null }">
							<tr>
								<td class="ver-bottom" width="34%">预期年化</td>
								<td class="ver-bottom" width="27%">理财期限</td>
								<td rowspan="2">
									<c:choose>
										<c:when test="${target90.status!='onsale' || target90.finishAmount>=target90.collectAmount }">
											<a href="javascript:void(0);" class="btn-href-sallout" onclick="sellOutAlert(${target90.annualizedRates },${target90.period })">已售罄</a>
										</c:when>
										<c:otherwise>
											<a href="../financial_detail.htm?app_view=detail&id=${target90.id }" class="btn-href">购买返加息券</a>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr class="color-red">
								<td><fmt:formatNumber value="${target90.annualizedRates - 2 }" pattern="##.##" minFractionDigits="1" />%+2%</td>
								<td>${target90.period }天</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td class="ver-bottom" width="34%">预期年化</td>
								<td class="ver-bottom" width="27%">理财期限</td>
								<td rowspan="2"><a href="javascript:void(0);" class="btn-href-sallout">已售罄</a></td>
							</tr>
							<tr class="color-red">
								<td>11.0%+2%</td>
								<td>90天</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
		</div>
	</div>
	<div class="rule-wrap" style="color: #533726;width: 96%;margin: 1rem auto 0;">
		<div style="text-align: center;font-weight: bold; font-size:18px;">活动规则</div>
		<table class="rule-con" style="width: 100%;">
			<tr>
				<td class="ver-top"><span>1</span></td>
				<td>活动时间： 9.9-9.12</td>
			</tr>
			<tr style="margin: 10px 0;">
				<td class="ver-top"><span>2</span></td>
				<td>活动期间，投资任意定期理财返【1%加息券】1张 (10000元60天以上可使用)</td>
			</tr>
			<tr>
				<td class="ver-top"><span>3</span></td>
				<td>每位用户仅能获得1次加息券</td>
			</tr>
			<tr>
				<td class="ver-top"><span>4</span></td>
				<td>每天10：00和15：00限时发放加息标</td>
			</tr>
		</table>
		<div style="text-align: center;">*活动最终解释权归来存吧所有</div>
	</div>
</div>

<script src="../js/jquery.min.js"></script>
<script>
  $(function(){
 	  $(".target-info").height($(".target-info").width()*493*0.9/683);	
 	  //alert($(".font-size").css("fontSize"));
 //	 document.documentElement.style.fontSize = document.documentElement.clientWidth / 7.5 + 'px';
  })
</script>
</body>
</html>
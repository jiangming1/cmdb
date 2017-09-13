<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>安全保障</title>
<style>
body {
	margin:0px;
	padding: 0px;
	background-color: #FFF;
}

* {
	font-family: "微软雅黑"
}

.backBar {
	
}

.backBar table {
	width: 100%;
	height: 50px;
	background-color: #FF7433;
	font-size: 20px;
}

.backBar table td {
	text-align: center;
	color: white;
}

.backBar a {
	display: inline-block;
	width: 100%;
	height: 100%;
	text-decoration: none;
	line-height: 50px;
	color: white;
}
.safety_main{
    padding: 20px;
    text-align:center;
}
.title{
    font-size: 22px;
    color: #FF5A2C;
    margin: 20px auto;
}
.small{
    font-size: 16px;
    color: #727171;
}
.safety_main .img_explan{
    margin-top: 60px;
}
.safety_main_ts{
   padding: 20px 20px 0;
   text-align: center;
}
</style>
</head>
<body>
	<c:if test="${param.device==null||param.device=='' }">
	<div class="backBar">
		<table >
			<tbody>
				<tr>
					<td style="width:50px;"><a href="my_account.htm?tab=account&t=<%=new Date()%>">〈</a></td>
					<td>安全保障</td>
					<td style="width:50px;"></td>			
				</tr>
			</tbody>
		</table>
	</div>
	</c:if>
	<div class="safety_main">
		<div class="title">产品安全，银行承兑</div>
		<div class="small">以银行承兑汇票作为投资产品，到期银行无条件兑付</div>
		<div class="img_explan"><img src="img/safety01.png" width="70%"></div>
	</div>
	<div class="safety_main" style=" background: #F5F5F5;">
		<div class="title">平台资金安全</div>
		<div class="small">平台资金由第三方支付机构环迅支付托管，来存吧全程不接触平台资金。</div>
		<div class="img_explan"><img src="img/safety02.png" width="60%"></div>
	</div>
	<div class="safety_main_ts">
		<div class="title">数据安全</div>
		<div class="small">三层防火墙隔离，全球领先SSL加密技术，杜绝系统的入侵；所有隐私信息进行256位高强度加密处理，严格保护您的信息安全。</div>
		<div class="img_explan" style="margin-top: 40px;"><img src="img/safety03.png" width="80%"></div>
	</div>
	<div class="safety_main" style=" background: #F5F5F5;">
		<div class="title">资金账户安全</div>
		<div class="small">姓名、身份证、银行卡、银行预留手机号四重验证，资金进出一手掌控。来存吧全程不接触平台资金。</div>
		<div class="img_explan"><img src="img/safety04.png" width="80%"></div>
	</div>
	<div class="safety_main">
		<div class="title">同卡进出，安全便捷</div>
		<div class="small">同卡进出，到期后本金和利息自动返还至购买时所使用的银行卡，减少提现步骤，安全又快捷。</div>
		<div class="img_explan"><img src="img/safety05.png	" width="80%"></div>
	</div>
</body>
</html>
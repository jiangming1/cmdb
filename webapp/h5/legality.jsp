<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>来存吧</title>
<link type="text/css" rel="stylesheet" href="css/lcb_wx_common.css">
<style type="text/css">
body {
	margin: 0px;
	padding: 0px;
	background-color: #eee;
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

.legal_concent {
	padding: 0 10px;
}

.legal_concent p {
	font-size: 14px;
	text-indent: 30px;
	color: #4B4B4B;
	line-height: 22px;
	font-weight: normal;
	padding: 5px;
}
</style>
</head>
<body>
	<c:if test="${param.device==null||param.device=='' }">
		<div class="backBar">
			<table>
				<tbody>
					<tr>
						<td style="width: 50px;"><a href="my_account.htm?tab=account&t=<%=new Date()%>">〈</a></td>
						<td>合法合规</td>
						<td style="width: 50px;"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</c:if>
	<h3 style="text-align: center;">来存吧平台合法合规</h3>
	<div class="legal_concent">
		<h4>1.来存吧理财投资人与借款人间借款合同合法</h4>
		<p>《合同法》第196条规定：“借款合同是借款人向贷款人借款，到期返还借款并支付利息的合同。”《合同法》允许自然人等普通民事主体之间发生借贷关系，并允许借方到期可以收回本金和符合法律规定的利息。</p>
		<h4>2.平台所有电子合同合法</h4>
		<p>根据《合同法》和《电子签名法》的规定，当事人可以采用合同书、信件和数据电文（包括电报、电传、传真、电子数据交换和电子邮件）等形式订立合同，并通过以电子形式所含、所附用于识别签名人身份并表明签名人认可其中内容的数据电文等电子签名方式进行签署，当事人不能仅因合同采用电子签名、数据电文的形式就否定其法律效应。</p>
		<h4>3.为借贷双方提供居间撮合服务合法</h4>
		<p>《合同法》第23章关于“居间合同”的规定，特别是第424条规定：“居间合同是居间人向委托人报告订立合同的机会或者是提供订立合同的媒介服务，委托人支付报酬的合同。 来存吧作为合法设立的理财平台，为民间借贷提供撮合，是借贷双方形成借贷关系并收取相关报酬的居间服务有着明前的法律基础。</p>
		<h4>4.关于投资人在来存吧获得的出借理财收益的合法性：为合法收益，收到法律保护</h4>
		<p>根据最高人民法院《关于审理民间借贷案件适用法律若干问题的规定》第26条：“借贷双方约定的利率未超过年利率24%，出借人请求借款人按照约定的利率支付利息的，人民法院应予支持。借贷双方约定的年利率在24%-36%之间的：如果已支付该部分利息，属自愿履行范畴，不能请求返还；如果尚未支付该部分利息，请求借款人支付的，人民法院不予支持。借贷双方约定的利率超过年利率36%，超过部分的利息约定无效。借款人请求出借人返还已支付的超过年利率36%部分的利息的，人民法院应予支持。</p>
		<p>来存吧平台的理财收益率在7%~15%之间，未超过年利率24%，属于合法利息收益，受到法律保护。</p>
	</div>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>交易授权委托书</title>
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
	line-height: 16px;
	font-weight: normal;
	margin: 5px 0;
}
h4 {
	margin: 15px 0 0 0;
}
</style>
</head>
<body>
	<h3 style="text-align: center;">随存宝自动交易授权委托书</h3>
	<div class="legal_concent" style="margin-bottom:20px;">
		<p>委托人：${userBank.holder }</p>
		<p>证件号码：${userBank.pid }<br/></p>
		<p>受托人：杭州满溢网络科技有限公司（以下简称:来存吧）</p>
		<p>住所地：杭州市下城区中山北路632号2201-1室</p>
		<p>鉴于：委托人参加“随存宝”（来存吧债权转让项目），为了让受托人能够更好的为委托人</p>
		<p>提供服务，现委托人特此向受托人做出如下授权：<br/></p>
		<h4>一、授权范围：</h4>
		<p>1）委托人加入“随存宝”到退出“随存宝”期间，受托人每日自动代委托人进行债权组合的配置；</p>
		<p>2）委托人申请“提现”时，受托人代委托人进行“债权转让”并依据此委托书代委托人签署债权转让协议及借款合同且自动匹配相应债权。</p>
		<p>3）代为办理汇票质押手续；</p>
		<p>4）代为办理背书并记载“已质押”、“不得转让”字样；</p>
		<p>5）代为接受质押票据；</p>
		<p>6）由受托人委托银行代为验证票据的真伪，代为保管票据；</p>
		<p>7）针对借款、票据质押引起的纠纷，代为诉讼（承认、变更、放弃诉讼请求；代为和解、上诉和反诉）；</p>
		<p>8）代为签署相关法律文书；</p>
		<p>9）代为行使和主张相关票据受益权、付款请求权、追索权。</p>
		<h4>二、授权期限：</h4>
		<p>本授权期限自委托人与受托人间签署《来存吧投资协议》之日起至完全退出随存宝项目之日止。</p>
		<h4>三、债权转让后的税费处理：</h4>
		<p>委托人在资金流出、债权转让过程产生的相关税费，由委托人自行向其主管税务机关申报、缴纳，受托人不负责处理相关事宜。</p>
		<h4>四、责任承担</h4>
		<p>委托人对于受托人在上述授权范围内所进行的民事行为后果承担相应责任。受托人包括但不限于代为签署、背书、被背书接受、移交汇票等行为的法律后果及权利、义务由委托人自行承担。</p>
		<h4>五、本协议经出借人在来存吧网络平台以线上点击“同意协议并付款”的方式签署。</h4>
		<p>委 托 人：${userBank.holder }</p>
		<p>来存吧平台ID：${userBank.userId }</p>
		<p>身份证号码：${userBank.pid }</p>
		<p>签署日期：<fmt:formatDate value="${dateNow }" pattern="yyyy年MM月dd日" /></p>
	</div>
</body>
</html>
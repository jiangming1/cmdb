<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>流量宝活动</title>
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<style type="text/css">
body {
	background-color: #f3f3f3;
	font-family: "微软雅黑";
}
.act-info {
	padding: 1px 10px;
	width: 100%;
	height: 100%;
    background-color: #fff;
	border-bottom: 1px solid #c5c5c5;
}
.info-des {
	width: 100%;
	clear: both;
	margin: 20px 0;
}
.info-txt {
	width: 75%;
	float: left;
}
.info-txt span {
	margin: 3px 0;
	display: inline-block;
}
.txt1 {
	font-weight: bold;
}
.txt2 {
	font-size: 13px;
}
.txt3 {
	color: #ff5a2c;
	font-weight: bold;
}
.info-btn {
	width: 25%;
	float: right;
	text-align: center;
}
.info-btn a {
	width: 100%;
	height: 30px;
	color: #fff;
	background-color: #ff5a2c;
	border-radius: 5px;
	display: inline-block;
	text-align: center;
	padding: 4px 0;
}
.info-hr {
	width:100%;
	margin:0;
	border:0;
	border-top: 1px solid #c5c5c5;
}

.act-rules {
	width: 100%;
	height: 100%;
	padding: 1px 10px;
	margin-top:12px;
    background-color: #fff;
	border: 1px solid #c5c5c5;
}
.rules-title {
	padding: 10px 0;
}
.rules-title div {
    height: 14px;
    float: left;
	margin: 3px 5px 3px 0;
	border-left: 3px solid #ff7433;
}
.rules-title2 {
	padding: 5px 0 5px 8px;
}
.rules-title3 {
	padding: 3px 0 3px 8px;
}
.rules-txt {
	padding: 2px 0 8px 8px;
}

.act-company {
	width: 100%;
	height: 100%;
	padding: 1px 10px;
	margin-top:12px;
    background-color: #fff;
	border: 1px solid #c5c5c5;
}
.introduction-title {
	padding: 10px 0;
}
.introduction-title div {
    height: 14px;
    float: left;
	margin: 3px 5px 3px 0;
	border-left: 3px solid #ff7433;
}
.introduction-txt {
	padding: 2px 0 18px 8px;
}

.act-btn {
	width: 100%;
	text-align: center;
    padding: 25px 20px 20px 20px;
	font-size: 16px;
	margin-top: 10px;
	background-color: #fff;
	border: 1px solid #c5c5c5;
}
.act-btn a {
	width: 100%;
	height: 36px;
	color: #fff;
	background-color: #ff5a2c;
	border-radius: 5px;
	display: inline-block;
	text-align: center;
	padding: 7px 0;
	margin: 10px 0;
}
</style>
</head>
<body>
	<div><img src="img/llb_idx_top.png" style="width: 100%;" /></div>
	<div class="act-info">
		<div class="info-des" style="height:50px;">
			<div class="info-txt">
				<span class="txt1">新用户注册即送</span><br/>
				<span class="txt3">注册送18888体验金+20M流量</span>
			</div>
			<div class="info-btn">
				<a href="llb_regist.htm" style="margin-top:10px;">立即领取</a>
			</div>
		</div>
		<hr class="info-hr" />
		<div class="info-des" style="height:77px;">
			<div class="info-txt">
				<span class="txt1">完成首次投资1000元</span><br/>
				<span class="txt2">预期年化<font style="color:#ff5a2c">8%</font>，限期7天，限送一次</span><br/>
				<span class="txt3" style="font-size:16px;">送200M流量</span>
			</div>
			<div class="info-btn">
				<a href="http://8.laicunba.com/h5/financial_detail.htm?id=bc33ee5a-4780-4068-b44d-92c100d52c08&_channel=liuliangbao_activity" style="margin-top:23px;">立即领取</a>
			</div>
		</div>
		<hr class="info-hr" />
		<div class="info-des" style="height:77px;">
			<div class="info-txt">
				<span class="txt1">投资3月期产品1000元</span><br/>
				<span class="txt2">预期年化<font style="color:#ff5a2c">11%</font>，限期89天，限送一次</span><br/>
				<span class="txt3" style="font-size:16px;">送500M流量</span>
			</div>
			<div class="info-btn">
				<a href="http://8.laicunba.com/h5/financial_detail.htm?id=0faa7039-83a6-4d62-ba83-b0590aaba030&_channel=liuliangbao_activity" style="margin-top:23px;">立即领取</a>
			</div>
		</div>
	</div>
	<div class="act-rules">
		<div class="rules-title">
			<div></div>
			<span class="txt1">活动规则</span>
		</div>
		<div class="rules-title2">
			<span>活动范围：流量宝用户</span>
		</div>
		<div class="rules-title3">
			<span>活动说明：</span>
		</div>
		<div class="rules-txt">
			<span>1.牛币以流量的形式3个工作日赠送</span><br/>
			<span>2.牛币可在流量宝客户端兑换流量</span><br/>
			<span>3.来存吧App注册手机号码需与流量宝注册手机号码一致</span><br/>
			<span>4.本次活动最终解释权归来存吧所有</span><br/>
		</div>
		<div class="rules-title3">
			<span>联系方式：</span><br/>
		</div>
		<div class="rules-txt">
			<span>客服电话：400-6191-520</span><br/>
			<span>服务时间：9:00~17:30（工作日）</span><br/>
		</div>
	</div>
	<div class="act-company">
		<div class="introduction-title">
			<div></div>
			<span class="txt1">公司介绍</span>
		</div>
		<div class="introduction-txt">
			<span>　　来存吧隶属于杭州满溢网络科技有限公司，成立于2015年7月，专注银行票据理财，平台以安全、稳健、灵活为宗旨，整合最优质的银行、国企、央企以及上市公司银行票据资产，通过创新金融模式和优化用户体验，为投资者实现财富稳定增值。</span>
		</div>
		<div class="introduction-txt">
			<span>　　来存吧的投资理财产品均为银行未到期的承兑汇票。银行承兑汇票是由出票人签发，由银行承兑的，保证在指定日期无条件支付确定的金额给收款人或者持票人的票据。《票据法》规定，银行票据到期由银行100%无条件承兑。来存吧提供期限1-6个月的短期理财产品，活期理财【随存宝】年化收益率为7%，定期理财【银票宝】年化收益率为8%-12%。</span>
		</div>
		<div class="introduction-txt">
			<span>　　来存吧，您的贴身理财管家！</span>
		</div>
	</div>
	<div class="act-btn">
		<a href="llb_query.htm" style="margin-top:10px;">查看我赚的流量</a><br/>
		<a href="http://a.app.qq.com/o/simple.jsp?pkgname=com.example.lcb&ckey=CK1328524683222" style="margin-top:10px;">下载APP产看理财收益</a>
	</div>
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function() {

		});
	</script>
</body>
</html>
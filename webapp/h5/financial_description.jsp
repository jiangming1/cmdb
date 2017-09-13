<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>项目描述</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<style type="text/css">
body {
	padding: 0px;
	background-color: #eee;
}

* {
	font-family: "微软雅黑"
}

.block {
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	background-color: white;
	padding: 0px 10px 10px 10px;
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

.backBar2 {
	position:fixed;
	top:0;
	left:0;
	width:100%;
	z-index:2000;
}

.backBar {
	
}

.backBar table {
	width: 100%;
	height: 50px;
	background-color: #fff;
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
.poster {
	list-style: none;
    padding: 0;
    top: 0;
    left: 0;
    position: fixed;
/*     background-color: #888; */
    width: 100%;
    height: 100%;
}
.poster li{
	display:block;
	position:absolute;
	top:0px;
	overflow:hidden;
	background-position:center;
	background-size:cover;
	padding-top:50px;
}
</style>
</head>
<body>
	<div id="container">
	<c:if test="${param.device==null||param.device=='' }">
		<div class="backBar">
			<table>
				<tr>
					<td style="width: 50px;"><a href="financial_detail.htm?id=${param.id }"><img src="img/icon_fanhui.png" style="height: 40px;"></a></td>
					<td>项目描述</td>
					<td style="width: 50px;"></td>
				</tr>
			</table>
		</div>
	</c:if>
	<div class="block" style="margin-top: 20px;">
		<div class="title">项目简介</div>
		<div class="hr"></div>
		<p style="text-indent: 30px;">杭州融创金融服务外包有限公司是浙江省领先的专业银行服务商。在服务银行、解决中小企业融资问题上有近10年经验。融创金融对需融资企业做严格的风控审核，用企业银行承兑汇票质押。银行承兑汇票具有流动性好、安全高、银行承诺兑付等特点。融创金融对银行票据产品的销售回款有比较完善的流程及基于互联网大数据分析的风控措施，近十年经验确保票据的真实性。本项目基于这些特点及需求公司的优质属性，经公司风控审批，资金用于银行票据质押放款、专款专用。</p>
	</div>
	<div class="block" id="assureDiv" style="margin-top: 20px;">
		<div class="title">担保函</div>
		<div class="hr"></div>
		<p>
			<img src="img/assure2.jpg" style="width:50%;" /><img src="img/assure3.jpg" style="width:50%;" />
		</p>
	</div>
	<div class="block" id="assureDiv2" style="margin-top: 20px;">
		<div class="title">银行质押协议</div>
		<div class="hr"></div>
		<p>
			<img src="img/zyxy.jpg" style="width:50%;" />
		</p>
	</div>


<!-- 	<div class="block" style="margin-top: 20px;"> -->
<!-- 		<div class="title">质押物图片</div> -->
<!-- 		<div class="hr"></div> -->
<!-- 		<p> -->
<!-- 			<img src="img/assure2.jpg" style="width:50%;" /> -->
<!-- 		</p> -->
<!-- 	</div> -->
	<div class="block" style="margin-top: 20px;">
		<div class="title">还款保障</div>
		<div class="hr"></div>
		<p style="text-indent: 30px;">第一：杭州融创金融服务外包有限公司到期还款。</p>
		<p style="text-indent: 30px;">第二：质押票据应收款资金回流。</p>
		<p style="text-indent: 30px;">第三：杭州融创金融服务外包有限公司法定代表人承担连带责任保证。</p>
		<p style="text-indent: 30px;">第四：来存吧在平台备付金范围内承诺赔付。</p>
	</div>
	<div class="block" style="margin-top: 20px;margin-bottom: 20px;">
		<div class="title">资金流向说明</div>
		<div class="hr"></div>
		<p>
			<img src="img/explan.png" style="width:100%;" />
		</p>
	</div>
	<div id="poster" style="display:none;">
		<c:if test="${param.device==null||param.device=='' }">
			<div class="backBar backBar2">
				<table>
					<tbody>
						<tr>
							<td style="width: 50px;"><a href="javascript:void(0);" id="closeAssure"><img src="img/icon_fanhui.png" style="height: 40px;"></a></td>
							<td>担保函</td>
							<td style="width: 50px;"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</c:if>
		<ul class="poster" style="background-color:#fff;">
			<li rel="1" style="z-index: 2000;">
				<div style="width:100%;height:100%;background-color:#fff;">
					<img src="img/assure2.jpg" style="width:100%;" />
					<div style="position:fixed;left:48%;bottom:3%;color:#ff7433;">1/2</div>
				</div>
			</li>
			<li rel="2" style="z-index: 1000;">
				<div style="width:100%;height:100%;background-color:#fff;">
					<img src="img/assure3.jpg" style="width:100%;" />
					<div style="position:fixed;left:48%;bottom:3%;color:#ff7433;">2/2</div>
				</div>
			</li>
		</ul>
	</div>
	<div id="poster2" style="display:none;">
		<c:if test="${param.device==null||param.device=='' }">
			<div class="backBar backBar2">
				<table>
					<tbody>
						<tr>
							<td style="width: 50px;"><a href="javascript:void(0);" id="closeAssure2"><img src="img/icon_fanhui.png" style="height: 40px;"></a></td>
							<td>银行质押协议</td>
							<td style="width: 50px;"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</c:if>
		<ul class="poster" style="background-color:#fff;">
			<li rel="1" style="z-index: 2000; padding-top: 70px;">
				<div style="width:100%;height:100%;background-color:#fff;">
					<img src="img/zyxy.jpg" style="width:100%;" />
				</div>
			</li>
		</ul>
	</div>
	<div style="width:100%;height:100%"></div>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery-swipe2.js?201602191" type="text/javascript"></script>
	<script src="js/lcb-wx-swipe.js?201602191" type="text/javascript"></script>
	<script type="text/javascript">
	$(function() {
		$("#assureDiv p img").click(function() {
			$("#poster").show();
		});
		$("#closeAssure").click(function() {
			$("#poster").hide();
		});
		$("#assureDiv2 p img").click(function() {
			$("#poster2").show();
		});
		$("#closeAssure2").click(function() {
			$("#poster2").hide();
		});
	})
	</script>
</body>
</html>
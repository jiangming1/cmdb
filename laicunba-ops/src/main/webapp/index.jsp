<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8">
<style type="text/css">
ul {
	list-style: decimal;
}
</style>
</head>
<body>
	<table style="width: 100%; height: 100%;">
		<tr>
			<td style="width: 200px; background-color: #ccc;" valign="top">
				<ul>
					<li><a href="http://121.199.62.86:8080/quicktask-web/gant/index.htm" target="_blank">开发中的功能</a></li>
					<li><a href="dbQuery.jsp" target="main">正式环境数据查询</a></li>
					<li><a href="keepalived.jsp?env=test" target="main">来存吧-测试环境心跳</a></li>
					<li><a href="keepalived.jsp?env=product" target="main">来存吧-正式环境心跳</a></li>
					<li><a href="mobileVerifyCode.jsp" target="main">测试-短信验证码</a></li>
					<li><a href="updateSQList.htm?env=product" target="main">来存吧-正式环境数据订证</a></li>
					<li><a href="https://8.laicunba.com/api_doc/index.html" target="_blank">来存吧接口文档</a></li>
					<li><a href="console/alert_monitor.jsp" target="_blank">生产环境-alter监控</a></li>
					<li><a href="console/data_step.jsp" target="main">数据订正提交</a></li>
					<li><a href="console/balance_line.jsp" target="main">生产数据资金成本</a></li>
					<li><a href="console/test_evn_token.jsp" target="main">测试环境Token</a></li>
					<li><a href="console/svn_pwd.jsp" target="main">SVN 密码修改</a></li>
					<li><a href="console/lcb-heroes-rank-list.jsp" target="main">小红花排行</a></li>
					<li><a href="console/webblock.jsp" target="main">网站waf防cc</a></li>
					<li><a href="console/webtopiplist.jsp" target="main">网站访问最多ip</a>
					<li><a href="console/wx_timelist.jsp" target="main">服务器线上参数</a>
					<li><a href="https://www.pgyer.com/wZZJ" target="main">安卓自动打包测试地址</a>
					<li><a href="https://www.pgyer.com/iD7e" target="main">ios自动打包测试地址</a>
					<li><a href="http://192.168.199.254" target="_blank">打包服务器</a>
				</ul>
			</td>
			<td valign="top"><iframe name="main" src="console/lcb-heroes-rank-list.jsp" style="width: 100%; height: 100%;"></iframe></td>
		</tr>
	</table>
</body>
</html>

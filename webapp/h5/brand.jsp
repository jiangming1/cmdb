<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>品牌介绍</title>
<style>
*{
   margin: 0;
   padding: 0;
   font-family: "微软雅黑";
}
table{
	border-collapse:collapse;
	border-spacing:0;
}
.backtip{
    width: 100%;
    text-align: center;
    height: 50px;
    font-size: 20px;
    background: #EEE;
}
a{
   text-decoration: none;
   color: #FF5829;
}
p{
   text-indent: 2rem;
   line-height: 28px;
}
</style>
</head>
<body>
<c:if test="${param.device==null||param.device=='' }">
<table class="backtip">
     <tr>
         <td style="width: 50px;font-size: 30px;"><a href="">〈</a></td>
         <td>品牌介绍</td>
         <td style="width: 50px;"></td>
     </tr>
</table>
</c:if>
<div class="" style="width: 90%;margin: 1rem auto 0;">
     <p>杭州满溢网络科技有限公司成立于2015年7月，是一家专注于银行票据理财的互联网金融公司。公司旗下的互联网金融平台来存吧（laicunba.com），以安全、稳健、灵活为宗旨，整合最优质的银行、国企、央企、以及上市公司银行票据资产，通过创新金融模式和优化用户体验，为投资者实现财富稳定增值。</p>
     <p>来存吧的投资理财产品均为银行未到期的承兑汇票。银行承兑汇票是由出票人签发，由银行承兑的，保证在指定日期无条件支付确定的金额给收款人或者持票人的票据。《票据法》规定，银行票据到期由银行100%无条件承兑。来存吧提供1-6个月的短期理财产品，活期理财【随存宝】年化收益率7%，定期理财【银票宝】年化收益率为8%-12%。</p>
     <p>来存吧，您的贴身理财管家！</p>
</div>
</body>
</html>
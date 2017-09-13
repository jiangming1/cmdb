<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" name="viewport" />
<meta charset="utf-8">
<title>投资排行榜</title>
<style>
*{
   margin: 0;
   padding: 0;
}
img{
	box-sizing: border-box;
    max-width: 100%;
    height: auto;
    vertical-align: middle;
    border: 0;
}
a{
   text-decoration: none;
}
table{
	border-collaspe:collapse;
	border-spacing:0;
}
ui li{
   list-style: none;
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
.btn-chart{
   background: #4BD9CB;
   width: 70%;
   margin: 1rem auto 0;
   height: 2.5rem;
   line-height: 2.5rem;
   text-align: center;
   color: #FFF;
   font-weight: bold;
   border-radius: 1.5rem;
   box-shadow: 0 5px 2px #2FBCAB, 0 7px 1px #C4A627;    
}
.btn-chart:active{
   box-shadow: 0 3px 2px #2FBCAB;  
}
tr td{
   text-align: center;
   line-height: 2rem;
}
.td1{
   width: 20%;
   height: 3rem;
   color: #FFF;
   padding-left: 1px;
   padding-top: 1px;
   position: relative;
}
.ver-bottom{
   vertical-align: bottom;
}
.chart-con-wrap{
   width: 80%;
   height: 304px;  
   margin: 1.5rem auto; 
   position: relative;
   display: none;  
}
.chart-con{
   width: 95%;
   padding: 2% 5% 2% 0;
   height: 304px; 
   background: rgba(255,255,255,0.9);
   overflow: auto;     
   border-radius: 0.5rem;  
}
.chart-con-wrap:before{
   display: block;
   content: "";
   position: absolute;
   left: 48%;
   top: -19px;
   border: 10px; 
   border-style: dashed dashed solid dashed;  
   border-color: transparent transparent rgba(255,255,255,0.9) transparent; 
   font-size: 0;
   line-height: 0;
}

</style>
</head>
<body style="background: url(img/bid-top-bg.png) no-repeat;background-size: 100%;">
      <div style="margin-top: 1rem;height: 2.5rem;width: 2.5rem;"><a href="#"><img src="img/callback.png"></a></div>
      <div class="btn-chart active">累计投资排行</div>
      <div class="chart-con-wrap" style="display: block;">
	       <div class="chart-con">
	            <table style="width: 100%;">
	            	<c:forEach items="${listToalInvest}" var="totalInvest"  varStatus="status">
	            		 <c:if test="${status.index < 3}" >
		            		<tr class="ver-bottom">
		                      <td class="td1" style="background: url(img/champion${status.index+1}.png) no-repeat center;background-size: contain;">${status.index+1} </td>
		                </c:if>      
		                <c:if test="${status.index >= 3}" >
		                <td>${status.index+1} </td>
		                </c:if>
		                      <td>${totalInvest.sub_mobile}</td>
		                      <td>￥${totalInvest.total_invest}</td>
		                  	</tr>
					</c:forEach>
	            </table>
	      </div>
	  </div>
      <div class="btn-chart">月投资排行</div>
      <div class="chart-con-wrap">
	       <div class="chart-con">
	            <table style="width: 100%;">
	            		<c:forEach items="${listToalMonthInvest}" var="toalMonthInvest" varStatus="status">
	            		 <c:if test="${status.index < 3}" >
		            		<tr class="ver-bottom">
		                      <td class="td1" style="background: url(img/champion${status.index+1}.png) no-repeat center;background-size: contain;">${status.index+1} </td>
		                </c:if>      
		                <c:if test="${status.index >= 3}" >
		                <td>${status.index+1} </td>
		                </c:if>
		                      <td >${toalMonthInvest.sub_mobile}</td>
		                      <td >￥${toalMonthInvest.month_total_invest}</td>
		                  	</tr>
					</c:forEach>
	            </table>
	      </div>
	  </div>
      <div class="btn-chart">收益排行</div>
      <div class="chart-con-wrap">
	       <div class="chart-con">
	            <table style="width: 100%;">
	            		<c:forEach items="${listToalProfit}" var="toalProfit" varStatus="status">
	            		 <c:if test="${status.index < 3}" >
		            		<tr class="ver-bottom">
		                      <td class="td1" style="background: url(img/champion${status.index+1}.png) no-repeat center;background-size: contain;">${status.index+1} </td>
		                </c:if>      
		                <c:if test="${status.index >= 3}" >
		                <td>${status.index+1} </td>
		                </c:if>
		                      <td >${toalProfit.sub_mobile}</td>
		                      <td >￥<fmt:formatNumber value="${toalProfit.total_profit}" pattern="##.##" minFractionDigits="2"></fmt:formatNumber></td>
		                  	</tr>
					</c:forEach>
	            </table>
	      </div>
	  </div>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script>
      $(function(){
    	  $(".btn-chart").click(function(){
    		 $(this).next().show().siblings(".chart-con-wrap").hide();
    	  });
      })
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="bottomLayout">
	<a class="btn1" href="home.htm?tab=home&t=<%=new java.util.Date()%>">
		<c:if test="${param.tab=='home' }">
			<img class="icon" src="img/icon_home_a.png" />
			<div class="text" style="color: #FF7433">首页</div>
		</c:if>
		<c:if test="${param.tab!='home' }">
			<img class="icon" src="img/icon_home_n.png" />
			<div class="text" style="color: #888888;">首页</div>
		</c:if>
	</a>
	<a class="btn1" href="financial_zone.htm?tab=zone&t=<%=new java.util.Date()%>">
		<c:if test="${param.tab=='zone' }">
			<img class="icon" src="img/icon_licai_a.png"/>
			<div class="text" style="color: #FF7433">理财专区</div>
		</c:if>
		<c:if test="${param.tab!='zone' }">
			<img class="icon" src="img/icon_licai_n.png" />
			<div class="text" style="color: #888888;">理财专区</div>
		</c:if>
	</a>
	<a class="btn1" href="my_account.htm?tab=account&t=<%=new java.util.Date()%>" style="float: right;">
		<c:if test="${param.tab=='account' }">
			<img class="icon" src="img/icon_myaccount_a.png"/>
			<div class="text" style="color: #FF7433">我的账户</div>
		</c:if>
		<c:if test="${param.tab!='account' }">
			<img class="icon" src="img/icon_myaccount_n.png" />
			<div class="text" style="color: #888888;">我的账户</div>
		</c:if>
	</a>
</div>

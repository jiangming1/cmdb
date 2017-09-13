<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="popBox" id="windowcenter">
	<p class="pop_header" id="windowtitle">提示标题</p>
	<div class="popconbox">
		<div class="popconc" id="windowtext"></div>
		<div class="popbtnbox" id="windowbuttons">
			<a href="javascript:;" title="确定" class="popbtn sure dialogok" >确定</a>
			<a href="javascript:;" title="取消" class="popbtn cancel dialogcancel">取消</a>
		</div>
	</div>
</div>
<div id="windowpopbg" class="popbg" style="display:none;"></div>

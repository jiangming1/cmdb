<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${scb!=null }">
	<hr class="u-hr" />
	<div class="am-g">
		<div class="am-u-sm-12 am-padding-vertical-xs am-text-lg" style="font-weight: bold;">
			随存随取系列<img src="/exwebdocs-wx/gytemp3/images/safe1.png" width="20" height="20" style="margin-left: 5px;" />
		</div>
	</div>
	<hr class="u-hr" />
	<div class="am-g am-relative am-padding-vertical-xs">
		<div class="am-u-sm-12">${scb.name }</div>

		<a href="http://www.laicunba.com/h5/sui_cun_bao_detail.htm">
			<div class="am-u-sm-4 am-text-center am-padding-top-xs">
				<span class="am-text-xl am-text-warning">${scb.annualizedRates }</span> <span class="am-text-sm am-text-warning">%</span><br /> <span class="am-text-xs">预期年化</span>
			</div>
			<div class="am-u-sm-4 am-text-center" style="padding-top: 5px;">
				<span class="am-text-xl block_color">[</span> <span class="am-text-sm block_color">随存随取</span> <span class="am-text-xl block_color">]</span><br /> <span class="am-text-xs">提现T+1天到账</span>
			</div>
			<!--收益率js内容开始  -->
			<input type="hidden" id="shouyinew0" value="${(scb.finishAmount/scb.collectAmount)*100 }" />
			<div class="am-u-sm-4 am-text-center" id="shouyi0"></div>
			<!--收益率js内容结束-->
		</a>
	</div>
	<hr class="u-hr" />
	<div class="am-g am-padding-vertical-xs"></div>
</c:if>

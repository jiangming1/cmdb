<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<title>Android发版</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta charset="utf-8">
<style type="text/css">
#form1 input {
	width: 500px;
}
</style>
</head>
<body style="margin: 20px;">
	该数据暂时只存在缓存中,如果缓存被清除则任何用户都不会提示更新,修改后60秒左右生效
	<h4>Android各渠道版本列表</h4>
	<table border="1">
		<thead>
			<tr>
				<th>序</th>
				<th>市场/渠道</th>
				<th>发布时间</th>
				<th>apk</th>
				<th>Version Code</th>
				<th>Version Name</th>
				<th>版本描述</th>
				<th>状态</th>
				<th>操作</th>
				<th>用户</th>
			</tr>
		</thead>
		<tbody id="tbody">
			<tr>
				<td class="xu">序</td>
				<td class="channel">市场/渠道</td>
				<td class="publishDate">发布时间</td>
				<td class="apkUrl">apk</td>
				<td class="versionCode">Version Code</td>
				<td class="versionName">Version Name</td>
				<td class="summary">版本描述</td>
				<td class="status">状态</td>
				<td>
					<button class="btnClose">关闭</button>
					<button class="btnOpen">开启</button>
				</td>
				<td class="count"></td>
			</tr>
		</tbody>
	</table>

	<h4>Android发版,方法一</h4>
	<table id="form1">
		<tr>
			<td>市场/渠道</td>
			<td><input id="channel" /></td>
		</tr>
		<tr>
			<td>发布时间</td>
			<td><input id="publishDate" /></td>
		</tr>
		<tr>
			<td>apkUrl</td>
			<td><input id="apkUrl" /></td>
		</tr>
		<tr>
			<td>versionCode</td>
			<td><input id="versionCode" /></td>
		</tr>
		<tr>
			<td>versionName</td>
			<td><input id="versionName" /></td>
		</tr>
		<tr>
			<td>summary</td>
			<td><input id="summary" /></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<button id="btnSubmit1">提交,更新现有渠道</button>
			</td>
		</tr>
	</table>
	<hr />
	<h4>Android发版,方法二</h4>
	<div style="margin-top: 20px;">
		<textarea placeholder="版本描述"></textarea>

	</div>
	<div>
		<input type="file" />
	</div>

	<button>上传</button>
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script type="text/javascript">
		var trTemplate = $("#tbody").find("tr").remove();
		$(function() {

			$("#btnSubmit1").click(function() {
				var p = {
					t : new Date(),
					channel : $("#channel").val().trim(),
					publishDate : $("#publishDate").val().trim(),
					apkUrl : $("#apkUrl").val().trim(),
					versionCode : $("#versionCode").val().trim(),
					versionName : $("#versionName").val().trim(),
					summary : $("#summary").val().trim()
				};
				$.post("android_publish1.htm", p, function(data) {
					loadApkList(data);
					alert("一分钟左右生效");
				}, "json");
			});
			$.post("android_published_list.htm", {
				t : new Date()
			}, function(apkList) {
				loadApkList(apkList);
			}, "json");

		});
		var loadApkList = function(apkList) {
			var tbody = $("#tbody");
			tbody.html("");
			for ( var i in apkList) {
				var apk = apkList[i];
				var newTr = trTemplate.clone();
				newTr.attr("channel", apk.channel);
				newTr.find(".xu").html(parseInt(i) + 1);
				newTr.find(".channel").html(apk.channel);
				newTr.find(".versionCode").html(apk.versionCode);
				newTr.find(".versionName").html(apk.versionName);
				newTr.find(".apkUrl").html(apk.apkUrl);
				if (apk.status && apk.status == 'enable') {
					newTr.find(".status").html("正常更新");
				} else {
					newTr.find(".status").html("Disable");
				}
				newTr.find(".publishDate").html(apk.publishDate);
				newTr.find(".summary").html(apk.summary);
				tbody.append(newTr);
				tbody.find(".btnOpen").click(function() {
					var tr = $(this).parent().parent();
					var channel = tr.find(".channel").html().trim();
					var status = tr.find(".status").html().trim();
					$.post("android_apk_status_switch.htm", {
						channel : channel,
						status : "enable"
					}, function(data) {
						loadApkList(data);
					}, "json");
				});
				tbody.find(".btnClose").click(function() {
					var tr = $(this).parent().parent();
					var channel = tr.find(".channel").html().trim();
					var status = tr.find(".status").html().trim();
					$.post("android_apk_status_switch.htm", {
						channel : channel,
						status : "disable"
					}, function(data) {
						loadApkList(data);
					}, "json");
				});
			}

			//load channel count
			$.post("../query.htm", {
				t : new Date(),
				listId : "USER_DEVICE.groupWithChannelVer"
			}, function(data) {
				//alert(JSON.stringify(data));
				var tbody = $("#tbody");
				data = data.rows;
				var row = null;
				var channelTr = null;
				for ( var i in data) {
					row = data[i];
					if (!row.channel) {
						continue;
					}
					channelTr = tbody.find("tr[channel='" + row.channel + "']"); 
					if(channelTr.length==0){
						channelTr=trTemplate.clone();
						channelTr.attr("channel", row.channel);
						channelTr.find(".xu").html(parseInt(i) + 1);
						channelTr.find(".channel").html(row.channel);
						channelTr.find(".versionCode").html(row.app_ver?row.app_ver:"无");
						channelTr.find(".versionName").html("");
						channelTr.find(".apkUrl").html(""); 
						channelTr.find(".status").html("");
						tbody.append(channelTr);
					}
	
					
					channelTr.find(".count").append("<span>"+(row.app_ver?row.app_ver:"null")+":"+row.amt+",</span>");
				}
			}, "json");
		}
	</script>
</body>
</html>



<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<title>银行支付渠道设置</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta charset="utf-8">
<link href="https://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../static/bootstrap-switch/css/bootstrap3/bootstrap-switch.min.css">
<style type="text/css">
body {
	padding: 0px;
	margin: 0px;
}

.bootstrap-switch .bootstrap-switch-handle-off, .bootstrap-switch .bootstrap-switch-handle-on,
	.bootstrap-switch .bootstrap-switch-label {
	line-height: 10px;
}

.tagIcon {
	height: 25px;
}

.db, .dr, .dy {
	width: 60px;
}

.fuiou {
	background-color: #f5faff;
}

.baofoo {
	background-color: #f9f9f9;
}

#tbody tr:HOVER td {
	background-color: #e5c67a;
}
</style>
</head>
<body>

	<table class="table">
		<thead>
			<tr>
				<th>银行</th>
				<th class="fuiou">富友</th>
				<th class="fuiou">单笔</th>
				<th class="fuiou">单日</th>
				<th class="fuiou">单月</th>
				<th class="baofoo">宝付</th>
				<th class="baofoo">单笔</th>
				<th class="baofoo">单日</th>
				<th class="baofoo">单月</th>
				<th>关闭通道</th>
			</tr>
		</thead>
		<tbody id="tbody">
			<tr>
				<td class="bank_name">工商银行</td>
				<td class="fuiou"><input name="0801020000" type="radio" value="fuiou" /></td>
				<td class="fuiou"><input class="db" /></td>
				<td class="fuiou"><input class="dr" /></td>
				<td class="fuiou"><input class="dy" /></td>
				<td class="baofoo"><input name="0801020000" type="radio" value="baofoo" /></td>
				<td class="baofoo"><input class="db" /></td>
				<td class="baofoo"><input class="dr" /></td>
				<td class="baofoo"><input class="dy" /></td>
				<td><input name="0801020000" type="radio" value="closed" /></td>
			</tr>
			<tr>
				<td class="bank_name">农业银行</td>
				<td class="fuiou"><input name="0801030000" type="radio" value="fuiou" /></td>
				<td class="fuiou"><input class="db" /></td>
				<td class="fuiou"><input class="dr" /></td>
				<td class="fuiou"><input class="dy" /></td>
				<td class="baofoo"><input name="0801030000" type="radio" value="baofoo" /></td>
				<td class="baofoo"><input class="db" /></td>
				<td class="baofoo"><input class="dr" /></td>
				<td class="baofoo"><input class="dy" /></td>
				<td><input name="0801030000" type="radio" value="closed" /></td>
			</tr>
			<tr>
				<td class="bank_name">中国银行</td>
				<td class="fuiou"><input name="0801040000" type="radio" value="fuiou" /></td>
				<td class="fuiou"><input class="db" /></td>
				<td class="fuiou"><input class="dr" /></td>
				<td class="fuiou"><input class="dy" /></td>
				<td class="baofoo"><input name="0801040000" type="radio" value="baofoo" /></td>
				<td class="baofoo"><input class="db" /></td>
				<td class="baofoo"><input class="dr" /></td>
				<td class="baofoo"><input class="dy" /></td>
				<td><input name="0801040000" type="radio" value="closed" /></td>
			</tr>
			<tr>
				<td class="bank_name">建设银行</td>
				<td class="fuiou"><input name="0801050000" type="radio" value="fuiou" /></td>
				<td class="fuiou"><input class="db" /></td>
				<td class="fuiou"><input class="dr" /></td>
				<td class="fuiou"><input class="dy" /></td>
				<td class="baofoo"><input name="0801050000" type="radio" value="baofoo" /></td>
				<td class="baofoo"><input class="db" /></td>
				<td class="baofoo"><input class="dr" /></td>
				<td class="baofoo"><input class="dy" /></td>
				<td><input name="0801050000" type="radio" value="closed" /></td>
			</tr>
			<tr>
				<td class="bank_name">邮政储蓄银行</td>
				<td class="fuiou"><input name="0801000000" type="radio" value="fuiou" /></td>
				<td class="fuiou"><input class="db" /></td>
				<td class="fuiou"><input class="dr" /></td>
				<td class="fuiou"><input class="dy" /></td>
				<td class="baofoo"><input name="0801000000" type="radio" value="baofoo" /></td>
				<td class="baofoo"><input class="db" /></td>
				<td class="baofoo"><input class="dr" /></td>
				<td class="baofoo"><input class="dy" /></td>
				<td><input name="0801000000" type="radio" value="closed" /></td>
			</tr>
			<tr>
				<td class="bank_name">平安银行</td>
				<td class="fuiou"><input name="0804100000" type="radio" value="fuiou" /></td>
				<td class="fuiou"><input class="db" /></td>
				<td class="fuiou"><input class="dr" /></td>
				<td class="fuiou"><input class="dy" /></td>
				<td class="baofoo"><input name="0804100000" type="radio" value="baofoo" /></td>
				<td class="baofoo"><input class="db" /></td>
				<td class="baofoo"><input class="dr" /></td>
				<td class="baofoo"><input class="dy" /></td>
				<td><input name="0804100000" type="radio" value="closed" /></td>
			</tr>
			<tr>
				<td class="bank_name">民生银行</td>
				<td class="fuiou"><input name="0803050000" type="radio" value="fuiou" /></td>
				<td class="fuiou"><input class="db" /></td>
				<td class="fuiou"><input class="dr" /></td>
				<td class="fuiou"><input class="dy" /></td>
				<td class="baofoo"><input name="0803050000" type="radio" value="baofoo" /></td>
				<td class="baofoo"><input class="db" /></td>
				<td class="baofoo"><input class="dr" /></td>
				<td class="baofoo"><input class="dy" /></td>
				<td><input name="0803050000" type="radio" value="closed" /></td>
			</tr>
			<tr>
				<td class="bank_name">光大银行</td>
				<td class="fuiou"><input name="0803030000" type="radio" value="fuiou" /></td>
				<td class="fuiou"><input class="db" /></td>
				<td class="fuiou"><input class="dr" /></td>
				<td class="fuiou"><input class="dy" /></td>
				<td class="baofoo"><input name="0803030000" type="radio" value="baofoo" /></td>
				<td class="baofoo"><input class="db" /></td>
				<td class="baofoo"><input class="dr" /></td>
				<td class="baofoo"><input class="dy" /></td>
				<td><input name="0803030000" type="radio" value="closed" /></td>
			</tr>
			<tr>
				<td class="bank_name">广发银行</td>
				<td class="fuiou"><input name="0803060000" type="radio" value="fuiou" /></td>
				<td class="fuiou"><input class="db" /></td>
				<td class="fuiou"><input class="dr" /></td>
				<td class="fuiou"><input class="dy" /></td>
				<td class="baofoo"><input name="0803060000" type="radio" value="baofoo" /></td>
				<td class="baofoo"><input class="db" /></td>
				<td class="baofoo"><input class="dr" /></td>
				<td class="baofoo"><input class="dy" /></td>
				<td><input name="0803060000" type="radio" value="closed" /></td>
			</tr>
			<tr>
				<td class="bank_name">中信银行</td>
				<td class="fuiou"><input name="0803020000" type="radio" value="fuiou" /></td>
				<td class="fuiou"><input class="db" /></td>
				<td class="fuiou"><input class="dr" /></td>
				<td class="fuiou"><input class="dy" /></td>
				<td class="baofoo"><input name="0803020000" type="radio" value="baofoo" /></td>
				<td class="baofoo"><input class="db" /></td>
				<td class="baofoo"><input class="dr" /></td>
				<td class="baofoo"><input class="dy" /></td>
				<td><input name="0803020000" type="radio" value="closed" /></td>
			</tr>
			<tr>
				<td class="bank_name">兴业银行</td>
				<td class="fuiou"><input name="0803090000" type="radio" value="fuiou" /></td>
				<td class="fuiou"><input class="db" /></td>
				<td class="fuiou"><input class="dr" /></td>
				<td class="fuiou"><input class="dy" /></td>
				<td class="baofoo"><input name="0803090000" type="radio" value="baofoo" /></td>
				<td class="baofoo"><input class="db" /></td>
				<td class="baofoo"><input class="dr" /></td>
				<td class="baofoo"><input class="dy" /></td>
				<td><input name="0803090000" type="radio" value="closed" /></td>
			</tr>
			<tr>
				<td class="bank_name">华夏银行</td>
				<td class="fuiou"><input name="0803040000" type="radio" value="fuiou" /></td>
				<td class="fuiou"><input class="db" /></td>
				<td class="fuiou"><input class="dr" /></td>
				<td class="fuiou"><input class="dy" /></td>
				<td class="baofoo"><input name="0803040000" type="radio" value="baofoo" disabled="disabled" /></td>
				<td class="baofoo"><input class="db" disabled="disabled"/></td>
				<td class="baofoo"><input class="dr" disabled="disabled"/></td>
				<td class="baofoo"><input class="dy" disabled="disabled"/></td>
				<td><input name="0803040000" type="radio" value="closed" /></td>
			</tr>
			<tr>
				<td class="bank_name">交通银行</td>
				<td class="fuiou"><input name="0803010000" type="radio" value="fuiou" /></td>
				<td class="fuiou"><input class="db" /></td>
				<td class="fuiou"><input class="dr" /></td>
				<td class="fuiou"><input class="dy" /></td>
				<td class="baofoo"><input name="0803010000" type="radio" value="baofoo" /></td>
				<td class="baofoo"><input class="db" /></td>
				<td class="baofoo"><input class="dr" /></td>
				<td class="baofoo"><input class="dy" /></td>
				<td><input name="0803010000" type="radio" value="closed" /></td>
			</tr>
			<tr>
				<td class="bank_name">招商银行</td>
				<td class="fuiou"><input name="0803080000" type="radio" value="fuiou" /></td>
				<td class="fuiou"><input class="db" /></td>
				<td class="fuiou"><input class="dr" /></td>
				<td class="fuiou"><input class="dy" /></td>
				<td class="baofoo"><input name="0803080000" type="radio" value="baofoo" /></td>
				<td class="baofoo"><input class="db" /></td>
				<td class="baofoo"><input class="dr" /></td>
				<td class="baofoo"><input class="dy" /></td>
				<td><input name="0803080000" type="radio" value="closed" /></td>
			</tr>
			<tr>
				<td class="bank_name">浦发银行</td>
				<td class="fuiou"><input name="0803100000" type="radio" value="fuiou" /></td>
				<td class="fuiou"><input class="db" /></td>
				<td class="fuiou"><input class="dr" /></td>
				<td class="fuiou"><input class="dy" /></td>
				<td class="baofoo"><input name="0803100000" type="radio" value="baofoo" /></td>
				<td class="baofoo"><input class="db" /></td>
				<td class="baofoo"><input class="dr" /></td>
				<td class="baofoo"><input class="dy" /></td>
				<td><input name="0803100000" type="radio" value="closed" /></td>
			</tr>
		</tbody>
	</table>
	<div style="margin: 10px;">
		<button id="btnSave" class="btn btn-primary" style="display: none;">保存,并立即生效</button>
		<div>通过该功能,可以设定指定银行走指定的通道.</div>
	</div>


	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="../../static/bootstrap2/js/bootstrap.min.js"></script>
	<script src="../../static/bootstrap-switch/docs/js/highlight.js"></script>
	<script src="../../static/bootstrap-switch/js/bootstrap-switch.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".db,.dr,.dy").each(function() {
				var input = $(this);
				if (!input.val()) {
					input.val("0");
				}
			});
			$(".fuiou").find("[type='radio']").each(function() {
				var radio = $(this);
				radio.prop("checked", true);
			});

			$("#btnSave").click(function() {
				var bankSetting = [];
				$("#tbody").find("tr").each(function() {
					try {
						var tr = $(this);
						var checkedRadio = tr.find(":checked");
						bankSetting.push({
							name : tr.find(".bank_name").html().trim(),
							cardType : "借记卡",
							code : checkedRadio.attr("name"),
							way : checkedRadio.val(),
							fuiou_s : toNumber(tr.find(".fuiou").find(".db").val()),
							fuiou_d : toMoney(toNumber(tr.find(".fuiou").find(".dr").val())),
							fuiou_m : toMoney(toNumber(tr.find(".fuiou").find(".dy").val())),
							baofoo_s : toNumber(tr.find(".baofoo").find(".db").val()),
							baofoo_d : toMoney(toNumber(tr.find(".baofoo").find(".dr").val())),
							baofoo_m : toMoney(toNumber(tr.find(".baofoo").find(".dy").val()))
						});
					} catch (e) {
						alert(e);
					}

				});
				$.post("save_bank_pay_way_setting.htm", {
					t : new Date(),
					content : JSON.stringify(bankSetting)
				}, function(data) {
					if (data.success) {
						alert("保存成功");
					} else {
						alert("保存失败");
					}
				}, "json");
			});

			$.post("get_bank_pay_way_setting.htm", {
				t : new Date()
			}, function(data) {
				for ( var i in data) {
					try { 
						var row = data[i];
						var tr = $("[name='" + row.code + "']").parent().parent();
						if (row.way == "fuiou") {
							tr.find("[type='radio'][value='fuiou']").prop("checked", true);
						} else if (row.way == "baofoo") {
							tr.find("[type='radio'][value='baofoo']").prop("checked", true);
						} else if (row.way == "closed") {
							tr.find("[type='radio'][value='closed']").prop("checked", true);
						}
						tr.find(".fuiou").find(".db").val(row.fuiou_s);
						tr.find(".fuiou").find(".dr").val(row.fuiou_d);
						tr.find(".fuiou").find(".dy").val(row.fuiou_m);
						tr.find(".baofoo").find(".db").val(row.baofoo_s);
						tr.find(".baofoo").find(".dr").val(row.baofoo_d);
						tr.find(".baofoo").find(".dy").val(row.baofoo_m);
					} catch (e) {
						alert(e);
					}
				}
				$("#btnSave").show();
			}, "json");
		});

		function toNumber(x) {
			return x ? parseFloat(x) : 0;
		}
		function toMoney(x) {
			return x;
		}
	</script>
</body>
</html>



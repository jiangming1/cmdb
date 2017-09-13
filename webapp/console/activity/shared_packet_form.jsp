<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>创建分享红包</title>

<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
</head>
<body>
	<div>红包名字</div>
	<div>
		<input type="text" id="name" />
	</div>

	<div>金额</div>
	<div>
		<input type="text" id="amount" placeholder="最大1000" />
	</div>

	<div>数量</div>
	<div>
		<input type="text" id="splitCount" value="10" />
	</div>

	<div>使用条件</div>
	<div>
		<input type="text" id="conditions" value='[{"buy_amount":1000,"period":7,"target_type":"CPB"}]' style="width: 300px;" />
	</div>

	<div>备注</div>
	<div>
		<input type="text" id="summary" />
	</div>
	<div>分配方式</div>
	<div>
		<select id="extractType">
			<option value="RANDOM">随机抽取</option>
			<option value="AVG">平分</option>
		</select>
	</div>
	<button id="btnCreate">创建</button>
	
	<img id="qrcodeImg" alt=""  />
	<script type="text/javascript">
		$(function() {
			$("#btnCreate").click(function() {
				var p = {
					t : new Date(),
					name : $("#name").val().trim(),
					amount : $("#amount").val().trim(),
					splitCount : $("#splitCount").val().trim(),
					conditions : $("#conditions").val().trim(),
					extractType : $("#extractType").val().trim(),
					summary : $("#summary").val().trim(),
					type : "CASH_COUPON"
				};
				if (!p.name) {
					$("#name").focus();
					return;
				}
				if (!p.amount) {
					$("#amount").focus();
					return;
				}
				if (!p.splitCount) {
					$("#splitCount").focus();
					return;
				}
				if (!p.conditions) {
					$("#conditions").focus();
					return;
				}
				$.post("create_share_packet.htm", p, function(data) { 
					if(!data.success){
						alert("创建失败"+JSON.stringify(data));
						return ;
					}
					$("#qrcodeImg").prop("src","data:image/gif;base64,"+data.qrcode);
				}, "json");
			});

		});
	</script>
</body>
</html>
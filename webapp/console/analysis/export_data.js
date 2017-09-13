$(function() {
	$("#exportExcelRegist").click(
			function() {
				var beginTimeStr = $('#beginTime').datetimebox('getValue');
				var endTimeStr = $('#endTime').datetimebox('getValue');

				if (!beginTimeStr) {
					alert("请输入开始时间!");
					return;
				}

				if (confirm("确定要导出excel吗?")) {
					var listId = "WHOLE_USER_ANALYSIS.userinfo";
					var myDate = new Date();
					var mytime = myDate.toCNString(); // 获取当前时间
					var channel = $('#channel').val().trim();
					var excelname = channel + "注册用户" + mytime;	
					window.open("../exportexcel.htm?listId=" + listId
							+ "&excelname=" + excelname + "&beginTimeStr="
							+ beginTimeStr + "&endTimeStr=" + endTimeStr
							+ "&channel=" + channel);
				}
			});
	$("#exportExcelDeal").click(
			function() {
				var beginTimeStr = $('#beginTime').datetimebox('getValue');
				var endTimeStr = $('#endTime').datetimebox('getValue');

				if (!beginTimeStr) {
					alert("请输入开始时间!");
					return;
				}
				
				if (isEmpty($("#channelType"))) {
					return;
				}
				if (confirm("确定要导出excel吗?")) {
					var listId = "WHOLE_USER_ANALYSIS.user_buyinfo";
					var myDate = new Date();
					var mytime = myDate.toCNString(); // 获取当前时间
					var channelType = $("#channelType").val();
					/*if($("#channelType").val()=='regist'){*/
						var channel = $('#channel').val();
						var excelname = channel + "用户交易行为" + mytime;
						window.open("../exportexcel.htm?listId=" + listId
								+ "&excelname=" + excelname + "&beginTimeStr="
								+ beginTimeStr + "&endTimeStr=" + endTimeStr
								+ "&channel=" + channel + "&channelType=" + channelType);
					/*}else if($("#channelType").val()=='deal'){
						var channelFBid = $('#channel').val();
						var excelname = channelFBid + "用户交易行为" + mytime;
						window.open("../exportexcel.htm?listId=" + listId
								+ "&excelname=" + excelname + "&beginTimeStr="
								+ beginTimeStr + "&endTimeStr=" + endTimeStr
								+ "&channelFBid=" + channelFBid);
					}*/
				}
			});

});
function isEmpty(input, type) {
	input.removeClass("dataError");
	var v = input.val().trim();
	if (!v) {
		input.focus();
		return true;
	}
	if (!type) {
		return false;
	}
	input.addClass("dataError");
	input.focus();
	return true;
}

Date.prototype.toCNString = function() {
	return this.getFullYear() + (this.getMonth()>=9 ? this.getMonth() + 1 : "0" + (this.getMonth() + 1))  + (this.getDate()>9 ? this.getDate() : "0" + this.getDate())
	 + (this.getHours()>9 ? this.getHours() : "0" + this.getHours())  + (this.getMinutes()>9 ? this.getMinutes() : "0" + this.getMinutes()) + (this.getSeconds()>9 ? this.getSeconds() : "0" + this.getSeconds());
};
$(function() {

	$(document).scroll(function(){
		 
	});
	
	
	$.post("../query.htm", {
		t : new Date(),
		listId : "ACCOUNT_BALANCE_ANALYSIS.listDailyBalanceItems"
	}, function(data) { 
		var tbody = $("#tbody");
		var templateTr = tbody.find("tr");
		templateTr.remove();
		var rows = data.rows;
		try {
			for ( var i in rows) {
				var row = rows[i];
				var tr = tbody.find("[date_id='" + row.date_id + "']");
				if (tr.length == 0) {
					tr = templateTr.clone();
					tbody.append(tr);
					tr.attr("date_id", row.date_id);
					tr.find(".date_id").html(row.date_id);
				}
				var a = 1;
				tr.find("." + row.data_type).find(".data_amount").html(row.data_amount.toFixed(2));
				tr.find("." + row.data_type).find(".data_count").html(row.data_count);
			
			}
			
			$.ajax({
				async:false,
				url:"../query.htm",
				data:{
					t:new Date(),
					listId:"ACCOUNT_BALANCE_ANALYSIS.countAllRemainProfit"
				},
				dataType:"json",
				success:function(tData){
					var trs = $("#tbody").find("tr");
					$(trs[trs.length-1]).find(".remain_profit").find(".data_amount").html(tData.rows[0]); 
				}
			});
		
			$.ajax({
				async:false,
				url:"../query.htm",
				data:{
					t:new Date(),
					listId:"ACCOUNT_BALANCE_ANALYSIS.countDebt"
				},
				dataType:"json",
				success:function(tData){
					var trs = $("#tbody").find("tr");
					$(trs[trs.length-1]).find(".total_amount").html(tData.rows[0]); 
				}
			});			
			
			$.post("../query.htm", {
				t : new Date(),
				listId : "ACCOUNT_BALANCE_ANALYSIS.listAccBalanceRegistry"
			}, function(registList) {
				var tbody = $("#tbody");
				for ( var i in registList.rows) {
					var row = registList.rows[i];
					var date = row.id.split("\.");
					date = date[date.length - 1];
					date = date.split("/");
					var tr = tbody.find("[date_id='" + date[0] + "-" + date[1] + "-" + date[2] + "']");
					if (row.id.indexOf("sys.acc.balance.remainprofit") > -1) {
						tr.find(".remain_profit").find(".data_amount").html(row.val);
					} else if (row.id.indexOf("sys.acc.balance.debt") > -1) {
						tr.find(".total_amount").html(row.val);
					}
				}

				BalanceTestService.test();
			}, "json");

		} catch (e) {
			alert(e);
		}
	}, "json");
	
	$.post("../query.htm",{
		t : new Date(),
		listId : "ACCOUNT_BALANCE_ANALYSIS.accItemGroup"
	},function(data){ 
		var aList=[];
		var row=null;
		var balanceAmt=null;
		var inAmt=0;
		var outAmt=0;
		for(var i in data.rows){
			row=data.rows[i];
			if(row.type=='balance'){
				balanceAmt=parseFloat(row.amt);
				continue;
			}
			if(row.type=='IN'){
				inAmt+=parseFloat(row.amt);
			}else{ 
				outAmt+=parseFloat(row.amt);
			}
			row.mark+="  ("+(row.type=='IN'?"收入":"支出")+")";
			aList.push({
				name:row.mark,
				y:row.amt
			}); 
		}
		var testBalanceAmt=(inAmt-outAmt-balanceAmt).toFixed(2);
		//alert(testBalanceAmt);
		$("#caBalanceAmt").html(balanceAmt);
		$("#caBalanceTest").html(testBalanceAmt);
		if(testBalanceAmt==0){
			$("#caBalanceTestImg").append('<img class="safeIcon" src="../../static/imgs/safe.png" height="30" title="复活账户整体安全" />');
			
		}else{
			$("#caBalanceTestImg").append('好像哪里有问题!');
		}
		$('#accApie').highcharts({
			chart : {
				plotBackgroundColor : null,
				plotBorderWidth : null,
				plotShadow : false,
				type : 'pie'
			},
			title : {
				text : '复活账户资金情况'
			},
			tooltip : {
				pointFormat : '{series.name}:<b>{point.percentage:.1f}%</b><br/>RMB:{point.y}元'
			},
			plotOptions : {
				pie : {
					allowPointSelect : true,
					cursor : 'pointer',
					dataLabels : {
						enabled : true,
						format : '<b>{point.name}</b>:{point.percentage:.1f}%<br/>RMB:{point.y}元',
						style : {
							color : (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
						}
					}
				}
			},
			series : [ {
				name : '占比',
				colorByPoint : true,
				data : aList
			} ]

		});
		
	},"json");

});

var BalanceTestService = {
	test : function() {
		$("#tbody").find("tr").each(function() {
			var tr = $(this);
			var beforeTotalmoney = 0;
			var beforeRemainProfit = 0;
			var prevTr = tr.prev();
			if (prevTr.length == 1) {
				beforeTotalmoney = prevTr.find(".total_amount").html().trim();
				beforeTotalmoney = beforeTotalmoney ? parseFloat(beforeTotalmoney) : 0;
				beforeRemainProfit = prevTr.find(".remain_profit").find(".data_amount").html().trim();
				beforeRemainProfit = beforeRemainProfit ? parseFloat(beforeRemainProfit) : 0;
			}
			var user_pay = str2Money(tr.find(".user_pay").find(".data_amount").html());
			var pay_out_principal = str2Money(tr.find(".pay_out_principal").find(".data_amount").html());
			var pay_out = str2Money(tr.find(".pay_out").find(".data_amount").html());
			if(pay_out>0){
				tr.find(".pay_out").find(".data_amount").html((pay_out-pay_out_principal).toFixed(2));
				tr.find(".pay_out_principal").find(".data_count").html(tr.find(".pay_out").find(".data_count").html());
				tr.find(".pay_out_principal").find(".data_amount").attr("title","总打款:"+pay_out);
				tr.find(".pay_out").find(".data_amount").attr("title","总打款:"+pay_out);
			}
	 
			var cash_coupon = str2Money(tr.find(".cash_coupon").find(".data_amount").html());
			var d2h_profit = str2Money(tr.find(".d2h_profit").find(".data_amount").html());
			var h2d_profit = str2Money(tr.find(".h2d_profit").find(".data_amount").html());
			var activity_profit = str2Money(tr.find(".activity_profit").find(".data_amount").html());
			var remain_profit = str2Money(tr.find(".remain_profit").find(".data_amount").html());
			var ac_profit = str2Money(tr.find(".ac_profit").find(".data_amount").html());
			var init_ca = str2Money(tr.find(".init_ca").find(".data_amount").html());
			var total_amount = str2Money(tr.find(".total_amount").html());
			var balanceValue = beforeTotalmoney;
			balanceValue += user_pay;
			balanceValue -= pay_out_principal; 
			balanceValue += cash_coupon;
			balanceValue += d2h_profit;
			balanceValue += h2d_profit;
			balanceValue += activity_profit;
			balanceValue -= beforeRemainProfit;
			balanceValue += remain_profit;
			balanceValue += ac_profit;
			balanceValue += init_ca;
			balanceValue -= total_amount;
			
			if(total_amount>0){
				tr.find(".testBalance").addClass("need_balance");
			}
			if (balanceValue != 0) {
				tr.find(".testBalance").addClass("test_error");
			}
			tr.find(".testBalance").html(balanceValue.toFixed(2));
		});
		
		var totalUserPay = count($("#tbody").find(".user_pay"));
		$("#tfoot").find(".user_pay").find(".data_count").html(totalUserPay.totalCount);
		$("#tfoot").find(".user_pay").find(".data_amount").html(totalUserPay.totalAmount); 
		

		var totalPay_out_principal = count($("#tbody").find(".pay_out_principal"));
		$("#tfoot").find(".pay_out_principal").find(".data_count").html(totalPay_out_principal.totalCount);
		$("#tfoot").find(".pay_out_principal").find(".data_amount").html(totalPay_out_principal.totalAmount); 
		
		var totalPay_out  = count($("#tbody").find(".pay_out"));
		$("#tfoot").find(".pay_out").find(".data_count").html(totalPay_out.totalCount);
		$("#tfoot").find(".pay_out").find(".data_amount").html(totalPay_out.totalAmount); 
		
		var totalcash_coupon  = count($("#tbody").find(".cash_coupon"));
		$("#tfoot").find(".cash_coupon").find(".data_count").html(totalcash_coupon.totalCount);
		$("#tfoot").find(".cash_coupon").find(".data_amount").html(totalcash_coupon.totalAmount); 
			
		var totald2h_profit  = count($("#tbody").find(".d2h_profit"));
		$("#tfoot").find(".d2h_profit").find(".data_count").html(totald2h_profit.totalCount);
		$("#tfoot").find(".d2h_profit").find(".data_amount").html(totald2h_profit.totalAmount); 
		
		var totalh2d_profit  = count($("#tbody").find(".h2d_profit"));
		$("#tfoot").find(".h2d_profit").find(".data_count").html(totalh2d_profit.totalCount);
		$("#tfoot").find(".h2d_profit").find(".data_amount").html(totalh2d_profit.totalAmount);
		
		
		var totalactivity_profit  = count($("#tbody").find(".activity_profit"));
		$("#tfoot").find(".activity_profit").find(".data_count").html(totalactivity_profit.totalCount);
		$("#tfoot").find(".activity_profit").find(".data_amount").html(totalactivity_profit.totalAmount); 

		var totalac_profit  = count($("#tbody").find(".ac_profit"));
		$("#tfoot").find(".ac_profit").find(".data_count").html(totalac_profit.totalCount);
		$("#tfoot").find(".ac_profit").find(".data_amount").html(totalac_profit.totalAmount); 

 
		var testBalanceTds = $("#tbody").find(".need_balance");
		var totalBalance=0;
		for(var i=1;i<testBalanceTds.length;i++){
			totalBalance+=str2Money($(testBalanceTds[i]).html());
		}
		$("#tfoot").find(".testBalance").html(totalBalance.toFixed(2));
	}

};
function count(tds){
	var totalCount=0;
	var totalAmount=0;
	for(var i=0;i<tds.length;i++){
		totalCount+=str2Money($(tds[i]).find(".data_count").html());
		totalAmount+=str2Money($(tds[i]).find(".data_amount").html());
	}
	return {totalCount:totalCount,totalAmount:totalAmount.toFixed(2)};
}
function str2Money(str) {
	return str ? parseFloat(str) : 0;
}
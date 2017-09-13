$(function() {
	
	var p = {
		t : new Date(),
		listId : "BID_ANALYSIS.channel_bid_count"
	};
	$.post("../query.htm", p, function(data) {
		if (!data.rows) {
			return;
		}
//		datas = data.rows;
		var array = [];
		for ( var i in data.rows) {
			var row = data.rows[i];
			if(row){
				
				if(row.channel==""||row.channel==null){
					row.channel="weixin_store";
				}
			}
			if(row){
				row.channel=row.channel.trim();
				if(row.channel=="weixin"){
					row.channel="weixin_store";
				}
			}
			if(array.length==0){
					array.push(row.channel);

			} 
			if(array.indexOf(row.channel)==-1){
					array.push(row.channel);
				
			}	
		}
		// load th
		for(var j in array){
			$("#table1").find("thead").find("tr").append("<th class='top' id='fth_" + array[j] + "'></th>");
			var topTh = $("#table1").find("#fth_" + array[j]);
			topTh.append("<th class='topTd' id='th_" + array[j] + "'>" + array[j] + "</th>");
			topTh.append("<td class='topTd'></td>");
			topTh.append("<td class='topTd'></td>");
			topTh.append("<td class='topTd'></td>");
		}
		var arrDayTotal = [];
		for(var j in array){
			var totalPayed = 0;
			var totalNpayed = 0;
			var totalPayedUser = 0;
			var totalNotpayUser = 0;
			for ( var i in data.rows) {
				var row = data.rows[i];
				var payDateTr = $("#table1").find("#tr_" + row.pay_date);			
				if (payDateTr.size() == 0) {
					$("#table1").find("tbody").append("<tr id='tr_" + row.pay_date + "'></tr>");
					payDateTr = $("#table1").find("#tr_" + row.pay_date);
					payDateTr.append("<td>" + row.pay_date + "</td>");
				}
				if(row.channel==array[j]){
					ChannelBidTable.createColumn(row);
				if(row.pay) {
					totalPayed +=row.amount;
					totalPayedUser += row.countuser;
				} else { 
					totalNpayed +=row.amount;
					totalNotpayUser += row.countuser;
				}
				}else if(row.channel!=array[j]){
					var payDateTr = $("#table1").find("#tr_" + row.pay_date);				
						var td = payDateTr.find("#" + "td_" + row.pay_date + "_" + array[j]);
						if (td.size() == 0) {
							td = $("<td></td>");
							td.attr("id", "td_" + row.pay_date + "_" + array[j]);
							payDateTr.append(td);
							var payedTd = document.getElementById("td_"+row.pay_date+ "_" + array[j]+"_payed");
							if(!payedTd){
							td.append("<td class='payed' id='td_"+row.pay_date+ "_" + array[j]+"_payed"+"'></td>");
							td.append("<td class='payedusernumber' id='td_"+row.pay_date+ "_" + array[j]+"_payedusernumber"+"'></td>");
							td.append("<td class='not_pay' id='td_"+row.pay_date+ "_" + array[j]+"_not_pay"+"'></td>");
							td.append("<td class='notpayusernumber' id='td_"+row.pay_date+ "_" + array[j]+"_notpayusernumber"+"'></td>")
							}
						}
				}				
			}
			var payDateTr = $("#table1").find("#tr_" + "storeTotal");
			if (payDateTr.size() == 0) {
				$("#table1").find("tbody").append("<tr id='tr_" + "storeTotal" + "'></tr>");	
				payDateTr = $("#table1").find("#tr_" + "storeTotal");
				payDateTr.append("<td>" + "storeTotal" + "</td>");	
				payDateTr.append("<td id='" + array[j] + "'></td>");
			}else{	
				payDateTr = $("#table1").find("#tr_" + "storeTotal");	
				payDateTr.append("<td id='" + array[j] + "'></td>");
			}
			var td = $("#table1").find("#" + array[j]);
			td.append("<td class='payed' id='td_"+array[j]+"_payed"+"'>"+totalPayed+"</td>");
			td.append("<td class='payedusernumber' id='td_"+array[j]+"_payed"+"'>"+totalPayedUser+"</td>");
			td.append("<td class='not_pay' id='td_"+array[j]+"_payed"+"'>"+totalNpayed+"</td>");
			td.append("<td class='notpayusernumber' id='td_"+array[j]+"_payed"+"'>"+totalNotpayUser+"</td>");
		}
		
	}, "json");

});
	var ChannelBidTable = {
		createColumn : function(row) {
			var payDateTr = $("#table1").find("#tr_" + row.pay_date);
			var td = payDateTr.find("#" + "td_" + row.pay_date + "_" + row.channel);
			if (td.size() == 0) {
				td = $("<td></td>");
				td.attr("id", "td_" + row.pay_date + "_" + row.channel);
				payDateTr.append(td);
			}
			var payedTd = document.getElementById("td_"+row.pay_date+ "_" + row.channel+"_payed");
			if(!payedTd){
				td.append("<td class='payed' id='td_"+row.pay_date+ "_" + row.channel+"_payed"+"'></td>");
				td.append("<td class='payedusernumber' id='td_"+row.pay_date+ "_" + row.channel+"_payedusernumber"+"'></td>");
				td.append("<td class='not_pay' id='td_"+row.pay_date+ "_" + row.channel+"_not_pay"+"'></td>");
				td.append("<td class='notpayusernumber' id='td_"+row.pay_date+ "_" + row.channel+"_notpayusernumber"+"'></td>")
			}
			if (row.pay) {                                                                                                                                                                    
				document.getElementById("td_"+row.pay_date+ "_" + row.channel+"_payed").innerHTML
				= row.amount;
				document.getElementById("td_"+row.pay_date+ "_" + row.channel+"_payedusernumber").innerHTML
				= row.countuser;
			} else { 
				document.getElementById("td_"+row.pay_date+ "_" + row.channel+"_not_pay").innerHTML
				= row.amount;
				document.getElementById("td_"+row.pay_date+ "_" + row.channel+"_notpayusernumber").innerHTML
				= row.countuser;
			}
		}
	};


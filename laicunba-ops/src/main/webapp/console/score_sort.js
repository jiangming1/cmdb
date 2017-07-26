var emptyTr=null;
$(function() {
	var trTemplate = $("#tbody").find("tr");
	trTemplate.remove();

	for (var i = 0; i < 10; i++) {
		var newTr = trTemplate.clone();
		newTr.find(".index").html(i+1);
		$("#tbody").append(newTr);
	}
	
	$.post("query.htm?listId=SCORE.scoreGroupList",{},function(data){ 
		for(var index in data.rows){
			var row=data.rows[index];
			var namedTr = $("#tbody").find("tr[usr='"+row['account_id']+"']");
			if(namedTr.length==0){
				
			 
				namedTr = $($("#tbody").find(".empty")[0]);
				if(!namedTr){
					alert("人太多了显示不下");
					continue;
				}
				namedTr.attr("usr",row['account_id']);
				namedTr.find(".score").html("-")
				namedTr.removeClass("empty");
			}
			
			namedTr.find(".username").html(row['account_id']);
			namedTr.find(".btn-pay").attr("usr",row['account_id']);
			 
			if(row["type"]=="1today"){
				namedTr.find(".day").html(row["amt"]);
			}else if(row["type"]=="2week"){
				namedTr.find(".week").html(row["amt"]);
			}else if(row["type"]=="3month"){
				namedTr.find(".month").html(row["amt"]);
			}
			  
		}
		$("#tbody").find(".empty").find("td").html("");
		$("#table1").show();
		
		
		$.post("query.htm?listId=SCORE.accountList",{},function(data){ 
			 
			var totalSocre=0;
			var scoreMoney=0;
			for(var index in data.rows){
				var row=data.rows[index];
				totalSocre += parseInt(row["balance"]);
			}	
			scoreMoney = 30.0 / totalSocre;   
			for(var index in data.rows){
				var row=data.rows[index];
				var tr = $("#tbody").find("tr[usr='"+row['id']+"']"); 
				var money = parseInt(row["balance"])*scoreMoney;
				tr.find(".alipay").html(row["alipay"]);
				tr.find(".money").html(money.toFixed(2)); 
				tr.find(".balance").html(row["balance"]);
				
			}	
		},"json");
		
		$(".btn-pay").click(function(){
			var usr = $(this).attr("usr");
			if(!window.confirm('确认手动付款')){
				return ;
			}
			var tr = $("#tbody").find("tr[usr='"+usr+"']"); 
			$.post("score_pay.htm",{
				t:new Date(),
				accountId:usr,
				money:tr.find(".money").html().trim()
			},function(data){

				alert(JSON.stringify(data));
				
			},"json");
		});
		
	},"json");

});
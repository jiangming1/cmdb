$(function() {
	var liclone = $(".main-ul>li").clone();
	$(".main-ul>li").remove();
	$.post("query.htm?listId=SCORE.scoreGroupList",{},function(data){		
		for(var i in data.rows){
			var row = data.rows[i];
			var liIndex = $(".main-ul>li"); //.main-ul下一级li的个数；
			//console.log(liIndex);
			var liUser = $(".main-ul").find("li[user = '"+ row.account_id +"']");
			var _liclone = liclone.clone();
			if(liUser.length == 0){
				$(".main-ul").append(_liclone);
				$(".search").attr("user",row.account_id);//给li添加user属性，唯一识别
				liUser = $(".main-ul").find("li[user = '"+ row.account_id +"']");
				liUser.find(".main-item:first-child").html(liIndex.length + 1);
				$(".search").removeClass("search");
			};
			liUser.find(".user-name").html(row.account_id);  // 给用户添加名字
			liUser.find(".btn-pay").attr("usr",row.account_id); //给结算按钮添加 usr属性 ，提交时使用
			if(row.type=="1today"){
				liUser.find(".day").html(row.amt);
			}else if(row.type=="2week"){
				liUser.find(".week").html(row.amt);
			}else if(row.type=="3month"){
				liUser.find(".month").html(row.amt);
			};
		};
	
		$.post("query.htm?listId=SCORE.accountList",{},function(data){
			var totalScore = 0;
			var scoreMoney = 0;
			for(var i in data.rows){
				row = data.rows[i];
				totalScore +=parseInt(row.balance);
			};
			scoreMoney = 30.0 / totalScore;
			for(var i in data.rows){
				var row=data.rows[i];
				var liUser = $(".main-ul").find("li[user='"+ row.id +"']");// 根据添加的user找到右侧对象的数据
				var money = parseInt(row.balance)*scoreMoney;
				liUser.find(".alipay").html(row.alipay);
				liUser.find(".money").html(money.toFixed(2)); 
				liUser.find(".balance").html(row.balance);			
			}
		},"json");
		
		$(".btn-pay img").hover(function(){
			$(this).attr("src","img/btn-close-h.png");
		},function(){
			$(this).attr("src","img/btn-close-a.png");
		});
		
		$(".btn-pay img").click(function(){
			var usr = $(this).parent().attr("usr");
			if(!window.confirm('确认手动付款')){
				return ;
			};
			var liUser = $(".main-ul>li[user='"+usr+"']"); 
			$.post("score_pay.htm",{
				t:new Date(),
				accountId:usr,
				money:liUser.find(".money").html().trim()
			},function(data){
				
				alert(JSON.stringify(data));
				
			},"json");
		});
	},"json");
	
	$(".raiders-icon").click(function(){
		$(".wrapper").addClass("wrapper-hide");
		$(".wrapper").removeClass("wrapper-show");
		$(this).hide(1000);
		$(".raiders-con").addClass("raiders-con-up");
		$(".raiders-con").removeClass("raiders-con-down");
	});
	$(".btn-stop img").hover(function(){
		$(this).attr("src","img/btn-stop-h.png");
	},function(){
		$(this).attr("src","img/btn-stop-a.png");
	});
	$(".btn-stop img").click(function(){
		$(".wrapper").addClass("wrapper-show");
		$(".wrapper").removeClass("wrapper-hide");
		$(".raiders-icon").show(1000);
		$(".raiders-con").addClass("raiders-con-down");
		$(".raiders-con").removeClass("raiders-con-up");
	});
});
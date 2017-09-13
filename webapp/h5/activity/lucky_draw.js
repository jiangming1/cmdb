$(function() {
	//旋转角度
	var angles;
	//可抽奖次数
	var luckyDrawCount = $(".residue").text();
	//$(".residue").html(luckyDrawCount);
	//旋转次数
	var rotNum = 1;
	var rewardLevel = -1;
	var msgType = $("#msgType").val();
	//var info = ["88元现金","  18元现金"," 10话费","5元红包","iPhone6s","8.8元发财红包"," 10元红包","5.2爱情红包"];
	//var info1 = ['再接再厉','      元','     元','  淘金币','     元','  淘金币','     元','  淘金币']
	$('.btn_run').bind('click',function(){
		var app_token = $("#app_token").val();
		if (luckyDrawCount > 0) {
			$.post("start_lucky_draw.htm?app_token="+app_token, null, function(data) {
				if (data.code == "fail") {
					if(data.msgType == "LOGIN_TIME_OUT") {
						// TODO 登录超时处理
					} else if(data.msgType == "NO_SHARE") {
						// TODO 没有分享过
					} else if(data.msgType == "COUNT_ZERO") {
						// TODO 没有抽奖次数
					} else if(data.msgType == "SYSTEM_EXCEPTION") {
						// TODO 系统异常
					}
					alert(data.msg);
				} else if (data.code == "success") {
					rewardLevel = data.rewardLevel;
					runCup();
				}
			}, "json");
			
			//可抽奖次数减一
			luckyDrawCount = luckyDrawCount-1;
			msgType = msgType-1;
			$(".residue").html(luckyDrawCount);
			//转盘旋转
			runCup();
			//转盘旋转过程“开始抽奖”按钮无法点击
			$('.btn_run').attr("disabled", true);
			//旋转次数加一
			rotNum = rotNum + 1;
			//“开始抽奖”按钮无法点击恢复点击
			/*setTimeout(function(){
				//alert(notice);
				$('.btn_run').removeAttr("disabled", true);
			},6000);  */
		} else if(msgType == -1){
			$(".tips1,.mask").show();
		} else if(msgType == 0){
			$(".tips2,.mask").show();
		}
	});
	//抽奖 次数为0时 点击跳转到app理财专区  
	$(".target_financial").click(function(){
		window.location.href=$(this).attr("rel");
	});
	//转盘旋转
	function runCup(){
		probability();
		var degValue = 'rotate('+angles+'deg'+')';
		$('.zpcon').css('-o-transform',degValue);           //Opera
		$('.zpcon').css('-ms-transform',degValue);          //IE浏览器
		$('.zpcon').css('-moz-transform',degValue);         //Firefox
		$('.zpcon').css('-webkit-transform',degValue);      //Chrome和Safari
		$('.zpcon').css('transform',degValue);
	}
	//各奖项对应的旋转角度及中奖公告内容
	function probability(){
		//获取随机数
//		var num = parseInt(Math.random()*(7 - 0 + 0) + 0);
		//概率
		if (rewardLevel == 2 ) {
			angles = 2160 * rotNum + 1800;
			setTimeout(function(){
				$(".prize_con").html("<img src='img/88cash.png'>");
				$(".prize_mask1").show();
				$(".prize_mask").hide();
				$('.btn_run').removeAttr("disabled", true);
			},6000);
		}
		//概率
		else if (rewardLevel == 7 ) {
			angles = 2160 * rotNum + 1845;
			setTimeout(function(){
				$(".prize_con").html("<img src='img/5d2love.png'>");
				$(".prize_mask").show();
				$(".prize_mask1").hide();
				$('.btn_run').removeAttr("disabled", true);
			},6000);
		}
		//概率
		else if (rewardLevel == 6 ) {
			angles = 2160 * rotNum + 1890;
			setTimeout(function(){
				$(".prize_con").html("<img src='img/10packet.png'>");
				$(".prize_mask").show();
				$(".prize_mask1").hide();
				$('.btn_run').removeAttr("disabled", true);
			},6000);
		}
		//概率
		else if (rewardLevel == 8 ) {
			angles = 2160 * rotNum + 1935;
			setTimeout(function(){
				$(".prize_con").html("<img src='img/8d8packet.png'>");
				$(".prize_mask").show();
				$(".prize_mask1").hide();
				$('.btn_run').removeAttr("disabled", true);
			},6000);
		}
		//概率
		else if (rewardLevel == 1 ) {
			angles = 2160 * rotNum + 1980;
			setTimeout(function(){
				$(".prize_con").html("<img src='img/iPhone6s.png'>");
				$(".prize_mask1").show();
				$(".prize_mask").hide();
				$('.btn_run').removeAttr("disabled", true);
			}, 6000);
		}
		//概率
		else if (rewardLevel == 5 ) {
			angles = 2160 * rotNum + 2025;
			setTimeout(function(){
				$(".prize_con").html("<img src='img/5packet.png'>");
				$(".prize_mask").show();
				$(".prize_mask1").hide();
				$('.btn_run').removeAttr("disabled", true);
			},6000);
		}
		//概率
		else if (rewardLevel == 4 ) {
			angles = 2160 * rotNum + 2070;
			setTimeout(function(){
				$(".prize_con").html("<img src='img/10fare.png'>");
				$(".prize_mask1").show();
				$(".prize_mask").hide();
				$('.btn_run').removeAttr("disabled", true);
			},6000);
		}
		//概率
		else if (rewardLevel == 3 ) {
			angles = 2160 * rotNum + 2115;
			setTimeout(function(){
				$(".prize_con").html("<img src='img/18cash.png'>");
				$(".prize_mask").show();
				$(".prize_mask1").hide();
				$('.btn_run').removeAttr("disabled", true);
			},6000);
		}
	}
	$(".close,.btn_close,.btn_share").click(function(){
	   $(".mask,.prize_mask,.prize_mask1,.warm_tips").hide();	
	});
	$(".rule").click(function(){
		$(".mask,.detail_con").fadeIn();		
	});
	$(".btn_sure").click(function(){
		$(".mask,.detail_con").fadeOut();
	});
	
	/* 滚动列表js */
	var $win=$(".Winning_info");
	var scrollTimer;
	$win.hover(function() {
		clearInterval(scrollTimer);
	}, function() {
		scrollTimer = setInterval(function() {
			scrollList($win);
		}, 2000);
	}).trigger("mouseleave");
});

function scrollList(obj){
	var $rollList=obj.find("ul.roll_list");
	var lineHeight=$rollList.find("li:first").height();
	//alert(lineHeight);
	$rollList.animate({"marginTop": -lineHeight + "px" },600,function() {
		$rollList.css({
			marginTop: 0
		}).find("li:first").appendTo($rollList);
	})
}

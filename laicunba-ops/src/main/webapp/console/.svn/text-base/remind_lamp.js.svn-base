window.onload=function(){
	$("iframe").attr("scrolling","no");
	KeepalivedService.init();
	setInterval(function() {
		KeepalivedService.refresh();	
	}, 10000);
}

var KeepalivedService = {
		pointSettingMap : {},
		pointGmtWriteMap : {},
		refreshPointSettingMap : {},
		init : function() {
			var all_lamp_num = 0;
			var iframe_div = $(".iframe_div");
			var pointSettingList = null;
			$.ajax({
				async : false,
				url : "../keepalivedPointList.htm",
				data : {
					t : new Date()
				},
				dataType : "json",
				type : "POST",
				success : function(data) {
					pointSettingList = data;
				}
			});
			all_lamp_num = pointSettingList.length;
			iframe_div.children().remove();
			$(".all_lamp").html(all_lamp_num);
			for ( var i in pointSettingList) {
				var tmp = pointSettingList[i];
				var iframe = "<iframe src='remind_lamp.html' class='"+tmp.id+"'scrolling='no'><iframe>"
				iframe_div.append(iframe);
				sendTest(tmp);
				new transformation_lamp(tmp,0,0);
				this.pointSettingMap[tmp["key"]] = tmp;
				this.pointGmtWriteMap[tmp["key"]] = tmp.gmtWrite
			}
		},	
		refresh : function() {
			var refreshPointSettingList = null;
			var iframe_div = $(".iframe_div");
			
			$.ajax({
				async : false,
				url : "../keepalivedPointList.htm",
				data : {
					t : new Date()
				},
				dataType : "json",
				type : "POST",
				success : function(data) {
					refreshPointSettingList = data;
				}
			});
			$(".all_lamp").html(refreshPointSettingList.length);
			for(var i in refreshPointSettingList){
				var rtmp = refreshPointSettingList[i];
				this.refreshPointSettingMap[rtmp["key"]] = rtmp;
				if($("."+rtmp["id"]).length!=0){
				//if(this.pointGmtWriteMap[rtmp["key"]]!=null){
					var a = this.pointGmtWriteMap[rtmp["key"]];
					if(this.pointGmtWriteMap[rtmp["key"]] != rtmp.gmtWrite){
						$("."+(this.pointSettingMap[rtmp["key"]]).id).remove();
						this.pointGmtWriteMap[rtmp["key"]] = rtmp.gmtWrite;
						this.pointSettingMap[rtmp["key"]].gmtWrite = rtmp.gmtWrite;
						var iframe = "<iframe src='remind_lamp.html' class='"+rtmp.id+' change '+rtmp.gmtWrite+"'scrolling='no'><iframe>"
						if(i<1){
							$(".iframe_div").prepend(iframe);
						}else{
							$("."+refreshPointSettingList[i-1].id).after(iframe);
						}
						sendTest(rtmp);
						new transformation_lamp(rtmp,0,0);
					}
				}else{
					this.pointGmtWriteMap[rtmp["key"]] = rtmp.gmtWrite;
					var iframe = "<iframe src='remind_lamp.html' class='"+rtmp.id+"'scrolling='no'><iframe>";
					if(i<1){
						$(".iframe_div").prepend(iframe);
					}else{
						$("."+refreshPointSettingList[i-1].id).after(iframe);
					}
					sendTest(rtmp);
					new transformation_lamp(rtmp,0,0);
				}	
			}
			for(var i in this.pointSettingMap){
				var point = this.pointSettingMap[i];
				if(this.refreshPointSettingMap[point.key]==null){
					$("."+point.id).remove();
					delete (this.pointGmtWriteMap[point.key]);
				}
			}
			this.pointSettingMap = this.refreshPointSettingMap;
			this.refreshPointSettingMap = {};
		}
}

function sendTest(tmp) {

	$.post("../selectForTesting.htm", {
		t : new Date(),
		key : tmp.key,
		env : $("#envInput").val().trim()
	}, function(data) {
		if (data.code != "SUCCESS") {
			alert("error");
		}
	}, "json");

}

function transformation_lamp(tmp,timeStr,show_time){
	var boolean= $("."+tmp.id).hasClass("change");
	if(boolean){
		var boolean002= $("."+tmp.id).hasClass(tmp.gmtWrite);
		if(!boolean002){
			return;
		}
	}
	var newTimeStr = 0;
	if (Number(timeStr) < 1){
		newTimeStr = tmp.interval*1000;
	}else{
		newTimeStr = Number(timeStr);
	}
	 
	var key = tmp.key;
	var setTimeout01= window.setTimeout(function() {
		var testCaseStatus = null;
		var param = {
				t : new Date(),
				env : $("#envInput").val().trim(),
				key : key
			};
		$.ajax({
			async : false,
			url : "../testCase.htm",
			data : param,
			dataType : "json",
			type : "POST",
			success : function(data) {
				testCaseStatus = data.status;
			}
		});
		if(testCaseStatus =='tested'){
			$("."+tmp.id).removeClass("red_div");
			green_lamp(tmp);
			//clearInterval(this.setInterval01);
			transformation_lamp(tmp,0,0);	
		}	
		else {
			$("."+tmp.id).addClass("red_div");
			red_lamp();
			show_error_info(tmp,show_time);

			if(show_time > tmp.interval){
				show_time =1 ;
			}
			//clearInterval(this.setInterval01);
			transformation_lamp(tmp,10000,show_time+10);
		}
	}, newTimeStr);
}

function show_error_info(tmp,show_time){
	var boolean= $("."+tmp.id).hasClass("red_div");
	if(!boolean){
		return;
	}
	if(show_time ==0 || show_time >= tmp.interval){
		$("."+tmp.id).addClass("yellow_div");
		yellow_lamp();
		
		var content = 	"<p style='font-size:1.1em;margin:10px 10px 5px 20px;'><span style='font-size:1.6em;color:red'>功能："+tmp.cnName+"</span>；时间阈："+tmp.interval+"s；负责人："+tmp.owner+"；用户类型："+tmp.userType+"</p>"
		$(".error_info").css({"display":"block","animation":"error_info_show 3s forwards"});
		setTimeout (function() { 
			$(".error_info").append(content);
		}, 2000);
		
		setTimeout (function() { 
			$(".error_info").css({"display":"block","animation":"error_info_close 1s forwards"});
			$(".error_info").html("");
			setTimeout (function() {
			$("."+tmp.id).removeClass("yellow_div");
			red_lamp();
			}, 1000);
		}, 10000);	
	}
}

function green_lamp(tmp){
	$("."+tmp.id).contents().find(".wrap #s-bulb").css({"fill":"green","stroke":"green","stroke-width":"0","transition": "300ms","animation":"null"});
	$("."+tmp.id).contents().find(".wrap #www-filament").css({"fill":"#00ef00","stroke":"#00ef00","stroke-width":"0","transition": "300ms"});
	$("."+tmp.id).contents().find(".wrap .light .glow").css({"width":"0","height":"0","opacity":"0","background":"-webkit-radial-gradient(rgba(255,0,0,1), rgba(255,0,0,0) 30%)","animation":"null","transition": "all 600ms cubic-bezier(0.68, -0.55, 0.265, 1.55)"});
	$("."+tmp.id).contents().find(".wrap .light .flare").css({"width":"0","height":"0","opacity":"0","background":"rgba(255,0,0,0)","animation":"null","transition": "all 300ms cubic-bezier(0.68, -0.55, 0.265, 1.55)"});	
	sendTest(tmp);
}

function red_lamp(){
	window.setTimeout(function() {
	$(".red_div").contents().find(".wrap #s-bulb").css({"fill":"#F00","stroke":"#f00","stroke-width":"2","transition": "1500ms"});
	$(".red_div").contents().find(".wrap #www-filament").css({"fill":"#F00","stroke":"#f00","stroke-width":"3","transition": "all 600ms cubic-bezier(0.68, -0.55, 0.265, 1.55)"});
	$(".red_div").contents().find(".wrap .light .glow").css({"animation":"mytwo 2s infinite","background":"-webkit-radial-gradient(rgba(255,0,0,1), rgba(255,0,0,0) 240%)","transition": "all 600ms cubic-bezier(0.68, -0.55, 0.265, 1.55)"});
	$(".red_div").contents().find(".wrap .light .flare").css({"background":"rgba(255,0,0,1)","transition": "all 600ms cubic-bezier(0.68, -0.55, 0.265, 1.55)","animation":"myfirst 2s infinite"});	
	$(".red_lamp_num").html($(".red_div").length);
	}, 100);
}



function yellow_lamp(){
	window.setTimeout(function() {
	$(".yellow_div").contents().find(".wrap #s-bulb").css({"fill":"#FF0","stroke":"#ff0","stroke-width":"2","transition": "1500ms"});
	$(".yellow_div").contents().find(".wrap #www-filament").css({"fill":"#FF0","stroke":"#ff0","stroke-width":"3","transition": "all 600ms cubic-bezier(0.68, -0.55, 0.265, 1.55)"});
	$(".yellow_div").contents().find(".wrap .light .glow").css({"animation":"mytwo 2s infinite","background":"-webkit-radial-gradient(rgba(255,255,0,1), rgba(255,0,0,0) 240%)","transition": "all 600ms cubic-bezier(0.68, -0.55, 0.265, 1.55)"});
	$(".yellow_div").contents().find(".wrap .light .flare").css({"background":"rgba(255,255,0,1)","transition": "all 600ms cubic-bezier(0.68, -0.55, 0.265, 1.55)","animation":"myfirst 2s infinite"});	
	}, 100);
}


Date.prototype.dateDiff = function (interval, objDate2) { var d = this, i = {}, t = d.getTime(), t2 = objDate2.getTime(); i['y'] = objDate2.getFullYear() - d.getFullYear(); i['q'] = i['y'] * 4 + Math.floor(objDate2.getMonth() / 4) - Math.floor(d.getMonth() / 4); i['m'] = i['y'] * 12 + objDate2.getMonth() - d.getMonth(); i['ms'] = objDate2.getTime() - d.getTime(); i['w'] = Math.floor((t2 + 345600000) / (604800000)) - Math.floor((t + 345600000) / (604800000)); i['d'] = Math.floor(t2 / 86400000) - Math.floor(t / 86400000); i['h'] = Math.floor(t2 / 3600000) - Math.floor(t / 3600000); i['n'] = Math.floor(t2 / 60000) - Math.floor(t / 60000); i['s'] = Math.floor(t2 / 1000) - Math.floor(t / 1000); return i[interval]; }

Date.prototype.DateAdd=function(strInterval,Number){var dtTmp=this;switch(strInterval){case's':return new Date(Date.parse(dtTmp)+(1000*Number));case'n':return new Date(Date.parse(dtTmp)+(60000*Number));case'h':return new Date(Date.parse(dtTmp)+(3600000*Number));case'd':return new Date(Date.parse(dtTmp)+(86400000*Number));case'w':return new Date(Date.parse(dtTmp)+((86400000*7)*Number));case'q':return new Date(dtTmp.getFullYear(),(dtTmp.getMonth())+Number*3,dtTmp.getDate(),dtTmp.getHours(),dtTmp.getMinutes(),dtTmp.getSeconds());case'm':return new Date(dtTmp.getFullYear(),(dtTmp.getMonth())+Number,dtTmp.getDate(),dtTmp.getHours(),dtTmp.getMinutes(),dtTmp.getSeconds());case'y':return new Date((dtTmp.getFullYear()+Number),dtTmp.getMonth(),dtTmp.getDate(),dtTmp.getHours(),dtTmp.getMinutes(),dtTmp.getSeconds());}}

Date.prototype.DateToParse=function(){var d=this;return Date.parse(d.getFullYear()+'/'+(d.getMonth()+1)+'/'+d.getDate());}
var InvestCalendarService = {
		load : function() {
 			var param = {
 				t : new Date(),
 				monthDate : $(".dates").attr("ref"),
 				app_token : $('#app_token').val()
 			};
			$.post("get_invest_info.htm", param, function(data) {
				if (data) {
					var array = data.msg;
					for(var i in array) {
						if(array[i].status == 'invest'){  // 购买标的 
//							$("#"+array[i].date+" span").addClass("invest");
//							$("#"+array[i].date).attr("ref","invest");
						} else if(array[i].status == 'expired') {  // 到期标的 
							$("#"+array[i].date+" span").addClass("expired");
							$("#"+array[i].date).attr("ref","expired");
						} else if(array[i].status == 'invest_expired') {  
//							$("#"+array[i].date+" span").addClass("invest_expired");
//							$("#"+array[i].date).attr("ref","invest_expired");
							$("#"+array[i].date+" span").addClass("expired");
							$("#"+array[i].date).attr("ref","expired");
						} else if(array[i].status == 'expireAmount') {  
							$("#expireAmount").text("本月应回款:" + parseFloat(array[i].date).toFixed(2) + "元");
						} else if(array[i].status == 'expiredAmount') {  
							$("#expiredAmount").text("已回款:" + parseFloat(array[i].date).toFixed(2) + "元");
						}
					}
					if($(".cur-cur").hasClass("expired")){ //当前日和到期日是同一天时的样式
				    	$(".cur-cur").append("<em></em>");
				    	$(".cur-cur").click();
				    } else if($(".cur").hasClass("expired")) {
				    	$(".cur").append("<em></em>");
				    }
				}
			}, "json");
		}
	};
//  日历表格绘制
function CreateCalendar(para,paraJsonName) {//c:容器,y:年,m:月,a:出发时间json,f:是否显示双日历,clickfu:点击事件回调函数,showFu:在日历里显示附加内容的回调函数
    var c=para.c;
	var y=para.y;
	var m=para.m;
	if(arguments.length!=3){
		m=para.m;
	} else if(arguments[2]=="pre") {
		m=para.m=para.m-1;
	} else if(arguments[2]=="next"){
		m=para.m=para.m+1;	
	} else{
		m=para.m;	
	}

	var a=para.a;
	var f=para.f;
	var clickfu=para.clickfu;
//	alert(clickfu);
	var showFu=para.showFu;
	
    var today = new Date();	
    today = new Date(today.getFullYear(),today.getMonth(),today.getDate());
    if (y == 0) {
    	y = today.getFullYear();
    	m = today.getMonth() + 1;
    };
	//var dmin=Date.parse(a.first().attr('d').replace(/-/g, '/')),dmax =Date.parse(a.last().attr('d').replace(/-/g, '/'));
	var dmin=a.d1.replace(/-/g,"/"),dmax =a.d2.replace(/-/g,"/");
	
    var i1 = 0, i2 = 0, i3 = 0, d2;
	var d1 = new Date(dmin), 
    today = today.DateToParse();
    if (Date.parse(d1.getFullYear() + '/' + (d1.getMonth() + 1) + '/1') > Date.parse(new Date(y,m-1,1))) {
        y = d1.getFullYear(); m = d1.getMonth() + 1;
	}
    $('#' + c).html('');
	//农历
	var ca=new Calendar();
	tmp='';		
	for(var i=0;i<=f;i++){
		d1=new Date(y,m-1+i);		
		y=d1.getFullYear();
		m=d1.getMonth() + 1;
		tmp += '<table cellpadding="0">';
		tmp += '<tr class="month"><th colspan="7"><div class="clearfix"><div class="prevMonth">';
		if(i==0){
			i1=Date.parse(y + '/' + m + '/1');
			d1 = new Date(dmin);// d1 最小时间
			if(Date.parse(d1.getFullYear() + '/' + (d1.getMonth() + 1) + '/1')<i1){//如果最小时间小于当前时间
				d1 = new Date(y,m-2-f,1);
				if(m == 1){  // 用来判断当前月是1月的时候 prev是12月的显示问题
					tmp += '<a class="prev" href="javascript:void(0);" onclick="CreateCalendar(' + paraJsonName + ',\'' + paraJsonName + '\',\'pre\');" title="上个月"><img src="img/prev-month.png"><span>' + 12 + '月</span></a>';
				}else{
					tmp += '<a class="prev" href="javascript:void(0);" onclick="CreateCalendar(' + paraJsonName + ',\'' + paraJsonName + '\',\'pre\');" title="上个月"><img src="img/prev-month.png"><span>' + (m-1) + '月</span></a>';
				}
				
			}else{
				if(m == 1){
					tmp += '<a class="prev0" href="javascript:;" title="上个月"><img src="img/prev-month.png"><span>' + 12 + '</span>月</a>';
				}else{
					tmp += '<a class="prev0" href="javascript:;" title="上个月"><img src="img/prev-month.png"><span>' + (m-1) + '</span>月</a>';
				}
			}
		}
		tmp+='</div>';
		tmp += '<div class="dates" ref="'+y+'-'+m+'"><span>' + y + '</span>年<span>' + m + '</span>月</div>';
		tmp+='<div class="nextMonth">';
		if(i==f){
			i1=Date.parse(y + '/' + m + '/1');
			d1 = new Date(dmax); // d1 最大时间
			i2=Date.parse(d1.getFullYear() + '/' + (d1.getMonth() + 1) + '/1');
			if(i2>i1){ //  如果最大时间大于当前时间
				d1 = new Date(y,Date.parse(new Date(y,m+1,1))>i2?m-f:m,1);
				if(m == 12){
					tmp += '<a class="next" href="javascript:;" onclick="CreateCalendar(' + paraJsonName + ',\'' + paraJsonName + '\',\'next\');" title="下个月"><span>' + 1 + '月</span><img src="img/next-month.png"></a>';
				}else{
					tmp += '<a class="next" href="javascript:;" onclick="CreateCalendar(' + paraJsonName + ',\'' + paraJsonName + '\',\'next\');" title="下个月"><span>' + (m+1) + '月</span><img src="img/next-month.png"></a>';
				}
					
			}else{//  如果最大时间小于当前时间
				if(m == 12){ // 用来判断当前月是12月的时候 next是1月的显示问题
					tmp += '<a class="next0" href="javascript:;" title="下个月"><span>' + 1 + '月</span><img src="img/next-month.png"></a>';
				}else{
					tmp += '<a class="next0" href="javascript:;" title="下个月"><span>' + (m+1) + '月</span><img src="img/next-month.png"></a>';
				}			
			}
		}
		tmp += '</div></div></th></tr>';
		tmp += '  <tr class="week">';
		tmp += '    <th class="weekEnd">日</th>';
		tmp += '    <th>一</th>';
		tmp += '    <th>二</th>';
		tmp += '    <th>三</th>';
		tmp += '    <th>四</th>';
		tmp += '    <th>五</th>';
		tmp += '    <th class="weekEnd">六</th>';
		tmp += '  </tr>';
		var maxdays = (new Date(Date.parse(new Date(y,m,1)) - 86400000)).getDate();  //当前月的天数
	//	alert(new Date(Date.parse(new Date(y,m,1)) - 86400000).getDate());
		d1 = new Date(y,m-1); //要显示的日期
		i1 = d1.getDay(); //这个月的第一天是星期几
	//	alert(i1);
	//  alert(maxdays);
		for (var j = 1; j <= 6; j++) {
			tmp += '<tr>';
			for (var k = 1; k <= 7; k++) {
				i2 = (j - 1) * 7 + k - i1; // 一个月的第多少天
				
				if (i2 < 1 || i2 > maxdays) {
					tmp += '<td></td>';
				} else {
					i3 = Date.parse(new Date(y,m-1,i2));
					d1=new Date(i3);
					//农历(ll的值为农历)
					//ca=new Calendar(y,m-1,i2)
					var ll=ca.getlf(d1);
					if(ll==''){
						ll=ca.getsf(d1);
						if(ll==''){
							ll=ca.getst(d1)	;
							if(ll=='')ll=ca.getls(d1)[3];
						}
					}
					if (i3 < dmin || i3 > dmax) {
						tmp += '<td><p><em>' + i2 + '</em></td>';
					} else {
						tmp += '<td week="' + (k - 1) + '" id="' + y + '-' + (m<10?"0"+m:m) + '-' + (i2<10?"0"+i2:i2) + '" title="' + ca.getl(d1,false) + ' ' + ca.getst(d1) + ' ' + ca.getsf(d1) + ' ' + ca.getlf(d1) +'">';

						if (today == i3){		//如果是当前日添加样式					
							tmp+='<span class="cur-cur">' + i2 + '</span></td>';
						} else {
							tmp+='<span>' + i2 + '</span></td>';
						}
					}   
				}
			}
			tmp += '</tr>';
		}
		tmp += '</table>';
	
	}
	tmp +='<div class="backcash clearfix"><div class="fl" id="expireAmount">本月应回款:-.--元</div><div class="fr" id="expiredAmount">已回款:-.--元</div></div>';
	tmp +='';
    $('#' + c).append(tmp);
	//alert(c);
    if ($.isFunction(clickfu)){
		//fu(this);
		$('#' + c +' td').click(function (){
			clickfu(this);
		})
		//alert($('#' + c +' td').text());
	}
    $(".expired-detail li").addClass("clearfix");
    $('#' + c +' td').height(30); //将td的高设置为宽度一样
    InvestCalendarService.load();
}
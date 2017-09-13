function Calendar() {
	/* ***
	
	该对象用于获取日期对应的节气、节日
	三个方法如下:
	.getl(date,lockNum)  返回日期对应的数字或农历表示
	.getst(date)  获取日期对应的节气,若不是则为空.
	.getlf(date)  获取阴历节日,若不是则为空.
	.getls(date)  获取阴历数组表示 结果["阴历年", "属相", "阴历月", "阴历日"] 
	.getsf(date)  获取阳历节日,若不是则为空.
	*/
	var unlockNum = true; //是否开启数字格式值返回 如：2011-12-15返回值为1121 [false则为 冬月廿十一]
	var solarTerm = new Array("小寒", "大寒", "立春", "雨水", "惊蛰", "春分", "清明", "谷雨", "立夏", "小满", "芒种", "夏至","小暑", "大暑", "立秋", "处暑", "白露", "秋分", "寒露", "霜降", "立冬", "小雪", "大雪", "冬至"); //24节气
	var DifferenceInMonth = new Array(1272060, 1275495, 1281180, 1289445, 1299225, 1310355, 1321560, 1333035, 1342770, 1350855, 1356420, 1359045,
	1358580, 1355055, 1348695, 1340040, 1329630, 1318455, 1306935, 1297380, 1286865, 1277730, 1274550, 1271556); //24节气值
	var SF = { "0101": "元旦", "0214": "情人节", "0305#": "学雷锋纪念日", "0308": "妇女节", "0312#": "植树节", "0315#": "消费者权益日", "0401#": "愚人节", "0501": "劳动节", "0504": "青年节", "0601": "儿童节", "0701": "建党节", "0801": "建军节", "0910": "教师节", "1001": "国庆节", "1224": "平安夜", "1225": "圣诞节" }; //阳历节日
	var LF = { "0101": "春节", "0115": "元宵节", "0505": "端午节", "0815": "中秋节", "0707": "七夕", "0909": "重阳节", "1010#": "感恩节", "1208#": "腊八节", "0100": "除夕" }; //阴历节日
	var CalendarData=new Array(100),madd=new Array(12),tgString="甲乙丙丁戊己庚辛壬癸",dzString="子丑寅卯辰巳午未申酉戌亥",numString="一二三四五六七八九十",monString="正二三四五六七八九十冬腊",weekString="日一二三四五六",sx="鼠牛虎兔龙蛇马羊猴鸡狗猪",cYear,cMonth,cDay,TheDate;
	CalendarData=new Array(0xA4B,0x5164B,0x6A5,0x6D4,0x415B5,0x2B6,0x957,0x2092F,0x497,0x60C96,0xD4A,0xEA5,0x50DA9,0x5AD,0x2B6,0x3126E,0x92E,0x7192D,0xC95,0xD4A,0x61B4A,0xB55,0x56A,0x4155B,0x25D,0x92D,0x2192B,0xA95,0x71695,0x6CA,0xB55,0x50AB5,0x4DA,0xA5B,0x30A57,0x52B,0x8152A,0xE95,0x6AA,0x615AA,0xAB5,0x4B6,0x414AE,0xA57,0x526,0x31D26,0xD95,0x70B55,0x56A,0x96D,0x5095D,0x4AD,0xA4D,0x41A4D,0xD25,0x81AA5,0xB54,0xB6A,0x612DA,0x95B,0x49B,0x41497,0xA4B,0xA164B,0x6A5,0x6D4,0x615B4,0xAB6,0x957,0x5092F,0x497,0x64B,0x30D4A,0xEA5,0x80D65,0x5AC,0xAB6,0x5126D,0x92E,0xC96,0x41A95,0xD4A,0xDA5,0x20B55,0x56A,0x7155B,0x25D,0x92D,0x5192B,0xA95,0xB4A,0x416AA,0xAD5,0x90AB5,0x4BA,0xA5B,0x60A57,0x52B,0xA93,0x40E95);madd[0]=0;madd[1]=31;madd[2]=59;madd[3]=90;madd[4]=120;madd[5]=151;madd[6]=181;madd[7]=212;madd[8]=243;madd[9]=273;madd[10]=304;madd[11]=334;
	function GetBit(m,n){return(m>>n)&1}
	function e2c(){
		TheDate=(arguments.length!=3)?new Date():new Date(arguments[0],arguments[1],arguments[2]);
		var total,m,n,k;
		var isEnd=false;
		var tmp=TheDate.getFullYear();
		total=(tmp-1921)*365+Math.floor((tmp-1921)/4)+madd[TheDate.getMonth()]+TheDate.getDate()-38;
		if(TheDate.getYear()%4==0&&TheDate.getMonth()>1){total++}
		for(m=0;;m++){
			k=(CalendarData[m]<0xfff)?11:12;
			for(n=k;n>=0;n--){
				if(total<=29+GetBit(CalendarData[m],n)){isEnd=true;break}
				total=total-29-GetBit(CalendarData[m],n)
			}
			if(isEnd)break
		}
		cYear=1921+m;cMonth=k-n+1;cDay=total;
		if(k==12){
			if(cMonth==Math.floor(CalendarData[m]/0x10000)+1){cMonth=1-cMonth}
			if(cMonth>Math.floor(CalendarData[m]/0x10000)+1){cMonth--}
		}
	}
	function GetcDateString() {
		var P = [19416, 19168, 42352, 21717, 53856, 55632, 91476, 22176, 39632, 21970, 19168, 42422, 42192, 53840, 119381, 46400, 54944, 44450, 38320, 84343, 18800, 42160, 46261, 27216, 27968, 109396, 11104, 38256, 21234, 18800, 25958, 54432, 59984, 28309, 23248, 11104, 100067, 37600, 116951, 51536, 54432, 120998, 46416, 22176, 107956, 9680, 37584, 53938, 43344, 46423, 27808, 46416, 86869, 19872, 42448, 83315, 21200, 43432, 59728, 27296, 44710, 43856, 19296, 43748, 42352, 21088, 62051, 55632, 23383, 22176, 38608, 19925, 19152, 42192, 54484, 53840, 54616, 46400, 46496, 103846, 38320, 18864, 43380, 42160, 45690, 27216, 27968, 44870, 43872, 38256, 19189, 18800, 25776, 29859, 59984, 27480, 21952, 43872, 38613, 37600, 51552, 55636, 54432, 55888, 30034, 22176, 43959, 9680, 37584, 51893, 43344, 46240, 47780, 44368, 21977, 19360, 42416, 86390, 21168, 43312, 31060, 27296, 44368, 23378, 19296, 42726, 42208, 53856, 60005, 54576, 23200, 30371, 38608, 19415, 19152, 42192, 118966, 53840, 54560, 56645, 46496, 22224, 21938, 18864, 42359, 42160, 43600, 111189, 27936, 44448];
		var tmp = "";
		if(unlockNum==false){
			tmp += tgString.charAt((cYear - 4) % 10);
			tmp += dzString.charAt((cYear - 4) % 12);
			tmp += "(";
			tmp += sx.charAt((cYear - 4) % 12);
			tmp += ")年";
		}
		if (cMonth < 1) {
			if (unlockNum == false) {
				tmp += "(闰)";
				tmp += monString.charAt(-cMonth - 1);
			} else {
				//tmp += "(闰)"; //**
				tmp += cMonth < 10 ? "0" + (cMonth - 2) : (cMonth - 2);  //monString.charAt(-cMonth - 1);//**        
			}
		} else {
			if (unlockNum == false) {
				tmp += monString.charAt(cMonth - 1);
			} else {
				tmp += cMonth < 10 ? "0" + cMonth : cMonth;  //monString.charAt(cMonth - 1);//**
			}
		}
		if (unlockNum == false) {
			tmp += "月";
			tmp += (cDay < 11) ? "初" : ((cDay < 20) ? "十" : ((cDay < 30) ? "廿" : "三十"));
			if (cDay % 10 != 0 || cDay == 10) {
				tmp += numString.charAt((cDay - 1) % 10);
			}
		} else {
			tmp += (cDay < 10 ? "0" + cDay : cDay);
			if (cMonth == 12 && cDay == ((P[cYear - 1900] & (65536 >> 12)) ? 30 : 29)) {
				tmp = "0100";
			}
		}
		return tmp;
	}
	//获取阴历	
	function GetLunarDay(solarYear,solarMonth,solarDay){
		if(solarYear<1921||solarYear>2020){return""}else{solarMonth=(parseInt(solarMonth)>0)?(solarMonth-1):11;
		e2c(solarYear,solarMonth,solarDay);
		return GetcDateString()
		}
	}

    //获取节气
    this.getst = function(date) {
		var DifferenceInYear = 31556926;
		var BeginTime = new Date(1901 / 1 / 1);
		BeginTime.setTime(947120460000);
		for (; date.getFullYear() < BeginTime.getFullYear(); ) {
			BeginTime.setTime(BeginTime.getTime() - DifferenceInYear * 1000);
		}
		for (; date.getFullYear() > BeginTime.getFullYear(); ) {
			BeginTime.setTime(BeginTime.getTime() + DifferenceInYear * 1000);
		}
		for (var M = 0; date.getMonth() > BeginTime.getMonth(); M++) {
			BeginTime.setTime(BeginTime.getTime() + DifferenceInMonth[M] * 1000);
		}
		if (date.getDate() > BeginTime.getDate()) {
			BeginTime.setTime(BeginTime.getTime() + DifferenceInMonth[M] * 1000);
			M++;
		}
		if (date.getDate() > BeginTime.getDate()) {
			BeginTime.setTime(BeginTime.getTime() + DifferenceInMonth[M] * 1000);
			M == 23 ? M = 0 : M++;
		}
		var JQ = "";
		if (date.getDate() == BeginTime.getDate()) {
			JQ += solarTerm[M];
		}
		return JQ;
	}
	//获取阳历节日
	this.getsf=function(){
		var m,d;
		if(arguments.length == 2){
			m=arguments[0];d=arguments[1];
		}else{
			m=arguments[0].getMonth()+1;d=arguments[0].getDate();
		}
		m= SF[(m < 10 ? "0" + m : m.toString()) + (d < 10 ? "0" + d : d.toString())];
		return m?m:'';
	}
	//获取阴历 D当前日期 lockNum是否开启数字格式值返回 //var D = new Date();
	this.getl=function (D,lockNum) {
		unlockNum = lockNum;
		if (lockNum == false || lockNum == "false") {
			numString = "一二三四五六七八九十";
			monString = "正二三四五六七八九十冬腊";
		}
		var yy = D.getFullYear();
		var mm = D.getMonth() + 1;
		var dd = D.getDate();
		var ww = D.getDay();
		var ss = parseInt(D.getTime() / 1000);
		if (yy < 100)yy = "19" + yy;
		return GetLunarDay(yy, mm, dd);
	}
	//获取阴历节日
	this.getlf=function (D) {
		var dayT = LF[this.getl(D,true)]; return dayT ? dayT : "";
	}
	//获取阴历数组
	this.getls=function(D){
		var tmp=this.getl(D,false);
		var t=['','','',''];
		var s=tmp.indexOf('年');
		if(s!=-1){
			t[0]=tmp.substring(0,2);
			t[1]=tmp.substring(3,4);
			tmp=tmp.substring(6);
			s=tmp.indexOf('月');
			t[2]=tmp.substring(0,s);
			t[3]=tmp.substring(s+1);
		}
		return t;
	}
}
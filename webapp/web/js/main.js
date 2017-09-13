// JavaScript Document
$(function(){
	/* 轮播图效果的实现 */
	var _index=0;
	var timePlay=null;
	var li_number=$("ul.on_list li").length;
	//clearInterval(timePlay);
	$("a.Imglist").eq(0).show().siblings("a").hide();
	$("#prev").hide();
	$("ul.on_list li").click(function(){
		_index=$(this).index();
		$(this).addClass("info_on").siblings().removeClass("info_on");
		$("a.Imglist").eq(_index).fadeIn().siblings("a").fadeOut();
	  });
	 $("#prev").click(function(){
		 $("ul.on_list li").eq(0).addClass("info_on").siblings().removeClass("info_on"); 
		 $("a.Imglist").eq(0).fadeIn().siblings("a").fadeOut();
		 $("#prev").hide();
		 $("#next").show();
	  });
	 $("#next").click(function(){
		$("ul.on_list li").eq(1).addClass("info_on").siblings().removeClass("info_on");
		$("a.Imglist").eq(1).fadeIn().siblings("a").fadeOut();
		$("#prev").show();
		$("#next").hide();
	  });
	/* 定时器的实现 */
	 function autoPlay(){
		timePlay=setInterval(function(){
			//alert(_index);
			 if(_index<li_number){
			   if(_index==li_number-1){
				 _index=-1;}  //最后一页的时候返回第一页
			   $("ul.on_list li").eq(_index).addClass("info_on").siblings().removeClass("info_on");
			   $("a.Imglist").eq(_index).fadeIn().siblings("a").fadeOut();
			   _index++;
			}else{
				_index=0;
				}
			if(_index==0){
				$("#prev").show();
				$("#next").hide();
				}
			if(_index==1){
				$("#prev").hide();
				$("#next").show();
				}	
		 },4000);
	  };
  autoPlay();
	  
   /*  返回顶部的js */
	var $bottomTools = $('.bottom_tools');
	$(window).scroll(function () {
		var scrollHeight = $(document).height();  //浏览器当前窗口文档的高度
		var scrollTop = $(window).scrollTop();   //浏览器当前窗口可视区域高度
		var $windowHeight = $(window).innerHeight();
		//scrollTop > 100 ? $(".header_fixed").fadeIn(200).css("display","block") : $(".header_fixed").fadeOut(200);
		//scrollTop> 200 ? $(".bottom_tools").fadeIn(200).css("display","block"): $(".bottom_tools").fadeOut(200);	
		//$bottomTools.css("bottom", scrollHeight - scrollTop > $windowHeight ? 40 : $windowHeight + scrollTop + 40 - scrollHeight);
	});
	
	$('#scrollUp').click(function (e) {
		e.preventDefault();  //阻止浏览器默认事件
		$('html,body').animate({ scrollTop:0},400);
	}); 
	$("#scrollUp").hover(function(){
		$(this).children("img").attr("src","images/return-top-h.png");
	},function(){
		$(this).children("img").attr("src","images/return-top-a.png");
	});
	/* 第一屏头部的鼠标移入效果 */
	$(".wx_app_download").hover(function(){
		$(".head_wx_app").show();
		$(".btn_app_download").attr("src","images/down-app-h.png")
     },function(){
		$(".head_wx_app").hide(); 
		$(".btn_app_download").attr("src","images/down-app-a.png") 
		 });
   /*  第二屏之后的鼠标移入下载app二维码 */
    $(".change_con").mouseover(function(){
		$(".change_con").attr("src","images/wx_app_download_h.png");
	    $("#app_download").css("display","block");
	}); 
	$(".change_con").mouseout(function(){
	    $(".change_con").attr("src","images/wx_app_download_a.png");
		$("#app_download").css("display","none");
    }); 
	
})
  // 判断手机和pc端访问路径的js代码       
var commonURL = 'http://www.laicunba.com';
function mobile_device_detect(url){
  var thisOS=navigator.platform;
  var os=new Array("iPhone","iPod","iPad","android","Nokia","SymbianOS","Symbian","Windows Phone","Phone","Linux armv71","MAUI","UNTRUSTED/1.0","Windows CE","BlackBerry","IEMobile");
  for(var i=0;i<os.length;i++){
    if(thisOS.match(os[i])){   
         window.location=url;
         }
  }
  if(navigator.platform.indexOf('iPad') != -1){
      window.location=url;
  }
  var check = navigator.appVersion;
      if( check.match(/linux/i) ){
          if(check.match(/mobile/i) || check.match(/X11/i)) {
         window.location=url;
        }  
      }
  Array.prototype.in_array = function(e){
    for(i=0;i<this.length;i++){
      if(this[i] == e)
      return true;
      }
      return false;
    }
  } 
mobile_device_detect("http://www.laicunba.com/phone_index.html");

/* 新手引导页面的js */
window.onload=function(){
   var defaultbg =['images/download_a.png','images/reg_a.png','images/select_a.png','images/bind_bank_a.png','images/finish_pay_a.png'];
   var active=['images/download_h.png','images/reg_h.png','images/select_h.png','images/bind_bank_h.png','images/finish_pay_h.png'];
   var bottomactive=$('.animatediv')
   var obj=$('.bj');
	  for(var i=0;i<obj.length;i++){
		obj[i].index=i; 
	function cansle(){
		for(var j=0;j<obj.length;j++){
				obj[j].style.backgroundImage="url("+defaultbg[j]+")";
				bottomactive[j].style.display="none"
				}
		}		 
		obj[i].onmouseover=function(){
			cansle();
			this.style.backgroundImage="url("+active[this.index]+")";
		    bottomactive[this.index].style.display="block";
			bottomactive[this.index].className="dragleft"
			}  
		  }
     }
	/*===== 首页竖屏导航样式 ====
    var _index2=0;
    $("ul.page_drap li").click(function(){
	  _index2=$(this).index();
	  var Top_section=0;
	  var section_height=$(".section").eq(_index2).height();
	  //console.log(section_height);
	  $(this).addClass("page_active").siblings().removeClass("page_active");
	  var Top=new Array("0px","760px","1480px","2220px","2980px","3740px");
	  // console.log(_index2);
	  //console.log(Top[_index2]);  
	   $('html,body').animate({scrollTop:Top[_index2]},0) ;
	});	   
    $(window).scroll(function(){
	   var scrollHeight = $(document).height();  //浏览器当前窗口文档的高度
		var Range_top = $(window).scrollTop();   //浏览器当前窗口可视区域高度
		console.log(0<Range_top<20);
		console.log(Range_top);
		//console.log(Top[0]);
	   if(0<Range_top&&Range_top<759){
	    	$("ul.page_drap li").eq(0).addClass("page_active").siblings().removeClass("page_active"); 
		  };
       if(760<=Range_top&&Range_top<1479){
	    	$("ul.page_drap li").eq(1).addClass("page_active").siblings().removeClass("page_active"); 
		  };
       if(1480<=Range_top&&Range_top<2219){
	    	$("ul.page_drap li").eq(2).addClass("page_active").siblings().removeClass("page_active"); 
		  };
       if(2220<=Range_top&&Range_top<2979){
	    	$("ul.page_drap li").eq(3).addClass("page_active").siblings().removeClass("page_active"); 
		  };
       if(2980<=Range_top&&Range_top<3739){
	    	$("ul.page_drap li").eq(4).addClass("page_active").siblings().removeClass("page_active"); 
		  };
       if(3740<=Range_top){
		    $("ul.page_drap li").eq(5).addClass("page_active").siblings().removeClass("page_active"); 
	      };  
	});   =*/ 
	$(window).scrollTop(0); 
	 
	 
	 
	 
	 
	 
	 
function swipe(){
    var $poster=$("#poster li");
    var distance=startX=moveX=0;
    var w,h;//屏幕高度
    var $thisObj;
    var left;
    var touchDate,startTime=endTime=interval=0;
    var direction;
    
    function content(){
    	$("#container").get(0).addEventListener("touchstart",mousedownBody,false);
    	$("#container").get(0).addEventListener("touchmove",mousemoveBody,false);
    	$("#container").get(0).addEventListener("touchend",mouseup,false);
    }
    
    function mousedownBody(){
        startX=event.touches[0].pageX;
        left=$("body").scrollLeft();
        $thisObj=$(this);
    }
    
    function mousemoveBody(event){
        moveX=event.touches[0].pageX;
        var onOff = true;
        if(onOff){
            touchDate = new Date();
            startTime = touchDate.getTime();
            onOff = !onOff;
        }
        if(startX < moveX && left==0){
            event.preventDefault();
            $thisObj=$poster.last();
            $thisObj.css({"left":-w+Math.abs(startX-moveX)});
            distance=startX-moveX;
        } else {
            document.removeEventListener('touchmove',frozenWindow,false);
        }
    }
    
    function poster(){
        w=parseInt($(window).width());
        h=parseInt($(window).height());
        left=$("body").scrollLeft();
        $poster.each(function(n){
            var $thisPoster=$(this);
            $thisPoster.css({"width":w,"height":h,"zIndex":$poster.width-n+1000});
            $thisPoster.get(0).addEventListener("touchstart",mousedown,false);
            $thisPoster.get(0).addEventListener("touchmove",mousemove,false);
            $thisPoster.get(0).addEventListener("touchend",mouseup,false);
            //解决转屏定位问题
            if(parseInt($thisPoster.css("left"))<0){
                $thisPoster.css({"left":-w});
            }
        })
    }
    
    function mousedown(event){
        event.preventDefault();
        startX=event.touches[0].pageX;
        $thisObj=$(this);
    }
    
    function mousemove(event){
        event.preventDefault();
        moveX=event.touches[0].pageX;
        var onOff = true;
        if(onOff){
            touchDate = new Date();
            startTime = touchDate.getTime();
            onOff = !onOff;
        }
        //拖动
        if($thisObj.index() == 0 && startX > moveX){
            $thisObj=$(this);
            $thisObj.css({"left":-Math.abs(startX-moveX)});
        }else{
            if(startX > moveX){
                $thisObj=$(this);
                $thisObj.css({"left":-(startX-moveX)});
            }else{
                $thisObj=$(this).prev();
                $thisObj.css({"left":-w+Math.abs(startX-moveX)});
            }
        }
        
        distance=startX-moveX;
    }
    
    function mouseup(){
        touchDate = new Date();
        endTime = touchDate.getTime();
        interval = endTime-startTime;
        inertia($thisObj,interval,distance,h);
    }
    
    poster();
    $(window).resize(function(){
        poster();
    })
//    content();
}
    
//惯性滑动
function inertia(_thisObj,_interval,_distance,_w){
    var speed=Math.abs(_distance/_interval);

    if(_distance<0){            //向右滑动
        if(speed>=5){           //快速滑动
            swipeRight(_thisObj,_w);
        }else{                  //慢速滑动
            swipeSlow(_thisObj,_w);
        }
    }else{                      //向左滑动
        if(speed>=5){           //快速滑动
            swipeLeft(_thisObj,_w);
        }else{                  //慢速滑动
            swipeSlow(_thisObj,_w);
        }
    }
}
//慢速滑动
function swipeSlow(_thisObj,_w){
    if(Math.abs(parseInt(_thisObj.css("left"))) >= _w/2){
        swipeLeft(_thisObj,_w);
    }else{
        swipeRight(_thisObj,_w);
    }
}
//向左滑动
function swipeLeft(_thisObj,_w){
    _thisObj.stop().animate({"left":-_w});
    //向左拉取最后一张图时，刷新页面
    if(_thisObj.attr("rel") == 2) {
        window.location.reload();
    }
}
//向右滑动
function swipeRight(_thisObj,_w){
    _thisObj.stop().animate({"left":0});
	//向右拉取最后一张图时，显示箭头
    if(_thisObj.attr("rel") == 2) {
//    	$(".arrow_con").show();
    }
}
function frozenWindow(e) {
    e.preventDefault();
}
function deleteAd() {
    $("div.ad").remove();
}
function changeIframe(w) {
    $("iframe").attr('left',w);
}
//document.addEventListener('touchmove',frozenWindow,false);
$(document).ready(function(){
    setTimeout(function() {
    	swipe();
    }, 400);
});


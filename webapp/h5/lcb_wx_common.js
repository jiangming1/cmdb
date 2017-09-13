var windowdialogtime;
//显示对话框
function alertT(code, title, txt, $callback) {
	clearTimeout(windowdialogtime);
	$("#windowbuttons").hide();
	var code_html = "", html = ""; 
	//#windowtext
	jQuery("#windowcenter").slideToggle(100);
	jQuery("#windowpopbg").show();
	//<i class="ts-ico dui"></i><i class="ts-ico cuo"></i><i class="ts-ico jg"></i><i class="ts-ico wen"></i>
	if(code==1){	//正常
		code_html = "<i class='ts-ico dui'><em></em></i>"
	}else if(code==2 || code==0){	//错误
		code_html = "<i class='ts-ico cuo'><em></em></i>"
	}else if(code==3){	//警告
		code_html = " <i class='ts-ico jg'><em></em></i>"
	}else if(code==4){	//询问
		code_html = " <i class='ts-ico wen'><em></em></i>"
	}
	
	jQuery("#windowtitle").html(title);
	html = code_html + txt;
	jQuery("#windowtext").html(html);
	// jQuery("#windowcenter").hide("slow");
	if (isFunction($callback)) {
		setTimeout($callback, 3000);
	} else {
		windowdialogtime = setTimeout('jQuery("#windowcenter").slideUp(1000); jQuery("#windowpopbg").hide(100);', 2500);
	}
}

//显示对话框
function confirmT(code, title,txt, $callback) {
	if (isFunction($callback)) {
		clearTimeout(windowdialogtime);
		var code_html = "", html = ""; 
		//#windowtext
		jQuery("#windowcenter").slideToggle(100);
		jQuery("#windowpopbg").show();
		if(code==1){	//正常
			code_html = "<i class='ts-ico dui'><em></em></i>"
		}else if(code==2 || code==0){	//错误
			code_html = "<i class='ts-ico cuo'><em></em></i>"
		}else if(code==3){	//警告
			code_html = " <i class='ts-ico jg'><em></em></i>"
		}else if(code==4){	//询问
			code_html = " <i class='ts-ico wen'><em></em></i>"
		}
		
		jQuery("#windowtitle").html(title);
		html = code_html + txt;
		jQuery("#windowtext").html(html);
	
		$("#windowbuttons").show();
		//点击OK
		jQuery('.dialogok').click(function(){
			$("#windowcenter").hide();
			$("#windowpopbg").hide();
			setTimeout($callback(),10);
		});
		
		//关闭对话框
		jQuery('.dialogcancel').click(function(){
			$("#windowcenter").fadeOut(500);
			$("#windowpopbg").fadeOut(500);
		});
	} 
}
//窗口关闭
jQuery('body').on('tap', '#windowclosebutton', function() {
	jQuery("#windowcenter").slideUp(500);
});

//窗口关闭
jQuery('body').on('tap', '#alertclose', function() {
	jQuery("#windowcenter").slideUp(500);
});

function isFunction(fn) {
	return !!fn && !fn.nodeName && fn.constructor != String
			&& fn.constructor != RegExp && fn.constructor != Array
			&& /function/i.test(fn + "");
}
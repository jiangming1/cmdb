<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="../js/jquery-1.11.0.js"></script>
<title>广告弹出框数据订正</title>
<style>
*{
	margin:0;
	padding:0;
	font-family: "微软雅黑"
}
table tr td{
    border: 1px solid #CCC;
    line-height: 30px;
}
table tr td input{
    text-align: center;
}
.t_head td{
    text-align: center;
}
.t_con td input{
    width: 100%;
    line-height: 30px;
}
</style>
</head>

<body>
    <h2 style="margin: 10px 0;">广告弹出框数据订正列表</h2>
	<table style="width: 100%; height: 100%;">
		   <thead class="t_head">
		       <tr>
		          <td>id</td>
		          <td>
		              <table style="width: 100%;">
		                  <tr>
		                      <td colspan="4">val</td>
		                  </tr>
		                  <tr>
		                      <td style="width: 25%;">id</td>
		                      <td style="width: 25%;">pic</td>
		                      <td style="width: 25%;">href</td>
		                      <td style="width: 25%;">target</td>
		                  </tr>
		              </table>
		          </td>
		          <td>visible</td>
		          <td>gmt_create</td>
		          <td>gmt_write</td>
		       </tr>
		   </thead>
		   <tbody class="t_con">
		       <tr>
		          <td class="adid"><input type="text"></td>
		          <td class="val_param">
		              <table style="width: 100%;">
		                  <tr>
		                      <td class="valid"><input type="text"></td>
		                      <td class="valpic"><input type="text"></td>
		                      <td class="valhref"><input type="text"></td>
		                      <td class="valtarget"><input type="text"></td>
		                  </tr>
		              </table>
		          </td>
		          <td class="visible"><input type="text"></td>
		          <td class="gmt_create"><input type="text"></td>
		          <td class="gmt_write"><input type="text"></td>
		       </tr>
		   </tbody>
	</table>
	<div style="padding: 5px;margin: 5px 0;">
	     <button class="btn_preview">预览</button>
	</div>
	<textarea class="sqltxt" style="width: 100%;height: 100px;"></textarea>
	<script>
	    $(function(){
	       //点击预览
	    	$(".btn_preview").click(function(){
	    		var valJson="";  
	            var id = "";      //广告的id
	            var pic = "";     //图像存储地址
	            var href = "";    //链接地址 
	            var target = "";  //以哪种形式展示
	            var dataAd = "";  // 广告显示内容
	            //处理的是conditions的是三个条件
	    		$(".val_param table tr").each(function(index,demEle){
	    			id = "";  
		            pic = ""; 
		            href = "";
		            target = "";
	    			$(demEle).find("input").each(function(index,data){  
	    				 if(index == 0){  
	                        // actionId = $(data).val();  
	                         if($(data).val() != "" && $(data).val() != null && isNumber($(data).val())){//如果没有输入的情况或者不为数字    
	                        	    id = $(data).val();  
	                        	    localStorage.setItem("valid", id);                        	
			                    }else{           	  
			                        alert("val第一个关键字id：广告的id为数字且不能为空");
			                        return false;
			                    }; 
	                     }else if(index == 1){
		    				if($(data).val() != "" && $(data).val() != null){ //如果没有输入的情况
		    					    pic = $(data).val();  
		    					    localStorage.setItem("valpic", pic);
		                    }else{   
		                    	    alert("val第二个关键字pic：广告的pic图片地址不能为空");
		                    	    return false;
		                    };
	                     }else if(index == 2){
			    				if($(data).val() != "" && $(data).val() != null){  
			    				    href = $(data).val();  
			    				    localStorage.setItem("valhref", href);
			                    }else{  
			                        alert("val第三个关键字href：广告的href图片地址不能为空");
		                    	    return false; 
			                    }; 
		                 }else if(index == 3){
			    				if($(data).val() != "" && $(data).val() != null){  
			    					target = $(data).val();  
			    					localStorage.setItem("valtarget", target);
			                    }else{  
			                    	alert("val第四个关键字target：广告的target图片展现形式不能为空");
		                    	    return false; 
			                    }; 
		                 };
// 		                 if(!period.indexOf(",")){  //用于返回，首次出现的位置取后面的值 
// 		                	 period = period.substring(1);  
// 		                 };
// 		                 if(!target_type.indexOf(",")){  
// 		                	 target_type = target_type.substring(1);  
// 		                 };  
	    			}); //循环获得input值结束
	    			valJson += "{"+"\"id\":\""+id+"\","+"\"pic\":\""+pic+"\","+"\"href\":\""+href+"\","+"\"target\":\""+target+"\"}";
	    		});	  
// 	    		if (valJson.lastIndexOf(",")) {  
// 	    			valJson = valJson.substring(0,valJson.length -1);  
// 	            };	            
	            console.log(valJson);
	            
	            //整理广告弹出框填写的所有内容 
	            var adId = "";
	            var val = "";
	           	var visible = "";
	           	var gmt_create = "";
	           	var gmt_write = "";
	            $(".t_con>tr>td").each(function(index,data){     
	            	if(index == 0){ //广告的id
	            		adId = $(data).find("input").val();
	            		if(adId !="" && adId != null){
	            			adId = $(data).find("input").val();
	            			localStorage.setItem("adid", adId);
	            		}else{
	            			alert("关键字id：不能为空");
	            			return false;
	            		};
	            	}else if(index == 1){ //广告弹出框的val 
	            		val = valJson;	 	            		
	            	}else if(index == 2){ //广告弹出框的visible
	            		visible = $(data).find("input").val();
	            		if(visible !="" && visible != null){
	            			visible = $(data).find("input").val();
	            			localStorage.setItem("visible",visible);
	            	    }else{
	            	    	alert("关键字used_quantity：广告弹出框的visible不能为空");
	            	    	return false;
	            	    };
	            	}else if(index == 3){ //广告弹出框gmt_create 
	            		gmt_create = $(data).find("input").val();
	            		if(gmt_create !="" && gmt_create != null){
	            			gmt_create = $(data).find("input").val() + ",";
	            	    }else{
	            	    	alert("关键字gmt_create：广告弹出框gmt_create不能为空");
	            	    	return false;
	            	    };
	            	}else if(index == 4){ //广告弹出框gmt_write 
	            		gmt_write = $(data).find("input").val();
	            	    if(gmt_write !="" && gmt_write != null){
	            	    	gmt_write = $(data).find("input").val();
	            	    }else{
	            	    	alert("关键字gmt_write：广告弹出框gmt_write不能为空");
	            	    	return false;
	            	    };  
	            	};
	            	
	            });
	           	dataAd +="(" +"'"+ adId + "'," + "'"+ val+"'," +"'" + visible + "'," + gmt_create+ gmt_write+")";  
	        //    console.log(datarate);
	            $(".sqltxt").text('INSERT INTO lcb_registry("id",val,visible,gmt_create,gmt_write) VALUES ' + dataAd);
	        // 判断内容是否为数字
	            function isNumber(n){
	                return !isNaN(parseFloat(n)) && isFinite(n);
	            };
	        });	  
	       //广告弹出框保存在本地的数据
	       
	        var val_adid = localStorage.getItem("adid");
	    	$(".adid input").val(val_adid);
	    	
	        var val_valid = localStorage.getItem("valid");
	    	$(".valid input").val(val_valid);
	    	
	    	var val_valpic = localStorage.getItem("valpic");
	    	$(".valpic input").val(val_valpic);
	    	
	    	var val_valhref = localStorage.getItem("valhref");
	    	$(".valhref input").val(val_valhref);
	    	
	    	var val_valtarget = localStorage.getItem("valtarget");
	    	$(".valtarget input").val(val_valtarget);
	    	
	    	var val_visible = localStorage.getItem("visible");
	    	$(".visible input").val(val_visible);
	    	
	    	var val_gmt_create = localStorage.getItem("gmt_create");
	    	$(".gmt_create input").val(val_gmt_create);
	    	
	    	var val_gmt_write = localStorage.getItem("gmt_write");
	    	$(".gmt_write input").val(val_gmt_write);
	    	
	    })
	</script>
</body>
</html>
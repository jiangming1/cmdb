<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>微信端banner数据订正</title>
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
    <h2 style="margin: 10px 0;">微信端banner数据订正列表</h2>
	<table style="width: 100%; height: 100%;">
		   <thead class="t_head">
		       <tr>
		          <td>action</td>
		          <td>pic</td>
		          <td>href</td>
		       </tr>
		   </thead>
		   <tbody class="t_con">
		       <tr>
		           <td class="first"><input type="text"></td>
		           <td><input type="text"></td>
		           <td><input type="text"></td>
		       </tr>
		       <tr>
		           <td><input type="text"></td>
		           <td><input type="text"></td>
		           <td><input type="text"></td>
		       </tr>
		       <tr>
		           <td><input type="text"></td>
		           <td><input type="text"></td>
		           <td><input type="text"></td>
		       </tr>
		       <tr>
		           <td><input type="text"></td>
		           <td><input type="text"></td>
		           <td><input type="text"></td>
		       </tr>
		       <tr>
		           <td><input type="text"></td>
		           <td><input type="text"></td>
		           <td><input type="text"></td>
		       </tr>
		   </tbody>
	</table>
	<div style="padding: 5px;margin: 5px 0;">
	     <button class="btn_add">添加</button>
	     <button class="btn_delete">删除</button>
	     <button class="btn_preview">预览</button>
	</div>
	<textarea class="sqltxt" style="width: 100%;height: 150px;"></textarea>
	
	<script type="text/javascript" src="../js/jquery-1.11.0.js"></script>
	<script>
	    $(function(){
	    	var addTr = "<tr><td><input type='text'></td><td><input type='text'></td><td><input type='text'></td></tr>";
	    	$(".btn_add").click(function(){
	    		$(".t_con").append(addTr);
	    	}); 
	    	$(".btn_delete").click(function(){
	    		if(confirm("确定要删除一个吗?")){
	    			$(".t_con tr:last").remove();
	    		};	    		
	    	});
	    	$(".btn_preview").click(function(){
	    		var dataJson="[";  
	            var actionId = "";  
	            var picId = ""; 
	            var hrefId = "";
	    		$(".t_con tr").each(function(index,demEle){
	    		    actionId = "";  
		            picId = ""; 
		            hrefId = "";
		            var iRow = index;
		            //alert(i);
	    			$(demEle).find("input").each(function(index,data){  
	    				 if(index == 0){  
	                        // actionId = $(data).val();  
	                         if($(data).val() != "" && $(data).val() != null){//如果没有输入的情况下传的值是0  
			                     actionId = $(data).val(); 
	                             localStorage.setItem("action" + iRow + index, actionId);
			                 }else{  
			                     //actionId = 0;  
			                     alert("关键字第"+(iRow+1)+"行 action：不能为空");
			                     return false;
			                 }; 
	                     }else if(index == 1){
		    				 if($(data).val() != "" && $(data).val() != null){//如果没有输入的情况下传的值是0  
		                         picId = $(data).val();  
		                         localStorage.setItem("pic" + iRow + index, picId);
		                     }else{  
		                    	 //picId = 0;  
		                    	 alert("关键字第"+(iRow+1)+"行 pic：不能为空");
			                     return false;
		                     } ;
	                     }else if(index == 2){
			    			 if($(data).val() != "" && $(data).val() != null){//如果没有输入的情况下传的值是0  
			    				 hrefId =$(data).val(); 
			    				 localStorage.setItem("href" + iRow + index, hrefId);
			                 }else{  
			                   	//hrefId = 0;  
			                   alert("关键字第"+(iRow+1)+"行 href：不能为空");
			                   return false;
			                 }; 
		                 }; 
	    			}); //循环获得input值结束
	    			dataJson += "{"+"\"action\":\""+actionId+"\","+"\"pic\":\""+picId+"\","+"\"href\":\""+hrefId+"\"},";
	    		});	  
	    		if (dataJson.lastIndexOf(",")) {  
	                dataJson = dataJson.substring(0,dataJson.length -1);  
	                dataJson += "]";  
	            };
	            console.log(dataJson);
// 	            var dataHead = update lcb_registry set val=;
// 	            var dataFoot = where id='sys.h5.home.banner';
	            $(".sqltxt").text( "update lcb_registry set val=" +"'"+dataJson+"'"+ " where id='sys.h5.home.banner';");
	    	});	   
	    	
	    	//将存储在本地的数据保存在input中 
	    	$(".t_con tr").each(function(index,demEle){
	    		var iRow = index;
	    		$(demEle).find("input").each(function(index,data){
	    			if(index == 0){
	    				var val_action = localStorage.getItem("action" + iRow + index);
	    				$(data).val(val_action);
	    			}else if(index == 1){
	    				var val_pic = localStorage.getItem("pic" + iRow + index);
	    				$(data).val(val_pic);
	    			}else if(index == 2){
	    				var val_href = localStorage.getItem("href" + iRow + index);
	    				$(data).val(val_href);
	    			};	    			
	    		});
	    	});
	    })
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="../js/jquery-1.11.0.js"></script>
<link rel="stylesheet" href="remind_lamp.css" media="screen" type="text/css" />

<title>加息券数据订正</title>
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
    <h2 style="margin: 10px 0;">加息券数据订正列表</h2>
	<table style="width: 100%; height: 100%;">
		   <thead class="t_head">
		       <tr>
		          <td>id</td>
		          <td>rate</td>
		          <td>used_quantity</td>
		          <td>total_quantity</td>
		          <td>
		              <table style="width: 100%;">
		                    <tr><td colspan="3">conditions</td></tr>
		                    <tr>
		                       <td style="width: 33.3%;">buy_amount</td>
		                       <td style="width: 33.3%;">period</td>
		                       <td style="width: 33.3%;">target_type</td>
		                   </tr>
		              </table>
		          </td>
		          <td>valid_day</td>
		          <td>name</td>
		          <td>write_uid</td>
		          <td>gmt_create</td>
		          <td>gmt_write</td>
		       </tr>
		   </thead>
		   <tbody class="t_con">
		       <tr>
		          <td class="rateid"><input type="text"></td>
		          <td class="rate"><input type="text"></td>
		          <td class="used_quantity"><input type="text"></td>
		          <td class="total_quantity"><input type="text"></td>
		          <td class="condition">
		              <table>
		                   <tr>
		                       <td class="buy_amount"><input type="text"></td>
		                       <td class="period"><input type="text"></td>
		                       <td class="target_type"><input type="text"></td>
		                   </tr>
		              </table> 
		          </td>
		          <td class="valid_day"><input type="text"></td>
		          <td class="ratename"><input type="text"></td>
		          <td class="write_uid"><input type="text"></td>
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
	    		var conditionsJson="[";  
	            var buy_amount = "";  //最低购买金额
	            var period = "";      //加息券有效期
	            var target_type = ""; //加息券类型 
	            var datarate = "";   //加息券填写内容
	            //处理的是conditions的是三个条件
	    		$(".condition table tr").each(function(index,demEle){
	    			buy_amount = "";  
		            period = ""; 
		            target_type = "";
	    			$(demEle).find("input").each(function(index,data){  
	    				 if(index == 0){  
	                        // actionId = $(data).val();  
	                         if($(data).val() != "" && $(data).val() != null && isNumber($(data).val())){//如果没有输入的情况或者不为数字    
	                        	    buy_amount = $(data).val();  
	                        	    localStorage.setItem("buy_amount", buy_amount); 	                    
			                    }else{           	  
			                    	alert("conditions第一个关键字buy_amount：最低购买金额应为数字金额且不能为空");
			                    	return false;
			                    }; 
	                     }else if(index == 1){
		    				if($(data).val() != "" && $(data).val() != null && isNumber($(data).val())){ //如果没有输入的情况或者不为数字  
		    					    period = $(data).val();  
		    					    localStorage.setItem("period", period);
		                    }else{   
		                    	    alert("conditions第二个关键字period：使用有效期应为数字天数且不能为空");
		                    	    return false;
		                    };
	                     }else if(index == 2){
			    				if($(data).val() != "" && $(data).val() != null){  
			    					target_type = $(data).val();  
			    					localStorage.setItem("target_type", target_type);
			                    }else{  
			                    	alert("conditions第三个关键字target_type：使用方式为定期且不能为空");
		                    	    return false; 
			                    }; 
		                 };  
	    			}); //循环获得input值结束
	    			conditionsJson += "{"+"\"buy_amount\":"+buy_amount+","+"\"period\":"+period+","+"\"target_type\":\""+target_type+"\"},";
	    		});	  
	    		if (conditionsJson.lastIndexOf(",")) {  
	    			conditionsJson = conditionsJson.substring(0,conditionsJson.length -1);  
	    			conditionsJson += "]";  
	            };	            
	         //   console.log(conditionsJson);
	            
	            //整理加息券填写的所有内容 
	            var rateId = "";
	            var rate = "";
	           	var used_quantity = "";
	           	var total_quantity = "";
	           	var conditions = "";
	           	var valid_day = "";
	           	var rateName = "";
	           	var write_uid = "";
	           	var gmt_create = "";
	           	var gmt_write = "";
	            $(".t_con>tr>td").each(function(index,data){     
	            	if(index == 0){
	            		rateId = $(data).find("input").val();
	            		if(rateId !="" && rateId != null){
	            			rateId = $(data).find("input").val();
	            			localStorage.setItem("rateid", rateId);
	            		}else{
	            			alert("关键字id：不能为空");
	            			return false;
	            		};
	            	}else if(index == 1){ //加息券利率 
	            		rate = $(data).find("input").val();
	            	    if(rate !="" && rate != null && isNumber(rate)){
	            	    	rate = $(data).find("input").val();
	            	    	localStorage.setItem("rate", rate);
	            	    }else{
	            	    	alert("关键字rate：加息券利息只能为数字");
	            	    	return false;
	            	    };
	            	}else if(index == 2){ //已使用数量
	            		used_quantity = $(data).find("input").val();
	            		if(used_quantity !="" && used_quantity != null && isNumber(used_quantity)){
	            			used_quantity = $(data).find("input").val();
	            			localStorage.setItem("used_quantity", used_quantity);
	            	    }else{
	            	    	alert("关键字used_quantity：加息券已使用数量只能为数字且不能为空");
	            	    	return false;
	            	    };
	            	}else if(index == 3){ //加息券总数量 
	            		total_quantity = $(data).find("input").val();
	            		if(total_quantity !="" && used_quantity != null && isNumber(total_quantity)){
	            			total_quantity = $(data).find("input").val();
	            			localStorage.setItem("total_quantity", total_quantity);
	            	    }else{
	            	    	alert("关键字total_quantity：加息券总数量只能为数字且不能为空");
	            	    	return false;
	            	    };
	            	}else if(index == 4){ //加息券使用条件 
	            		conditions = conditionsJson;	   
	            	}else if(index == 5){ //加息券有效期 
	            		valid_day = $(data).find("input").val();
	            		if(valid_day !="" && valid_day != null && isNumber(valid_day)){
	            			valid_day = $(data).find("input").val();
	            			localStorage.setItem("valid_day", valid_day);
	            	    }else{
	            	    	alert("关键字valid_day：加息券有效期只能为数字且不能为空");
	            	    	return false;
	            	    };
	            	}else if(index == 6){  //加息券名称 
	            		rateName = $(data).find("input").val();
	            		if(rateName !="" && valid_day != null){
	            			rateName = $(data).find("input").val();
	            			localStorage.setItem("rateName", rateName);
	            	    }else{
	            	    	alert("关键字rateName：加息券名称不能为空");
	            	    	return false;
	            	    };
	            	}else if(index == 7){
	            		write_uid = $(data).find("input").val();
	            		if(write_uid !="" && valid_day != null){
	            			write_uid = $(data).find("input").val();
	            			localStorage.setItem("write_uid", write_uid);
	            	    }else{
	            	    	alert("关键字write_uid：加息券uid不能为空");
	            	    	return false;
	            	    };
	            	}else if(index == 8){ //创建时间
	            		gmt_create = $(data).find("input").val();
	            		if(gmt_create !="" && valid_day != null){
	            			gmt_create = $(data).find("input").val();
	            			localStorage.setItem("gmt_create", gmt_create);
	            	    }else{
	            	    	alert("关键字gmt_create：加息券时间不能为空");
	            	    	return false;
	            	    };
	            	}else if(index == 9){ //写入时间 
	            		gmt_write = $(data).find("input").val();
	            		if(gmt_write !="" && valid_day != null){
	            			gmt_write = $(data).find("input").val();
	            			localStorage.setItem("gmt_write", gmt_write);
	            	    }else{
	            	    	alert("关键字gmt_write：加息券时间不能为空");
	            	    	return false;
	            	    };
	            	}
	            	
	            });
	           	datarate +="(" +"'"+ rateId + "'," + rate+ ","+ used_quantity+","+ total_quantity+ ",'"+ conditions+"',"+ valid_day+ ",'"+rateName+"',"+"'"+write_uid+"'," + gmt_create+","+ gmt_write+")";  
	        //    console.log(datarate);
	            $(".sqltxt").text('INSERT INTO lcb_rate_incr_coupon_def("id",rate,used_quantity,total_quantity,conditions,valid_day,"name",write_uid,gmt_create,gmt_write) VALUES ' + datarate);
	        // 判断内容是否为数字
	            function isNumber(n){
	                return !isNaN(parseFloat(n)) && isFinite(n);
	                };
	    	    });	  
	       // 以下为数据本地存储
	    	var val_buy_amount = localStorage.getItem("buy_amount");
	    	$(".buy_amount input").val(val_buy_amount);
	    	
	    	var val_period = localStorage.getItem("period");
	    	$(".period input").val(val_period);
	    	
	    	var val_target_type = localStorage.getItem("target_type");
	    	$(".target_type input").val(val_target_type);
	    	
	    	var val_rateid = localStorage.getItem("rateid");
	    	$(".rateid input").val(val_rateid);
	    	
	    	var val_rate = localStorage.getItem("rate");
	    	$(".rate input").val(val_rate);
	    	
	    	var val_used_quantity = localStorage.getItem("used_quantity");
	    	$(".used_quantity input").val(val_used_quantity);
	    	
	    	var val_total_quantity = localStorage.getItem("total_quantity");
	    	$(".total_quantity input").val(val_total_quantity);
	    	
	    	var val_valid_day = localStorage.getItem("valid_day");
	    	$(".valid_day input").val(val_valid_day);
	    	
	    	var val_rateName = localStorage.getItem("rateName");
	    	$(".ratename input").val(val_rateName);
	    	
	    	var val_write_uid = localStorage.getItem("write_uid");
	    	$(".write_uid input").val(val_write_uid);
	    	
	    	var val_gmt_create = localStorage.getItem("gmt_create");
	    	$(".gmt_create input").val(val_gmt_create);
	    	
	    	var val_gmt_write = localStorage.getItem("gmt_write");
	    	$(".gmt_write input").val(val_gmt_write);
	    })
	</script>
</body>
</html>
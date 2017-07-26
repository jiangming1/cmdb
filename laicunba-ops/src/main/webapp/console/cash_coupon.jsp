<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="../js/jquery-1.11.0.js"></script>
<link rel="stylesheet" href="remind_lamp.css" media="screen" type="text/css" />

<title>现金券数据订正</title>
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
    <h2 style="margin: 10px 0;">现金券数据订正列表</h2>
	<table style="width: 100%; height: 100%;">
		   <thead class="t_head">
		       <tr>
		          <td>id</td>
		          <td>amount</td>
		          <td>used_quantity</td>
		          <td>total_quantity</td>
		          <td>
		              <table style="width: 100%;">
		                   <tr><td colspan="3">conditions</td></tr>
		                   <tr>
		                       <td style="width: 33%">buy_amount</td>
		                       <td style="width: 33%">period</td>
		                       <td style="width: 34%">target_type</td>
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
		          <td class="cashid"><input type="text"></td>
		          <td class="amount"><input type="text"></td>
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
		          <td class="cashname"><input type="text"></td>
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
	            var period = "";      //现金券有效期
	            var target_type = ""; //现金券类型 
	            var datarate = "";   //现金券填写内容
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
	                                localStorage.setItem("cash_buy_amount", buy_amount);
			                    }else{           	  
			                    	alert("conditions第一个关键字buy_amount：最低购买金额应为数字金额且不能为空");
			                    	return false;
			                    }; 
	                     }else if(index == 1){
		    				if($(data).val() != "" && $(data).val() != null && isNumber($(data).val())){ //如果没有输入的情况或者不为数字  
		    					    period = $(data).val();  
		    				        localStorage.setItem("cash_period", period);
		                    }else{   
		                    	    alert("conditions第二个关键字period：使用有效期应为数字天数且不能为空");
		                    	    return false;
		                    };
	                     }else if(index == 2){
			    				if($(data).val() != "" && $(data).val() != null){  
			    					target_type =  $(data).val();  
			                    }else{  
			                    	alert("conditions第三个关键字target_type：使用方式为定期且不能为空");
		                    	    return false; 
			                    }; 
		                 };
		                 if(!period.indexOf(",")){  
		                	 period = period.substring(1);  
		                 };
		                 if(!target_type.indexOf(",")){  
		                	 target_type = target_type.substring(1);  
		                 };  
	    			}); //循环获得input值结束
	    			conditionsJson += "{"+"\"buy_amount\":"+buy_amount+","+"\"period\":"+period+","+"\"target_type\":\""+target_type+"\"},";
	    		});	  
	    		if (conditionsJson.lastIndexOf(",")) {  
	    			conditionsJson = conditionsJson.substring(0,conditionsJson.length -1);  
	    			conditionsJson += "]";  
	            };	            
	         //   console.log(conditionsJson);
	            
	            //整理现金券填写的所有内容 
	            var rateId = "";
	            var amount = "";
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
	            		cashId = $(data).find("input").val();
	            		if(cashId !="" && rateId != null){
	            		    cashId = $(data).find("input").val();
	            		    localStorage.setItem("cashId",cashId);
	            		}else{
	            			alert("关键字id：不能为空");
	            			return false;
	            		};
	            	}else if(index == 1){ //现金券利率 
	            		amount = $(data).find("input").val();
	            	    if(amount !="" && amount != null && isNumber(amount)){
	            	    	amount = $(data).find("input").val();
	            	    	localStorage.setItem("amount",amount);
	            	    }else{
	            	    	alert("关键字rate：现金券利息只能为数字");
	            	    	return false;
	            	    };
	            	}else if(index == 2){ //已使用数量
	            		used_quantity = $(data).find("input").val();
	            		if(used_quantity !="" && used_quantity != null && isNumber(used_quantity)){
	            			used_quantity = $(data).find("input").val();
	            	    }else{
	            	    	alert("关键字used_quantity：现金券已使用数量只能为数字且不能为空");
	            	    	return false;
	            	    };
	            	}else if(index == 3){ //现金券总数量 
	            		total_quantity = $(data).find("input").val();
	            		if(total_quantity !="" && used_quantity != null && isNumber(total_quantity)){
	            			total_quantity = $(data).find("input").val();
	            	    }else{
	            	    	alert("关键字total_quantity：现金券总数量只能为数字且不能为空");
	            	    	return false;
	            	    };
	            	}else if(index == 4){ //现金券使用条件 
	            		conditions = conditionsJson;	   
	            	}else if(index == 5){ //现金券有效期 
	            		valid_day = $(data).find("input").val();
	            		if(valid_day !="" && valid_day != null && isNumber(valid_day)){
	            			valid_day = $(data).find("input").val();
	            	    }else{
	            	    	alert("关键字valid_day：现金券有效期只能为数字且不能为空");
	            	    	return false;
	            	    };
	            	}else if(index == 6){  //现金券券名称 
	            		cashName = $(data).find("input").val();
	            		if(cashName !="" && valid_day != null){
	            			cashName = $(data).find("input").val();
	            			localStorage.setItem("cashName",cashName);
	            	    }else{
	            	    	alert("关键字cashName：现金券名称不能为空");
	            	    	return false;
	            	    };
	            	}else if(index == 7){
	            		write_uid = $(data).find("input").val();
	            		if(write_uid !="" && valid_day != null){
	            			write_uid = $(data).find("input").val();
	            	    }else{
	            	    	alert("关键字write_uid：现金券uid不能为空");
	            	    	return false;
	            	    };
	            	}else if(index == 8){ //创建时间
	            		gmt_create = $(data).find("input").val();
	            		if(gmt_create !="" && valid_day != null){
	            			gmt_create = $(data).find("input").val();
	            	    }else{
	            	    	alert("关键字gmt_create：现金券时间不能为空");
	            	    	return false;
	            	    };
	            	}else if(index == 9){ //写入时间 
	            		gmt_write = $(data).find("input").val();
	            		if(gmt_write !="" && valid_day != null){
	            			gmt_write = $(data).find("input").val();
	            	    }else{
	            	    	alert("关键字gmt_write：现金券时间不能为空");
	            	    	return false;
	            	    };
	            	}
	            	
	            });
	           	datarate +="(" +"'"+ cashId + "'," + amount+","+ used_quantity+","+ total_quantity+ ",'"+ conditions+"',"+ valid_day+ ",'"+cashName+"',"+"'"+write_uid+"'," + gmt_create+","+ gmt_write+")";  
	        //    console.log(datarate);
	            $(".sqltxt").text('INSERT INTO lcb_cash_coupon_def("id",amount,used_quantity,total_quantity,conditions,valid_day,"name",write_uid,gmt_create,gmt_write) VALUES ' + datarate);
	        // 判断内容是否为数字
	            function isNumber(n){
	                return !isNaN(parseFloat(n)) && isFinite(n);
	                };
	    	    });	   
	    	// 以下为数据本地存储
	    	var val_cash_buy_amount = localStorage.getItem("cash_buy_amount");
	    	$(".buy_amount input").val(val_cash_buy_amount);
	    	
	    	var val_cash_period = localStorage.getItem("cash_period");
	    	$(".period input").val(val_cash_period);
	    	
	    	var val_target_type = localStorage.getItem("target_type");
	    	$(".target_type input").val(val_target_type);
	    	
	    	var val_cashid = localStorage.getItem("cashId");
	    	$(".cashid input").val(val_cashid);
	    	
	    	var val_amount = localStorage.getItem("amount");
	    	$(".amount input").val(val_amount);
	    	
	    	var val_used_quantity = localStorage.getItem("used_quantity");
	    	$(".used_quantity input").val(val_used_quantity);
	    	
	    	var val_total_quantity = localStorage.getItem("total_quantity");
	    	$(".total_quantity input").val(val_total_quantity);
	    	
	    	var val_valid_day = localStorage.getItem("valid_day");
	    	$(".valid_day input").val(val_valid_day);
	    	
	    	var val_cashName = localStorage.getItem("cashName");
	    	$(".cashname input").val(val_cashName);
	    	
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
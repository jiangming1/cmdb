<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="../js/jquery-1.11.0.js"></script>
</head>
<body>
	<h4>webblock网站屏蔽</h4>
	<div>http://code.laicunba.com/svn/</div>
	<h4>先杀原先的进程后启动进程 比如自带100单ip限制</h4>
	<table>
		<tr>
			<td>单ip最大连接数</td>
			<td><input id="count" value=100 /></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<button id="btnUpdate">修改</button>
			</td>
		</tr>
	</table> 
	<script type="text/javascript">
	$(function(){
		$("#btnUpdate").click(function(){
			var p = {
					t:new Date(),
					count:$("#count").val().trim(),
			};
			
			if(p.count<100){ 
				alert("连接数必须大于99");
				return ;
			}
			
			$.post("webblock.htm",p,function(data){
				if(data.code=='0'){
					alert("密码修改成功!");
					$("input").val("");
				}else if(data.code=='404'){
					alert("用户名或密码不正确");
				}else if(data.code=='ok'){
					alert("设置成功");
				}else{
					alert("error:"+data.code);
				}
				
			},"json");
		});
		
	});
	</script>
</body>
</html>
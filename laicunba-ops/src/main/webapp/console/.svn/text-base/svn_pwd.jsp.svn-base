<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="../js/jquery-1.11.0.js"></script>
</head>
<body>
	<h4>SVN地址</h4>
	<div>http://code.laicunba.com/svn/</div>
	<h4>SVN密码修改</h4>
	<table>
		<tr>
			<td>svn username</td>
			<td><input id="username" /></td>
		</tr>
		<tr>
			<td>old pwd</td>
			<td><input id="oldpwd" type="password" /></td>
		</tr>
		<tr>
			<td valign="top">new pwd</td>
			<td><input id="newpwd" type="password" />
			<div>
				6位或以上同时包括数字和字母
			</div>
			</td>
		</tr>
		<tr>
			<td>re new pwd</td>
			<td><input id="newpwd2" type="password" /></td>
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
					username:$("#username").val().trim(),
					oldpwd:$("#oldpwd").val().trim(),
					newpwd:$("#newpwd").val().trim(),
					newpwd2:$("#newpwd2").val().trim()
			};
			if(!p.username){
				$("#username").focus();
				return ;
			}
			if(!p.oldpwd){
				$("#oldpwd").focus();
				return ;
			}
			if(!p.newpwd){
				$("#newpwd").focus();
				return ;
			}
			if(!p.newpwd2){
				$("#newpwd2").focus();
				return ;
			}
			
			if(p.newpwd2!=p.newpwd){ 
				alert("两次密码输入不一致");
				return ;
			}
			
			$.post("svnpwd.htm",p,function(data){
				if(data.code=='0'){
					alert("密码修改成功!");
					$("input").val("");
				}else if(data.code=='404'){
					alert("用户名或密码不正确");
				}else if(data.code=='newpwd_toosimple'){
					alert("密码太简单了！");
				}else{
					alert("error:"+data.code);
				}
				
			},"json");
		});
		
	});
	</script>
</body>
</html>
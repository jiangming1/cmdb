<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据库查询</title>
<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="dbQuery.js"></script>
</head>
<body>

	数据库:
	<select id="dbSelect">
		<option>来存吧-阿里云-生产库</option>
	</select>
	只能执行 select语句,最多返回200条数据 <span style="color: red;">不能查询密码字段</span>
	<textarea id="sqlInput" style="width: 100%; height: 100px;"></textarea>
	<button style="width: 100px; height: 30px;" id="btnQuery"  >查询</button>
	要订证数据?<a href="updateSQList.htm?env=product">请点这里</a><br>
	<table border="1" style="margin-top: 10px;">
		<thead id="thead">
			<tr>
				<th>结果</th>
			</tr>
		</thead>
		<tbody id="tbody">
			<tr>
				<td>无</td>
			</tr>
		</tbody>
	</table>
</body>
</html>
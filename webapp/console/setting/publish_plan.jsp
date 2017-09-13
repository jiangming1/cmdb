<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-CN">
<head>
<title>自动上标计划</title>
<style type="text/css">
html, body {
	height: 100%;
	margin: 0px;
	padding: 0px;
}

.select {
	width: 100%;
	height: 300px;
	background-color: #eee;
}

#table1 td {
	vertical-align: top;
}

.select-blue {
	background-color: #BCD2EE;
}

#tr2 td {
	vertical-align: bottom;
}

.target-code-input {
	width: 60px;
}

.tr-head {
	height: 30px;
}

.tr-head td {
	padding-left: 10px;
}

.btn-1 {
	width: 20px;
	height: 25px;
	font-size: 10px;
	line-height: 20px;
	text-align: center;
	padding: 0px;
}

.tr-head td {
	border-right: 1px solid #ccc;
}
#titleTr td{
	width: 200px;
}
#tr2 td {
	width: 200px;
}
</style>
</head>
<body>
	<div style="height: 100%; width: 3800px">
		<table id="table1" style="height: 100%;" cellspacing="0" cellpadding="0">
			<tbody>
				<tr id="titleTr" class="tr-head">
					<td>通道1</td>
					<td>通道2</td>
					<td>通道3</td>
					<td>通道4</td>
					<td>通道5</td>
					<td>通道6</td>
					<td>通道7</td>
					<td>通道8</td>
					<td>通道9</td>
					<td>通道10</td>
					
					
					<td>通道11</td>
					<td>通道12</td>
					<td>通道13</td>
					<td>通道14</td>
					<td>通道15</td>
					<td>通道16</td>
					<td>通道17</td>
					<td>通道18</td>
					<td>通道19</td>
					<td>通道20</td>
				</tr>
				<tr id="titleTr2" class="tr-head">
					<td way="1"><input class="target-code-input" placeholder="标的编号" />
						<button class="btn-1 btn-add">+</button>
						<button class="btn-1 btn-up">上</button>
						<button class="btn-1 btn-down">下</button>
						<button class="btn-1 btn-del">-</button></td>

					<td way="2"><input class="target-code-input" placeholder="标的编号" />
						<button class="btn-1 btn-add">+</button>
						<button class="btn-1 btn-up">上</button>
						<button class="btn-1 btn-down">下</button>
						<button class="btn-1 btn-del">-</button></td>

					<td way="3"><input class="target-code-input" placeholder="标的编号" />
						<button class="btn-1 btn-add">+</button>
						<button class="btn-1 btn-up">上</button>
						<button class="btn-1 btn-down">下</button>
						<button class="btn-1 btn-del">-</button></td>

					<td way="4"><input class="target-code-input" placeholder="标的编号" />
						<button class="btn-1 btn-add">+</button>
						<button class="btn-1 btn-up">上</button>
						<button class="btn-1 btn-down">下</button>
						<button class="btn-1 btn-del">-</button></td>

					<td way="5"><input class="target-code-input" placeholder="标的编号" />
						<button class="btn-1 btn-add">+</button>
						<button class="btn-1 btn-up">上</button>
						<button class="btn-1 btn-down">下</button>
						<button class="btn-1 btn-del">-</button></td>

					<td way="6"><input class="target-code-input" placeholder="标的编号" />
						<button class="btn-1 btn-add">+</button>
						<button class="btn-1 btn-up">上</button>
						<button class="btn-1 btn-down">下</button>
						<button class="btn-1 btn-del">-</button></td>

					<td way="7"><input class="target-code-input" placeholder="标的编号" />
						<button class="btn-1 btn-add">+</button>
						<button class="btn-1 btn-up">上</button>
						<button class="btn-1 btn-down">下</button>
						<button class="btn-1 btn-del">-</button></td>

					<td way="8"><input class="target-code-input" placeholder="标的编号" />
						<button class="btn-1 btn-add">+</button>
						<button class="btn-1 btn-up">上</button>
						<button class="btn-1 btn-down">下</button>
						<button class="btn-1 btn-del">-</button></td>

					<td way="9"><input class="target-code-input" placeholder="标的编号" />
						<button class="btn-1 btn-add">+</button>
						<button class="btn-1 btn-up">上</button>
						<button class="btn-1 btn-down">下</button>
						<button class="btn-1 btn-del">-</button></td>

					<td way="10"><input class="target-code-input" placeholder="标的编号" />
						<button class="btn-1 btn-add">+</button>
						<button class="btn-1 btn-up">上</button>
						<button class="btn-1 btn-down">下</button>
						<button class="btn-1 btn-del">-</button></td>
						
						
						
						
					<td way="11"><input class="target-code-input" placeholder="标的编号" />
						<button class="btn-1 btn-add">+</button>
						<button class="btn-1 btn-up">上</button>
						<button class="btn-1 btn-down">下</button>
						<button class="btn-1 btn-del">-</button></td>

					<td way="12"><input class="target-code-input" placeholder="标的编号" />
						<button class="btn-1 btn-add">+</button>
						<button class="btn-1 btn-up">上</button>
						<button class="btn-1 btn-down">下</button>
						<button class="btn-1 btn-del">-</button></td>

					<td way="13"><input class="target-code-input" placeholder="标的编号" />
						<button class="btn-1 btn-add">+</button>
						<button class="btn-1 btn-up">上</button>
						<button class="btn-1 btn-down">下</button>
						<button class="btn-1 btn-del">-</button></td>

					<td way="14"><input class="target-code-input" placeholder="标的编号" />
						<button class="btn-1 btn-add">+</button>
						<button class="btn-1 btn-up">上</button>
						<button class="btn-1 btn-down">下</button>
						<button class="btn-1 btn-del">-</button></td>

					<td way="15"><input class="target-code-input" placeholder="标的编号" />
						<button class="btn-1 btn-add">+</button>
						<button class="btn-1 btn-up">上</button>
						<button class="btn-1 btn-down">下</button>
						<button class="btn-1 btn-del">-</button></td>

					<td way="16"><input class="target-code-input" placeholder="标的编号" />
						<button class="btn-1 btn-add">+</button>
						<button class="btn-1 btn-up">上</button>
						<button class="btn-1 btn-down">下</button>
						<button class="btn-1 btn-del">-</button></td>

					<td way="17"><input class="target-code-input" placeholder="标的编号" />
						<button class="btn-1 btn-add">+</button>
						<button class="btn-1 btn-up">上</button>
						<button class="btn-1 btn-down">下</button>
						<button class="btn-1 btn-del">-</button></td>

					<td way="18"><input class="target-code-input" placeholder="标的编号" />
						<button class="btn-1 btn-add">+</button>
						<button class="btn-1 btn-up">上</button>
						<button class="btn-1 btn-down">下</button>
						<button class="btn-1 btn-del">-</button></td>

					<td way="19"><input class="target-code-input" placeholder="标的编号" />
						<button class="btn-1 btn-add">+</button>
						<button class="btn-1 btn-up">上</button>
						<button class="btn-1 btn-down">下</button>
						<button class="btn-1 btn-del">-</button></td>

					<td way="20"><input class="target-code-input" placeholder="标的编号" />
						<button class="btn-1 btn-add">+</button>
						<button class="btn-1 btn-up">上</button>
						<button class="btn-1 btn-down">下</button>
						<button class="btn-1 btn-del">-</button></td>
						
						
				</tr>
				<tr id="tr2">
					<td way="1"><select class="select" multiple="multiple"></select></td>
					<td way="2"><select class="select" multiple="multiple"></select></td>
					<td way="3"><select class="select select-blue" multiple="multiple"></select></td>
					<td way="4"><select class="select" multiple="multiple"></select></td>
					<td way="5"><select class="select" multiple="multiple"></select></td>
					<td way="6"><select class="select select-blue" multiple="multiple"></select></td>
					<td way="7"><select class="select" multiple="multiple"></select></td>
					<td way="8"><select class="select" multiple="multiple"></select></td>
					<td way="9"><select class="select select-blue" multiple="multiple"></select></td>
					<td way="10"><select class="select" multiple="multiple"></select></td>



					<td way="11"><select class="select" multiple="multiple"></select></td>
					<td way="12"><select class="select" multiple="multiple"></select></td>
					<td way="13"><select class="select select-blue" multiple="multiple"></select></td>
					<td way="14"><select class="select" multiple="multiple"></select></td>
					<td way="15"><select class="select" multiple="multiple"></select></td>
					<td way="16"><select class="select select-blue" multiple="multiple"></select></td>
					<td way="17"><select class="select" multiple="multiple"></select></td>
					<td way="18"><select class="select" multiple="multiple"></select></td>
					<td way="19"><select class="select select-blue" multiple="multiple"></select></td>
					<td way="20"><select class="select" multiple="multiple"></select></td>

				</tr>
			</tbody>
		</table>
	</div>
</body>
<script src="../../static/jquery-1.11.0.js"></script>
<script src="publish_plan.js"></script>
</html>
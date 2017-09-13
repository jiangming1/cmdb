<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta charset="utf-8">
<title>来存吧-管理员!</title>
<script src="../static/jquery-1.11.0.js"></script>
<link rel="stylesheet" type="text/css" href="../static/jquery-easyui-1.4.4/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="../static/jquery-easyui-1.4.4/themes/icon.css">
<script type="text/javascript" src="../static/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
<script src="index.js?v=1"></script>
<style type="text/css">
.mainFrame {
	width: 100%;
	height: 100%;
	border: 0px;
}

.panel-body {
	overflow: visible;
}
</style>
</head>
<body>
<body class="easyui-layout">
	<div data-options="region:'north',split:true" style="height: 70px">
		<div id="menuBar" style="margin: 3px; height: 25px;"></div>
		<div class="easyui-layout" style="height: 35px;">
			<div data-options="region:'center'" style="border-left: 0px;">
				<div id="quickBtnBar" style="padding: 2px"></div>
			</div>
			<div data-options="region:'east'" style="width: 200px; border-left: 0px; border-right: 0px;">
				<div style="line-height: 35px;">
					root &nbsp;您好 ! &nbsp;[
					<a href="adminLogout.htm">退出</a>
					]
				</div>
			</div>
		</div>

	</div>
	<div data-options="region:'west',title:'工具栏',split:true,collapsed:true" style="width: 200px">
	
	</div>
	<div data-options="region:'center'" style="background-color: #eee;">
		<div id="tabBar" style="width: 100%; height: 100%;"></div>
	</div>
	 
	<div id="tabSpaceTools" style="height: 26px;line-height: 26px;">
		<span style="color:gray"></span><button id="btnOpenInNewWindow" style="background-color: #eee">open new windows</button>
		<div>Ext Stauts&nbsp;:&nbsp;<span id="extStatusSpan">loading...</span></div>
	</div>
</body>
</body>
</html>

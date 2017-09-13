$(function() {
	TabTool.init();
	MenuLoader.load();
	QuickBtnLoader.load();
	$(window).bind('resize', function() {
		// alert($("#tabBar").height());
	});
	  
	$(".layout-panel-west").find(".layout-body").append($("#tabSpaceTools"));
	
	
	$("#btnOpenInNewWindow").click(function(){
		var index = $('#tabBar').tabs("getTabIndex",$('#tabBar').tabs("getSelected"));
		var src = $($(".mainFrame")[index]).attr("src");
		window.open(src); 
	});
	
	$.post("ext/status.htm",{t:new Date()},function(status){
		$("#extStatusSpan").html(status);
	},"html");
});

var QuickBtnLoader = {
	load : function() {
		$.post("menu/findQuickBtns.htm", {
			t : new Date()
		}, function(data) {
			if (!data) {
				return;
			}
			for ( var i in data) {
				var btn = $("<a  ></a>");
				$("#quickBtnBar").append(btn);
				btn.linkbutton({
					iconCls : data[i].icon,
					plain : true,
					id : data[i].id,
					text : data[i].menuName
				});
				btn.attr("url", data[i].url);
				btn.attr("menu_id", data[i].id);
				btn.attr("target", data[i].target);
				btn.click(function() {
					var target = $(this).attr("target");
					if (!target || target == "main") {
						TabTool.open(MenuLoader.menuDataCache[$(this).attr("menu_id")]);
						return;
					}
					alert("有代码尚未完成!");
				});
			}
		}, "json");

	}
};
/**
 * 标签页相关
 */
var TabTool = {
	init : function() {
		$('#tabBar').tabs({
			border : false,
			height : $("#tabBar").height() + "px",
			onSelect : function(title) {
				// alert(title + ' is selected');
			}
		});

		$("#tabBar").tabs('add', {
			title : '投资人',
			content : '<iframe class="mainFrame" src="investor.jsp" frameborder="0"></iframe>',
			closable : false
		});
//		$("#tabBar").tabs('add', {
//			title : '资产负责表',
//			content : '<iframe class="mainFrame" src="balance_sheet.jsp" frameborder="0"></iframe>',
//			closable : false
//		});
		
		$("#tabBar").tabs('add', {
			title : '融资标的',
			content : '<iframe class="mainFrame" src="financing_target/financing_target_manager.jsp" frameborder="0"></iframe>',
			closable : false
		});
		
	},
	open : function(pageInfo) {
		$("#tabBar").tabs('add', {
			title : pageInfo.menuName,
			content : '<iframe class="mainFrame" src="' + pageInfo.url + '" frameborder="0"></iframe>',
			closable : true
		});
	}
};

/**
 * 菜单相关
 */
var MenuLoader = {
	menuDataCache : {},
	add2Cache : function(itemData) {
		MenuLoader.menuDataCache[itemData.id] = {
			url : itemData.url,
			target : itemData.target,
			hasChild : itemData.childs.length > 0,
			menuName : itemData.menuName
		};
	},
	load : function() {
		$.post("menu/loadCurrentUserMenuTree.htm", {
			t : new Date()
		}, function(data) {
			if (!data) {
				return;
			}
			for ( var i in data) {
				MenuLoader.makeMenuButton(data[i]);
			}
		}, "json");
	},
	makeMenuButton : function(itemData) {
		MenuLoader.add2Cache(itemData);
		var menuBtn = $("<div></div>");
		$("#menuBar").append(menuBtn);
		menuBtn.menubutton({
			iconCls : itemData.icon,
			text : itemData.menuName
		});
		if (itemData.childs.length > 0) {
			var menuContainer = $("<div></div>");
			MenuLoader.makeMenu(itemData.childs, menuContainer);
			menuContainer.menu({
				onClick : function(item) {
					var menuInfo = MenuLoader.menuDataCache[item.id];
					if (menuInfo.hasChild) {
						return;
					}
					if (!menuInfo.target || menuInfo.target == "main") {
						TabTool.open(menuInfo);
					} else if (menuInfo.target == "self") {
						window.location = menuInfo.url;
					} else if (menuInfo.target == "_blank") {

					}
				}
			});
			menuBtn.menubutton({
				menu : menuContainer
			});
		}

	},
	makeMenu : function(itemDataList, container) {
		for ( var i in itemDataList) {
			var itemData = itemDataList[i];
			MenuLoader.add2Cache(itemData);
			var menu = $("<div ></div>");
			menu.html(itemData.menuName);
			if (itemData.icon) {
				menu.attr("iconCls", itemData.icon);
			}
			menu.attr("id", itemData.id);
			// menu.attr("disabled", true);
			container.append(menu);
			if (itemData.childs.length > 0) {
				var menuContainer = $("<div></div>");
				menu.append(menuContainer);
				MenuLoader.makeMenu(itemData.childs, menuContainer);
				// alert(itemData.childs);
			}
		}
		// alert(JSON.stringify(itemData));
	}
};
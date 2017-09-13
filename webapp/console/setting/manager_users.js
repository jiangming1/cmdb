var roles = {};
var menus = [];
var menu_level_data = [];
$(function() {
	$(".select").css("height", $("#table1").height() - $("#titleTr").height()-10 + "px");
	$.post("../query.htm?listId=MANAGER_USERS_PERMISSION.findAllUsrAndPermission", {
		t : new Date()
	}, function(data) {
		var roleSelect = $("#select-role");
		// alert(JSON.stringify(data));
		data.rows.push({
			"role_name" : "root",
			"login_name" : "root",
			"role_description" : "超级管理员",
			"role_id" : "root",
			"manager_user_id" : "root",
			"status" : 1
		});
		for ( var i in data.rows) {
			var row = data.rows[i];
			var roleOption = roleSelect.find("option[role_id='" + row.role_id + "']");
			if (roleOption.length == 0) {
				roleOption = $("<option></option>");
				roleOption.attr("role_id", row.role_id);
				roleOption.attr("role_name", row.role_name);
				roleOption.attr("role_description", row.role_description);
				roleOption.attr("usr_amt", "1");
				roleOption.html(row.role_name + " - " + row.role_description + (row.manager_user_id ? " - (1)" : " - (0)"));
				roleOption.val(row.role_id);
				roleSelect.append(roleOption);
			} else {
				roleOption.attr("usr_amt", parseInt(roleOption.attr("usr_amt")) + 1);
				roleOption.html(row.role_name + " - " + row.role_description + " - (" + roleOption.attr("usr_amt") + ")");

			}
			if (row.login_name) {
				if (roles[row.role_id]) {
					roles[row.role_id].push(row);
				} else {
					roles[row.role_id] = [ row ];
				}
			}
		}
		bindEvent.dobind();
		$("#select-role").find("option:first-child").click();
	}, "json");

	$.post("list_console_uri.htm", {
		t : new Date()
	}, function(data) {
		var select = $(".select-action-all");
		select.html("");
		for ( var key in data) {
			var option = $("<option></option>");
			option.html(data[key]);
			option.attr("actionid", key);
			option.val(key);
			select.append(option);
		}
	}, "json");

	$("#btnSynActionTab").click(function() {

		$.post("synActionTab.htm", {
			t : new Date()
		}, function() {
			alert("完成同步");
		}, "json");
	});
	$("#btnDrop").click(function() {
		var selectedOption = $(".select-action").find("option:selected");
		if (selectedOption.length == 0) {
			alert("请选择");
			return;
		}
		if ($("#select-role").find("option:selected").length != 1) {
			alert("请选择一个角色");
			return;
		}
		var roleId = $("#select-role").find("option:selected").val();
		var uris = "";
		selectedOption.each(function() {
			uris += $(this).val() + ",";
		});
		$.post("dropPermission.htm", {
			t : new Date(),
			roleId : roleId,
			actionIds : uris
		}, function(data) {
			if (!data.success) {
				alert(JSON.stringify(data));
			} else {
				for ( var key in data) {
					if (key != "success") {
						$(".select-action-all").find("option[actionid='" + key + "']").show();
						$(".select-action").find("option[actionid='" + key + "']").remove();
					}
				}
			}
		}, "json");
	});
	$("#btnGrant").click(function() {
		var selectedOption = $(".select-action-all").find("option:selected");
		if (selectedOption.length == 0) {
			alert("请选择");
			return;
		}
		if ($("#select-role").find("option:selected").length != 1) {
			alert("请选择一个角色");
			return;
		}
		var roleId = $("#select-role").find("option:selected").val();
		var uris = "";
		selectedOption.each(function() {
			uris += $(this).val() + ",";
		});
		$.post("grantPermission.htm", {
			t : new Date(),
			roleId : roleId,
			actionIds : uris
		}, function(data) {
			if (!data.success) {
				alert(JSON.stringify(data));
			} else {
				for ( var key in data) {
					if (key != "success") {
						var option = $(".select-action-all").find("option[actionid='" + key + "']");
						$(".select-action").append(option.clone());
						option.hide();
					}
				}
			}
		}, "json");
	});

	$("#btnCreateRole").click(function() {
		var roleDesc = window.prompt("角色ID,角色名");
		if (!roleDesc) {
			return;
		}
		$.post("create_role.htm", {
			t : new Date(),
			roleDesc : roleDesc
		}, function(row) {
			if (!row.success) {
				alert(JSON.stringify(row));
			} else {
				var roleSelect = $("#select-role");
				var roleOption = $("<option></option>");
				roleOption.attr("role_id", row.role_id);
				roleOption.attr("role_name", row.role_name);
				roleOption.attr("role_description", row.role_description);
				roleOption.attr("usr_amt", "1");
				roleOption.html(row.role_name + " - " + row.role_description + (row.manager_user_id ? " - (1)" : " - (0)"));
				roleOption.val(row.role_id);
				roleSelect.append(roleOption);
				bindEvent.dobind();
			}
		}, "json");
	});

	$("#btnDropRole").click(function() {
		var options = $("#select-role").find("option:selected");
		if (options.length != 1) {
			alert("请选择一个角色!");
			return;
		}
		$.post("drop_role.htm", {
			t : new Date(),
			roleId : options.val()
		}, function(data) {
			if (!data.success) {
				alert(JSON.stringify(data));
			} else {
				$("#select-role").find("option[role_id='" + data.roleId + "']").remove();
			}
		}, "json");
	});

	$("#btnCreateUsr").click(function() {
		var roleId = getSelectedRole();
		if (!roleId) {
			return;
		}
		var usrDesc = window.prompt("登录名,密码");
		if (!usrDesc) {
			return;
		}
		$.post("manager_usr_create.htm", {
			t : new Date(),
			loginName : usrDesc.split(",")[0],
			pwd : usrDesc.split(",")[1],
			roleId : roleId
		}, function(data) {
			if (!data.success) {
				alert(JSON.stringify(data));
			} else {
				var option = $("<option></option>");
				option.html(data.loginName);
				option.val(data.id);
				$(".select-usr").append(option);
			}
		}, "json");
	});

	$("#btnDropUsr").click(function() {
		var options = $(".select-usr").find("option:selected");
		if (options.length != 1) {
			alert("请选择用户");
			return;
		}
		$.post("manager_usr_drop.htm", {
			t : new Date(),
			managerUid : options.val()
		}, function(data) {
			if (data.success) {
				$(".select-usr").find("option:selected").remove();
			} else {
				alert(JSON.stringify(data));
			}
		}, "json");
	});

	$("#btnResetUsrPwd").click(function() {
		var options = $(".select-usr").find("option:selected");
		if (options.length != 1) {
			alert("请选择用户");
			return;
		}

		var newpwd = window.prompt("新密码");
		if (!newpwd) {
			return;
		}
		$.post("manager_usr_resetpwd.htm", {
			t : new Date(),
			managerUid : options.val(),
			newPwd : newpwd
		}, function(data) {
			if (data.success) {
				alert("重置成功!");
			} else {
				alert(JSON.stringify(data));
			}
		}, "json");

	});

	$("#btnMenuCreate").click(function() {
		var roleId = getSelectedRole();
		if (!roleId) {
			return;
		}
		var menuName = window.prompt("一级菜单名称");
		if (!menuName) {
			return;
		}
		$.post("menu_create.htm", {
			t : new Date(),
			menuName : menuName,
			roleId : roleId
		}, function(data) {
			if (data.success) {

				var option = $("<option></option>");
				option.html(data.menuName);
				option.val(data.id);
				$(".select-0-level-menu").append(option);
			} else {
				alert(JSON.stringify(data));
			}
		}, "json");
	});

	$("#btnMenuDrop").click(function() {

		var options = $(".select-0-level-menu").find("option:selected");
		if (options.length != 1) {
			alert("请选择");
			return;
		}
		$.post("menu_drop.htm", {
			t : new Date(),
			mid : options.val().trim()
		}, function(data) {
			if (data.success) {
				$(".select-0-level-menu").find("option:selected").remove();
			} else {
				alert(JSON.stringify(data));
			}
		}, "json");
	});

	$("#btnMenu2Create").click(function() {
		var roleId = getSelectedRole();
		if (!roleId) {
			return;
		}

		var options = $(".select-0-level-menu").find("option:selected");
		if (options.length != 1) {
			alert("请选择一级菜单");
			return;
		}

		var menuName = window.prompt("菜单名称,url,true/false");
		if (!menuName) {
			return;
		}
		menuName = menuName.split(",");
		if (menuName.length != 3) {
			alert("格式不正确");
			return;
		}
		$.post("menu_create.htm", {
			t : new Date(),
			menuName : menuName[0],
			roleId : roleId,
			pid : options.val().trim(),
			href : menuName[1],
			quickBtn : menuName[2]
		}, function(data) {
			if (data.success) {

				var option = $("<option></option>");
				option.html(data.menuName + "-" + data.url);
				option.val(data.id);
				$(".select-1-level-menu").append(option);
			} else {
				alert(JSON.stringify(data));
			}
		}, "json");
	});

	$("#btnMenu2Drop").click(function() {

		var options = $(".select-1-level-menu").find("option:selected");
		if (options.length != 1) {
			alert("请选择");
			return;
		}
		$.post("menu_drop.htm", {
			t : new Date(),
			mid : options.val().trim()
		}, function(data) {
			if (data.success) {
				$(".select-1-level-menu").find("option:selected").remove();
			} else {
				alert(JSON.stringify(data));
			}
		}, "json");
	});

});
function getSelectedRole() {
	var options = $("#select-role").find("option:selected");
	if (options.length != 1) {
		alert("请选择一个角色!");
		return;
	}
	return options.val().trim();
}
var bindEvent = {
	dobind : function() {
		$(".select-role").find("option").unbind();
		$(".select-role").find("option").click(function() {
			var usrSelect = $(".select-usr");
			usrSelect.html("");
			var roleId = $(this).attr("role_id");

			if (roleId == "root") {
				var select = $(".select-action");
				var selectAll = $(".select-action-all");
				select.html("");
				select.append(selectAll.find("option").clone());
				selectAll.find("option").hide();
				select.find("option").show();
			} else {

				$.post("../query.htm?listId=MANAGER_USERS_PERMISSION.findActionByRole", {
					t : new Date(),
					roleId : roleId
				}, function(data) {
					var select = $(".select-action");
					var selectAll = $(".select-action-all");
					selectAll.find("option").show();
					select.html("");
					for ( var i in data.rows) {
						var option = $("<option></option>");
						option.html(data.rows[i].uri);
						option.attr("actionid", data.rows[i].id);
						option.val(data.rows[i].id);
						select.append(option);
						selectAll.find("option[actionid='" + data.rows[i].id + "']").hide();
					}
				}, "json");
			}

			$.post("../query.htm?listId=MANAGER_USERS_PERMISSION.findMenuByRole", {
				t : new Date(),
				roleId : roleId
			}, function(data) {
				// menus = data.rows;
				var menu = null;
				for ( var i in data.rows) {
					menu = data.rows[i];
					menu_level_data[menu.id] = menu;
					menu_level_data[menu.id]["childs"] = [];
				}

				var firstLevelMenuSelect = $(".select-0-level-menu");
				firstLevelMenuSelect.html("");
				$(".select-1-level-menu").html("");

				for ( var i in data.rows) {
					menu = data.rows[i];
					if (menu.parent_menu_id) {
						if (!menu_level_data[menu.parent_menu_id]) {
							continue;
						}
						menu_level_data[menu.parent_menu_id].childs.push(menu_level_data[menu.id]);
					} else {
						// first level menu
						var option = $("<option></option>");
						option.html(menu.menu_name + (menu.url ? " - " + menu.url : ""));
						option.val(menu.id);
						firstLevelMenuSelect.append(option);
						option.click(function() {
							var menuid = $(this).val();
							var menu = menu_level_data[menuid];
							var menuGroup = $(".select-1-level-menu");
							menuGroup.html("");
							for ( var i in menu.childs) {
								var childMenu = menu.childs[i];
								var option = $("<option></option>");
								option.html(childMenu.menu_name + (childMenu.url ? " - " + childMenu.url : ""));
								option.val(childMenu.id);
								menuGroup.append(option);
							}
						});
					}
				}

			}, "json");

			var usrs = roles[roleId];
			if (!usrs) {
				return;
			}
			var option;
			for ( var i in usrs) {
				option = $("<option></option>");
				option.html(usrs[i].login_name + (usrs[i].status == "1" ? "" : " - (不可用)"));

				option.val(usrs[i].manager_user_id);
				usrSelect.append(option);
			}

		});
	}
};
var clearMenuSelect = function() {
	$(".select-0-level-menu").html("");
	$(".select-1-level-menu").html("");
	$(".select-2-level-menu").html("");
};
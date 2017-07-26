$(function() {
	KeepalivedService.init();
	KeepalivedService.refresh();
	window.setInterval(function() {
		KeepalivedService.refresh();
	}, 5000);
	KeepalivedService.refreshTestArea();
	window.setInterval(function() {
		KeepalivedService.refreshTestArea();
	}, 3000);

	$("#btnClear").click(function() {
		$.post("clearTestArea.htm", {
			env : $("#envInput").val().trim()
		}, function(data) {
			$("#tbodyTestCase").find("tr").remove();
		}, "json");
		$("#AllTestedLayout").fadeOut();

	});
});

var KeepalivedService = {
	pointSettingMap : {},
	init : function() {
		var pointSettingList = null;
		$.ajax({
			async : false,
			url : "keepalivedPointList.htm",
			data : {
				t : new Date()
			},
			dataType : "json",
			type : "POST",
			success : function(data) {
				pointSettingList = data;
			}
		});
		for ( var i in pointSettingList) {
			var tmp = pointSettingList[i];
			this.pointSettingMap[tmp["key"]] = tmp;
		}
	},
	refreshTestArea : function() {
		var param = {
			t : new Date(),
			env : $("#envInput").val().trim()
		};
		var testCaseList = null;
		$.ajax({
			async : false,
			url : "listTestCase.htm",
			data : param,
			dataType : "json",
			type : "POST",
			success : function(data) {
				testCaseList = data;
			}
		});

		var trTemplate = $("#leftTbodyTemplate").find("tr");
		var tbody = $("#tbodyTestCase");
		tbody.html("");
		var testCase = null;
		var allTested = true;
		for ( var i in testCaseList) {
			var newTr = trTemplate.clone();
			testCase = testCaseList[i];
			newTr.attr("key", testCase.key);
			newTr.find(".checkPoint-cn").html(testCase.cnName);
			newTr.find(".checkPoint-en").html(testCase.key);
			newTr.find(".level").html(testCase.level);
			newTr.find(".user").html(testCase.userType);
			newTr.find(".owner").html(testCase.owner);
			newTr.attr("lastHeartbeat", testCase.lastHeartbeat);
			if (testCase.status == "tested") {
				newTr.addClass("tested_passed");
				newTr.removeClass("no_test");
			} else {
				newTr.removeClass("tested_passed");
				newTr.addClass("no_test");
				allTested = false;
			}
			tbody.append(newTr);
		}
		if (testCaseList.length > 0 && allTested) {
			$("#AllTestedLayout").fadeIn();
		}
	},
	refresh : function() {
		var param = {
			t : new Date(),
			env : $("#envInput").val().trim()
		};
		var checkPointMap = null;
		$.ajax({
			async : false,
			url : "lcb_keepalived.htm",
			data : param,
			dataType : "json",
			type : "POST",
			success : function(data) {
				checkPointMap = data;
			}
		});
		var sortArray = new Array();
		var m = {};
		for ( var key in checkPointMap) {
			m[checkPointMap[key] + ""] = key;
			sortArray.push(parseFloat(checkPointMap[key]));
		}
		sortArray.sort();
		var tbody = $("#tbody");
		var tbodyTestCase = $("#tbodyTestCase");
		var trTemplate = $("#tbodyTemplate").find("tr");
		var nowTimeStemp = new Date().getTime();
		var interval = null;
		var key = null;
		var t = null;
		for ( var i in sortArray) {
			t = sortArray[i];
			key = m[t + ""];
			var tr = tbody.find("tr[key='" + key + "']");
			var trTastCase = tbodyTestCase.find("tr[key='" + key + "']");
			if (trTastCase.length > 0) {
				if (parseFloat(t) > parseFloat(trTastCase.attr("lastheartbeat"))) {
					trTastCase.addClass("tested_passed");
					trTastCase.removeClass("no_test");
					$.post("reportTested.htm", {
						t : new Date(),
						key : key,
						env : $("#envInput").val().trim()
					}, function(data) {
					}, "json");
				} else {
					trTastCase.removeClass("tested_passed");
					trTastCase.addClass("no_test");
				}
			}
			if (tr.length == 0) {
				tr = trTemplate.clone();
				tr.attr("key", key);
				tr.find(".btnSelectForTest").attr("key", key);
				tr.find(".btnSelectForTest").click(function() {
					var key = $(this).attr("key");
					$.post("selectForTesting.htm", {
						t : new Date(),
						key : key,
						env : $("#envInput").val().trim()
					}, function(data) {
						if (data.code == "SUCCESS") {
							var rightTr = $("#tbody").find("tr[key='" + key + "']");
							var newLeftTr = $("#leftTbodyTemplate").find("tr").clone();

							newLeftTr.find(".checkPoint-cn").html(rightTr.find(".checkPoint-cn").html());
							newLeftTr.find(".level").html(rightTr.find(".level").html());
							newLeftTr.find(".user").html(rightTr.find(".user").html());
							newLeftTr.find(".owner").html(rightTr.find(".owner").html());
							newLeftTr.find(".interval").html(rightTr.find(".interval").html());
							newLeftTr.addClass("no_test");
							rightTr.remove();
							$("#tbodyTestCase").append(newLeftTr);
						} else {
							alert("请先确认中文名");
						}
					}, "json");

				});
				tr.find(".btnSetting").attr("key", key);
				tr.find(".btnSetting").click(function() {
					var key = $(this).attr("key");
					window.location = "keepalivedPointForm.htm?id=" + key + "&env=" + $("#envInput").val().trim();
				});
				var settingDO = this.pointSettingMap[key];
				if (settingDO) {
					tr.find(".checkPoint-cn").html(settingDO.cnName);
					tr.find(".level").html(settingDO.level);
					tr.find(".user").html(settingDO.userType);
					tr.find(".owner").html(settingDO.owner);
					tr.find(".interval").html(settingDO.interval + " s");
				}
			}
			tr.find(".checkPoint-en").html(key);
			interval = nowTimeStemp - parseFloat(t);
			tr.find(".timestemp").html(this.countInterval(interval));
			tbody.append(tr);
		}

	},
	second : 1000,
	minite : 1000 * 60,
	hour : 1000 * 60 * 60,
	day : 1000 * 60 * 60 * 24,
	countInterval : function(interval) {
		if (interval > this.day) {
			return (interval / this.day).toFixed(1) + " d";
		}
		if (interval > this.hour) {
			return (interval / this.hour).toFixed(0) + " h";
		}
		if (interval > this.minite) {
			return (interval / this.minite).toFixed(0) + " m";
		}
		if (interval > this.second) {
			return (interval / this.second).toFixed(0) + " s";
		}
	}
};
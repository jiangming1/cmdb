$(function() {
	ProductTable.load();

	$("#btnCreateFeature").click(function() {
		if (!$("#featureName").val().trim()) {
			$("#featureName").focus();
			return;
		}
		var userCaseId = UserCaseTable.getSelected();
		var productId = ProductTable.getSelected();
		if (userCaseId) {
			var p = {
				t : new Date(),
				featureName : $("#featureName").val(),
				priority : 5,
				userCaseId : userCaseId[0],
				type : $("#typeSelect").val(),
				productVersionId:productId[0].split("_")[0]
			};

			$("#featureName").val("");
			$.post("feature_create.htm", p, function(data) {
				if (data.success) {
					FeatureTable.load();
				}
			}, "json");
		}

	});

	$("#btnCreateUserCase").click(function() {
		if (!$("#userCaseName").val().trim()) {
			$("#userCaseName").focus();
			return;
		}

		var productId = ProductTable.getSelected();
		if (!productId) {
			alert("请选择");
			return;
		}
		var p = {
			t : new Date(),
			caseName : $("#userCaseName").val(),
			productVersionId : productId[0].split("_")[0]
		};
		$("#userCaseName").val("");
		$.post("usercase_create.htm", p, function(data) {
			if (data.success) {
				UserCaseTable.load();
			}
		}, "json");

	});

});

var ProductTable = {
	load : function() {
		var p = {
			t : new Date(),
			listId : "PRODUCT_VERSION.list"
		};
		$.post("query.htm", p, function(data) {
			// alert(JSON.stringify(data));
			for ( var i in data.rows) {
				var row = data.rows[i];
				$("#productSelect").append("<option value='" + row["id"] + "_" + row["productId"] + "'>" + row["productName"] + "(" + row["versionName"] + ")</option>");
			}
			$("#productSelect").find("option").click(function() {
				UserCaseTable.load();
			});
		}, "json");
	},
	getSelected : function() {
		return $("#productSelect").val();
	}
};

var UserCaseTable = {
	load : function() {
		var productIdStr = ProductTable.getSelected();
		$("#userCaseSelect").html("");
		$("#featureSelect").html("");
		if (!productIdStr) {
			return;
		}
		var p = {
			t : new Date(),
			listId : "USER_CASE.findByProductId",
			productId : productIdStr[0].split("_")[1]
		};
		$.post("query.htm", p, function(data) {
			for ( var i in data.rows) {
				var row = data.rows[i];
				$("#userCaseSelect").append("<option value='" + row["id"] + "'>[用例]  " + row["caseName"] + "</option>");
			}
			$("#userCaseSelect").find("option").click(function() {
				FeatureTable.load();
			});
		}, "json");
	},
	getSelected : function() {
		return $("#userCaseSelect").val();
	}
};

var FeatureTable = {
	load : function() {
		var userCaseId = UserCaseTable.getSelected();
		var productIdStr = ProductTable.getSelected();
		$("#featureSelect").html("");
		if (!userCaseId) {
			return;
		}
		var p = {
			t : new Date(),
			listId : "FEATURE.findByUserCaseId",
			userCaseId : userCaseId[0],
			productVersionId:productIdStr[0].split("_")[0]
		};
		$.post("query.htm", p, function(data) {
			for ( var i in data.rows) {
				var row = data.rows[i];
				var featureMark = "feature";
				if (row["type"] == "new_feature") {
					featureMark = "新功能";
				} else if (row["type"] == "bug") {
					featureMark = "BUG";

				} else if (row["type"] == "upgrade") {
					featureMark = "改进";

				}
				$("#featureSelect").append("<option value='" + row["id"] + "'>[" + featureMark + "]  " + row["featureName"] + "</option>");
			}
			$("#featureSelect").find("option").click(function() {

			});
		}, "json");
	}
};
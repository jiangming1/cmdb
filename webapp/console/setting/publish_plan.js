$(function() {

	$(".select").css("height", $("#table1").height() - $("#titleTr").height() * 2 + "px");

	$(".btn-add").click(function() {
		var targetCodeInput = $(this).parent().find(".target-code-input");
		var targetCode = targetCodeInput.val().trim();
		var way = $(this).parent().attr("way");
		if (!targetCode) {
			targetCodeInput.focus();
			return;
		}
		targetCodeInput.val("");
		$.post("../financing_target/financing_target_find_by_code.htm", {
			t : new Date(),
			code : targetCode
		}, function(data) {
			if (!data) {
				alert("查无此标的");
				return;
			}
			var select = $("#tr2").find("[way='" + way + "']").find("select");
			if (select.find("[targetid='" + data.id + "']").length > 0) {
				return;
			}
			var option = $("<option></option>");
			option.html(data.period + "-" + data.name + "-" +data.finishAmount);
			option.val(data.id);
			option.attr("targetid", data.id);
			option.attr("name", data.name);
			option.attr("period", data.period);
			if(data.finishAmount) {
				option.attr("finishAmount", data.finishAmount);
			} else {
				option.attr("finishAmount", 0);
			}
			select.append(option);
			PublishPlanService.save(way);
		}, "json");
	});

	$(".btn-del").click(function() {
		var way = $(this).parent().attr("way");
		var select = $("#tr2").find("[way='" + way + "']").find("select");
		select.find("option:selected").each(function() {
			$(this).remove();
		});
		PublishPlanService.save(way);
	});

	$(".btn-up").click(function() {
		var way = $(this).parent().attr("way");
		var select = $("#tr2").find("[way='" + way + "']").find("select");
		select.find("option:selected").each(function() {
			$(this).insertBefore($(this).prev());
		});
		PublishPlanService.save(way);
	});

	$(".btn-down").click(function() {
		var way = $(this).parent().attr("way");
		var select = $("#tr2").find("[way='" + way + "']").find("select");
		select.find("option:selected").each(function() {
			$(this).insertAfter($(this).next());
		});
		PublishPlanService.save(way);
	});

	$.post("get_publish_plan.htm", {
		t : new Date()
	}, function(data) {
		for ( var key in data) {
			var way = key.substring(17);
			var planData = eval('(' + data[key] + ')');
			if (planData && planData.length > 0) {
				var select = $("#tr2").find("[way='" + way + "']").find("select");
				for ( var i in planData) {
					var option = $("<option></option>");
					option.html(planData[i].period + "-" + planData[i].name + "-" + planData[i].finishAmount);
					option.val(planData[i].id);
					option.attr("name", planData[i].name);
					option.attr("targetid", planData[i].id);
					option.attr("period", planData[i].period);
					if(planData[i].finishAmount) {
						option.attr("finishAmount", planData[i].finishAmount);
					} else {
						option.attr("finishAmount", 0);
					}
					select.append(option);
				}
			}
		}
	}, "json");
});

var PublishPlanService = {
	save : function(way) {
		var select = $("#tr2").find("[way='" + way + "']").find("select");
		var planData = [];
		select.find("option").each(function() {
			var option = $(this);
			planData.push({
				id : option.val().trim(),
				period : option.attr("period").trim(),
				name : option.attr("name").trim(),
				finishAmount : option.attr("finishAmount").trim()
			});
		});
		$.post("save_publish_plan.htm", {
			t : new Date(),
			way : way,
			content : JSON.stringify(planData)
		}, function(data) {
			if (data.success != true) {
				alert(JSON.stringify(data));
			}
		}, "json");
	}
};
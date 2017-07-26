package com.laicunba.ops.controller;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.laicunba.ops.pojo.FeatureDO;
import com.laicunba.ops.service.FeatureService;

@Controller
@RequestMapping(value = "/console")
public class FeatureCreateController extends BaseController {

	@Autowired
	private FeatureService featureService;

	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/feature_create.htm")
	public String create(FeatureDO featureDO) {
		JSONObject json = new JSONObject();
		featureDO.setStatus("new");
		json.put("success", featureService.create(featureDO));
		return json.toJSONString();
	}
}

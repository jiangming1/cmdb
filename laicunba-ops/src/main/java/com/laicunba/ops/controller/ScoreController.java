package com.laicunba.ops.controller;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.laicunba.ops.service.FeatureService;

@Controller
@RequestMapping(value = "/console")
public class ScoreController extends BaseController {
	@Autowired
	private FeatureService featureService;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@ResponseBody
	@RequestMapping(value = "/score_pay.htm")
	public String pay(String accountId, double money) {
		JSONObject json = new JSONObject();
		json.put("code", featureService.pay(accountId, money));
		return json.toJSONString();
	}
}

package com.laicunba.ops.controller;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.laicunba.ops.util.RedisUtil;

@Controller
public class TokenController extends BaseController {
	@ResponseBody
	@RequestMapping(value = "/console/getTestApiToken.htm")
	public String getApiToken(String uid) {
		JSONObject json = new JSONObject();
		json.put("token", RedisUtil.get("USER_ID_2_TOKEN_" + uid));
		return json.toJSONString();
	}
}

package com.laicunba.ops.controller;

import java.util.HashSet;
import java.util.Set;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.laicunba.ops.util.RedisUtil;

@Controller
public class RedisQueryController extends BaseController {

	@ResponseBody
	@RequestMapping(value = "/redisQuery.htm")
	public String redisQuery(String key) {
		JSONObject json = new JSONObject();
		Set<String> keys = RedisUtil.keys(key);
		if (keys == null) {
			keys = new HashSet(); 
		}
		return toJsonArray(keys);
	}
}

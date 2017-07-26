package com.laicunba.ops.controller;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.laicunba.ops.pojo.UserCaseDO;
import com.laicunba.ops.service.UserCaseService;

@Controller
@RequestMapping(value = "/console")
public class UserCaseController extends BaseController {

	@Autowired
	private UserCaseService userCaseService;

	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/usercase_create.htm")
	public String create(UserCaseDO userCaseDO) {
		JSONObject json = new JSONObject();
		json.put("success", userCaseService.create(userCaseDO));
		return json.toJSONString();
	}
}

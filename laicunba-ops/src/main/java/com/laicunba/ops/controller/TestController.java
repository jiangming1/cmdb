package com.laicunba.ops.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {

	@ResponseBody
	@RequestMapping(value = "/test.htm")
	public String test() {
		return "ok";
	}
}

package com.laicunba.ops.controller;

import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.laicunba.ops.pojo.KeepalivedPointDO;
import com.laicunba.ops.service.KeepalivedPointService;

@Controller
public class KeepalivedController extends BaseController {
	private static Map<String, KeepalivedPointDO> PRODUCTENV_TEST_CASE = new HashMap();
	private static Map<String, KeepalivedPointDO> TESTENV_TEST_CASE = new HashMap();
	@Autowired
	private KeepalivedPointService keepalivedPointService;

	@RequestMapping(value = "/saveKeepalivedPoint.htm")
	public ModelAndView saveKeepalivedPoint(KeepalivedPointDO keepalivedPointDO, String env) {
		ModelAndView view = new ModelAndView();
		try {
			KeepalivedPointDO savedPointDO = keepalivedPointService.get(keepalivedPointDO.getKey());
			if (savedPointDO == null) {
				keepalivedPointService.create(keepalivedPointDO);
			} else {
				savedPointDO.setCnName(keepalivedPointDO.getCnName());
				savedPointDO.setInterval(keepalivedPointDO.getInterval());
				savedPointDO.setLevel(keepalivedPointDO.getLevel());
				savedPointDO.setOwner(keepalivedPointDO.getOwner());
				savedPointDO.setType(keepalivedPointDO.getType());
				savedPointDO.setUserType(keepalivedPointDO.getUserType());
				keepalivedPointService.updateSkipCheckOwner(savedPointDO);

			}
			view.setViewName("redirect:keepalived.htm?env=" + env);
			return view;
		} catch (Exception e) {
			e.printStackTrace();
			view.setViewName("redirect:keepalivedPointForm.htm?id=" + keepalivedPointDO.getId());
		}

		return view;
	}

	@RequestMapping(value = "/keepalivedPointForm.htm")
	public ModelAndView keepalivedPointForm(String id) {
		ModelAndView view = new ModelAndView();
		view.addObject("keepalivedPoint", keepalivedPointService.get(KeepalivedPointDO.class, id));
		view.setViewName("keepalivedForm.jsp");
		return view;
	}

	@ResponseBody
	@RequestMapping(value = "/keepalivedPointList.htm")
	public String keepalivedPointList(String env) {
		return toJsonArray(keepalivedPointService.list());
	}

	@RequestMapping(value = "/keepalived.htm")
	public ModelAndView keepalived(String env) {
		ModelAndView view = new ModelAndView();
		view.setViewName("keepalived.jsp");
		return view;
	}

	@ResponseBody
	@RequestMapping(value = "/lcb_keepalived.htm")
	public String lcbKeepalived(String env) {
		try {
			if ("test".equalsIgnoreCase(env)) {
				URL url = new URL("http://test.laicunba.com/keepalived.htm?auth=dEw4yXK1");
				return IOUtils.toString(url.openStream(), "utf-8");
			} else {
				URL url = new URL("http://8.laicunba.com/keepalived.htm?auth=dEw4yXK1");
				return IOUtils.toString(url.openStream(), "utf-8");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "{}";
	}

	@ResponseBody
	@RequestMapping(value = "/selectForTesting.htm")
	public String selectForTesting(String key, String env) {
		JSONObject json = new JSONObject();
		KeepalivedPointDO keepalivedPointDO = keepalivedPointService.get(key);
		if (keepalivedPointDO == null) {
			json.put("code", "NOT_STORED");
			return json.toJSONString();
		}
		keepalivedPointDO.setLastHeartbeat(System.currentTimeMillis());
		if ("test".equalsIgnoreCase(env)) {
			TESTENV_TEST_CASE.put(keepalivedPointDO.getKey(), keepalivedPointDO);
		} else {
			PRODUCTENV_TEST_CASE.put(keepalivedPointDO.getKey(), keepalivedPointDO);
		}
		json.put("key", key);
		json.put("point", keepalivedPointDO);
		json.put("code", "SUCCESS");
		return json.toJSONString();
	}

	@ResponseBody
	@RequestMapping(value = "/reportTested.htm")
	public String reportTested(String key, String env) {
		JSONObject json = new JSONObject();
		KeepalivedPointDO keepalivedPointDO = "test".equalsIgnoreCase(env) ? TESTENV_TEST_CASE.get(key) : PRODUCTENV_TEST_CASE.get(key);
		if (keepalivedPointDO != null) {
			keepalivedPointDO.setStatus("tested");
		}
		json.put("code", "SUCCESS");
		return json.toJSONString();

	}

	@ResponseBody
	@RequestMapping(value = "/clearTestArea.htm")
	public String clearTestArea(String env) {
		JSONObject json = new JSONObject();
		if ("test".equalsIgnoreCase(env)) {
			TESTENV_TEST_CASE.clear();
		} else {
			PRODUCTENV_TEST_CASE.clear();
		}
		json.put("code", "SUCCESS");
		return json.toJSONString();

	}

	@ResponseBody
	@RequestMapping(value = "/listTestCase.htm")
	public String listTestCase(String env) {

		if ("test".equalsIgnoreCase(env)) {
			return toJsonArray(TESTENV_TEST_CASE.values());
		} else {
			return toJsonArray(PRODUCTENV_TEST_CASE.values());
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/testCase.htm")
	public String testCase(String env,String key) {

		if ("test".equalsIgnoreCase(env)) {
			return toJsonObject(TESTENV_TEST_CASE.get(key));
		} else {
			return toJsonObject(PRODUCTENV_TEST_CASE.get(key));
		}
	}
	

}

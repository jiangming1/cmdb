package com.laicunba.ops.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.laicunba.ops.service.FeatureService;
import com.laicunba.ops.util.StringUtil;

@Controller
@RequestMapping(value = "/console")
public class ProductVersionController extends BaseController {

	@Autowired
	private FeatureService featureService;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/product_version.htm")
	public ModelAndView productVersion(String status) {
		ModelAndView view = new ModelAndView("product_version.jsp");
		if (StringUtil.isEmpty(status)) {
			status = "working";
		}

		List<Map<String, Object>> features = featureService.findByProductVersionStatus(status);
		Map<String, List> versionMap = new HashMap();
		for (Map<String, Object> feature : features) {
			if (!versionMap.containsKey(feature.get("product_version_id"))) {
				versionMap.put((String) feature.get("product_version_id"), new ArrayList());
			}
			versionMap.get(feature.get("product_version_id")).add(feature);
		}

		view.addObject("product_version_list", versionMap.values());
		return view;
	}

}

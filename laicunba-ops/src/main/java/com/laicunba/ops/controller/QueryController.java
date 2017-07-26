package com.laicunba.ops.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.laicunba.ops.service.QueryService;
 

@Controller
@RequestMapping(value = "/console")
public class QueryController extends BaseController {

	@Autowired
	private QueryService queryService;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@ResponseBody
	@RequestMapping(value = "/query.htm")
	public String query(String listId, String countId, Integer page, Integer rows, Integer totalRows, String order, String sort, HttpServletRequest request, String noCount) {
		Map map = new HashMap();

		Map p = new HashMap();
		Iterator it = request.getParameterMap().keySet().iterator();
		while (it.hasNext()) {
			String key = (String) it.next();
			p.put(key, request.getParameter(key));
		}

		if (totalRows == null && !"true".equalsIgnoreCase(noCount)) {
			QueryService.Parameter parameter = new QueryService.Parameter();
			parameter.setMap(p);
			parameter.setSqlId(countId);
			map.put("total", queryService.count(parameter));
		}

		QueryService.Parameter parameter = new QueryService.Parameter();
		parameter.setMap(p);
		parameter.setSqlId(listId);
		parameter.setPageNumber(page != null ? page : 1);
		parameter.setPageSize(rows != null ? rows : 10);
		parameter.setSort(sort);
		parameter.setOrder(order);
		parameter.addAttribute("sort", sort);
		parameter.addAttribute("order", order);
		map.put("rows", queryService.list(parameter));
		return toJsonObject(map);
	}
}

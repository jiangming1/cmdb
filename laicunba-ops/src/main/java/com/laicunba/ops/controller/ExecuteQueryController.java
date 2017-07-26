package com.laicunba.ops.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.laicunba.ops.service.LaicunbaDataQueryService;
import com.laicunba.ops.util.StringUtil;

@Controller
public class ExecuteQueryController {
	@Autowired
	private LaicunbaDataQueryService laicunbaDataQueryService;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@ResponseBody
	@RequestMapping(value = "executeQuery.htm")
	public String executeQuery(String querySQL) {
		Map map = new HashMap();
		map.put("success", false);
		querySQL = querySQL.trim();

		if (StringUtil.isEmpty(querySQL)) {
			map.put("reason", "请输入SQL语句");
			return JSONArray.fromObject(map).toString();
		}
		if (!querySQL.split(" ")[0].equalsIgnoreCase("select")) {
			map.put("reason", "ֻ只能执行select语句");
			return JSONArray.fromObject(map).toString();
		}
		if (querySQL.endsWith(";")) {
			querySQL = querySQL.substring(0, querySQL.length() - 1);
		}

		try {
			querySQL = String.format("select * from (%s) t limit 200", querySQL);
			map.put("success", true);
			map.put("data", laicunbaDataQueryService.query(querySQL));
			return JSONArray.fromObject(map).toString();
		} catch (Exception e) {
			map.put("success", false);
			map.put("reason", e.getMessage());
			return JSONArray.fromObject(map).toString();
		}

	}

}

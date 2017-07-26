package com.laicunba.ops.controller;

import java.sql.Timestamp;
import java.util.Date;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

public class BaseController {

	private static JsonConfig jsonConfig = new JsonConfig();
	static {
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonValueProcessor() {
			public Object processObjectValue(String arg0, Object arg1, JsonConfig arg2) {
				Date date = (Date) arg1;
				return date != null ? date.getTime() : null;
			}

			public Object processArrayValue(Object arg0, JsonConfig arg1) {
				return null;
			}
		});

		jsonConfig.registerJsonValueProcessor(Timestamp.class, new JsonValueProcessor() {
			public Object processObjectValue(String arg0, Object arg1, JsonConfig arg2) {
				Timestamp date = (Timestamp) arg1;
				return date != null ? date.getTime() : null;
			}

			public Object processArrayValue(Object arg0, JsonConfig arg1) {
				return null;
			}
		});
	}

	public String toJsonArray(Object o) {
		return JSONArray.fromObject(o, jsonConfig).toString();
	}

	public String toJsonObject(Object o) {
		return JSONObject.fromObject(o, jsonConfig).toString();
	}

	public JSONObject toJson(Object o) {
		return JSONObject.fromObject(o, jsonConfig);
	}

}

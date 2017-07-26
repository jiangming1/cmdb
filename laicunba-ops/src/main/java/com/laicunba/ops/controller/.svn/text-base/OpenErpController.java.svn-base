package com.laicunba.ops.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.laicunba.ops.service.OpenErpDataQueryService;

@Controller
@RequestMapping(value = "/console")
public class OpenErpController extends BaseController {
	@Autowired
	private OpenErpDataQueryService openErpDataQueryService;

	@Autowired
	protected SqlSessionTemplate session;

	private static SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd");

	@ResponseBody
	@RequestMapping(value = "/findCarSheetByDate.htm")
	public String findCarSheetByDate(String gmtBegin, String gmtEnd, long st, long et) {
		Map para = new HashMap();
		para.put("st", SDF.format(new Date(st)));
		para.put("et", SDF.format(new Date(et)));
		String sql = session.getSqlSessionFactory().getConfiguration().getMappedStatement("OPENERP.findCarSheetByDate")
				.getBoundSql(para).getSql();
		sql = String.format(sql, para.get("st"), para.get("et"));
		try {
			return toJsonArray(openErpDataQueryService.query(sql));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "[]";
	}

	@ResponseBody
	@RequestMapping(value = "/findBaseData.htm")
	public String findBaseData() {
		String sql = session.getSqlSessionFactory().getConfiguration().getMappedStatement("OPENERP.findBaseData")
				.getBoundSql(new HashMap()).getSql();
		try {
			return toJsonArray(openErpDataQueryService.query(sql));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "[]";
	}

	@ResponseBody
	@RequestMapping(value = "/saveCarForm.htm")
	public String saveCarForm(String data) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		JSONObject json = new JSONObject();
		try {
			// [{"date":"2016-12-29","car_id":"7","d1_id":"43","d2_id":"54","start_id":"3","end_id":"1"}]
			String insertSQL = "insert into x_car_sheet(x_time,x_driver,x_d2,x_d3,x_car,x_times,x_price,x_start,x_end)values(?,?,?,?,?,?,?,?,?)";
			JSONArray array = (JSONArray) new JSONParser().parse(data);
			for (int i = 0; i < array.size(); i++) {
				JSONObject obj = (JSONObject) array.get(i);
				try{
					
					
			
					openErpDataQueryService.execute(insertSQL, new Object[] {
							sdf.parse(obj.get("date").toString())
							,obj.containsKey("d1_id")?Integer.parseInt(obj.get("d1_id").toString()):null
							,obj.containsKey("d2_id")?Integer.parseInt(obj.get("d2_id").toString()):null
							,obj.containsKey("d3_id")?Integer.parseInt(obj.get("d3_id").toString()):null						
							,obj.containsKey("car_id")?Integer.parseInt(obj.get("car_id").toString()):null
							,obj.containsKey("times")?Integer.parseInt(obj.get("times").toString()):1
							,obj.containsKey("price")?Double.parseDouble(obj.get("price").toString()):0
							,obj.containsKey("start_id")?Integer.parseInt(obj.get("start_id").toString()):null
							,obj.containsKey("end_id")?Integer.parseInt(obj.get("end_id").toString()):null 
					});
				
				}catch(Exception e){
					
				}
				System.out.println(array.get(i));
			}
			System.out.println(data);

			json.put("code", "success");
		} catch (Exception e) {
			e.printStackTrace();
			json.put("code", "error");
		}
		return json.toJSONString();
	}

}

package com.laicunba.ops.controller;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.laicunba.ops.exception.MyException;
import com.laicunba.ops.pojo.UpdateSqlDO;
import com.laicunba.ops.service.UpdateSqlService;

@Controller
public class UpdateController extends BaseController {
	@Autowired
	private UpdateSqlService updateSqlService;
	@Value("${db.update.confirm.pwd}")
	private String confirmPwd;

	@ResponseBody
	@RequestMapping(value = "/saveSQL.htm")
	public String saveSQL(String summary, String sql) {
		UpdateSqlDO updateSqlDO = new UpdateSqlDO();
		updateSqlDO.setSummary(summary);
		updateSqlDO.setSql(sql);
		JSONObject json = new JSONObject();
		json.put("success", updateSqlService.create(updateSqlDO));
		json.put("id", updateSqlDO.getId());
		return json.toJSONString();
	}

	@ResponseBody
	@RequestMapping(value = "/executeUpdateSQL.htm")
	public String executeUpdateSQL(String id, String pwd) {
		JSONObject json = new JSONObject();
		if (!confirmPwd.equals(pwd)) {
			json.put("code", "PWD_ERROR");
			return json.toJSONString();
		}
		try {
			json.put("success", updateSqlService.execute(id));
		} catch (MyException e) {
			json.put("code", e.getCode());
		} catch (Exception e) {
			json.put("code", e.getMessage());
		}

		return json.toJSONString();
	}

	@RequestMapping(value = "/updateSQList.htm")
	public ModelAndView list() {
		ModelAndView view = new ModelAndView();
		view.setViewName("data_update.jsp");

		List<UpdateSqlDO> updateSqlDOList = updateSqlService.listLast();
		view.addObject("updateSqlDOList", updateSqlDOList);
		return view;
	}
}

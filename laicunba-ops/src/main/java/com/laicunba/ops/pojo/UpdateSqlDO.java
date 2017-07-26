package com.laicunba.ops.pojo;

import org.springframework.stereotype.Component;

import com.laicunba.ops.annotation.MyTable;

@MyTable
@Component
public class UpdateSqlDO extends BaseDO {
	
	private String summary;
	private String sql;
	private String status;
	private int effectRows;
	public String getSummary() {
		return summary;
	}
	public String getSql() {
		return sql;
	}
	public String getStatus() {
		return status;
	}
	public int getEffectRows() {
		return effectRows;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public void setSql(String sql) {
		this.sql = sql;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setEffectRows(int effectRows) {
		this.effectRows = effectRows;
	}
	
	
}

package com.laicunba.ops.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
 

public interface QueryService {

	@SuppressWarnings("rawtypes")
	class Parameter {
		private Map map = new HashMap();
		private int totalRows;
		private int pageNumber;
		private int pageSize;
		private String sqlId;
		private String sort;
		private String order;

		public String getSort() {
			return sort;
		}

		public String getOrder() {
			return order;
		}

		public void setSort(String sort) {
			this.sort = sort;
		}

		public void setOrder(String order) {
			this.order = order;
		}

		public void setSqlId(String sqlId) {
			this.sqlId = sqlId;
		}

		public String getSqlId() {
			return sqlId;
		}

		public void addAttribute(String name, Object value) {
			map.put(name, value);
		}

		public Map getMap() {
			return map;
		}

		public int getTotalRows() {
			return totalRows;
		}

		public int getPageNumber() {
			return pageNumber;
		}

		public int getPageSize() {
			return pageSize;
		}

		public void setMap(Map map) {
			this.map = map;
		}

		public void setTotalRows(int totalRows) {
			this.totalRows = totalRows;
		}

		public void setPageNumber(int pageNumber) {
			this.pageNumber = pageNumber;
		}

		public void setPageSize(int pageSize) {
			this.pageSize = pageSize;
		}

	}

	List<Map<String, Object>> list(Parameter parameter);

	int count(Parameter parameter);

	String getSql(String sqlid);

}

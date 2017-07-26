package com.laicunba.ops.service.impl;

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

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.laicunba.ops.service.LaicunbaTestDataQueryService;

@Service
public class LaicunbaTestDataQueryServiceImpl implements LaicunbaTestDataQueryService {
	@Value("${db.aliyuntest.url}")
	private String url;
	@Value("${db.aliyuntest.username}")
	private String user;
	@Value("${db.aliyuntest.pwd}")
	private String pwd;

	static {
		try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public List<Map<String, String>> query(String querySQL) throws Exception {
		if (!querySQL.split(" ")[0].equalsIgnoreCase("Update")) {
			return null;
		}
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(this.url, user, pwd);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(querySQL);
			ResultSetMetaData rsmd = rs.getMetaData();

			List<Map<String, String>> list = new ArrayList();
			while (rs.next()) {
				Map<String, String> map = new HashMap();
				int columnCount = rsmd.getColumnCount();
				for (int i = 0; i < columnCount; i++) {
					String name = rsmd.getColumnName(i + 1);
					String value = rs.getString(i + 1);
					map.put(name, value == null ? "NULL" : value);
				}

				list.add(map);
			}
			return list;
		} finally {
			try {
				if(conn!=null)
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}
}

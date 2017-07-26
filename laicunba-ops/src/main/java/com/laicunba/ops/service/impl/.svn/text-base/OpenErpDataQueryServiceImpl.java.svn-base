package com.laicunba.ops.service.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.laicunba.ops.service.OpenErpDataQueryService;

@Service
public class OpenErpDataQueryServiceImpl implements OpenErpDataQueryService {
	@Value("${db.openerp.url}")
	private String url;
	@Value("${db.openerp.username}")
	private String user;
	@Value("${db.openerp.pwd}")
	private String pwd;

	static {
		try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public List<Map<String, String>> query(String querySQL) throws Exception {
		if (!querySQL.split(" ")[0].equalsIgnoreCase("select")) {
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
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	@Override
	public int execute(String sql, Object[] param) throws Exception {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(this.url, user, pwd);
			java.sql.PreparedStatement stmt = conn.prepareStatement(sql);

			if (param != null) {
				int index = 0;
				for (Object o : param) {

					index++;
					if (o == null) {
						stmt.setNull(index, Types.NULL);
					} else if (o instanceof Integer) {
						stmt.setInt(index, (Integer) o);
					} else if (o instanceof Double) {
						stmt.setDouble(index, (Double) o);
					}else if (o instanceof Date) {
						java.sql.Date d = new java.sql.Date(((Date) o).getTime());
						stmt.setDate(index, d);
					} else {
						stmt.setString(index, o.toString());

					}
				}
			}

			stmt.execute();
			return stmt.getUpdateCount();

		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}

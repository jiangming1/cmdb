package com.laicunba.ops.service.impl;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.laicunba.ops.annotation.MyColumn;
import com.laicunba.ops.annotation.MyTable;
import com.laicunba.ops.pojo.BaseDO;
import com.laicunba.ops.service.TableAutoCreateService;
import com.laicunba.ops.util.StringUtil;

 

@Service
public class TableAutoCreateServiceImpl implements TableAutoCreateService {
	private final static Logger LOG = Logger.getLogger(TableAutoCreateServiceImpl.class);
	private static String TABLE_NAME = "ops_";
	private static String SPLIT_WORDS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	@Value("${db.url}")
	private String url;
	@Value("${db.username}")
	private String user;
	@Value("${db.pwd}")
	private String pwd;
	@Autowired
	private List<BaseDO> doList;

	public void setUrl(String url) {
		this.url = url;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	@Override
	public boolean create() {

		for (Object obj : doList) {

			String className = obj.getClass().getName().replace(".class", "");
			if ("BaseDO".equals(className)) {
				continue;
			}
			LOG.info("解析实体类:" + className);
			try {

				if (obj.getClass().getAnnotation(MyTable.class) == null) {
					continue;
				}
				createTable(obj);
				parserObject(obj);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return true;
	}

	private void createTable(Object obj) {
		String tableName = getTableName(obj);
		if (tableExist(tableName)) {
			return;
		}
		String ddl = String.format("CREATE TABLE %s ()", tableName);
		executeDDL(ddl);

	}

	private void executeDDL(String ddl) {
		try {
			Connection conn = getConn();
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(ddl);
			LOG.info(ddl);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private boolean tableExist(String tableName) {
		String sql = String.format("select count(*) from pg_class where relname = '%s'", tableName);
		List<Map<String, String>> rs = query(sql);
		return Integer.parseInt(rs.get(0).get("count")) > 0;
	}

	private Connection conn;

	private Connection getConn() {
		if (conn != null) {
			return conn;
		}
		try {
			Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection(url, user, pwd);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;

	}

	private List<Map<String, String>> query(String sql) {
		List list = new ArrayList();
		try {
			Connection conn = getConn();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();
			int columnCount = rsmd.getColumnCount();
			while (rs.next()) {
				Map map = new HashMap();
				list.add(map);
				for (int i = 0; i < columnCount; i++) {
					String columnName = rsmd.getColumnName(i + 1).toLowerCase();
					String value = rs.getString(i + 1);
					map.put(columnName, value);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	private String getTableName(Object obj) {
		String tableName = TABLE_NAME + change2dbFormat(obj.getClass().getSimpleName());
		tableName = tableName.replace("_D_O", "").toLowerCase();
		return tableName;
	}

	private void parserObject(Object obj) {
		for (Method method : obj.getClass().getMethods()) {
			String methodName = method.getName();
			if (methodName.equals("getClass")) {
				continue;
			}
			if (!methodName.startsWith("get") && !methodName.startsWith("is")) {
				continue;
			}
			String columnName = new String();
			if (methodName.startsWith("get")) {
				columnName = methodName.substring(3);
			}
			if (methodName.startsWith("is")) {
				columnName = methodName.substring(2);
			}

			columnName = change2dbFormat(columnName.toString());
			createColumn(obj, method, columnName.toLowerCase());
		}
	}

	private String change2dbFormat(String string) {
		StringBuffer sb = new StringBuffer(string);
		int len = sb.length();
		for (int i = 1; i < len; i++) {
			if (!SPLIT_WORDS.contains(sb.charAt(i) + "")) {
				continue;
			}
			sb.insert(i, "_");
			i++;
			len++;
		}
		return sb.toString();
	}

	private void createColumn(Object obj, Method method, String columnName) {
		String tableName = getTableName(obj);
		boolean isPrimaryKey = false;
		String typeDef = null;
		Class typeClazz = method.getReturnType();
		String typeName = typeClazz.getName();
		String propertyName = null;
		if (method.getName().startsWith("get")) {
			propertyName = method.getName().substring(3);
		} else if (method.getName().startsWith("is")) {
			propertyName = method.getName().substring(2);
		}
		propertyName = propertyName.substring(0, 1).toLowerCase() + propertyName.substring(1);

		try {
			Field field = obj.getClass().getDeclaredField(propertyName);
			MyColumn myColumn = field.getAnnotation(MyColumn.class);
			if (myColumn != null) {
				columnName = StringUtil.isNotEmpty(myColumn.name()) ? myColumn.name() : columnName;
				typeDef = StringUtil.isNotEmpty(myColumn.type()) ? myColumn.type() : typeDef;
				// isPrimaryKey = myColumn.key();

			}
		} catch (Exception e) {

		}
		if (columnExist(tableName, columnName)) {
			return;
		}
		isPrimaryKey = "id".equals(columnName);
		if (StringUtil.isEmpty(typeDef)) {
			if ("int".equals(typeName) || "java.lang.Integer".equals(typeName)) {
				typeDef = "INT4";
			} else if ("long".equals(typeName) || "java.lang.Long".equals(typeName)) {
				typeDef = "int8";
			} else if ("double".equals(typeName) || "java.lang.Double".equals(typeName)) {
				typeDef = "float8";
			} else if ("float".equals(typeName) || "java.lang.Float".equals(typeName)) {
				typeDef = "float4";
			} else if ("boolean".equals(typeName) || "java.lang.Boolean".equals(typeName)) {
				typeDef = "bool";
			} else if ("java.lang.String".equals(typeName)) {
				if (columnName.endsWith("id")) {
					typeDef = "VARCHAR(64)";
				} else {
					typeDef = "VARCHAR";
				}
			} else if ("java.util.Date".equals(typeName)) {
				typeDef = "timestamp";
			} else if ("java.math.BigDecimal".equals(typeName)) {
				typeDef = "numeric(32,2)";
			} else {
				return;
			}
		}
		if (typeDef == null) {
			return;
		}
		if (isPrimaryKey) {
			typeDef += " PRIMARY KEY";
		}
		String ddl = String.format("ALTER table %s ADD COLUMN %s %s ", tableName, columnName, typeDef);

		executeDDL(ddl);

	}

	private boolean columnExist(String tableName, String columnName) {
		String sql = String.format("select count(*)from information_schema.columns where table_name = '%s' and column_name='%s'", tableName, columnName);
		List<Map<String, String>> rs = query(sql);
		return Integer.parseInt(rs.get(0).get("count")) > 0;
	}

}

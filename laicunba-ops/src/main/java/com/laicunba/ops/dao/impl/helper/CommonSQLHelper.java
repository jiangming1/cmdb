package com.laicunba.ops.dao.impl.helper;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import com.laicunba.ops.annotation.MyColumn;
import com.laicunba.ops.annotation.MyTable;
import com.laicunba.ops.util.StringUtil;

 

public class CommonSQLHelper {

	private static String SPLIT_WORDS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	/**
	 * column-->propertity
	 */
	private static Map<String, Map<String, String>> CACHE = new HashMap();
	private static Map<String, PrimaryKey> PRIMARYKEY_CACHE = new HashMap();

	public static String getTableName(Object entity) {
		return getTableName(entity.getClass());
	}

	public static String getTableName(Class clazz) {
		String tableName = change2dbFormat(clazz.getSimpleName());
		return "ops_" + tableName.replace("_D_O", "").toUpperCase();
	}

	public static String getInsertSQL(Object entity) {
		Map<String, String> columns = getColumnAndProperties(entity.getClass());
		if (columns == null) {
			throw new RuntimeException(entity.getClass() + " 获取不到字段关系!");
		}
		StringBuffer columnSB = new StringBuffer();
		StringBuffer propertySB = new StringBuffer();
		for (String column : columns.keySet()) {
			columnSB.append(column).append(",");
			if ("gmtCreate".equals(columns.get(column)) || "gmtWrite".equals(columns.get(column))) {
				propertySB.append("now(),");
			} else {
				propertySB.append("#{").append(columns.get(column)).append("},");
			}
		}
		if (columnSB.length() > 0) {
			columnSB.deleteCharAt(columnSB.length() - 1);
			propertySB.deleteCharAt(propertySB.length() - 1);
		}
		return String.format("INSERT INTO %s(%s)values(%s)", getTableName(entity), columnSB.toString(), propertySB.toString());
	}

	private static Map<String, String> getColumnAndProperties(Class clazz) {
		if (clazz.getAnnotation(MyTable.class) == null) {
			throw new RuntimeException(clazz.getName() + " 不是一个实体类!");
		}

		String tableName = getTableName(clazz);
		if (CACHE.containsKey(tableName)) {
			return CACHE.get(tableName);
		}
		Map<String, String> map = new HashMap();
		for (Method method : clazz.getMethods()) {
			String methodName = method.getName();
			if (methodName.equals("getClass")) {
				continue;
			}
			if (!methodName.startsWith("get") && !methodName.startsWith("is")) {
				continue;
			}
			String pName = new String();
			if (methodName.startsWith("get")) {
				pName = methodName.substring(3);
			}
			if (methodName.startsWith("is")) {
				pName = methodName.substring(2);
			}
			pName = pName.substring(0, 1).toLowerCase() + pName.substring(1);
			String columnName = null;

			try {
				Field filed = clazz.getDeclaredField(pName);
				MyColumn myColumn = filed.getAnnotation(MyColumn.class);
				if (myColumn != null) {
					columnName = StringUtil.isNotEmpty(myColumn.name()) ? myColumn.name() : columnName;
				}
			} catch (Exception e) {

			}

			if (StringUtil.isEmpty(columnName)) {
				columnName = change2dbFormat(pName);
			}
			map.put(columnName, pName);
		}
		CACHE.put(tableName, map);
		return map;
	}

	public static String change2dbFormat(String string) {
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

	public static String getDeleteSQL(Class clazz) {
		PrimaryKey primaryKey = getPrimaryKey(clazz);
		if (primaryKey == null) {
			throw new RuntimeException(clazz + " 缺少主键!");
		}
		return String.format("delete from %s where %s = #{entityId} and owner_id = #{del_user}", getTableName(clazz), primaryKey.getColumn());
	}

	private static PrimaryKey getPrimaryKey(Class clazz) {
		if (true) {
			PrimaryKey key = new PrimaryKey();
			key.setColumn("id");
			key.setAttrName("id");
			return key;
		}
		String tableName = getTableName(clazz);
		if (PRIMARYKEY_CACHE.containsKey(tableName)) {
			return PRIMARYKEY_CACHE.get(tableName);
		}
		PrimaryKey key = null;
		for (Method method : clazz.getMethods()) {
			String methodName = method.getName();
			if (methodName.equals("getClass")) {
				continue;
			}
			if (!methodName.startsWith("get") && !methodName.startsWith("is")) {
				continue;
			}
			String pName = new String();
			if (methodName.startsWith("get")) {
				pName = methodName.substring(3);
			}
			if (methodName.startsWith("is")) {
				pName = methodName.substring(2);
			}
			pName = pName.substring(0, 1).toLowerCase() + pName.substring(1);

			try {
				Field filed = clazz.getDeclaredField(pName);
				MyColumn myColumn = filed.getAnnotation(MyColumn.class);
				if (myColumn != null && myColumn.key()) {
					key = new PrimaryKey();
					key.setColumn(change2dbFormat(pName));
					key.setAttrName(pName);
					PRIMARYKEY_CACHE.put(tableName, key);
					break;
				}
			} catch (Exception e) {

			}
		}
		return key;
	}

	public static String getUpdateSQL(Class clazz) {
		// update XXX set a=a,b=b where id=id
		Map<String, String> columns = getColumnAndProperties(clazz);
		PrimaryKey key = getPrimaryKey(clazz);
		if (columns == null) {
			throw new RuntimeException(clazz + " 获取不到字段关系!");
		}
		if (key == null) {
			throw new RuntimeException(clazz + " 缺少主键!");
		}
		StringBuffer setContent = new StringBuffer();
		for (String column : columns.keySet()) {
			if (column.equals(key.getColumn())) {
				continue;
			}
			String attrName = columns.get(column);
			if ("gmtCreate".equals(attrName) || "createUid".equals(attrName) || "ownerId".equals(attrName)) {
				continue;
			}
			if ("gmtWrite".equals(attrName)) {
				setContent.append(column).append("=").append("now(),");
			} else {
				setContent.append(column).append("=").append("#{").append(attrName).append("},");
			}
		}
		if (setContent.length() > 0) {
			setContent.deleteCharAt(setContent.length() - 1);
		}
		return String.format("update %s set %s where %s=#{%s} ", getTableName(clazz), setContent.toString(), key.getColumn(), key.getAttrName());
	}

	public static String getGetSQL(Class clazz) {
		PrimaryKey key = getPrimaryKey(clazz);
		if (key == null) {
			throw new RuntimeException(clazz + " 缺少主键!");
		}
		return String.format("select * from %s where %s = #{%s}", getTableName(clazz), key.getColumn(), key.getAttrName());
	}
}

class PrimaryKey {
	private String column;
	private String attrName;

	public String getColumn() {
		return column;
	}

	public void setColumn(String column) {
		this.column = column;
	}

	public String getAttrName() {
		return attrName;
	}

	public void setAttrName(String attrName) {
		this.attrName = attrName;
	}

}
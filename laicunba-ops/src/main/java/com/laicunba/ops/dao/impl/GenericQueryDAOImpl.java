package com.laicunba.ops.dao.impl;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.builder.SqlSourceBuilder;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.ResultMap;
import org.apache.ibatis.mapping.ResultMapping;
import org.apache.ibatis.mapping.SqlCommandType;
import org.apache.ibatis.mapping.SqlSource;
import org.mybatis.spring.MyBatisSystemException;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.laicunba.ops.annotation.MyColumn;
import com.laicunba.ops.dao.GenericQueryDao;
import com.laicunba.ops.dao.impl.helper.CommonSQLHelper;
import com.laicunba.ops.util.StringUtil;

 

@Component
public class GenericQueryDAOImpl implements GenericQueryDao {

	@Autowired
	protected SqlSessionTemplate session;

	@Override
	public <T> T selectOne(String sqlId, Object parameter) {
		return session.selectOne(sqlId, parameter);
	}

	@Override
	public <T> List<T> selectList(String sqlId, Object param) {
		return session.selectList(sqlId, param);
	}

	@Override
	public <T> T getEntity(Class clazz, String entityId) {
		String sqlKey = "AUTOSQL_GET_" + CommonSQLHelper.getTableName(clazz);
		try {
			return session.selectOne(sqlKey, entityId);
		} catch (MyBatisSystemException e) {
			SqlSourceBuilder sqlSourceBuilder = new SqlSourceBuilder(session.getConfiguration());
			String getSQL = CommonSQLHelper.getGetSQL(clazz);
			System.out.println(getSQL);
			SqlSource sqlSource = sqlSourceBuilder.parse(getSQL, clazz, null);
			MappedStatement.Builder builder = new MappedStatement.Builder(session.getConfiguration(), sqlKey, sqlSource, SqlCommandType.SELECT);
			List mappingList = new ArrayList();
			List resultMapList = new ArrayList();
			// 设置返回值绑定
			for (Method method : clazz.getMethods()) {
				String methodName = method.getName();
				if (methodName.equals("getClass")) {
					continue;
				}
				if (!methodName.startsWith("get") && !methodName.startsWith("is")) {
					continue;
				}
				String attrName = new String();
				if (methodName.startsWith("get")) {
					attrName = methodName.substring(3);
				}
				if (methodName.startsWith("is")) {
					attrName = methodName.substring(2);
				}
				attrName = attrName.substring(0, 1).toLowerCase() + attrName.substring(1);
				String columnName = null;
				try {
					Field filed = clazz.getDeclaredField(attrName);
					MyColumn myColumn = filed.getAnnotation(MyColumn.class);
					if (myColumn != null && StringUtil.isNotEmpty(myColumn.name())) {
						columnName = myColumn.name();
					}
				} catch (Exception e1) {

				}
				if (StringUtil.isEmpty(columnName)) {
					columnName = CommonSQLHelper.change2dbFormat(attrName);
				}
				ResultMapping.Builder mappingBuilder = new ResultMapping.Builder(session.getConfiguration(), attrName);
				mappingBuilder.javaType(method.getReturnType());
				mappingBuilder.column(columnName);
				mappingList.add(mappingBuilder.build());
			}

			ResultMap.Builder mapBuilder = new ResultMap.Builder(session.getConfiguration(), "AUTOSQL_GET_MAP_" + clazz.getSimpleName(), clazz, mappingList);

			resultMapList.add(mapBuilder.build());
			builder.resultMaps(resultMapList);
			session.getConfiguration().addMappedStatement(builder.build());

			return session.selectOne(sqlKey, entityId);
		}
	}

}

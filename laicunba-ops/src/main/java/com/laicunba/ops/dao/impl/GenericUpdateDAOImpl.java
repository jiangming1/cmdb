package com.laicunba.ops.dao.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.builder.SqlSourceBuilder;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.SqlCommandType;
import org.apache.ibatis.mapping.SqlSource;
import org.mybatis.spring.MyBatisSystemException;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.laicunba.ops.dao.GenericUpdateDao;
import com.laicunba.ops.dao.impl.helper.CommonSQLHelper;
import com.laicunba.ops.pojo.BaseDO;
import com.laicunba.ops.util.SessionUtil;

 

@Component
public class GenericUpdateDAOImpl implements GenericUpdateDao {

	@Autowired
	protected SqlSessionTemplate session;

	@Override
	public int update(String sqlId, Object param) {
		return session.update(sqlId, param);
	}

	@Override
	public int insert(String sqlId, Object param) {
		return session.insert(sqlId, param);
	}

	@Override
	public int delete(String sqlId, Object param) {
		return session.delete(sqlId, param);
	}

	@Override
	public int createEntity(Object entity) {
		String sqlKey = "AUTOSQL_CREATE_" + CommonSQLHelper.getTableName(entity);
		try {
			return session.insert(sqlKey, entity);
		} catch (MyBatisSystemException e) {
			SqlSourceBuilder sqlSourceBuilder = new SqlSourceBuilder(session.getConfiguration());
			SqlSource sqlSource = sqlSourceBuilder.parse(CommonSQLHelper.getInsertSQL(entity), entity.getClass(), null);
			MappedStatement.Builder builder = new MappedStatement.Builder(session.getConfiguration(), sqlKey, sqlSource, SqlCommandType.INSERT);
			session.getConfiguration().addMappedStatement(builder.build());
			return session.insert(sqlKey, entity);
		}

	}

	@Override
	public int deleteEntity(Class clazz, String entityId) {
		String sqlKey = "AUTOSQL_DELETE_" + CommonSQLHelper.getTableName(clazz);
		Map p = new HashMap();
		p.put("entityId", entityId);
		p.put("del_user", SessionUtil.CURRENT_USER_ID.get());
		// 测试的时候将权限默认为root
		// p.put("del_user", "root");
		try {
			return session.delete(sqlKey, p);
		} catch (MyBatisSystemException e) {
			SqlSourceBuilder sqlSourceBuilder = new SqlSourceBuilder(session.getConfiguration());
			String deleteSQL = CommonSQLHelper.getDeleteSQL(clazz);
			System.out.println(deleteSQL);
			SqlSource sqlSource = sqlSourceBuilder.parse(deleteSQL, Map.class, null);
			MappedStatement.Builder builder = new MappedStatement.Builder(session.getConfiguration(), sqlKey, sqlSource, SqlCommandType.DELETE);
			session.getConfiguration().addMappedStatement(builder.build());
			return session.delete(sqlKey, p);
		}
	}

	@Override
	public int updateEntity(BaseDO entiry) {
		String sqlKey = "AUTOSQL_UPDATE_" + CommonSQLHelper.getTableName(entiry);
		try {
			return session.update(sqlKey, entiry);
		} catch (MyBatisSystemException e) {
			SqlSourceBuilder sqlSourceBuilder = new SqlSourceBuilder(session.getConfiguration());
			String updateSQL = CommonSQLHelper.getUpdateSQL(entiry.getClass());
			System.out.println(updateSQL);
			SqlSource sqlSource = sqlSourceBuilder.parse(updateSQL, entiry.getClass(), null);
			MappedStatement.Builder builder = new MappedStatement.Builder(session.getConfiguration(), sqlKey, sqlSource, SqlCommandType.UPDATE);
			session.getConfiguration().addMappedStatement(builder.build());
			return session.update(sqlKey, entiry);
		}
	}

}

package com.laicunba.ops.dao;

import java.util.List;

public interface GenericQueryDao {

	<T> T selectOne(String sqlId, Object param);

	<T> List<T> selectList(String sqlId, Object param);

	<T> T getEntity(Class clazz, String entityId);

}

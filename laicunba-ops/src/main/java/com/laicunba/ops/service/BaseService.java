package com.laicunba.ops.service;

import com.laicunba.ops.pojo.BaseDO;
 

public interface BaseService {
	boolean create(BaseDO entity);

	boolean update(BaseDO entity);

	/**
	 * 不管这个数据的所有者是谁,只根据ID进行修改 <h4 style="color:red">
	 * 注意:调这该接口的时候场景要非常小心,请确保不会出现数据权限问题</h4>
	 * 
	 * @param entity
	 * @return
	 */
	boolean updateSkipCheckOwner(BaseDO entity);

	<T> T get(Class<T> clazz, String entityId);

	boolean delete(Class clazz, String entityId);

}

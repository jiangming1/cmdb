package com.laicunba.ops.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.laicunba.ops.dao.GenericQueryDao;
import com.laicunba.ops.dao.GenericUpdateDao;
import com.laicunba.ops.pojo.BaseDO;
import com.laicunba.ops.service.BaseService;
import com.laicunba.ops.util.SessionUtil;
import com.laicunba.ops.util.StringUtil;

 

public class BaseServiceImpl implements BaseService {
	@Autowired
	protected GenericUpdateDao updateDao;
	@Autowired
	protected GenericQueryDao queryDao;

	@Override
	public boolean create(BaseDO entiry) {

		if (StringUtil.isEmpty(entiry.getId())) {
			entiry.generatorKey();
		}
		entiry.setCreateUid(SessionUtil.CURRENT_USER_ID.get());
		entiry.setOwnerId(SessionUtil.CURRENT_USER_ID.get());
		entiry.setWriteUid(SessionUtil.CURRENT_USER_ID.get());
		return updateDao.createEntity(entiry) == 1;
	}

	@Transactional
	@Override
	public boolean update(BaseDO entiry) {
		if (SessionUtil.CURRENT_USER_ID.get() == null || !SessionUtil.CURRENT_USER_ID.get().equals(entiry.getOwnerId())) {
			return false;
		}
		entiry.setWriteUid(SessionUtil.CURRENT_USER_ID.get());

		// 测试的时候将其默认添加root权限
		// entiry.setWriteUid("root");

		return updateDao.updateEntity(entiry) == 1;

	}

	@Transactional
	@Override
	public boolean updateSkipCheckOwner(BaseDO entity) {
		entity.setWriteUid(SessionUtil.CURRENT_USER_ID.get());
		return updateDao.updateEntity(entity) == 1;
	}

	@Override
	public <T> T get(Class<T> clazz, String entityId) {

		return queryDao.getEntity(clazz, entityId);
	}

	@Override
	public boolean delete(Class clazz, String entityId) {
		return updateDao.deleteEntity(clazz, entityId) == 1;
	}

}

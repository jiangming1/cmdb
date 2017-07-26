package com.laicunba.ops.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.laicunba.ops.pojo.KeepalivedPointDO;
import com.laicunba.ops.service.KeepalivedPointService;

@Service
public class KeepalivedPointServiceImpl extends BaseServiceImpl implements KeepalivedPointService {

	@Override
	public KeepalivedPointDO get(String key) {
		return queryDao.selectOne("KEEPALIVED_POINT.findByKey", key);
	}

	@Override
	public List<KeepalivedPointDO> list() {

		return queryDao.selectList("KEEPALIVED_POINT.list", null);
	}
}

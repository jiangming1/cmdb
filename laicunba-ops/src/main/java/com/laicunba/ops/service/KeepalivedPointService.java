package com.laicunba.ops.service;

import java.util.List;

import com.laicunba.ops.pojo.KeepalivedPointDO;

public interface KeepalivedPointService extends BaseService {

	KeepalivedPointDO get(String key);

	List<KeepalivedPointDO> list();

}

package com.laicunba.ops.service;

import java.util.List;

import com.laicunba.ops.pojo.UpdateSqlDO;

public interface UpdateSqlService extends BaseService {

	boolean execute(String id);

	List<UpdateSqlDO> listLast();

}

package com.laicunba.ops.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.laicunba.ops.service.FeatureService;
import com.laicunba.ops.util.StringUtil;

@Service
public class FeatureServiceImpl extends BaseServiceImpl implements FeatureService {

	@Override
	public List<Map<String, Object>> findByProductVersionStatus(String productVersionStatus) {

		return queryDao.selectList("FEATURE.findByProductVersionStatus", productVersionStatus);
	}

	@Transactional
	@Override
	public boolean pay(String accountId, double money) { 
		Float balance = queryDao.selectOne("SCORE.getBalance", accountId);
		updateDao.update("SCORE.clearScore", accountId);
		Map map = new HashMap();
		map.put("accountId", accountId);
		map.put("money", money); 
		map.put("id", StringUtil.genGUID());  
		map.put("balance", 0-balance);  
		return updateDao.insert("SCORE.scorePayLog", map)==1;
	}

}

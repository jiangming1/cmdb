package com.laicunba.ops.service;

import java.util.List;
import java.util.Map;

public interface FeatureService extends BaseService {

	List<Map<String, Object>> findByProductVersionStatus(String productVersionStatus);

	boolean pay(String accountId, double money);

}

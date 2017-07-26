package com.laicunba.ops.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.mapping.MappedStatement;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.laicunba.ops.dao.GenericQueryDao;
import com.laicunba.ops.service.QueryService;
import com.laicunba.ops.util.StringUtil;

 

@Service
public class QueryServiceImpl implements QueryService {
	private static final Logger LOG = Logger.getLogger(QueryServiceImpl.class);
	@SuppressWarnings("unused")
	private static Map<String, Boolean> SAFE_SQLID_MAP = new HashMap<String, Boolean>();

	@Autowired
	private GenericQueryDao queryDao;

	@Autowired
	protected SqlSessionTemplate session;

	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	@Override
	public List<Map<String, Object>> list(Parameter parameter) {
		if (StringUtil.isEmpty(parameter.getSqlId())) {
			return null;
		}
		if (!SAFE_SQLID_MAP.containsKey(parameter.getSqlId())) {
			MappedStatement stmt = session.getConfiguration().getMappedStatement(parameter.getSqlId());

			parameter.addAttribute("offset", 0);
			parameter.addAttribute("limit", 0);
			if (stmt.getSqlSource().getBoundSql(parameter.getMap()).getSql().toUpperCase().startsWith("SELECT")) {
				SAFE_SQLID_MAP.put(parameter.getSqlId(), true);
			}
		}

		if (!SAFE_SQLID_MAP.containsKey(parameter.getSqlId())) {
			LOG.error("sql语句[" + parameter.getSqlId() + "]可能不存在,或是不安全!");
			return null;
		}

		int offset = (parameter.getPageNumber() - 1) * parameter.getPageSize();
		parameter.addAttribute("offset", offset);
		parameter.addAttribute("limit", parameter.getPageSize());
		return queryDao.selectList(parameter.getSqlId(), parameter.getMap());
	}

	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	@Override
	public int count(Parameter parameter) {
		if (StringUtil.isEmpty(parameter.getSqlId())) {
			return 0;
		}
		if (!SAFE_SQLID_MAP.containsKey(parameter.getSqlId())) {
			MappedStatement stmt = session.getConfiguration().getMappedStatement(parameter.getSqlId());

			if (stmt.getSqlSource().getBoundSql(parameter.getMap()).getSql().toUpperCase().startsWith("SELECT")) {
				SAFE_SQLID_MAP.put(parameter.getSqlId(), true);
			}
		}

		if (!SAFE_SQLID_MAP.containsKey(parameter.getSqlId())) {
			LOG.error("sql语句[" + parameter.getSqlId() + "]可能不存在,或是不安全!");
			return 0;
		}
		return queryDao.selectOne(parameter.getSqlId(), parameter.getMap());
	}

	@Override
	public String getSql(String sqlid) {
		return session.getConfiguration().getMappedStatement(sqlid).getSqlSource().getBoundSql(new HashMap()).getSql();
	}

}

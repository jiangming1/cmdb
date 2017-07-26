package com.laicunba.ops.service.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.laicunba.ops.pojo.UpdateSqlDO;
import com.laicunba.ops.service.UpdateSqlService;
import com.laicunba.ops.util.AssertUtil;
import com.laicunba.ops.util.StringUtil;

@Service
public class UpdateSqlServiceImpl extends BaseServiceImpl implements UpdateSqlService {
	static {
		try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Value("${db.update.url}")
	private String url;

	@Value("${db.update.username}")
	private String userName;

	@Value("${db.update.pwd}")
	private String pwd;

	@Transactional
	@Override
	public boolean execute(String id) {
		UpdateSqlDO updateSqlDO = get(UpdateSqlDO.class, id);
		AssertUtil.assertNotNull(updateSqlDO, "CANT_FIND_SQL");
		AssertUtil.assertTrue(StringUtil.isNotEmpty(updateSqlDO.getSql()), "CANT_FIND_SQL");
		String firstWord = updateSqlDO.getSql().trim().toUpperCase().split(" ")[0];
		if (!"update".equalsIgnoreCase(firstWord) && !"delete".equalsIgnoreCase(firstWord) && !"insert".equalsIgnoreCase(firstWord)) {
			AssertUtil.assertFail("SQL_NOT_EXECUTEABLE");
		}
		if (updateSqlDO.getSql().endsWith(";")) {
			AssertUtil.assertFail("SQL_NOT_EXECUTEABLE");
		}
		AssertUtil.assertTrue(StringUtil.isEmpty(updateSqlDO.getStatus()), "STATUS_ERROR");
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, userName, pwd);
			conn.setAutoCommit(false);
			Statement stmt = conn.createStatement();

			int updateCount = stmt.executeUpdate(updateSqlDO.getSql());
			if (updateCount == 0) {
				return false;
			}
			if (stmt.getUpdateCount() > 10) {
				conn.rollback();
				AssertUtil.assertFail("UPDATE_CANT_MORE_10_ROWS");
			}
			if (stmt.getUpdateCount() == 0) {
				conn.rollback();
				AssertUtil.assertFail("NO_DATA_TO_UPDATE");
			}
			updateSqlDO.setStatus("executed");
			updateSqlDO.setEffectRows(updateCount);
			AssertUtil.assertTrue(updateSkipCheckOwner(updateSqlDO));
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				AssertUtil.assertFail(e1.getMessage());
				e1.printStackTrace();
			}
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return true;
	}

	@Override
	public List<UpdateSqlDO> listLast() {
		return queryDao.selectList("UPDATE_SQL.listLast", null);
	}

}

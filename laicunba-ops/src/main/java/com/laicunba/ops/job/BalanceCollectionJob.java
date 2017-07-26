package com.laicunba.ops.job;

import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.laicunba.ops.pojo.BalanceDO;
import com.laicunba.ops.service.BalanceService;
import com.laicunba.ops.service.LaicunbaDataQueryService;
import com.laicunba.ops.service.QueryService;

@Component
public class BalanceCollectionJob {

	public static final MathContext MC = new MathContext(10, RoundingMode.HALF_DOWN);
	@Autowired
	private QueryService queryService;
	@Autowired
	private LaicunbaDataQueryService laicunbaDataQueryService;
	@Autowired
	private BalanceService balanceService;

	// 0 10 0 * * ?
	// */3 * * * * ?
	@Scheduled(cron = "0 0 * * * ?")
	public void doCollection() { 
		String sql = queryService.getSql("BALANCE_COLLECTION.collectionFromLcbProduct");
		try {
			List<Map<String, String>> list = laicunbaDataQueryService.query(sql);
			if (list != null) {
				BalanceDO balanceDO = new BalanceDO();
				for (Map<String, String> row : list) {
					if ("h".equalsIgnoreCase(row.get("type"))) {
						balanceDO.sethBalance(BigDecimal.valueOf(Double.parseDouble(row.get("amount"))));
						balanceDO.sethProfit(BigDecimal.valueOf(Double.parseDouble(row.get("profit"))));
						balanceDO.sethRate(BigDecimal.valueOf(Double.parseDouble(row.get("rate"))));
					} else if ("d".equalsIgnoreCase(row.get("type"))) {
						balanceDO.setdBalance(BigDecimal.valueOf(Double.parseDouble(row.get("amount"))));
						balanceDO.setdProfit(BigDecimal.valueOf(Double.parseDouble(row.get("profit"))));
						balanceDO.setdRate(BigDecimal.valueOf(Double.parseDouble(row.get("rate"))));
					}
				}
				balanceDO.setBalance(balanceDO.gethBalance().add(balanceDO.getdBalance()));
				balanceDO.setProfit(balanceDO.gethProfit().add(balanceDO.getdProfit()));
				balanceDO.setRate(balanceDO.getProfit().divide(balanceDO.getBalance(), MC).multiply(BigDecimal.valueOf(36500), MC));
				balanceService.create(balanceDO);
			}
			System.out.println(list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("ddd");
	}
}

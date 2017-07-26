package com.laicunba.ops.pojo;

import java.math.BigDecimal;

import org.springframework.stereotype.Component;

import com.laicunba.ops.annotation.MyTable;

@Component
@MyTable
public class BalanceDO extends BaseDO {
	private BigDecimal dProfit;
	private BigDecimal dBalance;
	private BigDecimal dRate;
	private BigDecimal hProfit;
	private BigDecimal hBalance;
	private BigDecimal hRate;
	private BigDecimal profit;
	private BigDecimal balance;
	private BigDecimal rate;

	public BigDecimal getdProfit() {
		return dProfit;
	}

	public BigDecimal getdBalance() {
		return dBalance;
	}

	public BigDecimal getdRate() {
		return dRate;
	}

	public BigDecimal gethProfit() {
		return hProfit;
	}

	public BigDecimal gethBalance() {
		return hBalance;
	}

	public BigDecimal gethRate() {
		return hRate;
	}

	public BigDecimal getProfit() {
		return profit;
	}

	public BigDecimal getBalance() {
		return balance;
	}

	public BigDecimal getRate() {
		return rate;
	}

	public void setdProfit(BigDecimal dProfit) {
		this.dProfit = dProfit;
	}

	public void setdBalance(BigDecimal dBalance) {
		this.dBalance = dBalance;
	}

	public void setdRate(BigDecimal dRate) {
		this.dRate = dRate;
	}

	public void sethProfit(BigDecimal hProfit) {
		this.hProfit = hProfit;
	}

	public void sethBalance(BigDecimal hBalance) {
		this.hBalance = hBalance;
	}

	public void sethRate(BigDecimal hRate) {
		this.hRate = hRate;
	}

	public void setProfit(BigDecimal profit) {
		this.profit = profit;
	}

	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}

	public void setRate(BigDecimal rate) {
		this.rate = rate;
	}

}

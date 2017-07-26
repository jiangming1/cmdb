package com.laicunba.ops.pojo;

import com.laicunba.ops.annotation.MyTable;

import org.springframework.stereotype.Component;

@Component
@MyTable
public class TestDO extends BaseDO {

	private String a;

	public void setA(String a) {
		this.a = a;
	}

	public String getA() {
		return a;
	}
}

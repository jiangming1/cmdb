package com.laicunba.ops.pojo;

import org.springframework.stereotype.Component;

import com.laicunba.ops.annotation.MyTable;

@Component
@MyTable
public class ProductDO extends BaseDO {

	private String productName;

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductName() {
		return productName;
	}
}

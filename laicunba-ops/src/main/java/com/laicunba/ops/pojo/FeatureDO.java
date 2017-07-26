package com.laicunba.ops.pojo;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.laicunba.ops.annotation.MyColumn;
import com.laicunba.ops.annotation.MyTable;

@Component
@MyTable
public class FeatureDO extends BaseDO {
	private String userCaseId;
	private String featureId;// 如果是BUG,则有该字段
	private String featureName;
	private String status;
	private String description;
	private String type;// bug , fun
	private String coderId;
	private String designerId;
	private String testerId;
	private String pdId;
	private String productVersionId;

	@MyColumn(type = "int DEFAULT 5")
	private int priority;

	@MyColumn(type = "bool DEFAULT true")
	private boolean finishTest;
	@MyColumn(type = "bool DEFAULT true")
	private boolean finishCoding;
	@MyColumn(type = "bool DEFAULT true")
	private boolean finishDesign;

	public void setProductVersionId(String productVersionId) {
		this.productVersionId = productVersionId;
	}

	public String getProductVersionId() {
		return productVersionId;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	public int getPriority() {
		return priority;
	}

	public String getUserCaseId() {
		return userCaseId;
	}

	public String getFeatureId() {
		return featureId;
	}

	public String getFeatureName() {
		return featureName;
	}

	public String getStatus() {
		return status;
	}

	public String getDescription() {
		return description;
	}

	public String getType() {
		return type;
	}

	public String getCoderId() {
		return coderId;
	}

	public String getDesignerId() {
		return designerId;
	}

	public String getTesterId() {
		return testerId;
	}

	public String getPdId() {
		return pdId;
	}

	public boolean isFinishTest() {
		return finishTest;
	}

	public boolean isFinishCoding() {
		return finishCoding;
	}

	public boolean isFinishDesign() {
		return finishDesign;
	}

	public void setUserCaseId(String userCaseId) {
		this.userCaseId = userCaseId;
	}

	public void setFeatureId(String featureId) {
		this.featureId = featureId;
	}

	public void setFeatureName(String featureName) {
		this.featureName = featureName;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setCoderId(String coderId) {
		this.coderId = coderId;
	}

	public void setDesignerId(String designerId) {
		this.designerId = designerId;
	}

	public void setTesterId(String testerId) {
		this.testerId = testerId;
	}

	public void setPdId(String pdId) {
		this.pdId = pdId;
	}

	public void setFinishTest(boolean finishTest) {
		this.finishTest = finishTest;
	}

	public void setFinishCoding(boolean finishCoding) {
		this.finishCoding = finishCoding;
	}

	public void setFinishDesign(boolean finishDesign) {
		this.finishDesign = finishDesign;
	}

}

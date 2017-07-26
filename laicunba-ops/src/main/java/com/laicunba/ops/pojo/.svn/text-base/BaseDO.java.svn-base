package com.laicunba.ops.pojo;

import java.util.Date;

import com.laicunba.ops.annotation.MyColumn;
import com.laicunba.ops.util.StringUtil;

 

public abstract class BaseDO {
	@MyColumn(key = true)
	protected String id;
	protected Date gmtCreate;
	protected Date gmtWrite;
	protected String createUid;
	protected String writeUid;
	protected String ownerId;

	public void setId(String id) {
		this.id = id;
	}

	public String getId() {
		return id;
	}

	/**
	 * 生成主键
	 */
	public void generatorKey() {
		setId(StringUtil.genGUID());
	}

	public Date getGmtCreate() {
		return gmtCreate;
	}

	public void setGmtCreate(Date gmtCreate) {
		this.gmtCreate = gmtCreate;
	}

	public Date getGmtWrite() {
		return gmtWrite;
	}

	public void setGmtWrite(Date gmtWrite) {
		this.gmtWrite = gmtWrite;
	}

	public String getCreateUid() {
		return createUid;
	}

	public void setCreateUid(String createUid) {
		this.createUid = createUid;
	}

	public String getWriteUid() {
		return writeUid;
	}

	public void setWriteUid(String writeUid) {
		this.writeUid = writeUid;
	}

	public String getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(String ownerId) {
		this.ownerId = ownerId;
	}

}

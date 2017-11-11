package com.july.networkdisk.vo;

import java.sql.Timestamp;

public class Share {
	private String id;
	private String uid;
	private String magid;
	private String pwd;
	private Timestamp startTime;
	private Integer retain;
	
	public Share(){
		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getMagid() {
		return magid;
	}

	public void setMagid(String magid) {
		this.magid = magid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Timestamp getStartTime() {
		return startTime;
	}

	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}

	public Integer getRetain() {
		return retain;
	}

	public void setRetain(Integer retain) {
		this.retain = retain;
	}
	
	
	
}

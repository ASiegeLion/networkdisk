package com.july.networkdisk.vo;

import java.sql.Timestamp;

public class Categorie {
	private String id;
	private String name;
	private String reid;
	private String uid;
	private Integer state;
	private Timestamp addtime;
	
	
	public Categorie(){
		
	}

	
	public String getUid() {
		return uid;
	}


	public void setUid(String uid) {
		this.uid = uid;
	}

	public Integer getState() {
		return state;
	}


	public void setState(Integer state) {
		this.state = state;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getReid() {
		return reid;
	}

	public void setReid(String reid) {
		this.reid = reid;
	}


	public Timestamp getAddtime() {
		return addtime;
	}


	public void setAddtime(Timestamp addtime) {
		this.addtime = addtime;
	}

	
	
}

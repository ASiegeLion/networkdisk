package com.july.networkdisk.vo;

import java.sql.Timestamp;

public class NetFile {
	private String id;
	private String name;
	private String uid;
	private String catid;
	private String path;
	private Timestamp addtime;
	private String type;
	private Long size;
	private Integer downum;
	private Integer deletesign;
	
	
	public NetFile(){
		
	}
	
	public Integer getDeletesign() {
		return deletesign;
	}

	public void setDeletesign(Integer deletesign) {
		this.deletesign = deletesign;
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

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getCatid() {
		return catid;
	}

	public void setCatid(String catid) {
		this.catid = catid;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Timestamp getAddtime() {
		return addtime;
	}

	public void setAddtime(Timestamp addtime) {
		this.addtime = addtime;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	public void setSize(Long size) {
		this.size = size;
	}
	public Long getSize() {
		return size;
	}
	public Integer getDownum() {
		return downum;
	}

	public void setDownum(Integer downum) {
		this.downum = downum;
	}
	
	
	
	
}

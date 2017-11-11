package com.july.networkdisk.vo;

import java.util.List;

public class CateTree {
	private String cateid;
	private String catename;
	private List<CateTree> list;
	
	
	public String getCateid() {
		return cateid;
	}
	public void setCateid(String cateid) {
		this.cateid = cateid;
	}
	public String getCatename() {
		return catename;
	}
	public void setCatename(String catename) {
		this.catename = catename;
	}
	public void setList(List<CateTree> list) {
		this.list = list;
	}
	public List<CateTree> getList() {
		return list;
	}
}

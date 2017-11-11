package com.july.networkdisk.vo;

import java.sql.Timestamp;

public class Message {
	private String id;
	private String userid;
	private String friendid;
	private String content;
	private Timestamp sendtime;
	private int msg_static;
	public int getMsg_static() {
		return msg_static;
	}
	public void setMsg_static(int msg_static) {
		this.msg_static = msg_static;
	}
	private int type;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getFriendid() {
		return friendid;
	}
	public void setFriendid(String friendid) {
		this.friendid = friendid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getSendtime() {
		return sendtime;
	}
	public void setSendtime(Timestamp sendtime) {
		this.sendtime = sendtime;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
}

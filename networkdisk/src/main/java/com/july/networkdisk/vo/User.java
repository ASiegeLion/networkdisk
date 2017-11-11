package com.july.networkdisk.vo;

import java.sql.*;

public class User
{
    private String id;
    private String name;
    private String passWord;
    private String trueName;
    private String email;
    private String phone;
    private Integer isadmin;
    private Integer sex;
    private String about;
    private Timestamp addtime;
    private byte[] photo;
    
    public String getId() {
        return this.id;
    }
    
    public void setId(final String id) {
        this.id = id;
    }
    
    public String getName() {
        return this.name;
    }
    
    public void setName(final String name) {
        this.name = name;
    }
    
    public String getPassWord() {
        return this.passWord;
    }
    
    public void setPassWord(final String passWord) {
        this.passWord = passWord;
    }
    
    public String getTrueName() {
        return this.trueName;
    }
    
    public void setTrueName(final String trueName) {
        this.trueName = trueName;
    }
    
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(final String email) {
        this.email = email;
    }
    
    public String getPhone() {
        return this.phone;
    }
    
    public void setPhone(final String phone) {
        this.phone = phone;
    }
    
    public Integer getIsadmin() {
        return this.isadmin;
    }
    
    public void setIsadmin(final Integer isadmin) {
        this.isadmin = isadmin;
    }
    
    public Integer getSex() {
        return this.sex;
    }
    
    public void setSex(final Integer sex) {
        this.sex = sex;
    }
    
    public String getAbout() {
        return this.about;
    }
    
    public void setAbout(final String about) {
        this.about = about;
    }
    
    public Timestamp getAddtime() {
		return addtime;
	}
    public void setAddtime(Timestamp addtime) {
		this.addtime = addtime;
	}

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}
    
  
}

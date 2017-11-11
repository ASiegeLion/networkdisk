package com.july.networkdisk.web;


import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import javax.servlet.http.HttpSession;

import com.july.networkdisk.service.IUserService;
import com.july.networkdisk.util.CommonUtil;
import com.july.networkdisk.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserRegisterAction extends ActionSupport implements ModelDriven<User>{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private User user = new User();
	private String massger;
    private IUserService iUserService;
    ActionContext actionContext = ActionContext.getContext();
    HttpSession session = CommonUtil.createSession();
	
	public IUserService getiUserService() {
		return iUserService;
	}

	public void setiUserService(IUserService iUserService) {
		this.iUserService = iUserService;
	}

	public User getModel() {
		return user;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public String getMassger() {
		return massger;
	}
	
	public void setMassger(String massger) {
		this.massger = massger;
	}
	
	/*用户注册*/
	public String register() throws Exception{
    	String id = CommonUtil.createUUID();
    	String password = CommonUtil.getMD5(user.getPassWord());
    	user.setPassWord(password);
    	user.setId(id);
    	File file = new File("D:/photo/default.jpg");
    	InputStream in = new FileInputStream(file);	
    	byte[] photo = new byte[in.available()];
    	in.read(photo);
    	in.close();
    	user.setPhoto(photo);
    	this.iUserService.save(user);
    	this.setMassger("注册成功，请重新登录！");
    	return SUCCESS;
    }
	
	
	
	
	 
   
}

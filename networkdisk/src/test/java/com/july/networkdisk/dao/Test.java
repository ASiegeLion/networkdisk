package com.july.networkdisk.dao;



import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.july.networkdisk.service.IUserService;
import com.july.networkdisk.vo.User;

public class Test {
	ApplicationContext ac = new ClassPathXmlApplicationContext(
			"applicationcontext.xml");
	   IUserService us = ac.getBean("userService", IUserService.class);
	   
	   @org.junit.Test
	public void updatePassword()
	{
	     User user=new User();
		user.setId("1");
		user.setPassWord("3");
		us.updatePassword(user);
	}
	

}

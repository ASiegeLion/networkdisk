package com.july.networkdisk.dao;



import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.july.networkdisk.service.INoticeService;

import com.july.networkdisk.vo.Notice;
import com.july.networkdisk.web.NoticeAction;


public class NtestDao {
	ApplicationContext ac = new ClassPathXmlApplicationContext(
			"applicationcontext.xml");
	INoticeService dao = ac.getBean("iNoticeService",INoticeService.class);
	@Test
	public void test(){ 
	 List<Notice> list = dao.page(1,2);
	 System.out.println(list);
	}

}

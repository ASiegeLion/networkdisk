package com.july.networkdisk.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestFileService {
	ApplicationContext ac = new ClassPathXmlApplicationContext(
			"applicationcontext.xml");
	IFileService fileService = ac.getBean("fileService", IFileService.class);
	
	@Test
	public void  testDelete() {
		fileService.delete("04bf6638-3b14-448a-aefe-f350599f7c25");
	}
	
	@Test
	public void  testDeleteBatch() {
		List list = new ArrayList<String>();
		list.add("");
		list.add("");
		
		String[] paths = new String[3];
		
		fileService.delete("04bf6638-3b14-448a-aefe-f350599f7c25");
	}
	
}

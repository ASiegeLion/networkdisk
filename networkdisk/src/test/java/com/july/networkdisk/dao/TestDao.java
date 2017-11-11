package com.july.networkdisk.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.july.networkdisk.service.ICateService;
import com.july.networkdisk.vo.Categorie;
import com.july.networkdisk.vo.NetFile;

public class TestDao {

	ApplicationContext ac = new ClassPathXmlApplicationContext(
			"applicationcontext.xml");
	FileDao fileDao = ac.getBean("fileDao", FileDao.class);
	CategorieDao cateDao=ac.getBean("cateDao",CategorieDao.class);
	ICateService cateService=ac.getBean("cateService",ICateService.class);
	
	@Test
	public void testdeleteOne() throws Exception {
		String file_id = "17722329-3888-43a4-bb83-3ae399364735";
		Boolean a = fileDao.deleteOne(file_id);
		System.out.println(a);
	}

	@Test
	public void testdeleteBatch() throws Exception {
		String file_id = "06b21634-2d9e-4b57-aa2f-6a9ef0aee1e8";
		String file_id1 = "176bd887-f368-45d1-963f-57bf996ca5f0";
		String file_id2 = "4537c445-cd3c-498b-bb3c-d7252956994c";
		List<String> list = new ArrayList<String>();
		list.add(file_id);
		list.add(file_id1);
		list.add(file_id2);
		Boolean a = fileDao.deleteBatch(list);
		System.out.println(a);
	}
	
	@Test
	public void testfindAllByUser() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userID", "1");
		map.put("file_catID", null);
		List<NetFile> netFiles=fileDao.findAllByUser(map);
		System.out.println(netFiles.size());
	}
	
	@Test
	public void testfindAllByType() throws Exception {
		List<String> list = new ArrayList<String>();
		list.add("ppt");
		list.add("docx");
		list.add("doc");
		list.add("xlsx");
		list.add("pdf");
		list.add("txt");
		String uid ="94376d5c-56ac-42da-84e1-b0480a990f72";
		List<NetFile> files = fileDao.findAllByType(uid,list);
		System.out.println(files);
	}
	@Test
	public void testfindTime() throws Exception {
		List<String> list = new ArrayList<String>();
		list.add("png");
		list.add("jpeg");
		list.add("jpg");
		String uid ="94376d5c-56ac-42da-84e1-b0480a990f72";
		List<String> listtimeString = fileDao.findTime(uid, list);
		System.out.println(listtimeString);
	}
	
	@Test
	public void testUpdataFile() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("file_id", "17e2102a-e38f-4dcb-aecf-cc71dd18f379");
		map.put("file_name", "柳培岳.pdf");
		map.put("file_catid", null);
		/*map.put("file_downum", 2);
		map.put("file_deletesign", 1);*/
		//fileDao.updateFile(map);
		System.out.println("----------");
	}
	@Test
	public void testDeleteSignBatch() throws Exception {
		String file_id = "123";
		String file_id1 = "234";
		List<String> list = new ArrayList<String>();
		list.add(file_id);
		list.add(file_id1);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("file_deletesign", 1);
		fileDao.updateDeleteSingBatch(map);
		System.out.println("----------");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}

package com.july.networkdisk.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.july.networkdisk.vo.Categorie;


public class TestCategorieDao {
	ApplicationContext ac = new ClassPathXmlApplicationContext(
			"applicationcontext.xml");
	CategorieDao cateDao = ac.getBean("cateDao", CategorieDao.class);

	@Test
	public void testFindAllCate(){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cat_uid", "1");
		map.put("cat_state", 0);
		List<Categorie> list = cateDao.findAllCateByUser(map);
		System.out.println(list.size());
		
	}
	
	@Test
	public void testFindOneCate(){
		
		Categorie categorie = cateDao.get("1", 0);
		System.out.println("--------------------------"+categorie.getName());
		
	}
	
	
	@Test
	public void deleteOneCate(){
		
		cateDao.deleteOne("2");
	
		
	}
	
	@Test
	public void updateCate(){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cat_name", "lao");
		cateDao.updateCate("2", map);
		
	}
	
}

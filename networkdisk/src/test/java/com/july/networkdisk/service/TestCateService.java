package com.july.networkdisk.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.july.networkdisk.vo.CateTree;
import com.july.networkdisk.vo.Categorie;

public class TestCateService {
	ApplicationContext ac = new ClassPathXmlApplicationContext(
			"applicationcontext.xml");
	ICateService cateService = ac.getBean("cateService", ICateService.class);
	
	@Test
	public void saveCate(){
		Categorie categorie = new Categorie();
		categorie.setId("1");
		categorie.setName("新建文件夹");
		categorie.setReid(null);
		categorie.setUid("1");
		categorie.setState(0);
		cateService.save(categorie);
	}
	
	@Test
	public void testREcyleCate(){
		
		cateService.recyleCate("1",0);
	}
	
	@Test
	public void testDeleteCate(){
		cateService.deleteCate("1");
	}
	
	
	@Test
	public void showReclydeCate(){
	   String str="c18dd34e-ff8d-4da4-af12-4229a466c6a5";
		Map<String, Object> map = cateService.showRecycleCate(str);
		System.out.println(map.size());
	}
	
	
	@Test
	public void getAllCate(){
	   String str="e3dae0c1-788f-41f9-a997-65213b171b40";
	   CateTree cateTree = new CateTree();
	   cateTree.setCateid("123");
	   cateTree.setCatename("全部文件");
		cateService.getAllCate(str, null, cateTree);
		System.out.println(cateTree);
	}
	
	@Test
	public void getSublevelCate(){
	   String str="e3dae0c1-788f-41f9-a997-65213b171b40";
	   List<CateTree> listcate = new ArrayList<CateTree>();
	   cateService.getSublevelCate(str,"07c1b7dc-9cc7-4e3d-abab-f4a4975bd417", listcate);
	  System.out.println("123");
	}
}

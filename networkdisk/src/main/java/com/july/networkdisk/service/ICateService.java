package com.july.networkdisk.service;

import java.util.List;
import java.util.Map;

import com.july.networkdisk.vo.CateTree;
import com.july.networkdisk.vo.Categorie;

/**
 * @author Ling_jui;
 * @version 2017年9月18日
 * @type ICataService
 */
public interface ICateService extends IBaseService<Categorie> {

	/**
	 * 把文件夹放入或放出回收站
	 * 
	 * @param cat_id
	 * @return
	 */
	boolean recyleCate(String cat_id, Integer state);

	/**
	 * 根据用户名，所属文件夹，是否在回收站查询所有的文件夹
	 * 
	 * @param cat_uid
	 * @param cat_reid
	 * @param cat_state
	 * @return
	 */
	List<Categorie> findAllCate(String cat_uid, Map<String, Object> map);

	/**
	 * 删除文件夹
	 * 
	 * @param cat_id
	 * @return
	 */
	boolean deleteCate(String cat_id);

	/**
	 * 移动文件夹
	 * 
	 * @param cat_id
	 * @param cat_reid
	 */
	boolean updateCatereid(String cat_id, String cat_reid);

	/**
	 * 显示用户回收站中的文件和文件夹
	 * 
	 * @param cat_uid
	 * @return
	 */
	Map<String, Object> showRecycleCate(String cat_uid);

	/**
	 * 重命名文件夹
	 * 
	 * @param cateid
	 * @param catename
	 * @return
	 */
	boolean reName(String cateid, String catename);

	/**
	 * 显示用户所有的文件夹
	 * 
	 * @param cat_uid
	 * @param cate_reid
	 * @return
	 */
	void getAllCate(String cat_uid, String cate_reid, CateTree cateTree);

	/**
	 * 获取所有的子级目录
	 * 
	 * @param cat_uid
	 * @param cate_reid
	 * @return
	 */
	void getSublevelCate(String cat_uid, String cate_reid,
			List<CateTree> listcate);

	/**
	 * 判读复制或者移动的文件是否复制或移动到其子目录下。
	 * 
	 * @param cateids
	 * @param aimcateid
	 * @return
	 */
	boolean judgeCateID(String cat_uid, String[] cateids, String aimcateid);

	/**
	 * 判读同级目录下是否有相同名字的文件夹
	 * 
	 * @param cateids
	 * @param aimcateid
	 * @return
	 */
	boolean judgeCateName(String cat_uid, String[] cateids, String aimcateid,int flag);

	/**
	 * 拿到在回收站单个文件
	 */
	Categorie getRecylceCategorie(String cateid);
}

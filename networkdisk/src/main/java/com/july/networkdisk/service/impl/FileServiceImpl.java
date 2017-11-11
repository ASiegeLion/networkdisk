package com.july.networkdisk.service.impl;

import java.io.File;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.july.networkdisk.dao.FileDao;
import com.july.networkdisk.service.IFileService;
import com.july.networkdisk.util.FileUtil;
import com.july.networkdisk.vo.NetFile;
import com.july.networkdisk.vo.User;
import com.sun.xml.internal.ws.api.pipe.Tube;

public class FileServiceImpl implements IFileService {
	private FileDao fileDao;

	public FileDao getFileDao() {
		return fileDao;
	}

	public void setFileDao(FileDao fileDao) {
		this.fileDao = fileDao;
	}

	/**
	 * 保存文件
	 */
	public void save(NetFile file) {
		fileDao.save(file);
	}

	/**
	 * 重命名文件
	 */
	public boolean rename(String fileid, String refilename) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("file_name", refilename);
		return fileDao.updateFile(fileid, map);
	}

	/**
	 * 根据用户查找每个目录下所有文件 区分在不在回收站
	 */
	public List<NetFile> findAllByUser(String file_uid, Map<String, Object> map) {
		map.put("file_uid", file_uid);
		return fileDao.findAllByUser(map);
	}
	
	/**
	 * 根据用户和文件种类来查找文件
	 */
	public List<NetFile> findAllByType(String file_uid, List<String> list) {
		return fileDao.findAllByType(file_uid, list);
	}
	/**
	 * 根据用户和文件种类来查找文件
	 */
	public List<NetFile> findOtherType(String file_uid, List<String> list) {
		return fileDao.findOtherType(file_uid, list);
	}
	
	/**
	 * 根据条件对日期分组
	 * @param file_uid
	 * @param list
	 * @return
	 */
	public List<String> findTime(String file_uid, List<String> list){
		return fileDao.findTime(file_uid, list);
	}
	/**
	 * 根据文件夹目录和是否删除 来找文件的ID。用于文件的回收和删除
	 */
	public List<String> findAllByCatId(String cat_id, Integer file_deletesign) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("file_catid", cat_id);
		map.put("file_deletesign", file_deletesign);
		return fileDao.findFileIDByCateID(map);
	}

	/**
	 * 得到在或者不在回收站的一个文件,当flag为空时，就忽略是否在回收站中。
	 */
	public NetFile get(String netFile_id, Integer flag) {
		NetFile netfile = fileDao.get(netFile_id, flag);
		return netfile;
	}

	/**
	 * 文件上传
	 */
	public void fileUpLoad(NetFile netFile, File file, String fileFileName,
			String fileContentType, User user) throws Exception {
		NetFile newNetFile = FileUtil.layFile(file, fileFileName,
				fileContentType, user, netFile);
		save(newNetFile);
	}

	/**
	 * 文件下载
	 */
	public InputStream fileDownLoad(String netFile_id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		NetFile netfile = get(netFile_id, 0);
		map.put("file_downum", netfile.getDownum() + 1);
		fileDao.updateFile(netFile_id, map);
		return FileUtil.downFile(netfile.getPath());
	}
	
	/**
	 * 后台文件下载
	 */
	public InputStream adminFileDownLoad(String netFile_id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		NetFile netfile = get(netFile_id, null);
		map.put("file_downum", netfile.getDownum() + 1);
		fileDao.updateFile(netFile_id, map);
		return FileUtil.downFile(netfile.getPath());
	}


	/**
	 * 把一个文件放入,或放出回收站
	 * 
	 * @param netFile_id
	 * @return
	 */
	public boolean layRecyle(String netFile_id, Integer file_deletesign) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("file_deletesign", file_deletesign);
		fileDao.updateFile(netFile_id, map);
		return true;
	}

	/**
	 * 把一批文件放入或放出到回收站中
	 * 
	 * 
	 */
	public boolean layBatchRecyle(List<String> netFile_ids,
			Integer file_deletesign) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", netFile_ids);
		map.put("file_deletesign", file_deletesign);
		fileDao.updateDeleteSingBatch(map);
		return false;
	}

	/**
	 * 在回收站中删除数据库中的一个文件
	 */
	public boolean delete(String netFile_id) {
		fileDao.deleteOne(netFile_id);
		return true;
	}

	/**
	 * 在回收站中删除数据库中的一批文件
	 */
	public boolean deleteBatch(List<String> netFile_ids) {
		fileDao.deleteBatch(netFile_ids);
		return true;
	}

	/**
	 * 显示在回收站中的文件
	 */
	public List<NetFile> showRecycleFile(String file_uid) {
		List<NetFile> listFiles = fileDao.showRecycleFile(file_uid);
		return listFiles;
	}

	/**
	 * 移动文件
	 */
	public boolean moveFile(String netFile_id, String file_catid) {
		fileDao.updateFileCate(netFile_id, file_catid);
		return true;
	}

	/**
	 * 判断目标文件夹下有无名字相同的文件
	 */
	public boolean judgeFileName(String file_uid, String[] fileids,
			String aimcatid,int flag) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("file_catid", aimcatid);
		map.put("file_deletesign", 0);
		List<NetFile> listids = findAllByUser(file_uid, map);
		if (listids != null && listids.size() != 0) {
			for (NetFile netfile1 : listids) {
				for (String fileid : fileids) {
					NetFile netfile2 = get(fileid, flag);
					if (netfile1.getName().equals(netfile2.getName())) {
						return false;
					}
				}
			}
		}

		return true;
	}
	
	/**
	 * 废弃方法
	 */
	public void update(NetFile file) {

	}

	/**
	 * 废弃方法
	 */
	public NetFile get(String netFile_id) {

		return null;
	}

}

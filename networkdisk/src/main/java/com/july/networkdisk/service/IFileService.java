package com.july.networkdisk.service;

import java.io.File;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import com.july.networkdisk.vo.NetFile;
import com.july.networkdisk.vo.User;

public interface IFileService extends IBaseService<NetFile> {
	
	/**
	 * 得到在或者不在回收站的一个文件,当flag为空时，就忽略是否在回收站中。
	 */
	public NetFile get(String netFile_id, Integer flag);
	/**
	 * 根据用户查找每个目录下所有文件 区分在不在回收站
	 * 参数为用户id,所属文件夹id,是否删除
	 */
	List<NetFile> findAllByUser(String file_uid,Map<String, Object> map);
	
	/**
	 * 根据用户和文件的种类来查找文件
	 */
	List<NetFile> findAllByType(String file_uid,List<String> list);
	
	/**
	 * 根据用户和查找其它类型文件
	 */
	List<NetFile> findOtherType(String file_uid,List<String> list);
	
	/**
	 * 根据条件对日期分组
	 * @param file_uid
	 * @param list
	 * @return
	 */
	List<String> findTime(String file_uid, List<String> list);
	
	/**
	 * 根据文件夹id和是否回收来找所有的文件
	 * @param cat_id
	 * @param file_deletesign
	 * @return
	 */
	List<String> findAllByCatId(String cat_id,Integer file_deletesign);
	

	/**
	 * 文件上传
	 * @param netFile
	 * @param file
	 * @param fileFileName
	 * @param fileContentType
	 * @param user
	 * @throws Exception
	 */
	void fileUpLoad(NetFile netFile,File file, String fileFileName,
			String fileContentType, User user) throws Exception;
	
	/**
	 * 文件下载
	 * @param netFileID
	 * @return
	 * @throws Exception
	 */
	InputStream fileDownLoad(String netFileID) throws Exception;
	
	/**
	 * 后台文件下载
	 * @param netFileID
	 * @return
	 * @throws Exception
	 */
	InputStream adminFileDownLoad(String netFileID) throws Exception;
	
	/**
	 * 删除一批文件
	 * @param netFile_ids
	 * @return
	 */
	boolean deleteBatch(List<String> netFile_ids);
	/**
	 * 移动一个文件到回收站
	 * @param netFile_id
	 * @param file_deletesign
	 * @return
	 */
	boolean layRecyle(String netFile_id,Integer file_deletesign);
	
	/**
	 * 移动一批文件到回收站
	 * @param netFile_ids
	 * @param file_deletesign
	 * @return
	 */
	boolean layBatchRecyle(List<String> netFile_ids,Integer file_deletesign);
	
	/**
	 * 移动文件
	 * @param netFile_id
	 * @param cat_id
	 * @return
	 */
	boolean moveFile(String netFile_id,String cat_id);
	/**
	 * 显示在回收张中的文件
	 * @param file_uid
	 * @return
	 */
	List<NetFile> showRecycleFile(String file_uid);
	/**
	 * 重命名文件
	 * @param fileid
	 * @param refilename
	 * @return
	 */
	boolean rename(String fileid,String refilename);
	/**
	 * 判断目标文件夹下有无名字相同的文件
	 */
	 boolean judgeFileName(String file_uid, String[] fileids,
			String aimcatid,int flag);
}

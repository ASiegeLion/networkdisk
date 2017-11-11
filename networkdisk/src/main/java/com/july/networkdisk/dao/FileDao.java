package com.july.networkdisk.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.july.networkdisk.vo.NetFile;

public class FileDao extends BaseDao {
	/**
	 * 保存一个文件
	 * @param file
	 */
	public void save(NetFile file) {
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		sqlSession.insert("fileSpace.save", file);
		sqlSession.close();
	}
	/**
	 * 查询所有文件的信息
	 * 
	 * @return
	 */
	public List<NetFile> findAllByUser(Map<String, Object> map) {
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		List<NetFile> list = sqlSession.selectList("fileSpace.findAllByUser",map);
		sqlSession.close();
		return list;
	}
	
	/**
	 * 根据用户id，文件类别来查询文件的信息
	 * 
	 * @return
	 */
	public List<NetFile> findAllByType(String uid,List<String> list) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("file_uid", uid);
		map.put("list", list);
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		List<NetFile> Filelist = sqlSession.selectList("fileSpace.findAllByType",map);
		sqlSession.close();
		return Filelist;
	}

	/**
	 * 根据用户id，查询其他文件的信息
	 * 
	 * @return
	 */
	public List<NetFile> findOtherType(String uid,List<String> list) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("file_uid", uid);
		map.put("list", list);
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		List<NetFile> Filelist = sqlSession.selectList("fileSpace.findOtherType",map);
		sqlSession.close();
		return Filelist;
	}
	/**
	 * 查找时间
	 * @return
	 */
	public List<String> findTime(String uid,List<String> list) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("file_uid", uid);
		map.put("list", list);
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		List<String> listtime = sqlSession.selectList("fileSpace.findTime",map);
		sqlSession.close();
		return listtime;
	}
	
	/**
	 * 根据文件夹id查询所有文件的id
	 * 
	 * @return
	 */
	public List<String> findFileIDByCateID(Map<String, Object> map) {
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		List<String> list = sqlSession.selectList("fileSpace.findFileIDByCateID",map);
		sqlSession.close();
		return list;
	}
	
	/**
	 * 显示回收站中的文件
	 * 
	 * @return
	 */
	public List<NetFile> showRecycleFile(String file_uid) {
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		List<NetFile> list = sqlSession.selectList("fileSpace.showRecycleFile",file_uid);
		sqlSession.close();
		return list;
	}
	
	/**
	 * 根据ID查询一个文件，区分是否有deleteSign ，0 ，1；
	 * @return
	 */
	public NetFile get(String netFile_id, Integer deleteSign) {
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("file_id", netFile_id);
		map.put("file_deletesign", deleteSign);
		NetFile netFile = sqlSession.selectOne("fileSpace.get", map);
		sqlSession.close();
		return netFile;
	}

	/**
	 * 在回收站删除一个文件
	 * 
	 * @param file_id
	 * @return
	 */
	public boolean deleteOne(String file_id) {
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		int b = sqlSession.delete("fileSpace.deleteOne", file_id);
		sqlSession.close();
		if (b > 0) {
			return true;
		}
		return false;
	}

	/**
	 * 在回收站删除一批文件
	 * 
	 * @param file_id
	 * @return
	 */
	public boolean deleteBatch(List file_ids) {
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		int row = sqlSession.delete("fileSpace.deleteBatch", file_ids);
		sqlSession.close();
		if (row == file_ids.size()) {
			return true;
		}
		return false;
	}
	
	
	/**
	 * 根据文件file_id 修改file_name或者file_downum或者file_deletesign
	 * @param map
	 * @return
	 */
	public boolean updateFile(String netFile_id,Map<String, Object> map){
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		map.put("file_id", netFile_id);
		int row =sqlSession.update("fileSpace.updateFile", map);
		sqlSession.close();
		if(row > 0)
		{
			return true;
		}
		return false;
	}
	
	/**
	 * 移动文件的目录
	 * @return
	 */
	public boolean updateFileCate(String file_id,String file_catid){
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("file_id", file_id);
		map.put("file_catid", file_catid);
		int row = sqlSession.delete("fileSpace.updateFileCate", map);
		sqlSession.close();
		
		return true;
	}
	
	
	
	/**
	 * 把一批文件放入或者放出回收站
	 * 参数为文件的id(list)和sate
	 * @return
	 */
	public boolean updateDeleteSingBatch(Map<String, Object> map){
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		int row = sqlSession.delete("fileSpace.updateDeleteSingBatch", map);
		sqlSession.close();
		if (row == ((List<String>)(map.get("list"))).size()) {
			return true;
		}
		return false;
	}
}

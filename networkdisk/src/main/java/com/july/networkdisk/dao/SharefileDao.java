package com.july.networkdisk.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.july.networkdisk.util.CommonUtil;
import com.july.networkdisk.vo.Categorie;
import com.july.networkdisk.vo.NetFile;
import com.july.networkdisk.vo.Share;
import com.july.networkdisk.vo.Sharefile;
import com.july.networkdisk.vo.User;


public class SharefileDao extends BaseDao{
	
	public void addshare(Share share) {
		 final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		 sqlSession.insert("shareSpace.share", share);
		
	}
	/*分享文件*/
	public void sharefile(Sharefile sharefile, String[] s_type) {
		 final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		 for(int i=0;i<s_type.length;i++){
			 sharefile.setId(CommonUtil.createUUID());
			 sharefile.setFileandcateid(s_type[i]);
			 sqlSession.insert("sharefileSpace.sharefile", sharefile);
		 }
	     sqlSession.close();
	}
	/*分享的文件*/
	public List<Sharefile> sharecent(Sharefile sharefile) {
		 final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		 List<Sharefile> sf = sqlSession.selectList("sharefileSpace.sharecent", sharefile);
		/* List<NetFile> file = new ArrayList<NetFile>();
		 
		 for(int i=0;i<sf.size();i++){
			 String fid = sf.get(i).getFileandcateid();
			 int iscate = sf.get(i).getIscate();
			 if(iscate == 1){
				 
			 }
			 NetFile f = sqlSession.selectOne("fileSpace.getone", fid);
			 file.add(f);
		 }*/
		 sqlSession.close();
		 return sf;
	}
	/*根据id查询文件夹*/
	public Categorie getcate(String fileandcateid) {
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		Categorie cate = sqlSession.selectOne("cateSpace.findbyid", fileandcateid);
		return cate;
	}
	/*查找文件夹的下层文件夹*/
	public List<Categorie> getcatenext(String cateid) {
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		List<Categorie> cate = sqlSession.selectList("cateSpace.getcatenext", cateid);
		return cate;
	}
	/*查找文件夹的下层文件*/
	public List<NetFile> getcatenextfile(String cateid) {
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		List<NetFile> filelist = sqlSession.selectList("fileSpace.getcatenextfile",cateid);
		return filelist;
	}
	/*根据id查询文件*/
	public NetFile getfile(String fid) {
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		NetFile file = sqlSession.selectOne("fileSpace.getone", fid);
		return file;
	}
	/*保存分享的文件*/
	public void preservation(String uid, String[] fid,String file_catid) {
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		for(int i=0;i<fid.length;i++){
			NetFile f = sqlSession.selectOne("fileSpace.getone", fid[i]);
			f.setId(CommonUtil.createUUID());
			f.setUid(uid);
			f.setCatid(file_catid);
			sqlSession.insert("fileSpace.save", f);
		}
		sqlSession.close();
	}
	/*保存分享的文件夹*/
	public void preservationcate(String uid, String[] cidlist,String cate_reid) {
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		for(int i=0;i<cidlist.length;i++){
			Categorie cate = sqlSession.selectOne("cateSpace.findbyid", cidlist[i]);
			String cateid = cate.getId();
			cate.setId(CommonUtil.createUUID());
			cate.setUid(uid);
			cate.setReid(cate_reid);
			sqlSession.insert("cateSpace.save", cate);
			String reid = cate.getId();
			recursion(cateid,reid,uid);
		}
		sqlSession.close();
	}
	public void recursion(String cateid,String reid,String uid){
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		List<Categorie> catelist = sqlSession.selectList("cateSpace.getcatenext",cateid);
		List<NetFile> filelist = sqlSession.selectList("fileSpace.getcatenextfile",cateid);
		if(filelist != null){
			for(int i=0;i<filelist.size();i++){
				NetFile file = sqlSession.selectOne("fileSpace.getone", filelist.get(i).getId());
				if(file != null){
					file.setId(CommonUtil.createUUID());
					file.setUid(uid);
					file.setCatid(reid);
					sqlSession.insert("fileSpace.save", file);
				}
			}
		}
		
			for(int i=0;i<catelist.size();i++){
				Categorie cate = sqlSession.selectOne("cateSpace.findbyid", catelist.get(i).getId());
				if(cate != null){
					
					String cid = cate.getId();
					cate.setId(CommonUtil.createUUID());
					cate.setUid(uid);
					cate.setReid(reid);
					String rid = cate.getId();
					sqlSession.insert("cateSpace.save", cate);
					recursion(cid,rid,uid);
				}
			}
		
		sqlSession.close();
	}
	
	
	
	/*检查文件是否以存在*/
	public int checkfile(String[] fid, String[] fname, int flag, String uid, String recateid) {
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		NetFile file = new NetFile();
		file.setCatid(recateid);
		file.setUid(uid);
		List<NetFile> f = new ArrayList<NetFile>();
		if(recateid == null){
			f = sqlSession.selectList("fileSpace.getlistcateisnull", file);
		}else{
			f = sqlSession.selectList("fileSpace.getlistbyuid", file);
		}
		for(int i=0;i<f.size();i++){
			for(int j=0;j<fname.length;j++){
				if(fname[j].equals(f.get(i).getName()) && f.get(i).getDeletesign() == 0){
					flag = 0;
				}
			}
		}
		sqlSession.close();
		return flag;
	}
	
	/*检查文件夹是否以存在*/
	public int checkcate(String[] cidlist, String[] cnamelist, int cateflag,
			String id ,String recateid) {
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		Categorie c = new Categorie();
		c.setUid(id);
		List<Categorie> cate = new ArrayList<Categorie>();
		if(recateid == null){
			cate = sqlSession.selectList("cateSpace.getlistcateisnull", c);
		}else{
			c.setReid(recateid);
			cate = sqlSession.selectList("cateSpace.getlistbyuid", c);
		}
		
		for(int i=0;i<cate.size();i++){
			for(int j=0;j<cnamelist.length;j++){
				if(cnamelist[j].equals(cate.get(i).getName()) && cate.get(i).getState() == 0){
					cateflag = 0;
				}
			}
		}
		sqlSession.close();
		return cateflag;
	}
	public Share getsharebyid(String magid) {
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		Share share = sqlSession.selectOne("shareSpace.getonebyid", magid);
		sqlSession.close();
		return share;
	}
	public User findOne(User user) {
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		User u = sqlSession.selectOne("userSpace.findOne", user);
		sqlSession.close();
		return u;
	}
	public User getuserbyid(String uid) {
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		User u = sqlSession.selectOne("userSpace.get",uid);
		sqlSession.close();
		return u;
	}
	
	
}

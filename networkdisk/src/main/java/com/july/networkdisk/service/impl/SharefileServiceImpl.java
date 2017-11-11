package com.july.networkdisk.service.impl;


import java.util.List;

import com.july.networkdisk.dao.SharefileDao;
import com.july.networkdisk.service.ISharefileService;
import com.july.networkdisk.vo.Categorie;
import com.july.networkdisk.vo.NetFile;
import com.july.networkdisk.vo.Share;
import com.july.networkdisk.vo.Sharefile;
import com.july.networkdisk.vo.User;

public class SharefileServiceImpl implements ISharefileService {
	private SharefileDao sharefileDao;
	
	public SharefileDao getSharefileDao() {
		return sharefileDao;
	}

	public void setSharefileDao(SharefileDao sharefileDao) {
		this.sharefileDao = sharefileDao;
	}

	public void save(Sharefile sharefile) {
	}

	public void update(Sharefile p0) {
		// TODO Auto-generated method stub
		
	}

	public boolean delete(String p0) {
		// TODO Auto-generated method stub
		return false;
	}

	public Sharefile get(String p0) {
		// TODO Auto-generated method stub
		return null;
	}

	public void addshare(Share share) {
		this.sharefileDao.addshare(share);
		
	}
	
	public void sharefile(Sharefile sharefile, String[] s_type) {
		this.sharefileDao.sharefile(sharefile, s_type);
	}

	public List<Sharefile> sharecent(Sharefile sharefile) {
		List<Sharefile> sf = this.sharefileDao.sharecent(sharefile);
		return sf;
	}

	public void preservation(String id, String[] fid, String file_cateid) {
		this.sharefileDao.preservation(id,fid, file_cateid);
		
	}
	
	public void preservationcate(String id, String[] cidlist, String cate_reid) {
		this.sharefileDao.preservationcate(id,cidlist, cate_reid);
	}
	
	public int checkfile(String[] fid, String[] fname, int flag, String uid ,String recateid) {
		flag = this.sharefileDao.checkfile(fid,fname,flag,uid,recateid);
		return flag;
	}

	public int checkcate(String[] cidlist, String[] cnamelist, int cateflag,
			String id ,String recateid) {
		return this.sharefileDao.checkcate(cidlist,cnamelist,cateflag,id,recateid);
	}
	
	public Categorie getcate(String fileandcateid) {
		Categorie cate = this.sharefileDao.getcate(fileandcateid);
		return cate;
	}

	public NetFile getfile(String fileandcateid) {
		NetFile file = this.sharefileDao.getfile(fileandcateid);
		return file;
	}

	public List<Categorie> getcatenext(String cateid) {
		return this.sharefileDao.getcatenext(cateid);
	}

	public List<NetFile> getcatenextfile(String cateid) {
		return this.sharefileDao.getcatenextfile(cateid);
	}

	public Share getsharebyid(String magid) {
		return this.sharefileDao.getsharebyid(magid);
	}

	public User findOne(User user) {
		return this.sharefileDao.findOne(user);
	}

	public User getuserbyid(String uid) {
		return this.sharefileDao.getuserbyid(uid);
	}

	



}

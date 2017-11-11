package com.july.networkdisk.service;

import java.util.List;

import com.july.networkdisk.vo.Categorie;
import com.july.networkdisk.vo.NetFile;
import com.july.networkdisk.vo.Share;
import com.july.networkdisk.vo.Sharefile;
import com.july.networkdisk.vo.User;

public interface ISharefileService extends IBaseService<Sharefile>{

	void addshare(Share share);
	
	void sharefile(Sharefile sharefile, String[] s_type);

	List<Sharefile> sharecent(Sharefile sharefile);

	void preservation(String id, String[] fid, String file_cateid);

	void preservationcate(String id, String[] cidlist, String cate_reid);
	
	int checkfile(String[] fid, String[] fname, int flag, String uid, String recateid);

	int checkcate(String[] cidlist, String[] cnamelist, int cateflag, String id, String recateid);
	
	Categorie getcate(String fileandcateid);

	NetFile getfile(String fileandcateid);

	List<Categorie> getcatenext(String cateid);

	List<NetFile> getcatenextfile(String cateid);

	Share getsharebyid(String magid);

	User findOne(User user);

	User getuserbyid(String uid);



	
}

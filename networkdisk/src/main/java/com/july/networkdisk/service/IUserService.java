package com.july.networkdisk.service;

import java.util.List;
import java.util.Map;

import com.july.networkdisk.vo.*;

public interface IUserService extends IBaseService<User>
{
	User findOne(User user);
	User findOneByEm(User user);
	User findOneByPhone(User user);
	List<User> getAll();
	User selectUserByName(String name);
	User selectUserByTel(String phone);
	User selectUserByEmail(String email);
	void photoup(User user);
	void updatePassword(User user);
	List<Share> getmyshare(String uid);
	List<Sharefile> getsharefile(String magid);
	Categorie getcate(String fileandcateid);
	NetFile getfile(String fileandcateid);
	void cancelshare(Sharefile sharefile);
	List<NetFile> searchfile(Map<String, Object> map);
	List<Categorie> searchcate(Map<String, Object> map);
	String getrecatename(String catid);
	List<Categorie> showparents(String filecateid);
	User getphoto(String uid);
	void addmessage(Message mes);
	List<Message> getmessage(String id,String[] fid);
	List<Message> getcontent(String filecateid,String uid);
}

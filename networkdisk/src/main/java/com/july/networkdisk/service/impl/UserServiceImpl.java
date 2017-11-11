package com.july.networkdisk.service.impl;

import com.july.networkdisk.service.*;
import com.july.networkdisk.dao.*;
import com.july.networkdisk.vo.*;

import java.util.*;

public class UserServiceImpl implements IUserService
{
    private UserDao userDao;
    
    public UserDao getUserDao() {
        return this.userDao;
    }
    
    public void setUserDao( UserDao userDao) {
        this.userDao = userDao;
    }
    
    public void save( User user) {
        this.userDao.save(user);
    }
    
    public void update( User user) {
    	this.userDao.update(user);
    }
    
    public boolean delete( String id) {
		return false;
    }
    
    public User get( String id) {
    	
        return this.userDao.get(id);
    }
    
    public List<User> getAll() {
        return this.userDao.getAll();
    }

	public User findOne(User user) {
		return this.userDao.findOne(user);
	}
	public User findOneByEm(User user) {
		return this.userDao.findOneByEm(user);
	}
	public User findOneByPhone(User user) {
		return this.userDao.findOneByPhone(user);
	}
	public User selectUserByName(String name) {
		
		return this.userDao.selectUserByName(name);
	}

	public User selectUserByTel(String phone) {
		return this.userDao.selectUserByTel(phone);
	}

	public User selectUserByEmail(String email) {
		
		return this.userDao.selectUserByEmail(email);
	}

	public void photoup(User user) {
		this.userDao.photoup(user);
	}
	public void updatePassword(User user) {
		
		 this.userDao.updatePassword(user);
		
	}

	public List<Share> getmyshare(String uid) {
		return this.userDao.getmyshare(uid);
	}

	public List<Sharefile> getsharefile(String magid) {
		return this.userDao.getsharefile(magid);
	}

	public Categorie getcate(String fileandcateid) {
		return this.userDao.getcate(fileandcateid);
	}

	public NetFile getfile(String fileandcateid) {
		return this.userDao.getfile(fileandcateid);
	}

	public void cancelshare(Sharefile sharefile) {
		this.userDao.cancelshare(sharefile);
		
	}

	public List<NetFile> searchfile(Map<String, Object> map) {
		return this.userDao.searchfile(map);
	}

	public List<Categorie> searchcate(Map<String, Object> map) {
		return this.userDao.searchcate(map);
	}

	public String getrecatename(String catid) {
		return this.userDao.getrecatename(catid);
	}

	public List<Categorie> showparents(String cateid) {
		return this.userDao.showparents(cateid);
	}

	public User getphoto(String uid) {
		return this.userDao.getphoto(uid);
	}
	
	public void addmessage(Message mes) {
		this.userDao.addmessage(mes);
	}

	public List<Message> getmessage(String id, String[] fid) {
		return this.userDao.getmessage(id, fid);
	}

	public List<Message> getcontent(String filecateid,String uid) {
		return this.userDao.getcontent(filecateid,uid);
	}
}

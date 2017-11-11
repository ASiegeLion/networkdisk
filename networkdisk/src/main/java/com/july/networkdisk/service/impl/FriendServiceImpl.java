package com.july.networkdisk.service.impl;

import java.util.List;

import com.july.networkdisk.dao.FriendDao;
import com.july.networkdisk.service.IFriendService;
import com.july.networkdisk.vo.Friend;
import com.july.networkdisk.vo.User;

/**
 *@author Ling_jui;
 *@version 2017年9月19日
 *@type FriendServiceImpl
 */
public class FriendServiceImpl implements IFriendService{
	
	private FriendDao friendDao;

	public void save(Friend p0) {
		// TODO Auto-generated method stub
		
	}

	public void update(Friend p0) {
		// TODO Auto-generated method stub
		
	}

	public boolean delete(String p0) {
		// TODO Auto-generated method stub
		return false;
	}

	public Friend get(String p0) {
		// TODO Auto-generated method stub
		return null;
	}
	/*好友列表*/
	public List<User> getAll(String uid) {
		// TODO Auto-generated method stub
		
		return friendDao.findAll(uid);
	}
	/*查询好友*/
	public User findOne(String friendname) {
		// TODO Auto-generated method stub
		return friendDao.findOne(friendname);
	}
	public FriendDao getFriendDao() {
		return friendDao;
	}

	public void setFriendDao(FriendDao friendDao) {
		this.friendDao = friendDao;
	}

	public void insertfriend(Friend friend) {
		// TODO Auto-generated method stub
		this.friendDao.addfriend(friend);
	}

	public List<User> getfriAll(String uid) {
		// TODO Auto-generated method stub
		return friendDao.findfriAll(uid);
	}

	public List<Friend> getFriList(String id) {
		return this.friendDao.getFriList(id);
	}

	public void save(User p0) {
		// TODO Auto-generated method stub
		
	}

	public void update(User p0) {
		// TODO Auto-generated method stub
		
	}

	public User getUser(String fid) {
		return this.friendDao.getUser(fid);
	}

	public Friend findfrione(Friend friend) {
		// TODO Auto-generated method stub
		return this.friendDao.getfirone(friend);
	}

	public void deleteOne(Friend friend) {
		// TODO Auto-generated method stub
		this.friendDao.deleteOne(friend);
	}

	public void addOne(Friend friend) {
		// TODO Auto-generated method stub
		this.friendDao.addOne(friend);
	}

	
}

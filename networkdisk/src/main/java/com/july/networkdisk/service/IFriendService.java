package com.july.networkdisk.service;

import java.util.List;
import java.util.Map;

import com.july.networkdisk.vo.Friend;
import com.july.networkdisk.vo.User;

/**
 *@author Ling_jui;
 *@version 2017年9月19日
 *@type IFriendService
 */
public interface IFriendService{
	
	List<User> getAll(String uid);
	User findOne(String friendname);
	void insertfriend(Friend friend);
	List<User> getfriAll(String id);
	List<Friend> getFriList(String id);
	User getUser(String fid);
	Friend findfrione(Friend friend);
	void deleteOne(Friend friend);
	void addOne(Friend friend);
}

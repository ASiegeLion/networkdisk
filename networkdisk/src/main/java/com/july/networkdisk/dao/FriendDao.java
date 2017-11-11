package com.july.networkdisk.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.july.networkdisk.vo.Friend;
import com.july.networkdisk.vo.User;

/**
 *@author Ling_jui;
 *@version 2017年9月20日
 *@type FriendDao
 */

public class FriendDao extends BaseDao{
	
	/**
	 * @author Administrator
	 * 查找所有好友
	 */	
	public List<User> findAll(String uid) {
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		List<User> list = sqlSession.selectList("userSpace.getAllfriend",uid);
		sqlSession.close();
		return list;
	}
	/**
	 * @author Administrator
	 * 查找是否有添加好友信息
	 */	
	public List<User> findfriAll(String uid) {
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		List<User> list = sqlSession.selectList("userSpace.getfriAll",uid);		
		sqlSession.close();
		return list;
	}
	/**
	 * @author Administrator
	 * 根据input框中输入的昵称或者手机号查找好友
	 * 
	 */	
	public User findOne(String friendname){
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		User list = sqlSession.selectOne("userSpace.getOnefriend",friendname);
		sqlSession.close();
		return list;
	}
	
	/**
	 * @author Administrator
	 * 添加好友
	 * 
	 */	
	
	public void addfriend(Friend friend){
		 final SqlSession sqlSession = this.sqlSessionFactory.openSession();
	     sqlSession.insert("friendSpace.addfriend",friend);
	     sqlSession.close();
	}
	/**
	 * @author Administrator
	 * 获取friend表中fid和添加时间
	 * 
	 */	
	public List<Friend> getFriList(String id) {
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
	    List<Friend> frilist = sqlSession.selectList("friendSpace.getfrilist",id);
	    sqlSession.close();
		return frilist;
	}
	/**
	 * @author Administrator
	 * 通过id查找用户信息
	 * 
	 */	
	public User getUser(String id) {
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		User u = sqlSession.selectOne("userSpace.get", id);
		sqlSession.close();
		return u;
	}
	/**
	 * @author Administrator
	 * 查询是否好友是否存在
	 * 
	 */	
	public Friend getfirone(Friend friend) {
		// TODO Auto-generated method stub
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		Friend f=sqlSession.selectOne("friendSpace.getfrione",friend);
		sqlSession.close();
		return f;
	}
	/**
	 * @author Administrator
	 * 删除好友
	 * 
	 */	
	public void deleteOne(Friend friend) {
		// TODO Auto-generated method stub
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
		sqlSession.update("friendSpace.deleteOne",friend);
		sqlSession.close();
	}
	/**
	 * @author Administrator
	 * 添加好友
	 * 
	 */	
	public void addOne(Friend friend) {
		final SqlSession sqlSession = this.sqlSessionFactory.openSession();
	    sqlSession.insert("friendSpace.addOne",friend);
	    sqlSession.close();
	}

}

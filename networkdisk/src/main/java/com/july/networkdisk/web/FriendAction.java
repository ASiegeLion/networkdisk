package com.july.networkdisk.web;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.july.networkdisk.service.IFriendService;
import com.july.networkdisk.service.IUserService;
import com.july.networkdisk.util.CommonUtil;
import com.july.networkdisk.vo.Friend;
import com.july.networkdisk.vo.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 *@author Ling_jui;
 *@version 2017年9月19日
 *@type FriendAction
 */
@SuppressWarnings("serial")
public class FriendAction extends ActionSupport implements ModelDriven<User>{
	private Friend friend;
	private User user = new User();
	private String name;
	private IFriendService iFriendService;
	HttpServletResponse response=ServletActionContext.getResponse();
	private Map<String, Object> map;  //用来接收查询的数据和返回到前台
	private String result;
	
    public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	/**
     * 查找好友信息
     * @return
     * @throws Exception
     */
	public String getAll()throws Exception{
		map = new HashMap<String, Object>();
		User u = CommonUtil.getSessionUser();
		List<User> i = this.iFriendService.getAll(u.getId());		
		map.put("listfriends", i);
    	return SUCCESS;
    }
	/**
     * 查找是否有添加自己为好友的信息
     * @return
     * @throws Exception
     */
	public String getfriAll()throws Exception{
		map = new HashMap<String, Object>();
		User u = CommonUtil.getSessionUser();
		List<Friend> friendlist = this.iFriendService.getFriList(u.getId());
		List<User> userlist = new ArrayList<User>();
		for(int i=0;i<friendlist.size();i++){
			User user = this.iFriendService.getUser(friendlist.get(i).getFid());
			userlist.add(user);
		}
		map.put("frilist", friendlist);
		map.put("userlist", userlist);
    	return "json";
    }
	/**
     * 查询好友
     * @return
     * @throws Exception
     */
	
	public String findafriend() throws Exception{
		map = new HashMap<String, Object>();	
		User list = this.iFriendService.findOne(user.getName());
		map.put("friend", list);	
		return "json";
	}

	/**
     * 添加好友，根据前台传过来的id
     * @return
     * @throws Exception
     */
	public String addfriend() throws Exception{	
		Friend fri=this.iFriendService.findfrione(friend);
		PrintWriter out = response.getWriter();
		if(fri!=null)
		{
			out.print(false);
		}else{
			this.iFriendService.insertfriend(friend);
		}
		out.close();
		return null;	
	}
	/**
     * 添加好友，改变状态为1
     * @return
     * @throws Exception
     */
	public String addOne() throws Exception{	
		Friend fri=this.iFriendService.findfrione(friend);
		PrintWriter out = response.getWriter();
		if(fri!=null)
		{
			out.print(false);
		}else{
			this.iFriendService.addOne(friend);
			out.print(true);
		}
		out.close();
		return null;	
	}	
	/**
     * 删除好友
     * @return
     * @throws Exception
     */
	public String deleteOne() throws Exception{
    	this.iFriendService.deleteOne(friend); 
    	PrintWriter out = response.getWriter();
    	out.print(true);
    	return null;
    }
	public Friend getFriend() {
		return friend;
	}

	public void setFriend(Friend friend) {
		this.friend = friend;
	}

	public IFriendService getiFriendService() {
		return iFriendService;
	}

	public void setiFriendService(IFriendService iFriendService) {
		this.iFriendService = iFriendService;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	public Map<String, Object> getMap() {
		return map;
	}
	public void setMap(Map<String, Object> map) {
		this.map = map;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public User getModel() {
		return user;
	}

}

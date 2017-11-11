package com.july.networkdisk.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.websocket.Session;

import org.apache.struts2.ServletActionContext;

import com.july.networkdisk.service.*;
import com.july.networkdisk.vo.Notice;
import com.opensymphony.xwork2.ActionSupport;

public class NoticeAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private Notice notice;
	private INoticeService iNoticeService;
	private int beginRow;
	private int pageSize=5;
	private int pageSum;
	private int currentPage;
	private Map<String, Object> map;

	public INoticeService getiNoticeService() {
		return iNoticeService;
	}

	public void setiNoticeService(INoticeService iNoticeService) {
		this.iNoticeService = iNoticeService;
	}

	public Notice getNotice() {
		return notice;
	}

	public void setNotice(Notice notice) {
		this.notice = notice;
	}

	
	public int getBeginRow() {
		return beginRow;
	}

	public void setBeginRow(int beginRow) {
		this.beginRow = beginRow;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageSum() {
		return pageSum;
	}

	public void setPageSum(int pageSum) {
		this.pageSum = pageSum;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	/* 插入消息公告 */
	public String save() {
		iNoticeService.save(notice);
		return "success";
	}

	/* 删除消息公告 */
	public String delete() {
		map = new HashMap<String, Object>();
		HttpServletRequest request = ServletActionContext.getRequest();
		String[] s = request.getParameterValues("checkbox");
		int[] a = new int[s.length];
		for (int i = 0; i < s.length; i++) {
			a[i] = Integer.parseInt(s[i]);
			iNoticeService.delete(a[i]);
		}
		return SUCCESS;

	}

	/* 查找消息公告 */
	public String getAll() {
		HttpServletRequest request = ServletActionContext.getRequest();
		List<Notice> notice = iNoticeService.getAll();
		request.setAttribute("notice", notice);
		return "success";
	}
	
	/*消息公告详情 */
	public String noticeDetail() {
		return "success";
	}
	/*公告数量*/
	public String sum(){
		map = new HashMap<String, Object>();
		int notice = iNoticeService.sum();
		map.put("allNotice", notice);
    	return "json";
		
	}
   /*分页*/
   public String page(){
	   HttpServletRequest request = ServletActionContext.getRequest();
	   Notice notice2 =new Notice();
	   int sum = iNoticeService.sum();
	   int i = (int)Math.ceil(sum/5.0);
	   if(currentPage==0){
			currentPage=1;
		}else if(currentPage>=1&&currentPage<i){
			currentPage=currentPage;
		}else{
			currentPage = i;	
		}
	   notice2.setNowPage(currentPage);
	   notice2.setSumPage(i);
	    beginRow = (currentPage-1)*pageSize;
		List<Notice> notice = iNoticeService.page(beginRow, pageSize);
		request.setAttribute("notice", notice);
		request.setAttribute("notice2", notice2);
		return "success";
		
   }
	public Map<String, Object> getMap() {
		return map;
	}

	public void setMap(Map<String, Object> map) {
		this.map = map;
	}
	public String more(){
		return "success";
	}
}


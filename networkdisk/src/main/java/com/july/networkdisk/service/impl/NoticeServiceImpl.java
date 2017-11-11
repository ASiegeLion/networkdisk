package com.july.networkdisk.service.impl;

import java.util.List;

import com.july.networkdisk.dao.NoticeDao;
import com.july.networkdisk.service.INoticeService;
import com.july.networkdisk.vo.Notice;

public class NoticeServiceImpl implements INoticeService {
	private NoticeDao noticeDao;
	

	public NoticeDao getNoticeDao() {
		return noticeDao;
	}

	public void setNoticeDao(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}
	/*插入消息公告*/
	public void save(Notice notice) {
		noticeDao.insert(notice);
	}
	/*查找消息公告*/
	public List<Notice> getAll(){
		List<Notice> list = noticeDao.getAll();
		return list;
	}
	
	/*删除消息公告*/
	public void delete(int id) {
		noticeDao.delete(id);
	}
	public int sum(){
	   return	noticeDao.sum();
	}
    /*分页  */
	public List<Notice> page(int beginRow,int pageSize){
		return noticeDao.page(beginRow, pageSize);
	}
	public void update(Notice p0) {
		// TODO Auto-generated method stub

	}

	public boolean delete(String p0) {
		return false;
		// TODO Auto-generated method stub

	}

	public Notice get(String p0) {
		// TODO Auto-generated method stub
		return null;
	}

	



}

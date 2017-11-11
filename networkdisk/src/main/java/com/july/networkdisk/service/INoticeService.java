package com.july.networkdisk.service;


import java.util.List;

import com.july.networkdisk.vo.Notice;

public interface INoticeService extends IBaseService<Notice>{
	/*插入消息公告*/
	void save(Notice notice);
	/*删除消息公告*/
	void delete(int id);
	/*查询消息公告*/
	List<Notice> getAll();
	/*消息数量*/
	int sum();
	/*分页*/
	List<Notice> page(int beginRow,int pageSize);
	
}

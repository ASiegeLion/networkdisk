package com.july.networkdisk.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.july.networkdisk.vo.User;


	public class CommonUtil {
	public static String createUUID(){
		String strID=UUID.randomUUID().toString();
		return strID;
	}
	public static String getUUID(int number) {
		if (number < 1) {
			return null;
		}
		String s = createUUID().substring(0, 4);
	return s;
	}
	public static HttpSession createSession(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		return session;
		
	}
	public static User getSessionUser(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		return (User)session.getAttribute("user");
	}
	
	 /*MD5加密密码*/
	public static String getMD5(String str) throws Exception {
		 // 生成一个MD5加密计算摘要
		 MessageDigest md = MessageDigest.getInstance("MD5");
		 // 计算md5函数
		 md.update(str.getBytes());
		 // digest()最后确定返回md5 hash值，返回值为8为字符串。因为md5 hash值是16位的hex值，实际上就是8位的字符
		 // BigInteger函数则将8位的字符串转换成16位hex值，用字符串来表示；得到字符串形式的hash值
		 return new BigInteger(1, md.digest()).toString(16);
	}
}

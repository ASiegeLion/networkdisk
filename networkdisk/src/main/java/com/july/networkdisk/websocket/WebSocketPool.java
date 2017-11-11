package com.july.networkdisk.websocket;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.java_websocket.WebSocket;

public class WebSocketPool { 
	private static final Map<WebSocket, String> userconnections = new HashMap<WebSocket, String>();
	//通过Websocket对象获取用户名
	public static String getUserByKey(WebSocket conn) { 
		return userconnections.get(conn); 
	} 
	//获取在线人数 
	public static int getUserCount() { 
		return userconnections.size(); 
	} 
	//获得WebSocket对象
	public static WebSocket getWebSocketByUser(String uid) { 
		Set<WebSocket> keySet = userconnections.keySet(); 
		synchronized (keySet) { 
			for (WebSocket conn : keySet) { 
				String cuser = userconnections.get(conn); 
				cuser = cuser.replace(" ", "");
				uid = uid.replace(" ", "");
				if (cuser.equals(uid)) { 
					return conn; 
					} 
				} 
			} 
		return null; 
	} 
	//加入连接
	public static void addUser( WebSocket conn, String uid) { 
		System.out.println("\n~~~~~~~~~~~~~~~~~~~~~"+uid+"~~~~~~~~~~~~~~~~~~~~~\n");
		userconnections.put(conn, uid); // 添加连接 
		System.out.println(userconnections.get(conn)+"==============================");
	} 
	
	//退出处理
	public static boolean removeUser(WebSocket conn) { 
		if (userconnections.containsKey(conn)) { 
			
			@SuppressWarnings("rawtypes")
			Iterator iterator = userconnections.keySet().iterator();   
			while (iterator.hasNext()) {  
				WebSocket key = (WebSocket) iterator.next();  
			    if (conn == key) { 
			       iterator.remove();        
			       userconnections.remove(key);      //直接remove无法成功必须有前面一行代码
			     }  
			} 
			return true; 
			} else { 
				return false; 
			} 
	}
	//向指定用户发送消息
	public static void sendMessageToUser(String friid,String uid, String message) { 
		WebSocket friconn = getWebSocketByUser(friid);
		WebSocket userconn = getWebSocketByUser(uid);
		if (null != friconn) { 
			message += uid;
			friconn.send(message); 
		}else{
			message = "0";
			userconn.send(message);
		}
	} 
	//向所有用户发送消息
	public static void sendMessage(String message) { 
		Set<WebSocket> keySet = userconnections.keySet(); 
		synchronized (keySet) { 
			for (WebSocket conn : keySet) { 
				String user = userconnections.get(conn); 
				if (user != null) { 
					conn.send(message); 
					} 
				} 
		} 
	} 
}



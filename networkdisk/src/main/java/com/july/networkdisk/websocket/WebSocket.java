package com.july.networkdisk.websocket;

import java.net.InetSocketAddress;
import java.net.UnknownHostException;

import net.sf.json.JSONObject;
import org.java_websocket.handshake.ClientHandshake;
import org.java_websocket.server.WebSocketServer;
import com.july.networkdisk.vo.Message;

public class WebSocket extends WebSocketServer {
	
	public WebSocket(InetSocketAddress address) { 
		super(address); 
		System.out.println("地址"+address); 
	}
	public WebSocket(int port) throws UnknownHostException {
		super(new InetSocketAddress(port)); 
		System.out.println("端口"+port); 
	}
	//退出
	@Override
	public void onClose(org.java_websocket.WebSocket conn, int message,
			String reason, boolean remote) {
		String uid = WebSocketPool.getUserByKey(conn);
		System.out.println(uid+"退出连接！");
		WebSocketPool.removeUser(conn);
			/*userLeave(conn);*/
	}
	//异常
	@Override
	public void onError(org.java_websocket.WebSocket conn, Exception message) {
		System.out.println("Socket异常:"+message.toString());
	}
	//客户端发送消息到服务器时触发事件
	int j=0,h=0,e=0,l=0;
	@Override
	public void onMessage(org.java_websocket.WebSocket conn, String message) {
		JSONObject js= JSONObject.fromObject(message);  
        System.out.println(js.toString()+"###################");
        Message mes=(Message)JSONObject.toBean(js, Message.class);
        int type = mes.getType();
        if(type == 1){
        	WebSocketPool.addUser(conn, mes.getUserid());
        }else{
        	WebSocketPool.sendMessageToUser(mes.getFriendid(),mes.getUserid(), mes.getContent());
        }
		
	}
	
	//连接
	@Override
	public void onOpen(org.java_websocket.WebSocket conn, ClientHandshake handshake) {
		
	}
	
}
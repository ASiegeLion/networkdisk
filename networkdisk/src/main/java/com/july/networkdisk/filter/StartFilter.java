package com.july.networkdisk.filter;

import java.io.IOException;
import java.net.UnknownHostException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.websocket.server.ServerEndpoint;

import org.java_websocket.WebSocketImpl;

import com.july.networkdisk.websocket.WebSocket;

@ServerEndpoint("/ws") 
public class StartFilter implements Filter{

	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
	}
	
	public void init(FilterConfig arg0) throws ServletException {
		this.startWebsocketOnline(); 
		
	}

	//启动socket服务
	private void startWebsocketOnline() {
		System.out.println("开始启动websocket"); 
		WebSocketImpl.DEBUG = false; 
		int port = 8085; // 端口随便设置，只要不跟现有端口重复就可以
		WebSocket s = null; 
		try { 
			s = new WebSocket(port); 
			s.start(); 
		} catch (UnknownHostException e) { 
			System.out.println("启动websocket失败！"); 
			e.printStackTrace(); 
		} 
		System.out.println("启动websocket成功！");
		
	}

	
}

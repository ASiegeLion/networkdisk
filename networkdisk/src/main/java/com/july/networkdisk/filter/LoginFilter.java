package com.july.networkdisk.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginFilter implements Filter{

	public void destroy() {
		
	}

	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)servletRequest;  
        HttpServletResponse response = (HttpServletResponse)servletResponse;  
        String currentURL = request.getRequestURI();  
        String ctxPath = request.getContextPath();  
        //除掉项目名称时访问页面当前路径  
        String targetURL = currentURL.substring(ctxPath.length());
        System.out.println("================================================");
		System.out.println(targetURL);
		/*不需要拦截的访问*/
		if(targetURL.endsWith(".css")||targetURL.endsWith(".js")||targetURL.endsWith(".jpg")||targetURL.endsWith(".png")
				||"/login.jsp".equals(targetURL)||"/register.jsp".equals(targetURL)||"/userlogin".equals(targetURL)
				||"/register".equals(targetURL)||"/checkUserName".equals(targetURL)||"/checkPhone".equals(targetURL)
				||"/checkEmail".equals(targetURL)||"/sendEmail".equals(targetURL)||"/checkVCode".equals(targetURL)
				||"/showphoto".equals(targetURL)||"/shareurl".equals(targetURL)||"//progress".equals(targetURL)
				||"/sharelogin".equals(targetURL)||"/".equals(targetURL)||"/shownext".equals(targetURL)
				||"/goforget".equals(targetURL)||"/getUserByEm".equals(targetURL)||"/updatepwd".equals(targetURL)
				||"/pwdextract".equals(targetURL) ||"/manager/login.jsp".equals(targetURL)||"/manager/adminlogin".equals(targetURL)
				||"/error.jsp".equals(targetURL)||"/exception.jsp".equals(targetURL)
		){
			System.out.println("不需要拦截");
		}else{
			System.out.println("需要拦截");
			HttpSession session = request.getSession(false);  
			if(session == null || session.getAttribute("user") == null)
			{
				System.out.println("已经拦截");
				response.sendRedirect(request.getContextPath()+"/login.jsp");
				return;
			}
		}
		chain.doFilter(servletRequest, servletResponse);
	}

	public void init(FilterConfig arg0) throws ServletException {
		
	}
	
	

}

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page language="java" import="java.util.*,java.net.*" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
		<link rel="stylesheet" href="/networkdisk/user/css/login.css">
		<link rel="stylesheet" href="/networkdisk/user/css/bootstrap.min.css"/> 
		<link rel="Shortcut Icon" href="/networkdisk/img/julyicon.png">
		<script src="/networkdisk/user/js/jquery-1.11.2.min.js"></script>
		<script src="/networkdisk/user/js/login.js"></script>
	    <script src="/networkdisk/user/js/bootstrap.min.js"></script>
<%
  String un="";
  String up="";
  Cookie cookie[]=request.getCookies();
  if(cookie!=null)
  {
	  for(Cookie ck:cookie)
	  {
		  if("username".equals(ck.getName()))
		  {
			  un=URLDecoder.decode(ck.getValue(), "utf-8");
		  }
		  if("password".equals(ck.getName()))
		  {
			  up=ck.getValue();
		  }
	  }
  }



%>
	</head>
<body>
<div class="login-container">
    <div id="myCarousel" class="carousel slide">
	<!-- 轮播（Carousel）指标 -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
		<li data-target="#myCarousel" data-slide-to="3"></li>
	</ol>   
	<!-- 轮播（Carousel）项目 -->
	<div class="carousel-inner">
		<div class="item active" >
			<a><img src="/networkdisk/user/img/bg1.jpg" alt="First slide"></a>
			<div class="body-content">
			<p>
		    <span ><img src="/networkdisk/user/img/leftquote.png"></span>
			<span>安全存储</span>
			</p>
			<p>
    		<span>生活仅仅有条</span>
			<span><img src="/networkdisk/user/img/rightquote.png"></span>
			</p>
			</div>
		</div>
		<div class="item" >
			<a><img src="/networkdisk/user/img/bg2.jpg" alt="Second slide"></a>
			<div class="body-content">
			<p>
			<span ><img src="/networkdisk/user/img/leftquote.png"></span>
			<span>在线预览</span>
			</p>
			<p>
			<span>文件即开即看</span>
			<span><img src="/networkdisk/user/img/rightquote.png"></span>
			</p>
			</div>
		</div>
		<div class="item" >
			<a><img src="/networkdisk/user/img/bg3.jpg" alt="Third slide"></a>
			<div class="body-content">
			<p>
			<span><img src="/networkdisk/user/img/leftquote.png"></span>
			<span>多端并用</span>
			</p>
			<p>
			<span>数据随身携带</span>
			<span><img src="/networkdisk/user/img/rightquote.png"></span>
			</p>
			</div>
		</div>
		<div class="item" >
			<a><img src="/networkdisk/user/img/bg3.jpg" alt="Third slide"></a>
			<div class="body-content">
			<p>
			<span><img src="/networkdisk/user/img/leftquote.png"></span>
			<span>好友分享</span>
			</p>
			<p>
			<span>共度幸福时光</span>
			<span><img src="/networkdisk/user/img/rightquote.png"></span>
			</p>
			</div>		
		</div>
	</div>
</div> 
<div class="logo"><img src="/networkdisk/user/img/login_logo.png"><span> july云盘</span></div>
			<div id="login-middle">
			<div class="login_title">
				<h4>账号密码登录</h4>
			</div>
			 
			<div class="login_form">

			  <form action="${pageContext.request.contextPath}/userlogin" method="post" >

				<div class="form_user">
					<input type="text" placeholder="  用户名/手机/邮箱" name="name"  value="<%=un%>"/>
				</div>
				<div class="form_password">
					<input type="password" placeholder="   密 码"  name="passWord" value="<%=up%>"/>
				</div>
				
				<div class="form_check">
					<input type="checkbox"  name="check"/>
					<span>记住密码</span>
				</div>
				<div class="form_login">
				 
					<input type="submit" value="登录"  />
				</div>
				<div class="form_href" id="question">
					<a href="goforget">忘记密码？</a>
				</div>
				<div class="form_href" id="number">
					<a href="#">海外手机号</a>
				</div>
			   <input type="hidden" id="success" value="${message}" > 
              </form>
             
			</div>
			
			<div class="login_bottom">
				<div class="bottom_href">
					<ul>	
				    	<li> <a href="#"><input type="submit" value="扫一扫登录" id="scan_login"/></a></li>
				    	<li> <a href="#"><img src="/networkdisk/user/img/weibo.png"/></a></li>
				    	<li> <a href="#"><img src="/networkdisk/user/img/qq.png"/></a></li>
				    	<li><a href="/networkdisk/register.jsp"><input type="submit" value="立即注册"/></a></li>
					</ul>
				</div>
			</div>

		</div>
</div>
<script type="text/javascript">
     
              /*   登录验证 */
		$(document).ready(function(){
			var successmassge = $("#success").val();
		    if(successmassge=="error"){
				alert("用户名或密码错误！");
				location.href="login.jsp";
			}
		});
              
	</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/networkdisk/manager/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/networkdisk/manager/css/bootstrap-theme.min.css" />
<link rel="stylesheet" href="/networkdisk/manager/css/home.css" />
<script type="text/javascript"
	src="/networkdisk/manager/js/jquery-3.2.1.min.js"></script>

<script src="/networkdisk/manager/js/jquery.validate.js"></script>
<script src="/networkdisk/manager/js/jquery.validate.min.js"></script>
<script src="/networkdisk/manager/js/messages_zh.js"></script>
<script type="text/javascript"
	src="/networkdisk/manager/js/bootstrap.min.js"></script>

<script type="text/javascript" src="/networkdisk/manager/js/home.js"></script>
<style>
.error {
    padding-left:15px;
	padding-left: 15px;
	color: red;
}
</style>
<script type="text/javascript">
function logout()
{
	if(confirm("确认退出？"))
		{
		window.location.href="adminlogout";
		}
}


</script>
<title>Insert title here</title>
</head>
<body>
	<div class="head">
		<div class="logo">
			<a id="logo" href="#">
				<img src="/networkdisk/img/LOGO.png"/>
			</a>
		</div>
		<div class="head_right">
			<span>您好</span> <a href="#"><span>${user.name }</span></a>
			<a data-toggle="modal" data-target="#editPwd"><span class="aa">修改密码</span></a>
		    <a onclick="logout()"><span class="aa">退出</span></a>
		</div>
	</div>
	<div class="cont">
		<div class="cont_left">
			<div class="bot" id="p1"><a href="getUserAll" target="content" class="net">首页</a></div>
			<div class="bot" id="p2"><a href="getUserAll" target="content" class="net">用户管理</a></div>
			<div class="bot" id="p3"><a href="getUserfile" target="content" class="net">文件管理</a></div>
			<div class="bot" id="p7"><a href="getNotice" target="content" class='net'>网站公告管理</a></div>
			
			
		</div>
		<div class="cont_right">
			<iframe src="/networkdisk/manager/frist.jsp" id="page" class="page" scrolling="no" name="content"></iframe>
		</div>
	</div>
	<div class="modal fade" id="editPwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel"> 修改密码</h4>
            </div>
            <form action="updatePassAction"  id="updatePassForm" method="post">
					<ol  class="right-03">
						<li class="pwd-li1"><span>密码:</span><input type="password"  id="u_pwd1" value="" name="passWord"></li>
						<li class="pwd-li2"><span>确认密码:</span><input type="password"   id="u_pwd2" value="" name="repassword"></li>
				</form>
				<br />
				<div class="modal-footer" class="update_btn">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					 <button type="submit" class="btn btn-primary" >修改</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#updatePassForm").validate({
			rules:{
				 passWord: {
				        required: true,
				        rangelength:[6,14]
				      },
				      repassword: {
					        required: true,
					        rangelength:[6,14],
					        equalTo:"#u_pwd1"
					      }
			 },
			 messages: {
				  passWord: {
				        required: "请输入密码",
				        rangelength: "密码长度为6-14个字符"
				      },
				      repassword: {
					        required: "请输入密码",
					        rangelength:"密码长度为6-14个字符",
					        equalTo:"两次密码不一致"
					      }
			 }
			 
		 });
	})
	
	
	
	
	
	
	</script>
</body>
</html>
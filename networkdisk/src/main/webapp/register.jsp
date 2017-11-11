<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title></title>
<link rel="stylesheet" href="/networkdisk/user/css/register.css">
<link rel="stylesheet" href="/networkdisk/user/css/bootstrap.min.css" />
<link rel="Shortcut Icon" href="/networkdisk/img/julyicon.png">
<script src="/networkdisk/user/js/jquery-1.11.2.min.js"></script>
<script src="/networkdisk/user/js/register.js"></script>
<script src="/networkdisk/user/js/bootstrap.min.js"></script>
<script src="/networkdisk/user/js/jquery.validate.js"></script>
<script src="/networkdisk/user/js/jquery.validate.min.js"></script>
<script src="/networkdisk/user/js/messages_zh.js"></script>
<script src="/networkdisk/user/js/jquery.validate.addMethod.js"></script>

<script type="text/javascript">
var countdown=60; 
function settime(obj) { 
	if(countdown == 60){
			    var email = $("#email").val();
			    if(email ==""){
			    	alert("请填写邮箱！")
			    	return;
			    }
		        $.ajax({  
		            url:"${pageContext.request.contextPath}/sendEmail",  
		            dataType: 'json',  
		            data:{"email":email},
		            success:function(data){ 
		            	if(data == true)
		            	alert("发送成功，请到邮箱查看验证码！");
		            	if(data == false)
		            	alert("发送失败！");
		             },  
		            error:function(){  
		                alert("发送失败！");  
		            }  
				}); 
	}
    if (countdown == 0) { 
        obj.removeAttribute("disabled");    
        obj.value="获取验证码"; 
        countdown = 60; 
        return;
    } else { 
        obj.setAttribute("disabled", true); 
        obj.value="重新发送(" + countdown + ")"; 
        countdown--; 
    } 
setTimeout(function() { 
    settime(obj)
    }
    ,1000) 
}

</script>

<style>

.error {
padding-left:15px;
	color: red;
}
</style>


</head>
<body>
	<div id="head">
	<div style="height:40px"></div>
		<div id="head-left">
			<img src="/networkdisk/user/img/register_logo .png"> <span>|&nbsp;&nbsp;注册july云盘账号</span>
		</div>
		<div id="head-right">
			<span>我已注册，现在就</span>
			<div class="login-buttom">
				<a href="login.jsp"> 登录</a>
			</div>
		</div>
	</div>
	 <div class="hr">
		<hr />
	</div>  
	<div class="reg_content">
		<!-- <form action="register.action" method="post">
			<input type="submit" value="submit" />
		</form> -->
	
	
	
		<form action="${pageContext.request.contextPath}/register" method="post" id="registerForm" class="register_form" >
			<fieldset>
				<div class="reg_username">
					<span>用户名</span><input type="text" name="name"  id="username" value="${user.name }" onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')"  />
				</div> 
				<div class="reg_realname">
					<span>真实姓名</span><input type="text" name="trueName" id="realname" value="${user.trueName }" onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')"  />
				</div>
				<div class="reg_sex">
					<span>性&nbsp;&nbsp;&nbsp;别</span> <input type="radio" name="sex" value="1"  id="sex" checked="checked"/>男  &nbsp; &nbsp;&nbsp;&nbsp;<input type="radio" name="sex" value="0" id="sex"  /> 女
				</div>
				<div class="reg_tel">

					<span>手机号</span><input type="text" name="phone" id="telphone" value="${user.phone }" onkeyup="value=value.replace(/[^0-9]/g,'')"/>
				</div>
				<div class="reg_email">
					<span>邮&nbsp;&nbsp;&nbsp;箱</span><input type="email" name="email"  value="${user.email }"
						id="email" />
						
						<label id="false" style="color:red;height:10px;"><s:fielderror></s:fielderror></label>
				</div>
				<div class="reg_code">
					&nbsp;<label>邮箱验证码</label>
					<input type="button" id="btn" value="获取验证码" onclick="settime(this)" /> 
					<input type="text" name="code" id="code" />
						
				</div>
				<div class="reg_password">

						<span>密&nbsp;&nbsp;&nbsp;码</span><input type="password" name="passWord" value="${user.passWord }"
						id="password" onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5]/g,'')"/>

				</div>
				<div class="repassword">
					<span>确认密码</span><input type="password" name="repassword" id="repassword"  />
				</div>
				<div class="reg_check">
					<input type="checkbox" id="agree" name="agree" checked="checked"/><font size="2">阅读并接受<a
						href="#">《july云盘用户协议》</a> 及<a href="#">《july云盘隐私权保护生命》</a></font>
				</div>
				<div class="reg_btn">
					<input type="submit"  value="注册" />
				</div>
			</fieldset>
			
		</form>
				<input type="hidden" id="success" value="${massger }" >
				
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			var successmassge = $("#success").val();
			var falsemassge = $("#false").text();
			if(successmassge != ""){
				alert(successmassge);
				location.href="login.jsp";
			}
			
		});
		
	</script>
	
</body>
</html>

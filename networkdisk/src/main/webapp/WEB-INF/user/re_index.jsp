   <%@ page language="java" contentType="text/html; charset=UTF-8"  
        pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>July云盘</title>
		<link rel="stylesheet" href="/networkdisk/css/re_index.css" /> 
		<link rel="Shortcut Icon" href="/networkdisk/img/julyicon.png">
	</head>
	<body>
		<div class="frame">
			<img src="img/po.jpg"/>
		</div>
		<div class="content">
	        <div class="logo">
	        	<img src="/networkdisk/img/cloudLogo.png" class="logo-p"/>
	        	<span class="logoName">July云盘</span>
	        </div>
		    <div class="content-form">
		    	<div class="content-head">
		    		<img src="${pageContext.request.contextPath}/showphoto?uid=${user.id}"  class="head-img">
		    		<span class="span-name">
		    			${user.name }
                    </span>
		    		<span class="span-file">给您分享了文件</span>
		    	</div>
		    	<form action="pwdextract" method="post">
		    	<div class="content-fonter">
		    		<div class="re-pwd">
		    		<input type="hidden" value="${url }" name="url" >
		    			<div><p>请输入提取密码:</p></div>
		    			<div><input type="text" class="text" name="sharepwd"><input type="submit" class="button" value="提取文件"></div>
		    		</div>
		    	</div>
		    	</form>
		    </div>
		</div>
		
	</body>
</html>

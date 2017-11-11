<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/networkdisk/user/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/networkdisk/user/css/bootstrap-theme.min.css" />
<link href="/networkdisk/css/notice2.css" rel="stylesheet" />
<link href="/networkdisk/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
<script src="/networkdisk/user/js/jquery-1.11.2.min.js"></script>
<script src="/networkdisk/js/index.js"></script>
<script src="/networkdisk/user/js/jquery.validate.js"></script>
<script src="/networkdisk/user/js/jquery.validate.min.js"></script>
<script src="/networkdisk/user/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="clean" style="clear: all;height:40px;"></div>
		      <div class="noticePage">
		      	<div style="height:50px;"><a href="getNotice" class="goback">返回</a></div>
		      	<div class="noticeTitle">${param.title}</div>
		      	<div class="noticeContent">
		      	  <textarea style="width:700px;height:400px" >${param.text}</textarea>	
		      	</div>
		      </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/networkdisk/manager/css/login.css" />
<script type="text/javascript" src="/networkdisk/manager/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/networkdisk/manager/js/login.js" ></script>
<title>Insert title here</title>
</head>
<body>
	<div class="mid">
		<div>
			<img src="/networkdisk/manager/img/logo.png" />
		</div>
		<div class="cent">
			<form action="adminlogin" method="post">
				<div style="margin: 20px 60px;" id="d1">
					<span class="font">username:</span>&nbsp;&nbsp;<input type="text" name="name"
						value="" class="text" id="t1" />
				</div>
				<div style="margin: 20px 60px;" id="d2">
					<span class="font">password:</span>&nbsp;&nbsp;<input type="password" name="passWord"
						value="" class="text" id="t2" />
				</div>
				<div class="botton">
					<input type="image" src="/networkdisk/manager/img/button.png" id="img" />
				</div>
			</form>
		</div>
	</div>
</body>
</html>
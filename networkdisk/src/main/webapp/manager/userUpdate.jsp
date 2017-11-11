<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td><input type="text" value="用户名" name="user.name" /></td>
			<td><input type="password" value="密码" name="user.passWord" /></td>
			<td><input type="text" value="真实姓名" name="user.trueName" /></td>
			<td><input type="text" value="邮箱" name="user.email" /></td>
			
		</tr>
		<tr>
			<td><input type="text" value="电话" name="user.phone" /></td>
			<td><input type="text" value="性别" name="user.sex" /></td>
			<td><input type="text" value="个人信息" name="about" /></td>
			<td><input type="text" value="头像" name="user.photo" /></td>
			<td><a href="userUpdate?${users.id }">修改</a></td>
		</tr>
	</table>
</body>
</html>
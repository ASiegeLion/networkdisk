<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<link rel="stylesheet" href="/networkdisk/manager/css/users2.css" />
</head>
<body>
<div class="head"><span class="m-head">文件管理</span></div>
		<div class="cont">
		<form id="formupdate">
			<table>
				<tr class="m-tr">
					<td>用户名</td>
					<td>真实姓名</td>
					<td>性别</td>
					<td>操作管理</td>
				</tr>
				
				<c:forEach items="${users}" var="u">
				<tr class="m-tr2">
					
					<td><input type="text"  value="${u.name}" name="name" readonly="readonly" class="aaa" /></td>
					<td><input type="text"  value="${u.trueName}" name="trueName" readonly="readonly" class="aaa" /></td>
					<td><input type="text" name="sex" value="<c:if test="${u.sex == 1 }">男</c:if><c:if test="${u.sex == 0 }">女</c:if>" readonly="readonly" class="aaa" /></td>
			        <td><a href="fileManager.jsp?id=${u.id}" target="content">查看</a></td>
				</tr>
				
				</c:forEach>
			</table>
			</form>
		</div>

</body>
</html>
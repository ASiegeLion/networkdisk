<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/networkdisk/manager/css/users2.css" />
<script type="text/javascript" src="/networkdisk/manager/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".update").hide();
		$(".edite").click(function(){
			 $(this).parents('tr').find(".aaa").removeAttr("readonly");
			 $(this).parents('tr').find(".aaa").css({"background":"white"});
			 $(this).parents('tr').find(".edite").hide();
			 $(this).parents('tr').find(".update").show();
		});
		
	});
	 function update(){
		 
		 $.ajax({
				type : "post",
				dataType : "json",
				url : "adminUpdate",
				data: $('#formupdate').serialize(),
				success : function() {
					alert("修改成功");
				},
				error :function(){
					alert("修改失败");
				}
		});
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<div class="head"><span class="m-head">用户管理</span></div>
		<div class="cont">
		<form id="formupdate">
			<table>
				<tr class="m-tr">
					<td>用户名</td>
					<td>真实姓名</td>
					<td>性别</td>
					<td>email</td>
					<td>手机</td>
					<td>操作</td>
					
				</tr>
				
				<c:forEach items="${users}" var="u">
				<tr class="m-tr2">
					
					<td><input type="text"  value="${u.name}" name="name" readonly="readonly" class="aaa" /></td>
					<td><input type="text"  value="${u.trueName}" name="trueName" readonly="readonly" class="aaa" /></td>
					<td><input type="text" name="sex" value="<c:if test="${u.sex == 1 }">男</c:if><c:if test="${u.sex == 0 }">女</c:if>" readonly="readonly" class="aaa" /></td>
					<td><input type="text"  value="${u.email}" readonly="readonly" name="email" class="aaa" /></td>
					<td><input type="text"  value="${u.phone}" readonly="readonly" name="phone" class="aaa" /></td>
					<td><a href="userdetailInfo.jsp?id=${u.id}">查看资料</a></td>
				</tr>
				</c:forEach>
			</table>
			</form>
		</div>
</body>
</html>
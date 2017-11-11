<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/networkdisk/manager/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/networkdisk/manager/css/bootstrap-theme.min.css" />
<link href="/networkdisk/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="/networkdisk/manager/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="/networkdisk/manager/css/notice3.css" />

<script type="text/javascript"
	src="/networkdisk/manager/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body style='height:600px;overflow: auto'>
	
		<div class="head">

			<div class="head_left">
				<span class="m-head">公告管理</span> 
				<span class="rowDelete" > <a onclick="Ndelete()"> <i class="fa fa-trash"></i>删除
				</a>
				</span> <span class="rowAdd" > <a  data-toggle="modal"
							data-target="#addNotices"><i
						class="fa fa-plus"></i>发布公告</a>
				</span>

			</div>
		
		</div>

<form name="form1" action="">
		<div class="cont" style="overflow: auto;max-height:560px">

			<table>
				<tr class="m-tr">
					<td>主题</td>
					<td>内容</td>
					<td>发布时间</td>
				</tr>

				<c:forEach items="${notice}" var="n">
					<tr class="m-tr2">
						<td class="ts-title"><input type="checkbox" class="checkbox" name="checkbox"
							value="${n.id}" />
							<div class="s-title"><a href="noticeDetail.jsp?title=${n.title}&text=${n.text}" class="noticeTitle">${n.title}</a></div></td>
						<td class="ts-text"><div class="tdcontent">
								<span class="s-text">${n.text}</span>
							</div></td>
						<td><span><fmt:formatDate value="${n.time}"
									pattern="yyyy-MM-dd HH:mm:ss" /></span></td>

				</c:forEach>
			</table>

		</div>

	</form>
	
	
	
	<!-- 添加公告弹框 -->
	<form action="addNotice" id="updatePassForm" method="post" >
	<div class="modal fade" id="addNotices" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
 <div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title" id="myModalLabel">
							添加公告
						</h4>
					</div>
					
						<ol class="notice_add">
							<li ><span>公告主题:</span><input type="text"  value="" name="notice.title"></li>
							<li>公告内容:<textarea  id="noteice_area"    name="notice.text"></textarea></li>
						</ol>
					
					<br />
					<div class="modal-footer"  id="notice_btn">
						<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
						<input type="submit" class="btn btn-primary"  value="添加" >
					</div>
					
				</div>
			</div>
</div>
</form>
	
	
	<script type="text/javascript">
		function Ndelete() {
			 if(confirm("是否删除？"))
			   {
				 document.form1.action="noticeDelete";
		         document.form1.submit();
				  
			   }
		}
		
	</script>
</body>
</html>
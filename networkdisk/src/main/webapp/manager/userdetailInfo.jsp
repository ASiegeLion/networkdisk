<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="/networkdisk/user/js/jquery-1.11.2.min.js"></script>
<style type="text/css">
	.userinfo-box div{
		width:100%;
		height:40px;
		line-height:40px;
		margin:20px 0;
		padding-left:5px;
		padding-left:20px;
		color:#000;
	}
	.userinfo-box div input{
		width:700px;
		height: 36px;
		padding-left:10px;
		border: 0;
		font-weight: bold;
		font-size:15px;
	}
	a
	{
	text-decoration: none;
	color:black;
	}
</style>
</head>
<body>
<a href="user.jsp">返回</a>

<table id="userinfo">

  
</table>

	<div class='userinfo' style="width:910px;height:auto;margin: 0px auto;">
		<div class="userhead" style="width:100%;height: 60px;padding:0px;">
		          &nbsp;&nbsp;  &nbsp;我的头像: &nbsp; &nbsp;<img alt="" src="" width='60px' height="60px">
		</div>
		<div class='userinfo-box'>
			<div>
		           用 &nbsp;户  &nbsp;名：<input type='text' value='' class='user-name' readonly="readonly">
			</div>
			<div>
			真实姓名：	<input type='text' value='' class='user-truename' readonly="readonly">
			</div>
			<div>
			性 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;别：	<input type='text' value='' class='user-sex' readonly="readonly">
			</div>
			<div>
			手 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;机：	<input type='text' value='' class='user-phone' readonly="readonly">
			</div>
			<div>
			邮 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;箱：	<input type='text' value='' class='user-email' readonly="readonly">
			</div>
			<div style="overflow:hidden; white-space: nowrap;text-overflow: ellipsis;">
			描 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;述：	<input type='text' value='' class='user-desc' readonly="readonly">
			</div>
			<div>
			注册时间: &nbsp; &nbsp;<input type='text' value='' class='user-regtime' readonly="readonly">
			</div>
		</div>
	</div>



	<script type="text/javascript">
var id="<%=request.getParameter("id")%>";


function showUserInfo()
{
	 $.ajax({
			url : "${pageContext.request.contextPath}/getUserInfoById",
			type :"post",
			dataType: "json",
			data : {
				 uid:id
			},
			success:function(user) {
				var sex=null;
				if(user.sex==0)
				{
				   sex='女';
				}else if(user.sex==1)
					{
					sex='男';
					}
				
				$('.userhead img').attr('src',"showphoto?uid="+user.id);
				$('.user-name').val(user.name);
				$('.user-truename').val(user.trueName);
				$('.user-sex').val(sex);
				$('.user-phone').val(user.phone);
				$('.user-email').val(user.email);
				$('.user-desc').val(user.about);
				$('.user-regtime').val(user.addtime);
				
				
				
				
			},
			error : function() {
				alert("查询失败！");
			}
		}); 
}

$(document).ready(function(){
	showUserInfo();
	
})


</script>
</body>
</html>
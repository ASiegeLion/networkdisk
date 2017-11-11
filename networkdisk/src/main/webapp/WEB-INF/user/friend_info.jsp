<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分享界面</title>
		<link href="/networkdisk/user/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="/networkdisk/user/css/bootstrap-theme.min.css" />
		<link href="/networkdisk/css/style.css" rel="stylesheet" />
		<link href="/networkdisk/css/share.css" rel="stylesheet" />
		<script src="/networkdisk/user/js/jquery-1.11.2.min.js"></script>	
		<script src="/networkdisk/user/js/bootstrap.min.js"></script>
</head>

	<body>

			<div class="friend_info">
			<div class="friend_touxiang">
				<img src="img/pic3.png" />
			</div>
			<div class="friend_name">
				<p><font size="6">慕名玉兰</font></p>
			</div>
			<div class="friend_option">
				<div class="option_one">
					<label>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</label><span>慕名玉兰</span>
				</div>
				<div class="option_one">
					<label>昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</label><span>------</span>
				</div>
				<div class="option_one">
					<label>七度账号：</label><span>慕名玉兰</span>
				</div>
				<div class="option_two">
					<a href="#">
						<button>分享文件</button>
					</a>
				</div>
				<div class="option_two">
					<a href="#deleteModal" data-toggle="modal">
						<button>删除好友</button>
					</a>
				</div>

			</div>

			<!--    删除模态框    -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
				</button>
				<h4 class="modal-title" id="myModalLabel">
					删除好友
				</h4>
			</div>
			<div class="modal-body">
				<div class="modal-body_item">
					<p><span>确定要删除好友“慕名玉兰”？</span></p>
					
				</div>
				
			</div>
			<div class="modal-footer">
				
				<button type="button"  data-dismiss="modal" class="confirm">
					确定
				</button>
				<button type="button"  data-dismiss="modal" class="cancle">
					取消
				</button>
			
			</div>
		</div>
	</div>
</div>
<script>
   $(function () { $('#deleteModal').modal('hide')});
</script>

		</div>
	</body>

</html>
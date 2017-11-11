<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.july.networkdisk.util.CommonUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>GitCloud</title>
		<link rel="Shortcut Icon" href="/networkdisk/img/julyicon.png">
		<link href="/networkdisk/user/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css"
			href="/networkdisk/user/css/bootstrap-theme.min.css" />
		<link href="/networkdisk/css/more.css" rel="stylesheet" />
		<link href="/networkdisk/css/style.css" rel="stylesheet" />
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<link href="/networkdisk/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
		<script src="/networkdisk/user/js/jquery-1.11.2.min.js"></script>
		<script src="/networkdisk/js/index.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="/networkdisk/user/js/jquery.validate.js"></script>
		<script src="/networkdisk/user/js/jquery.validate.min.js"></script>
		<script src="/networkdisk/user/js/bootstrap.min.js"></script>
	</head>

	<body>
		<div id="in-nav">
		<div class="logo">
				<a id="logo" href="goindex">
					<img src="/networkdisk/img/LOGO.png" style="position: absolute;top:3px;"/>
				</a>
			</div>
		<div class="container1">
			<div class="row1">
				<div class="span1" style="display: inline;">
					<ul class="pull-left">
						<li><a href="goindex">网盘</a></li>
						<li ><a href="findAll">分享</a></li>
						<li class="active"><a href="more">更多</a></li>
					</ul>
				</div>
				<div class="span2">
					<ul class="right">
						<li class="chos" style="width: 220px;">
							<div class="sev">
								<div class="admin">
									<img src="showphoto?uid=${sessionScope.user.id }" width="30px"
										style="border-radius: 30px; position: absolute; top: 10px;" />
									<a href="#" style="display: inline-block; height: 50px;">
										<div class="username">${sessionScope.user.name }</div> <img
										src="/networkdisk/img/VIP1.png"
										style="display: inline-block; margin-bottom: 45px;" />
									</a> <em style="display: inline-block;"><img
										src="/networkdisk/img/downchoose.png" class="c"
										style="margin-bottom: 40px;" /></em>
								</div>
								<div class="user">
									<span id="triangle-up"> </span>
									<div class="userpan">
										<div class="userpan_2">
											<div class="u1">
												<a href="#"> 
												<img src="showphoto?uid=${sessionScope.user.id }" width="30px" class="userpic" />
												</a> <a href="">${sessionScope.user.name }</a> <img
													src="/networkdisk/img/SVIP.png"
													style="display: inline; margin-bottom: 5px;" />
											</div>
										</div>
										<div class="userpan_3">
											<a href="" style="color: #000; font-size: 12px;">超级会员专享特权：</a>
											<div class="svip">开通超级会员</div>
										</div>
										<div class="userpan_4">
											<p>
												<a href="${pageContext.request.contextPath}/per-center"><span>个人资料</span></a>
											</p>
											<p>
												<a href=""><span>帮助中心</span></a>
											</p>
											<p>
												<a href=""><span>设置</span></a>
											</p>
											<p>
												<a href="logout"><span>退出</span></a>
											</p>
										</div>
									</div>
								</div>

							</div>

						</li>
						<li style="width: 100px;"><a href="#"
							style="font-size: 13px;">&nbsp;客户端下载</a></li>
						<li><a href="#"><img src="/networkdisk/img/notice.png"
								style="margin-top: 10px;" /></a><p class="new-notice"></p></li>
						<li><a href="#"><img src="/networkdisk/img/serve.png"
								style="margin-top: 10px;" /></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
		<div class="content">
			<table>
				<tr>
					<td><img src="img/more-audio.png"/><p>多媒体</p></td>
					<td><img src="img/more-deal.png"/><p>交易记录</p></td>
					<td><img src="img/more-disposal.png"/><p>垃圾回收</p></td>
					<td><img src="img/more-tool.png"/><p>工具</p></td>
				</tr>
				<tr>
					<td><img src="img/more-share.png"/><p>分享</p></td>
					<td><img src="img/more-essay.png"/><p>文章</p></td>
					<td><img src="img/more-message.png"/><p>消息</p></td>
					<td><img src="img/more-photo.png"/><p>图片</p></td>
				</tr>
			</table>
			
		</div>


<script>	
            function read(e){
				alert("1111");
			}
	 
			
		$(document).ready(function() { 
			
			/* 弹框*/
			$(function() {
   				 $('#myModal').modal('hide')
			});
			      
			//子导航展开收缩
			$(".admin").mouseenter(function() {
				$(this).find(".c").removeClass("lbaxztop2").addClass("lbaxztop");
				$(this).next(".user").toggle().parents(".sev").siblings().find(".user").hide();
			});

			/*鼠标离开下拉框关闭*/
			$(".sev").mouseleave(function() {
				$(".user").hide();
				$(this).children(".admin").find(".c").addClass("lbaxztop2");
			});
			/* 当没有头像时，为默认头像*/
			
});	

</script>
<!-- 网站公告 -->
    <script type="text/javascript">
      $(function(){
    	  $.ajax({
    		  url:"allNotice",
    		  dataType: 'json',
              async: false,
              success:function(map){
            	  var i = map.allNotice;
            	  if(i>0){
              		$('.new-notice').show();
              		$('.new-notice').html(i);
              	  }
              }
    	  }
    	)
      });
    </script>
		
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.july.networkdisk.util.CommonUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>July</title>
<link rel="Shortcut Icon" href="/networkdisk/img/julyicon.png">
<link href="/networkdisk/user/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/networkdisk/user/css/bootstrap-theme.min.css" />
<link href="/networkdisk/css/style.css" rel="stylesheet" />
<link href="/networkdisk/css/component.css" rel="stylesheet" />
<link href="/networkdisk/css/context.css" rel="stylesheet" />
<link rel="stylesheet"
	href="/networkdisk/font-awesome-4.7.0/css/font-awesome.min.css">
<script src="/networkdisk/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/networkdisk/js/ajaxfileupload.js"></script>
<script src="/networkdisk/user/js/bootstrap.min.js"></script>
<script src="/networkdisk/js/jquery.rotate.min.js"></script>
</head>

<body>
	<div id="overlay" class="overlay"></div>
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
							<li class="active">
								<a href="goindex">网盘</a>
							</li>
							<li>
								<a href="findAll">分享</a>
							</li>
							<li>
								<a href="more">更多</a>
							</li>
						</ul>
					</div>
					<div class="span2">
						<ul class="right">
							<li class="chos" style="width: 220px;">
								<div class="sev">
									<div class="admin">
										<img src="showphoto?uid=${sessionScope.user.id }" width="30px" style="border-radius: 30px;position: absolute;top:10px;" />
										<a href="#" style="display: inline-block;height:50px;">
											<div class="username">${sessionScope.user.name }</div>
											<img src="/networkdisk/img/VIP1.png" style="display: inline-block;margin-bottom:45px;" />
										</a>
										<em style="display: inline-block;"><img src="/networkdisk/img/downchoose.png" class="c" style="margin-bottom: 40px;"/></em>
									</div>
									<div class="user">
									<span id="triangle-up">								
									</span>
										<div class="userpan">
											<div class="userpan_2">
												<div class="u1">
													<a href="#">
														<img src="showphoto?uid=${sessionScope.user.id }"  width="30px"  class="userpic" />
														<a href="">${sessionScope.user.name }</a>
														<img src="/networkdisk/img/VIP1.png" style="display: inline;margin-bottom:5px ;" />
													</a>
												</div>
											</div>
											<div class="userpan_3">
												<span>
												<a href="" style="color:#000;font-size: 12px;">超级会员专享特权：</a>
												<div class="svip">开通超级会员</div>
											</span>
											</div>
											<div class="userpan_4">
												<p><a href="per-center"><span>个人资料</span></a></p>
												<p><a href=""><span>帮助中心</span></a></p>
												<p><a href=""><span>设置</span></a></p>
												<p><a href="logout"><span>退出</span></a></p>
											</div>
										</div>
									</div>
								</div>
							
						</li>
						<li><a href="noticeList"><img src="/networkdisk/img/notice.png" style="margin-top: 10px;"/></a><p class="new-notice"></p></li>
						<li><a href="#"><img src="/networkdisk/img/serve.png" style="margin-top: 10px;"/></a></li>
					</ul>
				</div>
				</div>
			</div>
		</div>	
	<div class="clean" style="clear: all;"></div>
	<div id="in-sub-nav">
		<div class="container2">
			<div class="row2">
				<div class="span12">
					<ul style="padding: 0px;" id="tabs">
						<li><a href="goindex"
							class="act"><i class="batch home"></i><br>全部文件</a></li>
						<li><a href="picture"><i
								class="batch stream"></i><br>图片</a></li>
						<li><a href="word"><i
								class="batch plane"></i><br>文档</a></li>
						<li class="active"><a href="video"><i
								class="batch calendar"></i><br>视频</a></li>
						<li><a href="others"><i
								class="batch settings"></i><br>其他</a></li>
						<li><a href="gomyshare"><i
								class="batch share"></i><br>我的分享</a></li>
						<li><a href="gorecycle"><i
								class="batch barbage"></i><br>回收站</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="page">
		<div class="page-container">
			<div class="container">
				<div class="tab-content">
					<div>
						<div class="row" id="videoID">
							<div class="span3">
								<span>全部视频</span> <span style="float: right;"></span>
							</div>
							<div class="videobox">
								<script type="text/javascript">
								$(function(){									
									var list = new Array();
									list[0]="mp4";
									list[1]="rmvb";
									list[2]="avi";
									list[3]="mkv";
									list[4]="wmv";
									list[5]="3gp";
									list[5]="mov";
									list[5]="flv";
									showVideo(list);
								})
								
					function showVideo(list){
						
						$.ajax({
							url : "${pageContext.request.contextPath}/showFileByType?fileType="+list,
							dataType : 'json',
							success : function(data) {
								var listtime = data.listtime;
								var video = data.files;
								if(video.length == 0){
									$(".recyclebin-empty").show();
									return;
								}
								$('.span3').find('span:eq(1)').html("已加载"+video.length+"个");
								for(var i = 0; i< listtime.length;i++){
									var $str=$("<div class='timeline' style='width:100%'><span class='timeline_day1'>"+listtime[i]
											+"</span> <span class='fa fa-chevron-down' id='down'> </span> <span class='timeline_day3' id ='num'>"  
											+"</span></div><div id='tb"+i+"'style='min-height:150px;position:relative';max-height:auto;></div>");
									$(".videobox").append($str);
									for(var j = 0; j< video.length;j++){
										var atime = video[j].addtime;
										var anewTime = atime.split("T");
										if(anewTime[0] == listtime[i]){
											 var truepath = video[j].path.substring(18,92)+".jpg";
											 var $pic=$("<div class='open-enable'>"
											 			+"<div class='open-video' >"
														+"<img class='video-img' src='/networkdiskFile"+truepath+"'>"
														+"<span class='v-bl'></span>"
														+"</div>"
														+"<div class='file-name'>"
														+"<a class='v-name' href='javascript:void(0);'>"+video[j].name+"</a>"
														+"<input type='hidden' value='"
														+video[j].id
														+"'>"
														+"</div>"
														+"<span class='video-check'>"
														+"<i class='fa fa-download' title='下载' ></i>"
														+"<i class='fa fa-trash'title='删除'></i>"
														+"</span>"
														+"</div>");
											$("#tb"+i).append($pic); 
											
										}
									}
								}
							},
							error : function() {
								alert("图片显示失败！");
							}
						});
						
					}
							</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="recyclebin-empty">
			<p class="img records records-17"></p>
			<p class="empty-word" style="margin-left:50px;">您的视频为空噢～</p>
		</div>
		<div class="md-modal md-effect-13" id="modal-13" style="width: 910px;">
			<div class="md-content" style="height: 610px; padding: 0px;">
				<div class="dialog-header dialog-drag" id='header-drag'
					style="height: 40px; line-height: 35px; background: rgb(99, 135, 133); color: #fff; font-size: 20px; padding: 5px; text-align: center">
					<span class="fname"></span> <span class="fa fa-times"
						style="float: right; top: 6px; margin-right: 5px; position: relative;"></span>
				</div>
				<div class="test_mask"
					style="width: 140px; height: 38px; border: 1px solid #ccc; dislay: none; position: fixed; top: 40%; left: 40%; padding: 3px 7px">
					<img alt="" src="/networkdisk/img/loading.gif"
						style="position: relative; float: left"> <span
						style="color: #ccc; font-size: 18px; position: relative; bottom: -3px; display: inline-block;">数据加载中</span>
				</div>
				<div class="dialog-tree officeview" id="officeview"
					style="overflow: hidden; border: none; width: 910px; height: 570px; margin: 0px; padding: 0px;">
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$('.videobox').on('mouseenter', '.open-enable', function() {
		$(this).css('background-color', 'rgba(241, 245, 250,0.5)');
		$(this).css('border', '1px solid #90c3fd');
		$(this).find('.open-video .v-bl').show();
		$(this).find('.video-check').show();
	});
	$('.videobox').on('mouseleave', '.open-enable', function() {
		$(this).css('background', 'none');
		$(this).css('border', '1px solid #fff');
		$(this).find('.open-video .v-bl').hide();
		$(this).find('.video-check').hide();
	});
	$('.video-check i').mouseenter(function() {
		$(this).css('color', '#000');
	})
	$('.video-check i').mouseleave(function() {
		$(this).css('color', 'rgb(59, 140, 255)');
	});
	$('.videobox').on('click','.video-check i',function() {
				var name = $(this).parents('.open-enable').find('.v-name').text();
				var id = $(this).parents('.open-enable').find('.file-name input').val();
				/* 下载视频 */
				if ($(this).hasClass('fa-download')) {
					window.location.href = "fileDownload?fileFileName=" + name+ "&netFileID=" + id;
				} else {
					var msg = "确认删除？";
					/* 删除视频 */
					if (confirm(msg) == true) {
						layFileRecyle(id);
					}
				}
			});
	/*删除当前文件到回收站*/
	function layFileRecyle(fileID) {
		$.ajax({
			url : "${pageContext.request.contextPath}/layFileRecyle?file_id="+ fileID,
			dataType : 'json',
			async : false,
			success : function(data) {

			},
			error : function() {
				alert("文件放入回收站失败！");
			}
		});
		window.location.href = "video";
	}
	var value2 = 180;
	$('.videobox').on('click', '.timeline', function() {
		$(this).find('.fa-chevron-down').rotate({
			animateTo : value2
		});
		if (value2 == 0) {
			$(this).next('div').show(300);
			value2 = 180;
		} else {
			$(this).next('div').hide(300);
			value2 = 0;
		}

	});
	/*视频文件预览*/
	$('.videobox').on('click','.open-enable',function() {						
			var fileid = $(this).find('input').val();
			var $video = $("<div id='viewvideo' style='width: 910px; height: 570px; margin: 0 auto;'>"
						+ "<object width='910' height='570' classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000'>"
						+ "<param name='movie' value='' id='videosrc'/>"
						+ "<embed src='' width='100%' height='100%'class='videoemsrc'type='application/x-shockwave-flash'quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer'></embed>"
						+ "</object></div>");
						showOverlay();
						$('.md-effect-13').addClass('md-show');
						$('#header-drag').find('.fname').text("");
						$('.fname').append($(this).text());
						$('#officeview').empty();
						$('.test_mask').show();
						$.ajax({
								url : "${pageContext.request.contextPath}/officeView?netFileID="+ fileid,
								dataType : 'json',
								success : function(data) {
										$('.test_mask').hide();
										$('#viewvideo').show();
										$('.officeview').html($video);
										$('#viewvideo').find('param').val("flvplayer.swf?file=" + data);
										$('#viewvideo').find('embed').attr("src","flvplayer.swf?file=" + data);
									},
									error : function() {
										alert("视频预览失败！");
									}
						});

		});
	$('#modal-13 .fa-times').click(function() {
		$('.overlay').hide();
		$('#officeview').empty();
		$('.md-effect-13').removeClass('md-show');
	});
	 /**
	 * 显示遮罩层
	 */

	 function showOverlay() {
	     // 遮罩层宽高分别为页面内容的宽高
	     $('.overlay').css({'height':$(window).height(),'width':$(window).width()});
	     $('.overlay').show();
	 }	 
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
</html>

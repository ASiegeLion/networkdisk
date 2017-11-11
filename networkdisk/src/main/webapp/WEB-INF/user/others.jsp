<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.july.networkdisk.util.CommonUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
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
<script src="/networkdisk/js/index.js"></script>
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
						<li><a href="video"><i
								class="batch calendar"></i><br>视频</a></li>
						<li class="active"><a href="others"><i
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
					<div class="tab-pane fade in active" id="tw1">
						<div class="row">
							<div class="tw1_body" style="height: 567px;">
								<div class="Jdh">
									<table id="july_allFile" style="display: inline">
										<tr>
											<td>全部文件</td>
										</tr>
									</table>
									<span class="Sdh" style="float: right; display: inline-block;"></span>
								</div>

								<div class="Qdh">
									<ul>
										<li style="width: 51%; margin-left: -40px;"><span id="n1"
											style='margin-left: 10px;'>文件名</span><i
											class="fa fa-arrow-down"></i></li>
										<li>大小<i class="fa fa-arrow-down"></i></li>
										<li>修改日期<i class="fa fa-arrow-down"></i></li>
									</ul>
								</div>
								<div class="nullfile eefile">
									<p class="ggflie">
										您还没上传过文件哦，点击上传
									</p>
								</div>
								<form action="" method="post">
									<table class="table">
										<tbody id="mytbody">
												<script type="text/javascript">
												$(function(){
													showothers();
												})
												
												function showothers(){
												$.ajax({
													url : "${pageContext.request.contextPath}/showOtherFile",
													dataType : 'json',
													success : function(data) {
														var listFile = data.files;
														if(listFile.length == 0){
															$(".nullfile").show();
															return;
														}
														var sum=listFile.length;
														var sumhead="已加载全部,共"+sum+"条";
														$('.Sdh').html(sumhead);
														for (var i = 0; i < listFile.length; i++) {
																var type;
																var filesize;
																var sizeflag;
																/* 修改时间格式 */
																var time = listFile[i].addtime;
																var newTime = time.split("T");
																
																/* 计算文件大小 */
																if(listFile[i].size/(1024*1024) < 1 ){
																	filesize=(listFile[i].size/1024).toFixed(2);
																	sizeflag="KB";
																}else if(listFile[i].size/(1024*1024*1024) < 1)
																{
																	filesize=(listFile[i].size/(1024*1024)).toFixed(2);
																	sizeflag="M";
																}else{
																	filesize=(listFile[i].size/(1024*1024*1024)).toFixed(2);
																	sizeflag="G";
																}
																
																switch(listFile[i].type){
																case("zip"):
																	type="/networkdisk/img/ZIP_2.png";
																break;
																case("html"):
																	type="/networkdisk/img/html.png";
																break;
																case("mp3"):
																case("wav"):
																case("mod"):	
																	type="/networkdisk/img/music.png";
																break;
																	default:
																		type="/networkdisk/img/others.png";
																}
																var $str = $("<tr class='showfileTr'>"
																		+ "<td>"
																		+ "<img src='"
																		+ type
																		+ "'width='28px' style='margin:0 5px 5px 10px;'>"
																		+ "<input id='listFileID' class='refileid' type='text' style='display:none' value="
																		+ listFile[i].id
																		+ ">"
																		+ "<input id='listFileType' type='text' style='display:none' value="
																		+ listFile[i].type
																		+ ">"
																		+ "<input id='listFileName' class='rename' type='text' style='display:none' value="
																		+ listFile[i].name
																		+ ">"
																		+ "<a class='july_fileName'>"
																		+ listFile[i].name
																		+ "</a>"
																		+ "<div class='more'>"
																		+ "</span><span class='fa fa-download' title='下载' >"
																		+ "</span>"
																		+ "<span class='fa fa-trash' title='删除'></span>"
																		+ "</span>"
																		+ "</div></td>" 
																		+ "<td>"
																		+ filesize + sizeflag
																		+ "</td>" 
																		+ "<td>"
																		+ newTime[0]+" "+newTime[1]
																		+ "</td>"
																		+ "</tr>")
																$("#mytbody").append($str);
																
															}
														},
														error : function() {
															alert("查询失败");
														}						
													});
												}
                                        </script>
										</tbody>
									</table>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
/*删除当前文件*/
$('#mytbody').on('click','.fa-trash',function(){
	var fileid =$(this).parents('tr').find('#listFileID').val();
	var msg = "确认删除？";
	/* 删除文件 */
	if (confirm(msg) == true) {
		layFileRecyle(fileid);
	}	
});
/*删除当前文件到回收站*/
function layFileRecyle(fileID){
	$.ajax({
		url : "${pageContext.request.contextPath}/layFileRecyle?file_id="+fileID,
		dataType : 'json',
		async : false,
		success : function(data) {
			/* alert(data); */
		},
		error : function() {
			alert("文件放入回收站失败！");
		}
	});
	window.location.href="others";
}
/* 文件下载 */

$('table').on('click','.fa-download',function(){
 	var fileid =$(this).parent().parent('td').find('.refileid').val();
 	var filename =$(this).parent().parent('td').find('.rename').val();
 	window.location.href="fileDownload?fileFileName="+filename+"&netFileID="+fileid;
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
</html>

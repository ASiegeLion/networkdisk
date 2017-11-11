<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="/networkdisk/css/share.css" rel="stylesheet" />
<link rel="stylesheet"
	href="/networkdisk/font-awesome-4.7.0/css/font-awesome.min.css">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="/networkdisk/js/jquery-1.11.2.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/networkdisk/user/js/bootstrap.min.js"></script>
<script src="/networkdisk/js/index.js"></script>
<script src="/networkdisk/js/jquery.rotate.min.js"></script>
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
						<li class="active"><a href="goindex">网盘</a></li>
						<li><a href="findAll">分享</a></li>
						<li><a href="more">更多</a></li>
					</ul>
				</div>
				<div class="span2">
					<ul class="right">
						<li class="chos" style="width: 220px;">
							<div class="sev">
								<div class="admin">
									<img src="${pageContext.request.contextPath}/showphoto?uid=${sessionScope.user.id}"
										width="30px"
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
												<a href="#"> <img
													src="${pageContext.request.contextPath}/showphoto?uid=${sessionScope.user.id}"
													width="30px" class="userpic" />
													<input type="hidden" value="${sessionScope.user.id }" id="uid" />
												</a> <a href="">${sessionScope.user.name }</a> <img
													src="/networkdisk/img/VIP1.png"
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
						<li><a href="noticeList"><img src="/networkdisk/img/notice.png"
								style="margin-top: 10px;" /></a><p class="new-notice"></p></li>
						<li><a href="#"><img src="/networkdisk/img/serve.png"
								style="margin-top: 10px;" /></a></li>
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
						<li><a href="others"><i
								class="batch settings"></i><br>其他</a></li>
						<li class="active"><a href="gomyshare"><i
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
			<div class="module_link">
				<span>链接分享<span style="color: #808080;">(分享失败超过1年以上的链接记录将被自动清理)</span></span>
				<!-- <span style="float: right;">已加载1个</span> -->
			</div>
			<div class="sharebox">
				<div class="name">
					<input type="checkbox" id="checkbox_a1" class="chk" /><label
						for="checkbox_a1"></label> <span style="color: #5E5E5E;">文件名</span>
					<a class='recbtn' style="width:100px;" id="cancel" ><i class='fa fa-refresh' title='取消分享' ></i>取消分享</a>
				</div>
				<div class="fufH">
					<span style="color: #5E5E5E;">大小</span>
				</div>
				<div class="fufHs">
					<span style="color: #5E5E5E;">分享时间</span>
				</div>
				<div class="fufH">
					<span style="color: #5E5E5E;">保留时长</span>
				</div>
			</div>
			<div class="no-result-div">
				<p class="no-result-pic"><em class="shr"></em></p>
				<p class="no-result-title">您还没有分享过文件／文件夹～</p>
			</div>		
		</div>
		
		<script type="text/javascript">
			$("#cancel").click(function(){
				var filecateid = new Array();
				var magid = new Array();
				$("input[name='magbox']:checked").each(
						function(key, value) {
							magid[key] = $(this).val();
							filecateid[key] = $(this).next().next().val();
						});
				$.ajax({
					url : "cancelshare?magid="+magid+"&filecateid="+filecateid,
					dataType : 'json',
					async : false,
					success : function(data) {
						alert("取消成功！");
						 location.href="gomyshare"; 
					},
					error : function() {
						alert("取消失败！");
					}
				}); 
			});
		</script>
		
		<div class="reclist">
			<script type="text/javascript">
				 $(function(){
					 july_myshare();
					 
				 })
					 function july_myshare(){
					 	var uid = $("#uid").val();
						
						 $.ajax({
								url : "myshare?uid="+uid,
								dataType : 'json',
								async : false,
								success : function(map) {
									var listCate = map.catelist;
									var listFiles = map.filelist;
									
									if(listCate=="" && listFiles==""){
										$('.no-result-div').show();
									}else{
										$('.no-result-div').hide();
									}

									for (var i = 0; i < listCate.length; i++) {
										/* 修改时间格式 */
										var time = listCate[i].addtime;
										var newTime = time.split("T");
										var retime = listCate[i].state;
										var endtime;
										if(retime == 0){
											endtime = "永久有效";
										}else if(retime == 1){
											endtime = "一天";
										}else if(retime == 7){
											endtime = "七天";
										}
										var $str=$("<div class='listshare'  id='listFileandCate'><span class='showRecycle'>"
										+"<div class='name'>"
										+"<input type='checkbox' id='checkbox_a1' name='magbox' value='"
										+ listCate[i].reid
										+"' /><img src='/networkdisk/img/category.png' width='28px' style='margin:0 5px 5px 10px;'>"
										+ "<input id='listCateID' name='fcid' class='reid' type='text' style='display:none' value="
										+ listCate[i].id
										+ ">"
										+"<a class='file-name'>"+listCate[i].name +"</a>"
									    +"<i class='fa fa-trash'title='删除'></i><i class='fa fa-refresh' title='还原'></i></div>"
									    +"<div class='fufH'>"
										+"<span style='color: #5E5E5E;'>"+ "--"+"</span>"
									    +"</div>"
								        +"<div class='fufHs'>"
										+"<span style='color: #5E5E5E;'>"+ newTime[0]+" "+newTime[1]+"</span>"
									    +"</div>"
									    +"<div class='fufH'style='margin-left:10px;'>"
										+"<span style='color: #5E5E5E;'>"
										+ endtime
										+"</span>"
									    +"</div>"
									    +"</span></div>");
										$(".reclist").append($str);
									}
									
									for (var i = 0; i < listFiles.length; i++) {
										/* 计算文件大小 */
										if(listFiles[i].size/(1024*1024) < 1 ){
											filesize=(listFiles[i].size/1024).toFixed(2);
											sizeflag="KB";
										}else
										{
											filesize=(listFiles[i].size/(1024*1024)).toFixed(2);
											sizeflag="M";
										}
										
										var retime = listFiles[i].deletesign;
										var endtime;
										if(retime == 0){
											endtime = "永久有效";
										}else if(retime == 1){
											endtime = "一天";
										}else if(retime == 7){
											endtime = "七天";
										}
										
										/* 修改时间格式 */
										var time = listFiles[i].addtime;
										var newTime = time.split("T");
										
										switch(listFiles[i].type){
										case("zip"):
											type="/networkdisk/img/ZIP_2.png";
										break;
										case("mp4"):
										case("rmvb"):
										case("avi"):
										case("mkv"):	
										case("wmv"):
										case("3gp"):	
										case("mov"):
											type="/networkdisk/img/video.png";
										break;
										case("png"):
											type="/networkdisk/img/png.png";
										break;
										case("jpg"):
											type="/networkdisk/img/jpg.png";
										break;
										case("gif"):
										case("bmp"):
										case("psd"):
										case("ai"):
										case("svg"):
											type="/networkdisk/img/picture1.png";
										break;
										case("doc"):
										case("docx"):
											type="/networkdisk/img/word.png";
										break;
										case("txt"):
											type="/networkdisk/img/text.png";
										break;
										case("xls"):
											type="/networkdisk/img/xls.png";
										break;
										case("pdf"):
											type="/networkdisk/img/pdf.png";
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
										var $str=$("<div class='listshare'id='listFileandCate'><span class='showRecycle'>"
										+"<div class='name'>"
										+"<input type='checkbox' id='checkbox_a1' name='magbox' value='"
										+ listFiles[i].catid
										+ "' />"
										+ "<img src='"
										+ type
										+ "'width='28px' style='margin:0 5px 5px 10px;'>"
										+ "<input id='listFilesID' name='fc' class='refileid' type='text' style='display:none' value="
										+ listFiles[i].id
										+ ">"
										+"<a class='file-name'>"+listFiles[i].name +"</a>"
									    +"<i class='fa fa-trash'title='删除'></i><i class='fa fa-refresh' title='还原'></i></div>"
									    +"<div class='fufH'>"
										+"<span style='color: #5E5E5E;'>"+ filesize+sizeflag+"</span>"
									    +"</div>"
								        +"<div class='fufHs'>"
										+"<span style='color: #5E5E5E;'>"+ newTime[0]+" "+newTime[1]+"</span>"
									    +"</div>"
									    +"<div class='fufH'style='margin-left:10px;'>"
										+"<span style='color: #5E5E5E;'>"
										+ endtime
										+"</span>"
									    +"</div>"
									    +"</span></div>");
										$(".reclist").append($str);
									}
									
								},
								error : function() {
									alert("查询失败！");
								}
							}); 
					 }
			
				 /* 全选反选 */
				 $('.chk').click(function(){				 
						 if(this.checked){						 
							 $('.reclist :checkbox').prop('checked',true);
							 var filenum=$('.reclist input:checked').length;
							 var message="已选中"+filenum+"个文件/文件夹";
							 $('.sharebox .name').find('span').html(message);
							 $('.name .recbtn').css('display','inline-block');
							 $('.sharebox').find('.name').nextAll('div').hide();							 
						 }else{
							 $('.reclist :checkbox').prop('checked',false);
							 $('.sharebox .name').find('span').html('文件夹');
							 $('.name .recbtn').css('display','none');
							 $('.sharebox').find('.name').nextAll('div').show();						 
						 }	
				 });
				 $('.reclist').on('click',':checkbox',function() {
					 var num=$('.reclist input:checked').length;
					 if(num>0&&num<$('.reclist :text').length){
						 var msg="已选中"+num+"个文件/文件夹";
						 $('.sharebox .name').find('span').html(msg);
						 $('.name .recbtn').css('display','inline-block');
						 $('.sharebox').find('.name').nextAll('div').hide(); 
					 }else if(num==$('.reclist :text').length){
						 $('.chk').prop('checked',true);
						 var msg="已选中"+num+"个文件/文件夹";
						 $('.sharebox .name').find('span').html(msg);					 					 
					 }else{
						 $('.chk').attr('checked',false);
						 $('.sharebox .name').find('span').html('文件夹');
						 $('.name .recbtn').css('display','none');
						 $('.sharebox').find('.name').nextAll('div').show();
					 }			 
				 })
				
			</script>
		</div>
	</div>
	
	
	
</body>
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
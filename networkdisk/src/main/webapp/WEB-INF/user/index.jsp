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
<script type="text/javascript" src="/networkdisk/js/flexpaper_flash.js"></script>
<script type="text/javascript" src="/networkdisk/js/flexpaper_flash_debug.js"></script>
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
						<li class="active"><a href="goindex"
							class="act"><i class="batch home"></i><br>全部文件</a></li>
						<li><a href="picture"><i
								class="batch stream"></i><br>图片</a></li>
						<li><a href="word"><i
								class="batch plane"></i><br>文档</a></li>
						<li><a href="video"><i
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
					<div class="tab-pane fade in active" id="tw1">
						<div class="row">
							<div class="span3">
								<form action="javascript:void(0)" method="post"
									style="width: 0px; display: block;">
									<div class="upfile" style="width: 84px; display: block;">
										<a class="file" title="请选择文件" style="font-size: 15px;">
											<img src="/networkdisk/img/upload.png"
											style="margin-bottom: 3px;" />&nbsp;上传
											<input type="file" name="file" id="upfile" value="上传" style="cursor:pointer;"/>
										</a> 
										
									</div>
								</form>
								<a class="g_button" id="newonefile"><img
									src="/networkdisk/img/newfile.png" style="margin-bottom: 3px;" />&nbsp;新建文件夹</a>
								<a class="g_button" id="mydownload">
								<img src="/networkdisk/img/download.png" style="margin-bottom: 3px;" />&nbsp;我的上传</a>
								
								<div class="equip_1">
									<ul class="equi_1">
										<li id="f1" class="sharefile">
										<a href="javascript:;" class="md-trigger" data-modal="modal-4">
										<img src="/networkdisk/img/share.png" style="margin-bottom: 3px" />分享</a></li>
										<li id='f3'><img src="/networkdisk/img/delete.png" style="margin-bottom:3px"/>删除</li>
										<li id='f4'>复制到</li>
										<li id="f2">移动到</li>
									</ul>
								</div>
								<div class="span5">
									<div class="cs" style="display: inline-block;">
										<form action="" method="post">
											<a class="search"> <input id="search" type="text" value=""
												placeholder="搜索您的文件" class="search_input"
												onfocus="this.placeholder=''"
												onblur="this.placeholder='搜索您的文件'" /> <span
												class="fa fa-search" id="ser" ></span>
											</a>
										</form>
									</div>
									
									<script type="text/javascript">
										$("#ser").click(function(){
											$("#july_allFile tr").empty();
											var $head=$("<td><a id='null' class='aa' style='cursor:pointer;color:#333;text-decoration:none ' >全部文件</a></td>"); 
											$("#july_allFile tr").append($head);
											var $li=$("<li class='addli'>所在目录</li>");
											var str = $("#search").val();
											$.ajax({  
											 	url: "search?str="+str,       //后台处理程序
									            type: "post",               		//数据发送方式
									            dataType: "json",           		//接受数据格式   
									            success:function(map){ 
									            	$('#mytbody').empty();
									            	var filelist = map.filelist;
									            	var catelist = map.catelist;
									            	if(catelist=="" && filelist==""){
														$('.nullfile').show();
													}else{
														$('.nullfile').hide();
													}
												    var sum=parseInt(catelist.length+filelist.length);
													var $sumhead=$("<span class='j2'>已加载全部,共"+sum+"条</span>");
													$('.Sdh').html($sumhead); 
													$('.Qdh li:eq(2)').css('width','17%');
													if($('.Qdh ul').find('.addli').length>0){
														$('.Qdh ul').find('.addli').remove();	
													}													
													$('.Qdh ul').append($li);
													
													for (var i = 0; i < catelist.length; i++) {
														//分割时间字符串
														var time = catelist[i].addtime;
														var newTime = time.split("T");
														var rename;
														if(catelist[i].uid == null){
															rename="全部文件";
														}else{
															rename = catelist[i].uid;
														}
														var $str = $("<tr class='showTr'>"
																+ "<td>"
																+ "<input type='checkbox' name='catebox' value='"+catelist[i].id+"' class='chk_2'/>"
																+ "<img src='/networkdisk/img/category.png' width='28px' style='margin:0 5px 5px 10px;'>"
																+ "<input id='listCateID' class='reid' type='text' style='display:none' value="
																+ catelist[i].id
																+ ">"
																+ "<input id='listCateState' class='restate' type='text' style='display:none' value="
																+ catelist[i].state
																+ ">"
																+ "<input id='listCateName' class='rename' type='text' style='display:none' value="
																+ catelist[i].name
																+ ">"
																+ "<a class='getparents'>"
																+ catelist[i].name
																+ "</a>"
																+ "</td>"
																+ "<td>--</td>"
																+ "<td>" 
																+ newTime[0]+" "+newTime[1]
																+ "</td>" 
																+ "<td class='addli'>" 
																+ "<a class='getcateparent'>"
																+ rename
																+ "<input id='catereid' class='' type='text' style='display:none' value="
																+ catelist[i].reid
																+ ">"
																+ "</a>"
																+ "</td>" 
																+ "</tr>");
														$("#mytbody").append($str);
													}
													for (var i = 0; i < filelist.length; i++) {
														var type;
														var filesize;
														var sizeflag;
														/* 修改时间格式 */
														var time = filelist[i].addtime;
														var newTime = time.split("T");
														
														/* 计算文件大小 */
														if(filelist[i].size/(1024*1024) < 1 ){
															filesize=(filelist[i].size/1024).toFixed(2);
															sizeflag="KB";
														}else
														{
															filesize=(filelist[i].size/(1024*1024)).toFixed(2);
															sizeflag="M";
														}
														var rename;
														if(filelist[i].uid == null){
															rename="全部文件";
														}else{
															rename = filelist[i].uid;
														}
														switch(filelist[i].type){
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
														var $str = $("<tr class='showfileTr'>"
																+ "<td>"
																+ "<input type='checkbox' name='filebox' value='"+filelist[i].id+"' class='chk_2' />"
																+ "<img src='"
																+ type
																+ "'width='28px' style='margin:0 5px 5px 10px;'>"
																+ "<input id='listFileID' class='refileid' type='text' style='display:none' value="
																+ filelist[i].id
																+ ">"
																+ "<input id='listFileID' class='rename' type='text' style='display:none' value="
																+ filelist[i].name
																+ ">"
																+ "<a class='july_fileName'>"
																+ filelist[i].name
																+ "</a>"
																+ "</td>" 
																+ "<td>"
																+ filesize + sizeflag
																+ "</td>" 
																+ "<td>"
																+ newTime[0]+" "+newTime[1]
																+ "</td>"
																+ "<td class='addli'>" 
																+ "<a class='getcateparent'>"
																+ rename
																+ "<input id='catereid' class='' type='text' style='display:none' value="
																+ filelist[i].catid
																+ ">"
																+ "</a>"
																+ "</td>"
																+ "</tr>")
														$("#mytbody").append($str);
														
													}
													$('.table td:nth-child(3)').css('width','16%');
												},
												error : function() {
													alert("查询失败")
												}						
											});
										})									       
									</script>
									
									<div class="ch">
										<div class="lp">
											<a class="list"><img src="img/list.png" /></a>
											<ul class="listpal">
												<li class='listname'><img src="/networkdisk/img/OK.png" class="active" />&nbsp;文件名</li>
												<li class='listsize'><img src="/networkdisk/img/OK.png" />&nbsp;大小</li>
												<li class='listdate'><img src="/networkdisk/img/OK.png" />&nbsp;修改日期</li>
											</ul>
										</div>
										<a class="large"><img src="/networkdisk/img/other.png" /></a>
									</div>
								</div>
							</div>
							<div class="tw1_body">
								<div class="Jdh">
									<table id="july_allFile" style="display:inline">
										<tr>
										</tr>
									</table>
									<span class="Sdh" style="float:right;display:inline-block;"></span>
								</div>
								
								<div class="Qdh">
									<ul>
										<li style="width:51%; margin-left: -40px;"><input
											type="checkbox" class="chk_1"/><span id="n1" style='margin-left: 10px;'>文件名</span><i class="fa fa-arrow-down"></i></li>
										<li>大小<i class="fa fa-arrow-down"></i></li>
										<li style='width: 36%'>修改日期<i class="fa fa-arrow-down"></i></li>
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

										</tbody>
									</table>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="md-modal md-effect-10" id="modal-10" >
    		<div class="md-content" style="height:310px;">
     			<div class="dialog-header dialog-drag">
					<span class="dialog-header-title">复制到 </span>
				</div>
      			<div class="dialog-tree">
        			<div id="menuTree" class="menuTree"></div>        			
      			</div>
      			<div class="dialog-footer g-clearfix">
      				<a class="g-button g-button-large cancel" href="javascript:void(0);" style="float: right;">
      				<span class="g-button-right" style="padding-right: 50px;">
      				<span class="text" style="width: auto;">取消</span>
      				</span>
      				</a>
      				<a class="g-button g-button-blue-large surein" href="javascript:void(0);" style="float: right;">
      				<span class="g-button-right" style="padding-right: 50px;">
      				<span class="text" style="width: auto;">确定</span>
      				</span>
      				</a>
      				<a class="g-button g-button-blue-large suremove" href="javascript:void(0);" style="float: right;display:none">
      				<span class="g-button-right" style="padding-right: 50px;">
      				<span class="text" style="width: auto;">移动</span>
      				</span>
      				</a>
      			</div>
    		</div>
  		</div>
  		<div class="md-modal md-effect-13" id="modal-13" style="width: 910px;">
			<div class="md-content" style="height: 610px;padding:0px;">
				<div class="dialog-header dialog-drag" id='header-drag' style="height: 40px; line-height: 35px; background: rgb(99,135,133); color: #fff; font-size: 20px; padding: 5px;text-align: center">
					<span class="fname"></span>
					<span class="fa fa-times" style="float:right;top:6px; margin-right: 5px;position: relative;"></span>
				</div>
				<div class="test_mask" style="width:140px; height:38px;border:1px solid #ccc;dislay:none;position: fixed;top: 40%;left: 40%;padding: 3px 7px">
					<img alt="" src="/networkdisk/img/loading.gif" style="position: relative;float: left">
					<span style="color:#ccc;font-size: 18px;position: relative;bottom:-3px;display: inline-block;">数据加载中</span>
				</div>
				<div class="dialog-tree officeview" id="officeview" style="overflow: hidden;border: none;width: 910px;height: 570px;margin: 0px;padding:0px;">					
				</div>
				
				
			</div>
		</div>
  		<div class="md-modal md-effect-4" id="modal-4">
			<div class="md-content">
				<div class="dialog-header dialog-drag">
					<span class="dialog-header-title"></span>
				</div>
				<div class="dialog-body">
					<div class="share-dialog">
						<div class="content" id="_disk_id_1">
							<ul class="tab">
								<li class="share-link current" _idx="0"><em
									class="fa fa-link"></em>链接分享</li>
								<li class="share-friend" _idx="1"><em class="fa fa-users"></em>发给好友</li>
								<li class="share-mail" _idx="2"><em class="fa fa-envelope"></em>发到邮箱</li>
							</ul>
							<div class="cb"></div>
							<div class="tips-placeholder">
								<div class="tips" style="display: none;">
									<em class="icon"></em><span></span><em class="close icon"></em>
								</div>
							</div>
							<ul class="content" style="width: 520px; margin-left: -25px;">
								<li class="share-link" style="display: block;">
									<div class="create-link">
										<table class="validity-section">
											<tbody>
												<tr>
													<td class="first-child">分享形式</td>
													<td>
														<div class="share-method-line">
															<input type="radio" id="share-method-private" name="share-method" value="private" checked="true" style="margin-bottom:-3px;">
															<b style="color: rgb(66, 78, 103);">加密</b><span>仅限拥有密码者可查看，更加隐私安全</span>
														</div>
														<div class="share-method-line share-public-panel" style="color: rgb(139, 144, 158);">
															<input type="radio" id="share-method-public" name="share-method" value="public" style="margin-bottom:-3px;"> 
																<b>公开</b><span>任何人可查看或下载，同时出现在您的
																<a class="share-home-href" href="" target="_blank" style="color: rgb(59, 140, 255);">个人主页</a>
															</span> <span class="share-public-tip" style="display: none;"></span>
														</div>
													</td>
												</tr>
												<tr>
													<td class="first-child">有效期</td>
													<td class="choose-panel">
														<button class="g-button g-button-large-gray choose-value">
															<span class="text" id="datetype">永久有效</span> <em
																class="fa fa-sort-desc"></em>
														</button>
														<ul class="choose-list" style="display: none;">
															<li class="choose-checked" value="0"><em>永久有效</em><span
																class="fa fa-check"></span></li>
															<li value="7"><em>7天</em><span class="fa fa-check"></span></li>
															<li value="1"><em>1天</em><span class="fa fa-check"></span></li>
														</ul>
													</td>
												</tr>
											</tbody>
										</table>
										<div class="createlink" style="display: none">
											<div class="create-success" style="padding-bottom: 10px;">
												<span class="public" style="display: none;"> <em
													class="fa fa-check-circle"></em> 成功创建公开链接
												</span> <span class="private"> <em
													class="fa fa-check-circle"></em> 成功创建私密链接
												</span>
											</div>
											<div class="link-info">
												<div class="copy-button-section">
													<a class="copy-button" id="copyShare"> 
														<span class="g-button-right"> 
														<span class="text public" style="display: none" onclick="Copy()">复制链接</span>
														<span class="text private" onclick="myCopy()">复制链接及密码</span>
														</span>
													</a>
													<div class="copy-tips" id="copy-tips">复制链接成功</div>
												</div>
												
												<div class="url">
													<input type="text" spellingcheck="false" readonly="readonly" class="share-url" id="share-url" value="">
													<span class="share-validity-tip">链接永久有效</span>
												</div>
												<div class="password">
													<a>提取密码</a> 
													<input type="text" class="share-password" id="share-password" spellingcheck="false" readonly="readonly" value="">
												</div>
												<div class="description">
													<span class="private">可以将链接发送给你的QQ等好友 </span>
													<span class="public" style="display:none"> 
														1.生成文件下载链接 <br>
														2.把链接通过QQ、微博、人人网、QQ空间等方式分享给好友
													</span>
												</div>
												<input type="text" class="sharelink" id="sharelink" spellingcheck="false" readonly="readonly" value="" style="opacity:0;">
											</div>
										</div>
									</div>
								</li>
							</ul>
							<div class="footer">
								<a class="md-close close" id="end">关闭</a>
								<a href="javascript:;" class="create"> 
									<span class="g-button-right"> 
									<span class="text" id="create">创建链接</span>
								</span>
								</a>
								<!-- <a href="javascript:;" class="create share" style="display:none"> <span class="g-button-right"> <span
										class="text" id="create">确认分享</span>
								</span>
								</a> -->
							</div>
							<%String uuid = CommonUtil.createUUID(); String pwd = CommonUtil.getUUID(4);%>
							<script type="text/javascript">
								$("#end").click(function(){
									/* location.href="index.jsp"; */
								});								
								function shareurl(){
									var method;
									$("#share-url").val('http://localhost:8080/networkdisk/shareurl?url=<%=uuid%>');
									$("#share-password").val('<%=pwd%>');									
									var btns = new Array();
									var cateid = new Array();
									var uuid = $("#share-url").val();
									var time = $("#datetype").text();
									method=null;
									method = $('input[name="share-method"]:checked').val();
									if(method == "private"){
										var pwd = $("#share-password").val();
									}else{
										var pwd = "";
									}
									if($('.table').find('input:checked').length!=0){
										$("input[name='filebox']:checked").each(function(key,value){
										    btns[key] = $(this).val();
										});
										$("input[name='catebox']:checked").each(function(key,value){
										    cateid[key] = $(this).val();
										});
									}else{
										if(iscate){
											cateid[0]=shareid;
										}else{
											btns[0]=shareid;	
										}
									}																											
									if(btns == "" && cateid == ""){
										alert("请选择文件或文件夹进行分享！");
									}else{
										$.ajax({  
								            url:"share?fidlist="+btns+"&cateid="+cateid+"&uuid="+uuid+"&pretime="+time+"&sharepwd="+pwd,
								            dataType: 'json',
								            async: false,
								            success:function(data){  
								               
								            },  
								            error:function(){  
								                alert("分享失败！");  
								            }  
								        });  
									}	
									
								}
							</script>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="msg">
			<span style="float: left; font-size: 16px; padding-left: 10px;">我的上传</span>
			<span class="fa fa-times"></span> <span class="fa fa-window-maximize"></span>
			<div class="upmagbox">
				<div class="upload_header">
					<div class="file_name">文件（夹）名</div>
					<div class="file_size">大小</div>
					<div class="file_path">上传目录</div>
					<div class="file_status">状态</div>
				</div>
				<div class="upload_body">
					<ul class="container" id="uploaderList">
					</ul>
				</div>
			</div>
		</div>
	</div>
	<script src="js/classie.js"></script>
	<script src="js/modalEffects.js"></script>
	<script type="text/javascript">
		var categorie =null;
		var recycle =null;
		var cateName = null;
		var caterid = null;
		function show(categorie_id, recycleflag ) {
			categorie = categorie_id;
			recycle = recycleflag;			
			 if(cateName != null){
				var $head=$("<td><a id='"+caterid+"' class='aa'  style='cursor:pointer;text-decoration:none'> >"+cateName+"</a></td>"); 
				$("#july_allFile tr").append($head)
			}else{
				var $head=$("<td><a id='null' class='aa' style='cursor:pointer;color:#333;text-decoration:none ' >全部文件</a></td>"); 
				$("#july_allFile tr").append($head)
			} 			 
			 showchild(categorie_id,recycleflag)

		}
		
		function showchild(categorie_id,recycleflag){
			$('.addli').remove();
			$(".table tr").remove();
			$("#tw1 :checkbox").prop("checked", false);
			$("#n1").html("文件夹");
			$('#g_button').css('display', 'block');
			$('.equip_1').css('display', 'none');
			$('.Qdh').find('li').nextAll('li').show();
			
			$.ajax({
				type : "post",
				dataType : "json",
				url : "${pageContext.request.contextPath}/showFileAndCate?Time="+new Date().getTime(),
				data : {
					categorie_id : categorie_id,
					recycleflag : recycleflag
				},
				success : function(map) {
					var listFile = map.listFiles;
					var listCate = map.listCategories;
					if(listCate=="" && listFile==""){
						$('.nullfile').show();
					}else{
						$('.nullfile').hide();
					}
				    var sum=parseInt(listCate.length+listFile.length);
					var $sumhead=$("<span class='j2'>已加载全部,共"+sum+"条</span>");
					$('.Sdh').html($sumhead);   
					for (var i = 0; i < listCate.length; i++) {
						//分割时间字符串
						var time = listCate[i].addtime;
						var newTime = time.split("T");
						
						var $str = $("<tr class='showTr'>"
								+ "<td>"
								+ "<input type='checkbox' name='catebox' value='"+listCate[i].id+"' class='chk_2'/>"
								+ "<img src='/networkdisk/img/category.png' width='28px' style='margin:0 5px 5px 10px;'>"
								+ "<input id='listCateID' class='reid' type='text' style='display:none' value="
								+ listCate[i].id
								+ ">"
								+ "<input id='listCateState' class='restate' type='text' style='display:none' value="
								+ listCate[i].state
								+ ">"
								+ "<input id='listCateName' class='rename' type='text' style='display:none' value="
								+ listCate[i].name
								+ ">"
								+ "<a class='july_cateName' >"
								+ listCate[i].name
								+ "</a>"
								+ "<div class='more'>"
								+ "<span class='fa fa-share-alt' title='分享'>"
								+ "</span>"
								+ "<span class='fa fa-ellipsis-h' title='更多'></span>"
								+ "<span class='menu' style='width: 96px;'>"
								+ "<a style='display: block;' data-menu-id='b-menu9' class='g-button-menu md-ren' href='javascript:void(0);'>重命名</a>"
								+ "<a style='display: block;' data-menu-id='b-menu10' class='g-button-menu md-copy' href='javascript:void(0);'>复制到</a>"
								+ "<a style='display: block;' data-menu-id='b-menu11' class='g-button-menu md-move' href='javascript:void(0);'>移动到</a>"
								+ "<a style='display: block;' data-menu-id='b-menu4' class='g-button-menu delelecate' id='"+listCate[i].id+"' >删除</a>"
								+ "</span></div></td>"
								+ "<td>--</td>"
								+ "<td>" 
								+ newTime[0]+" "+newTime[1]
								+ "</td>" 
								+ "</tr>");
						$("#mytbody").append($str);
					}
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
							case("jpg"):
								type="/networkdisk/img/pic.png";
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
						var $str = $("<tr class='showfileTr'>"
								+ "<td>"
								+ "<input type='checkbox' name='filebox' value='"+listFile[i].id+"' class='chk_2' />"
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
								+ "<span class='fa fa-share-alt' title='分享'>"
								+ "</span><span class='fa fa-download' title='下载' >"
								+ "</span>"
								+ "<span class='fa fa-ellipsis-h' title='更多'></span>"
								+ "</span>"
								+ "<span class='menu' style='width: 96px;'>"
								+ "<a style='display: block;' data-menu-id='b-menu9' class='g-button-menu md-ren' href='javascript:void(0);'>重命名</a>"
								+ "<a style='display: block;' data-menu-id='b-menu10' class='g-button-menu md-copy' href='javascript:void(0);'>复制到</a>"
								+ "<a style='display: block;' data-menu-id='b-menu11' class='g-button-menu md-move' href='javascript:void(0);'>移动到</a>"
								+ "<a style='display: block;' data-menu-id='b-menu4' class='g-button-menu delelefile' id='"+listFile[i].id+"' >删除</a>"
								+ "</span></div></td>" 
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
					alert("查询失败")
				}						
			});
		}

		/*删除当前文件*/
		$('#mytbody').on('click','.delelefile',function(){
			var fileid=$(this).attr("id");
			layFileRecyle(fileid);
		});
		
		/*删除当前文件夹*/
		$('#mytbody').on('click','.delelecate',function(){
			var cateid=$(this).attr("id");
			layCateRecyle(cateid);
		});
		/*删除当前文件到回收站*/
		function layFileRecyle(fileID){
			$.ajax({
				url : "${pageContext.request.contextPath}/layFileRecyle?file_id="+fileID,
				dataType : 'json',
				success : function(data) {
					/* alert(data); */
				},
				error : function() {
					alert("文件放入回收站失败！");
				}
			});
			showchild(categorie,recycle);
		}
		/*删除当前文件夹*/
		function layCateRecyle(cateID){
			$.ajax({
				url : "${pageContext.request.contextPath}/layCateRecycle?categorieID="+cateID,
				dataType : 'json',
				success : function(data) {
					/* alert(data); */
				},
				error : function() {
					alert("文件夹放入回收站失败！");
				}
			});
			showchild(categorie,recycle);
		}
		
		/* 显示条形菜单 */
		$('#july_allFile').on('click','.aa',function(){
			var caterid=$(this).attr("id");
			if(caterid =="null"){
				show(null,recycle);
			}else{
			show(caterid,recycle);
			}
			$(this).parent('td').nextAll('td').remove();
		});
		
		/*跳下一级*/
		$('table').on('click','.july_cateName',function(){
			if($(this).hasClass('off')){ // 判断当前元素是否有off的类，如果有则不继续向下执行
		        return;
		    }
			var cateid =$(this).parent('td').find('.reid').val();
			var catestate =$(this).parent('td').find('.restate').val();
			var catename =$(this).parent('td').find('.rename').val();
			cateName = catename;
			caterid = cateid;
			show(cateid,catestate);
		});
		
		/*office文件预览*/
		$('table').on('click','.july_fileName',function(){
			if($(this).hasClass('off')){ // 判断当前元素是否有off的类，如果有则不继续向下执行
		        return;
		    }
			var fileid =$(this).parent('td').find('#listFileID').val();
			var filetype =$(this).parent('td').find('#listFileType').val();
			var $office=$("<div id='viewerPlaceHolder' style='margin:0px; width: 910px;height: 570px;'></div>");
			var $video=$("<div id='viewvideo' style='width: 910px; height: 570px; margin: 0 auto;'>"
						+ "<object width='910' height='570' classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000'>"
						+ "<param name='movie' value='' id='videosrc'/>"
						+ "<embed src='' width='100%' height='100%'class='videoemsrc'type='application/x-shockwave-flash'quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer'></embed>"
						+ "</object></div>");
			if(    /* 文件预览 pdf,txt,doc,word,docx,ppt*/
				filetype == "pdf"|| filetype == "xls" 
				|| filetype == "txt" ||filetype == "docx" 
				|| filetype == "doc" || filetype == "ppt"
					/*照片预览、jpg、jpeg、png、gif、bmp*/
				|| filetype == "jpg" || filetype == "jpeg"
				|| filetype == "png" || filetype == "gif"
				|| filetype == "bmp" 
				)
			{
				showOverlay();
				$('.md-effect-13').addClass('md-show');
				$('#header-drag').find('.fname').text("");
				$('.fname').append($(this).text());
				$('#officeview').empty();
				$('.test_mask').show(300);
				$.ajax({
					url : "${pageContext.request.contextPath}/officeView?netFileID="+fileid,
					dataType : 'json',
					success : function(data) {	
						$('.test_mask').hide();
						$('#officeview').append($office);
						officeviewfun(data); 
					},
					error : function() {
						alert("文件预览失败！");
					}
				});
				
			}
				/* 视频预览  wmv9，rm，rmvb，asx，asf，mpg，wmv，3gp，mp4，mov，avi，flv*/
			if(        filetype == "wmv9"  
				    || filetype == "rm" ||filetype == "rmvb" 
					|| filetype == "asx" || filetype == "asf"
					|| filetype == "mpg" || filetype == "wmv"
					|| filetype == "3gp" || filetype == "mp4"
					|| filetype == "mov" || filetype == "avi"
					|| filetype == "flv" ){
				showOverlay();
				$('.md-effect-13').addClass('md-show');
				$('#header-drag').find('.fname').text("");
				$('.fname').append($(this).text());
				$('#officeview').empty();
				$('.test_mask').show();				
				$.ajax({
					url : "${pageContext.request.contextPath}/officeView?netFileID="+fileid,
					dataType : 'json',
					success : function(data) {	
						$('.test_mask').hide();
						$('#viewvideo').show();
						$('.officeview').html($video); 
						$('#viewvideo').find('param').val("flvplayer.swf?file="+data);	
						$('#viewvideo').find('embed').attr("src","flvplayer.swf?file="+data);
					},
					error : function() {
						alert("视频预览失败！");
					}
				});
			}
			
		});
		$('#modal-13 .fa-times').click(function() {
			$('.overlay').hide();
			$('#officeview').empty();
			$('.md-effect-13').removeClass('md-show');
		});
		
		/* 文件下载 */
		
		 $('table').on('click','.fa-download',function(){
		  var fileid =$(this).parent().parent('td').find('.refileid').val();
		  var filename =$(this).parent().parent('td').find('.rename').val();
		  window.location.href="fileDownload?fileFileName="+filename+"&netFileID="+fileid;
		});
		
		/* 显示文件和文件夹 */
		$(function() {
			show(null, 0);
		});
		
		/* 文件上传 */
		$("#upfile").bind("change",function() {
			var file = this.files[0];
			july_fileReader(file);
		});
		function july_fileReader(file) {
			var upfilename=file.name;
			var upfileaddress=$('table tr:eq(0)').find('td:last-child').children('a').text();
			var upfilesize;
			var upsizeflag;
			var type=(upfilename.substr(upfilename.lastIndexOf("."))).toLowerCase();
			if(file.size/(1024*1024) < 1 ){
				upfilesize=(file.size/1024).toFixed(1);
				upsizeflag="KB";
			}else if(file.size/(1024*1024)<1024 && file.size/(1024*1024) > 1){
				upfilesize=(file.size/(1024*1024)).toFixed(1);
				upsizeflag="M";
			}else{
				upfilesize=(file.size/(1024*1024*1024)).toFixed(1);
				upsizeflag="G";
			}
			switch(type){
			case(".zip"):
				type="/networkdisk/img/ZIP_2.png";
			break;
			case(".mp4"):
			case(".rmvb"):
			case(".avi"):
			case(".mkv"):	
			case(".wmv"):
			case(".3gp"):	
			case(".mov"):
			case(".flv"):
				type="/networkdisk/img/video.png";
			break;
			case(".png"):
			case(".jpg"):
				type="/networkdisk/img/pic.png";
			break;
			case(".gif"):
			case(".bmp"):
			case(".psd"):
			case(".ai"):
			case(".svg"):
				type="/networkdisk/img/picture1.png";
			break;
			case(".doc"):
			case(".docx"):
				type="/networkdisk/img/word.png";
			break;
			case(".txt"):
				type="/networkdisk/img/text.png";
			break;
			case(".xls"):
				type="/networkdisk/img/xls.png";
			break;
			case(".pdf"):
				type="/networkdisk/img/pdf.png";
			break;
			case(".html"):
				type="/networkdisk/img/html.png";
			break;
			case(".mp3"):
			case(".wav"):
			case(".mod"):	
				type="/networkdisk/img/music.png";
			break;
			default:
				type="/networkdisk/img/others.png";
		}
			var $str=$("<li class='file-list'><div class='file_name'title='"
					+ upfilename
					+ "'>"
					+ "<img src='"
					+ type
					+ "'width='28px' style='display:inline-block;position:relative;float:left;margin-top:10px;'>"
					+ "<span class='name-text'>"
					+ upfilename
					+ "</span></div>"
					+ "<div class='file_size'>"
					+ upfilesize+upsizeflag
					+ "</div><div class='file_path'><span class='server_path'>"
					+ upfileaddress
					+ "</span></div>"
					+"<div class='up_status'>上传中···</div>"
					+"<div class='probox' style='width: 100%; height:5px;padding-left:0px;display:none;'>"
					+"<div id='myprogress' style='background-color: hsl(100, 80%, 60%); height: 5px;'></div></div></li>");
			var flag = 0;
			$(".july_fileName").each(function() {
				if ($(this).text() == file.name) {
					flag = 1;
				}
			})
			if (flag != 1) {
				if (window.FileReader) {
					var reader = new FileReader();
					reader.readAsDataURL(file);
					//监听文件读取结束后事件    
					reader.onloadend = function(e) {						
						$('#msg').show();
						$('#uploaderList').append($str);
						ajaxFileUpload();
					};
				}
			} else {
				alert("文件夹中已经有相同名字的文件！")
			}
		}
		var time = 0;
		function ajaxFileUpload() {
			$("#myprogress").width(0);
			$('#msg').css('bottom', '0px');
			time = window.setInterval(progress, 100);
			$('.up_status:last').html("上传中···");
			$.ajaxFileUpload({
						url : '${pageContext.request.contextPath}/fileupload?categorie_id='+ categorie,
						secureuri : false,
						fileElementId : 'upfile',//upfile是input file 标签的id值  
						dataType : 'multipart/form-data',
						success : function(data) {
							$("#upfile").off("change");
							//需要重新绑定事件
							$("#upfile").bind("change",function() {
								var file = this.files[0];
								july_fileReader(file);
							});
							//刷新页面
							$('.up_status').html("上传成功");
							$('.probox').remove();
							$('#msg').css('bottom', '-300px');
							showchild(categorie,recycle);
						},
						error : function() {
							$('.up_status:last').html("上传失败");
							 $('.probox').hide();
						}

					})
			return false;
		}

		function progress() {
			$.ajax({
				url : "${pageContext.request.contextPath}/progress",
				dataType : 'json',
				success : function(data) {
					$('.probox').show();
					$("#myprogress").width(data.rate + "%");
					if (data.rate == 100) {
						clearInterval(time);
					}
				},
				error : function() {
					alert("error");
				}
			});
		}
	</script>
	<script type="text/javascript">

		$('table').on('click','.fa-ellipsis-h',function(){
			$(this).parent().parent('td').find('.menu').css('display','block');
		});
		$('table').on('mouseleave','.menu',function(){
			$('.menu').css('display','none');
		});
		$('.md-trigger').click(function() {		
			showOverlay();
			$('.md-effect-4').addClass('md-show');
			var che=$('.table').find('input:checked');
			if(che.length>1){
				$('.dialog-header-title').html("分享多个文件(夹)");
			}else{
				shareid=null;				
				if(che.parents('tr').find('.reid').length!=0){				
					shareid=che.parents('tr').find('.reid').val();
					iscate=true;
				}else{
					shareid=che.parents('tr').find('.refileid').val();
					iscate=false;
				}			
				var name=che.parents('tr').find('a:eq(0)').text();
				$('.dialog-header-title').html("分享文件(夹):"+name);
			}
			
		});
		var shareid;
		var iscate=true;
		$('table').on('click','.fa-share-alt',function() {
			shareid=null;
			if($(this).parents('tr').find('.reid').length!=0){				
				shareid=$(this).parents('tr').find('.reid').val();
				iscate=true;
			}else{
				shareid=$(this).parents('tr').find('.refileid').val();
				iscate=false;
			}			
			var name=$(this).parents('tr').find('a:eq(0)').text();	
			showOverlay();
			$('.md-effect-4').addClass('md-show');
			$('.dialog-header-title').html("分享文件(夹):"+name);
		});
		/* $('table').on('click','.md-copy',function() {
			$('.md-effect-10').addClass('md-show');
		});
		$('.cancel').click(function(){
			$('.md-effect-10').removeClass('md-show');
		}); */
		/* 判断私密还是公开 */
		$("input[type=radio]").click(function(){
			$("input[name='share-method']:checked").each(function() {
				if ($(this).val() == 'public') {
					$('.share-public-panel').css('color','red');
				} else {
					$('.share-public-panel').css('color','rgb(139, 144, 158)');
				}
			});
		});
		/* 创建链接样式 */
		$('.create').click(function() {
				var pp=$("input[name='share-method']:checked").val();
				if (pp == 'private') {
					$('.validity-section').hide();
					$('.create').hide();
					$('.share').show();
					$('.createlink').show();
					$('.create-success .private').show();
					$('.create-success .public').hide();
					$('.password').show();
					$('.description .private').show();
					$('.description .public').hide();
					$('#copyShare .private').show();
					$('#copyShare .public').hide();
				} else {
					$('.validity-section').hide();
					$('.create').hide();
					$('.share').show();
					$('.createlink').show();
					$('.create-success .private').hide();
					$('.create-success .public').show();
					$('.password').hide();
					$('.description .private').hide();
					$('.description .public').show();
					$('#copyShare .private').hide();
					$('#copyShare .public').show();
				}
				shareurl();
			});
		/* 鼠标滑过选中input-url */
		$('.share-url').mouseover(function(){
			this.select();
		})
		/* 关闭分享 */
		$('.close').click(function() {
			$('.validity-section').show();
			$('.create').show();
			$('.overlay').hide();
			$('.createlink').hide();
		})

		/* 重命名 */
		$('table').on('click','.md-ren',function() {
			var zz="<div class='reName'><input class='GodName' type='text' value=''><i class='fa fa-check sure'></i><i class='fa fa-times dele'></i></div>";
			$(this).parents('tr').css('background','#F0F8FD');
			$(this).parents('tr').find('a:eq(0)').after(zz);
			var idVal=$(this).parents('tr').find('.reid').length;
			var originVal=$(this).parents('tr').find('a:eq(0)').text();
			var id=$(this).parents('tr').find('input[type=text]').val();			
			$('.GodName').val(originVal);
			$('.GodName').select();
			$('.tw1_body').css('overflow-y','hidden');
			/* 关闭tr触发事件 */
			$('table').off('mouseenter','tr');
			$('table').off('mouseleave','tr');
			$('table').off('click','.july_cateName');
			$('table').find('.july_fileName').addClass('off');
			$('.sure').click(function(){
				var newname=$(this).prev('input').val();
				if(idVal!=0){
					
					var cateid=id; 
				 	var flag = 0;
					$(".july_cateName").each(function() {
						if(originVal!=newname){	
							if ($(this).text() == newname) {
								flag = 1;
							}
						}
					})
				   if(flag == 1){
						alert("文件夹中名字不能相同")
						return ;
					}
				
				}else{
				var fileid=id;
				
				var flag = 0;
				$(".july_fileName").each(function() {
					if(originVal!=newname){	
						if ($(this).text() == newname) {
							flag = 1;
						}
					}
				})
			   if(flag == 1){
					alert("文件中名字不能相同")
					return ;
				}
				}
				
		        $.ajax({
					url : "${pageContext.request.contextPath}/rename?refileid="+fileid+"&recategorieid="+cateid+"&rename="+newname,
					dataType : 'json',
					success : function(data) {
						$('tr').css('background','none');
						$('.tw1_body').css('overflow-y','scroll');
						$('.reName').remove();
						$('.table').on('mouseenter','tr',function() {
							$(this).css('background','rgba(220, 200, 200, 0.4)');
							$(this).children().find('.more').css('display', 'inline-block');					
						});
						$('.table').on('mouseleave','tr',function() {
							$(this).css('background','none');
							$(this).children().find('.more').css('display', 'none');
						});
						$('.table').on('click','.july_cateName',function(){
							var cateid =$(this).parent('td').find('.reid').val();
							var catestate =$(this).parent('td').find('.restate').val();
							var catename =$(this).parent('td').find('.rename').val();
							cateName = catename;
							caterid = cateid;
							show(cateid,catestate);
						});
						$('table').find('.july_fileName').removeClass('off');						
					},
					error : function() {
						alert("重命名失败失败！");
					}
				});
				showchild(categorie,recycle);
			})
			$('.dele').click(function(){
				$('tr').css('background','none');
				$('.tw1_body').css('overflow-y','scroll');
				$('.reName').remove();
				$('.table').on('mouseenter','tr',function() {
					$(this).css('background','rgba(220, 200, 200, 0.4)');
					$(this).children().find('.more').css('display', 'inline-block');					
				});
				$('.table').on('mouseleave','tr',function() {
					$(this).css('background','none');
					$(this).children().find('.more').css('display', 'none');
				});
				$('.table').on('click','.july_cateName',function(){
					var cateid =$(this).parent('td').find('.reid').val();
					var catestate =$(this).parent('td').find('.restate').val();
					var catename =$(this).parent('td').find('.rename').val();
					cateName = catename;
					caterid = cateid;
					show(cateid,catestate);
				});
				$('table').find('.july_fileName').removeClass('off');
			})
		});


	</script>
	<script type="text/javascript">
	function myCopy(){
		var url = document.getElementById("share-url");
		var password=document.getElementById("share-password");				
		var link="链接："+url.value+" 密码："+password.value;
		document.getElementById('sharelink').value = link;
		var share=document.getElementById('sharelink');
		share.select();
		document.execCommand("Copy");
		document.getElementById("copy-tips").style.display ="block"; 
	}
	function Copy(){
		var url = document.getElementById("share-url");			
		var link=url.value;
		document.getElementById('sharelink').value = link;
		var share=document.getElementById('sharelink');
		share.select();
		document.execCommand("Copy");
		document.getElementById("copy-tips").style.display ="block"; 
	}
	</script>
	<!-- 复制model的树形结构 -->
	<script type="text/javascript">
	
	$('.table').on('click','.fa-ellipsis-h',function(){
		$(this).parent().parent('td').find('.menu').css('display','block');
	});
	$('.table').on('mouseleave','.menu',function(){
		$('.menu').css('display','none');
	});
	
	var a=1;
	var flag=1;
	var thecate;
	var thefile;
	var ree=[];
	var pan=0;
	$('.table').off('click','.md-copy').on('click','.md-copy',function() {
		a=a+1;	
		thecate=null;
		thefile=null;
		ree=null;
		if($(this).parents('tr').find('input[type=text]').hasClass('reid')){
			thecate=$(this).parents('tr').find('.reid').val();
		}
		else{
			thefile=$(this).parents('tr').find('.refileid').val();
		}
		btnAjax(cb);
	});
	$('.table').off('click','.md-move').on('click','.md-move',function() {
		a=a+1;	
		pan=1;
		thecate=null;
		thefile=null;
		ree=null;
		if($(this).parents('tr').find('input[type=text]').hasClass('reid')){
			thecate=$(this).parents('tr').find('.reid').val();
		}
		else{
			thefile=$(this).parents('tr').find('.refileid').val();
		}
		btnAjax(cb);
	});
	function btnAjax(cb) {
		$.ajax({
			url : "${pageContext.request.contextPath}/showAllCate?guid="+new Date().getTime(),
			dataType : 'json',
			success : function(data) {
				var func = callbackFunc(data, cb);
                func()				
			},
			error : function() {
				alert("error");
			}
		});
	}
	function cb(data) {
		$('.menuTree').empty();
		showOverlay();
		$('.md-effect-10').addClass('md-show');		
		if(pan==1){
			$('.dialog-header-title').html('移动到');
			$('.surein').hide();
			$('.suremove').show();
			pan=0;
		}else{
			$('.dialog-header-title').html('复制到');
			$('.surein').show();
			$('.suremove').hide();
		}
    	var json = data;
		var str = "";
		var forTree = function(o){
	 	for(var i=0;i<o.length;i++){
	   		 var urlstr = "";
			 try{
	 				if(typeof o[i]["url"] == "undefined"){
			   	   		urlstr = "<div><i class='fa fa-plus-square-o'></i><img src='/networkdisk/img/category.png' width='20px' style='margin:0 5px 5px 10px;'><span class='treename'>"+o[i]["catename"]+"</span><input value='"+ o[i]["cateid"] +"' type='text' style='display:none'><ul>";
	 				}else{
	 					urlstr = "<div><i class='fa fa-plus-square-o'></i><img src='/networkdisk/img/category.png' width='20px' style='margin:0 5px 5px 10px;'><span class='treename'>"+o[i]["catename"]+"</span><input value='"+ o[i]["cateid"] +"' type='text' style='display:none'><ul>"; 
	 				}
	 			str += urlstr;
	 			if(o[i]["list"] != null){
	 				forTree(o[i]["list"]);
	 			}
	   		 str += "</ul></div>";
	 		}catch(e){}
	 }
	 return str;
	}
	/*添加无级树*/
	document.getElementById("menuTree").innerHTML = forTree(json);
	/*树形菜单*/
	var menuTree = function(){
	 //给有子对象的元素加
		 $("#menuTree ul").each(function(index, element) {
	 		var ulContent = $(element).html();
	 		var spanContent = $(element).siblings("span").html();
	 		if(ulContent){
				 $(element).siblings("span").html(spanContent) 
	 		}
		 });

		 $("#menuTree").find("div span").click(function(){
		 	 var ul = $(this).siblings("ul");
			 var spanStr = $(this).html();
		 	 var spanContent = spanStr.substr(3,spanStr.length);
			 if(ul.find("div").html() != null){
				 if(ul.css("display") == "none"){
					 $(this).parent('div').find('i:eq(0)').attr('class','fa fa-minus-square-o');
					 		 
					 ul.show(300);
		 		 }else{
		 			$(this).parent('div').find('i:eq(0)').attr('class','fa fa-plus-square-o');
		 			 ul.hide(300);
		 		 }
		 	}
		 })
	}()	
	}
	 //判断次数，获取返回函数
    function callbackFunc(data, cb) {
        flag++;
        if (a == flag) {
            return function () {
                cb(data);
            }
        } else {
            return function () {
            }
        }
    }
    var insertCate;
    $('.menuTree').off('click','.treename').on('click','.treename',function(){
		insertCate='';
		$(".treename").removeClass("active");  
        $(this).addClass("active");
        insertCate=$('.menuTree .active').next('input[type=text]').val();
	});
    
    $('.surein').unbind("click").click(function(){
    	var file_ids;
    	var cate_ids;
    	var aimcateid;
		if(thecate&&!thefile){			
			//alert("选择文件夹的id:"+thecate+"复制到文件夹："+insertCate);		
			cate_ids=thecate;
			aimcateid=insertCate;
		}else if(!thecate&&thefile){
			//alert("选择文件的id:"+thefile+"复制到文件夹："+insertCate);
			file_ids=thefile;
			aimcateid=insertCate;
		}else if(cateids.length>0&&fileids.length==0){
			//alert("选择文件夹的id:"+cateids+"复制到文件夹："+insertCate);
			cate_ids=cateids;
			aimcateid=insertCate;
		}else if(cateids.length==0&&fileids.length>0){
			//alert("选择文件的id:"+fileids+"复制到文件夹："+insertCate);
			file_ids=fileids;
			aimcateid=insertCate;
		}else{
			//alert("选择文件夹的id:"+cateids+"选择文件的id:"+fileids+"复制到文件夹："+insertCate);
			cate_ids=cateids;
			file_ids=fileids;
			aimcateid=insertCate;
		}
		copyFileAndCate(file_ids,cate_ids,aimcateid);		
    });
    /* 点击移动触发事件 */
    $('.suremove').unbind("click").click(function(){
    	var file_ids;
    	var cate_ids;
    	var aimcateid;
		if(thecate&&!thefile){			
			//alert("选择文件夹的id:"+thecate+"复制到文件夹："+insertCate);		
			cate_ids=thecate;
			aimcateid=insertCate; 
		}else if(!thecate&&thefile){
		//	alert("选择文件的id:"+thefile+"复制到文件夹："+insertCate);
			 file_ids=thefile;
			aimcateid=insertCate; 
		}else if(cateids.length>0&&fileids.length==0){
			//alert("选择文件夹的id:"+cateids+"复制到文件夹："+insertCate);
			 cate_ids=cateids;
			aimcateid=insertCate; 
		}else if(cateids.length==0&&fileids.length>0){
			//alert("选择文件的id:"+fileids+"复制到文件夹："+insertCate);
			file_ids=fileids;
			aimcateid=insertCate; 
		}else{
			//alert("选择文件夹的id:"+cateids+"选择文件的id:"+fileids+"复制到文件夹："+insertCate);
		    cate_ids=cateids;
			file_ids=fileids;
			aimcateid=insertCate; 
		}
		moveFileAndCate(file_ids,cate_ids,aimcateid);
    });
    
	$('.cancel').click(function(){
		$('.menuTree').empty();
		$('.md-effect-10').removeClass('md-show');
		$('.overlay').hide();
	});
	
	function moveFileAndCate(fileids,cateids,aimCateid){
		 $.ajax({
            url: "${pageContext.request.contextPath}/moveFileAndCate?filelist="+fileids+"&catelist="+cateids+"&categorie_id="+aimCateid,
            dataType: "json",
            success: function(data){
           	 alert(data);
           	 showchild(categorie,recycle);
            },
            error : function() {
				alert("移动失败！");
			}
        });
		$('.md-effect-10').removeClass('md-show');
		$('.overlay').hide();
	}
	
	function copyFileAndCate(fileids,cateids,aimCateid){
		 $.ajax({
             url: "${pageContext.request.contextPath}/copyFileAndCate?filelist="+fileids+"&catelist="+cateids+"&categorie_id="+aimCateid,
             dataType: "json",
             success: function(data){
            	 alert(data);
            	 showchild(categorie,recycle);
             },
             error : function() {
 				alert("复制失败！");
 			}
         });
		 $('.md-effect-10').removeClass('md-show');
		 $('.overlay').hide();
	}
	
</script>

<!-- 多选复制 -->
<script>
var cateids=[];
var fileids=[];
var btns=[];
$('.equip_1').off('click','#f4').on('click','#f4',function(){
	showOverlay();
	a=a+1;	
	var j=0;
	var k=0;
	var i=0;
	cateids=[];
	fileids=[];
	btns=[];
	$('.table input:checked').each(function(){ 
		btns[i]=$(this).next().next('input').val();
	if($(this).next().next('input').hasClass('reid')){
		cateids[j++] = btns[i++];
	}else{
		fileids[k++] = btns[i++];
	}
	});
	btnAjax(cb);
});
$('.equip_1').off('click','#f2').on('click','#f2',function(){
	a=a+1;	
	var j=0;
	var k=0;
	var i=0;
	pan=1;
	cateids=[];
	fileids=[];
	btns=[];
	$('.table input:checked').each(function(){ 
		btns[i]=$(this).next().next('input').val();
	if($(this).next().next('input').hasClass('reid')){
		cateids[j++] = btns[i++];
	}else{
		fileids[k++] = btns[i++];
	}
	});
	btnAjax(cb);
});
</script>
<!-- 实现排序功能 -->
	<script type="text/javascript">  
	var up=true;
	$('.listpal .listsize').click(function(){
		if(up){ 
			$('.Qdh ul').find('li i').hide();
			$('.Qdh ul').find('li:eq(1) i').show();
			$('.Qdh ul').find('li:eq(1) i').attr('class','fa fa-arrow-up');
			up=false;
		}else{
			$('.Qdh ul').find('li i').hide();
			$('.Qdh ul').find('li:eq(1) i').show();
			$('.Qdh ul').find('li:eq(1) i').attr('class','fa fa-arrow-down');
			up=true;
		}
		sortsize();
	});
	$('.Qdh li:eq(1)').click(function(){
		if(up){ 
			$('.Qdh ul').find('li i').hide();
			$('.Qdh ul').find('li:eq(1) i').show();
			$('.Qdh ul').find('li:eq(1) i').attr('class','fa fa-arrow-up');
			up=false;
		}else{
			$('.Qdh ul').find('li i').hide();
			$('.Qdh ul').find('li:eq(1) i').show();
			$('.Qdh ul').find('li:eq(1) i').attr('class','fa fa-arrow-down');
			up=true;
		}
		sortsize();
	});
	function sortsize(){
		var $trs = $('.table tbody .showfileTr');
		$trs.sort(function(a,b){
		    var valueNumOfa = $(a).find('td:eq(1)').text();
		    var valueNumOfb = $(b).find('td:eq(1)').text();		
			var atype=valueNumOfa.split(".");
		    var atype2=atype[1].substr(2);
		    var btype=valueNumOfb.split(".");
		    var btype2=btype[1].substr(2);
		    if(atype2=='KB'){
		    	valueNumOfa=parseFloat(valueNumOfa)*1024;
		    }
		    if(atype2=='M'){
		    	valueNumOfa=parseFloat(valueNumOfa)*1024*1024;
		    }
		    if(atype2=='G'){
		    	valueNumOfa=parseFloat(valueNumOfa)*1024*1024*1024;
		    }
		    if(btype2=='KB'){
		    	valueNumOfb=parseFloat(valueNumOfb)*1024;
		    }
		    if(btype2=='M'){
		    	valueNumOfb=parseFloat(valueNumOfb)*1024*1024;
		    }
		    if(btype2=='G'){
		    	valueNumOfb=parseFloat(valueNumOfb)*1024*1024*1024;
		    }
		    if(up){		    	 
			    if(valueNumOfa > valueNumOfb) return -1;
				else return 1;
		    }else{
		    	if(valueNumOfa < valueNumOfb) return -1;
				else return 1;
		    }		      
		});
		$trs.detach().appendTo('.table tbody');
	}
	var date=true;
	$('.listpal .listdate').click(function(){
		if(date){ 
			$('.Qdh ul').find('li i').hide();
			$('.Qdh ul').find('li:eq(2) i').show();
			$('.Qdh ul').find('li:eq(2) i').attr('class','fa fa-arrow-up');
			date=false;
		}else{
			$('.Qdh ul').find('li i').hide();
			$('.Qdh ul').find('li:eq(2) i').show();
			$('.Qdh ul').find('li:eq(2) i').attr('class','fa fa-arrow-down');
			date=true;
		}
		sortdate();
	})
	$('.Qdh li:eq(2)').click(function(){
		if(date){ 
			$('.Qdh ul').find('li i').hide();
			$('.Qdh ul').find('li:eq(2) i').show();
			$('.Qdh ul').find('li:eq(2) i').attr('class','fa fa-arrow-up');
			date=false;
		}else{
			$('.Qdh ul').find('li i').hide();
			$('.Qdh ul').find('li:eq(2) i').show();
			$('.Qdh ul').find('li:eq(2) i').attr('class','fa fa-arrow-down');
			date=true;
		}
		sortdate();
	});
	function sortdate(){
		var $trs = $('.table tbody .showTr');	
		var $ftrs = $('.table tbody .showfileTr');	
		$trs.sort(function(a,b){
			var dateOfa = $(a).find('td:eq(2)').text();
			var dateOfb = $(b).find('td:eq(2)').text();
			if(date){
				if(dateOfa > dateOfb) return -1;
				else return 1;
			}else{
				if(dateOfa < dateOfb) return -1;
				else return 1;
			}			
		});
		$ftrs.sort(function(a,b){
			var fdateOfa = $(a).find('td:eq(2)').text();
			var fdateOfb = $(b).find('td:eq(2)').text();
			if(date){
				if(fdateOfa > fdateOfb) return -1;
				else return 1;
			}else{
				if(fdateOfa < fdateOfb) return -1;
				else return 1;
			}
		});		
		$trs.detach().appendTo('.table tbody');							
		$ftrs.detach().appendTo('.table tbody');	
	}
		function officeviewfun(data){
			var fp = new FlexPaperViewer('FlexPaperViewer', /* 对应FlexPaperViewer.swf文件*/
					'viewerPlaceHolder', {
						config : {
							SwfFile : data,
							Scale : 0.6,
							ZoomTransition : 'easeOut',
							ZoomTime : 0.5,
							ZoomInterval : 0.2,
							FitPageOnLoad : true,
							FitWidthOnLoad : true,
							FullScreenAsMaxWindow : false,
							ProgressiveLoading : false,
							MinZoomSize : 0.2,
							MaxZoomSize : 5,
							SearchMatchAll : false,
							InitViewMode : 'Portrait',
							ViewModeToolsVisible : true,
							ZoomToolsVisible : true,
							NavToolsVisible : true,
							CursorToolsVisible : true,
							SearchToolsVisible : true,
							localeChain : 'zh_CN'
						}
					});
		}
    </script>
    <script type="text/javascript">
    /**
     * 显示遮罩层
     */

     function showOverlay() {
        // 遮罩层宽高分别为页面内容的宽高
        $('.overlay').css({'height':$(window).height(),'width':$(window).width()});
        $('.overlay').show();
    }
    
     $('table').on('click','.getparents',function(){
    		var cateid =$(this).parent('td').find('.reid').val();
    		var catestate =$(this).parent('td').find('.restate').val();
			showchild(cateid,catestate);
    		showsearch(cateid);
	 });
     $('table').on('click','.getcateparent',function(){
 		var cateid =$(this).find('#catereid').val();
 		if(cateid=="null"){
 			showchild(null,0);
 		}else{
 			showchild(cateid,0);
 			showsearch(cateid);
 		}
 		
	 });
     function showsearch(cateid) {
    		
			$.ajax({  
			 	url: "showparents?filecateid="+cateid,      		//后台处理程序
	            type: "post",               					//数据发送方式
	            dataType: "json",           					//接受数据格式   
	            success:function(map){ 
	            	var catelist = map.catelist;
	            	for(var i=catelist.length-1;i>=0;i--){
	            		 var $head=$("<td><a id='"+catelist[i].id+"' class='aa'  style='cursor:pointer;text-decoration:none'> >"+catelist[i].name+"</a></td>"); 
	     				 $("#july_allFile tr").append($head);
	            	} 
				},
				error : function() {
					alert("error");
				}						
			});
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
    
    
</body>
</html>

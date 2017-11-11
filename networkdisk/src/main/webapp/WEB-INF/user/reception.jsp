<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
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
<link href="/networkdisk/css/component.css" rel="stylesheet" />
<link rel="stylesheet"
	href="/networkdisk/font-awesome-4.7.0/css/font-awesome.min.css">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="/networkdisk/js/jquery-1.11.2.min.js"></script>
<script src="/networkdisk/user/js/bootstrap.min.js"></script>
<script src="/networkdisk/js/index.js"></script>
<script src="/networkdisk/js/jquery.rotate.min.js"></script>
</head>
<script type="text/javascript">
$(document).ready(function(){
	var username = $(".username").text();
	if(username.length > 0){
		$(".login").hide();
		$(".sev").show();
	}else{
		$(".login").show();
		$(".sev").hide;
	}
})
</script>
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
				<div class="span1" style="display: inline;float:left;">
					<ul class="pull-left">
						<li><a id="goindex">网盘</a></li>
						<li><a id="goshare">分享</a></li>
						<li><a href="more">更多</a></li>
					</ul>
				</div>
				<script type="text/javascript">
					$("#goindex").click(function(){
						var name = $(".username").text();
						if(name.length < 1){
							alert("请先登陆！");
						}else{
							$("#goindex").attr("href","goindex");
						}
					});
					$("#goshare").click(function(){
						var name = $(".username").text();
						if(name.length < 1){
							alert("请先登陆！");
						}else{
							$("#goshare").attr("href","goshare");
						}
					})
				</script>
				
				<div class="span2">
					<ul class="right">
						<li class="chos" style="width: 220px;" id="admin">
							<div class="sev" style='display:none;'>
								<div class="admin">
									
									<img src="showphoto?uid=${sessionScope.user.id }" width="30px" class="photo"
										style="border-radius: 30px; position: absolute; top: 10px;" />
									<a href="#" style="display: inline-block; height: 50px;">
										<div class="username">${sessionScope.user.name }</div><input type="hidden" id="uid" value="${sessionScope.user.id }" >  <img
										src="/networkdisk/img/VIP1.png"
										style="display: inline-block; margin-bottom: 45px;" />
									</a>
									
									 <em style="display: inline-block;">
									 	<img src="/networkdisk/img/downchoose.png" class="c" style="margin-bottom: 40px;" />
									 </em>
								</div>

								<div class="user">
									<span id="triangle-up"> </span>
									<div class="userpan">
										<div class="userpan_2">
											<div class="u1">
												<a href="#"><img src="showphoto?uid=${sessionScope.user.id }" class="photo"
													width="30px" class="userpic" /> </a> <a id="username">${sessionScope.user.name }</a>
												<img src="/networkdisk/img/VIP1.png"
													style="display: inline; margin-bottom: 5px;" />
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
							<div class="login" style="text-align: right; font-size: 14px;">
								<a href="#" class="load">登录</a> 
								<a href="register.jsp" class='reg'>注册</a>
							</div>
						</li>
						<li><a href="noticeList"><img src="/networkdisk/img/notice.png"style="margin-top: 10px;" /></a>
						<p class="new-notice"></p></li>																
						<li><a href="#"><img src="/networkdisk/img/serve.png"
								style="margin-top: 10px;" /></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="clean" style="clear: all; height: 50px;"></div>
	<div class="receivepage">
		<div class="col-lg-9 col-md-9 page2">
			<div class="page2_1">
				<div class="slide-show-left">
					<h2>
						<c:if test="${filelist.size() < 1 }"><img src="/networkdisk/img/category.png" style="margin-left:10px;margin-bottom:5px;" ></c:if>
						<c:if test="${filelist.size() > 1 && catelist.size() < 1 }"><img src="/networkdisk/img/cates.png"  style="margin-left:10px;margin-bottom:5px;" ></c:if>
						<c:if test="${filelist.size() >=1 && catelist.size() >=1 }"><img src="/networkdisk/img/cates.png"  style="margin-left:10px;margin-bottom:5px;" ></c:if>
						
						<c:if test="${filelist.size() == 1 && catelist.size() < 1 }">
							<c:choose>
								    <c:when test="${filelist[0].type == 'zip' }">
								       <img src='/networkdisk/img/ZIP_2.png'>
								    </c:when>
								    <c:when test="${filelist[0].type == 'mp4' || filelist[0].type == 'rmvb' || filelist[0].type=='avi' || filelist[0].type == 'mkv' || filelist[0].type=='wmv' || filelist[0].type=='wmv' ||  filelist[0].type=='mov'}">
								       <img src='/networkdisk/img/video.png'>
								    </c:when>
								     <c:when test="${filelist[0].type == 'png'}">
								      <img src='/networkdisk/img/pic.png'>
								    </c:when>
								     <c:when test="${filelist[0].type == 'jpg'}">
								       <img src='/networkdisk/img/pic.png'>
								    </c:when>
								     <c:when test="${filelist[0].type == 'gif' || filelist[0].type == 'bmp' || filelist[0].type == 'psd'  || filelist[0].type == 'ai' || filelist[0].type == 'svg' }">
								       <img src='/networkdisk/img/picture1.png'>
								    </c:when>
								     <c:when test="${filelist[0].type == 'docx' || filelist[0].type == 'doc' }">
								       <img src='/networkdisk/img/word.png'>
								    </c:when>
								    <c:when test="${filelist[0].type == 'txt' }">
								       <img src='/networkdisk/img/text.png'>
								    </c:when>
								    
								     <c:when test="${filelist[0].type == 'xls' }">
								       <img src='/networkdisk/img/xls.png'>
								    </c:when>
								     <c:when test="${filelist[0].type == 'pdf' }">
								       <img src='/networkdisk/img/pdf.png'>
								    </c:when>
								     <c:when test="${filelist[0].type == 'html' }">
										<img src='/networkdisk/img/html.png'>
								    </c:when>
								    <c:when test="${filelist[0].type == 'mp3' || filelist[0].type == 'wav' || filelist[0].type == 'mod' }">
										<img src='/networkdisk/img/music.png'>
								    </c:when>
								    <c:otherwise>
								       <img src='/networkdisk/img/others.png'>
								    </c:otherwise>
								</c:choose>
						</c:if>
						<c:forEach items="${catelist }" var="c" varStatus="stat">
							<c:if test="${!stat.last}">${c.name }、</c:if>
							<c:if test="${stat.last}">${c.name }</c:if>
						</c:forEach> 
						<c:forEach items="${filelist }" var="f"  varStatus="stat">
							<c:if test="${!stat.last}">${f.name }、</c:if>
							<c:if test="${stat.last}">${f.name }</c:if>
						</c:forEach>
					</h2>
				</div>
				<div class="slide-show-right">
					<div class="module-share-top-bar g-clearfix">
						<div class="bar" style="white-space: nowrap; position: relative;">
							<div class="button-box" style="position: absolute; top: 0px; padding-top: 0px; line-height: normal;right:10px;">
								<a class="g-button g-button-blue" href="javascript:void(0);">
									<span class="g-button-right">
									<em class="fa fa-save" title="保存到网盘"></em>
									<span class="text" style="width: auto; margin-left: 5px;" id="pres">保存到网盘</span>
									</span> 
								</a>
							</div>
						</div>
					</div>
				</div>
				
				<script type="text/javascript">
					$("#pres").click(function(){
						var name = $(".username").text();
						if(name.length < 1){
							alert("请先登陆！");
							return ;
						}
						
						
						
						var fid = new Array();
						var fname = new Array();
						var cateid = new Array();
						var catename = new Array();
						var uid = $("#uid").val();
						$("input[name='filebox']:checked").each(
								function(key, value) {
									fid[key] = $(this).val();
									fname[key] = $(this).parent().find("span")
											.text();
								});
						$("input[name='catebox']:checked").each(
								function(key, value) {
									cateid[key] = $(this).val();
									catename[key] = $(this).parent().find("span")
											.text();
								});				
						if (fid == "" && cateid == "") {
							alert("请选择文件进行保存！");
						} else {
							
							showOverlay();
							a=a+1;
							btnAjax(cb);
							
							
						} 
					});
				</script>
				
				
				<div class="cb"></div>
				<div class="slide-show-other-infos">
					<div class="share-file-info" style="font-size: 14px;">
						<span class="fa fa-clock-o" style="font-size: 18px;"></span>&nbsp;<fmt:formatDate value="${share.startTime }" pattern="yyyy-MM-dd  HH:mm:ss" /> 
					</div>
					<div class="share-valid-check" style='margin-left:30px;color:red;'>失效时间：
						<c:if test="${share.retain == 0 }">永久有效</c:if>
						<c:if test="${share.retain == 7 }">七天</c:if>
						<c:if test="${share.retain == 1 }">一天</c:if>
					</div>
					<div class="slide-show-other-cns clearfix">
						<span class="title-funcs"> <span class="funcs-share-area">
						</span>
						</span>
					</div>
					<div class="cb"></div>
				</div>
			</div>

			<div class="tw1_body" style="width: 100%; margin: 0px auto; height: 410px; overflow-y: auto; border: none;">
				<div class="Jdh">
					<table id="july_allFile" style="display: inline">
						<tr>
							 <td><a id='null' class='frist'
								style='cursor: pointer; color: #333; text-decoration: none'>全部文件</a></td>
						</tr>
					</table>
					<span class="Sdh" style="float: right; display: inline-block;"></span>
				</div>
				<div class="Qdh">
					<ul class='head'>
						<li style="width: 50%; margin-left: -40px;"><input
							type="checkbox" class="ck1" /><span id="n1" style='margin-left: 10px;'>文件名</span></li>
						<li style="width: 25%;">大小</li>
						<li style="width: 30%;">修改日期</li>
					</ul>
					<div id="qdh">
					<c:forEach items="${catelist }" var="c">
						<ul>
							<li style="width: 50%; margin-left: -40px;">
							<input type="checkbox" class="cateid" name="catebox" value="${c.id }" />
								<img src='/networkdisk/img/category.png' width='28px' style='margin:0 5px 5px 0px;'>
								<span id="" class="cate">${c.name }</span>
								<input type="hidden" value="${c.id }" />
								</li>
							<li style="width: 25%;">---</li>
							<li style="width: 30%;"><fmt:formatDate value="${c.addtime}"
									pattern="yyyy-MM-dd  HH:mm:ss" /></li>
						</ul>
					</c:forEach>
					<c:forEach items="${filelist }" var="f">
						<ul>
							<li style="width: 50%; margin-left: -40px;" class="downhover">
							<input type="checkbox" class="filebox" name="filebox" value="${f.id }" />								
								<c:choose>
								    <c:when test="${f.type == 'zip' }">
								       <img src='/networkdisk/img/ZIP_2.png' width='28px' style='margin:0 5px 5px 0px;'>
								    </c:when>
								    <c:when test="${f.type == 'mp4' || f.type == 'rmvb' || f.type=='avi' || f.type == 'mkv' || f.type=='wmv' || f.type=='wmv' ||  f.type=='mov'}">
								       <img src='/networkdisk/img/video.png' width='28px' style='margin:0 5px 5px 0px;'>
								    </c:when>
								     <c:when test="${f.type == 'png'}">
								      <img src='/networkdisk/img/png.png' width='28px' style='margin:0 5px 5px 0px;'>
								    </c:when>
								     <c:when test="${f.type == 'jpg'}">
								       <img src='/networkdisk/img/jpg.png' width='28px' style='margin:0 5px 5px 0px;'>
								    </c:when>
								     <c:when test="${f.type == 'gif' || f.type == 'bmp' || f.type == 'psd'  || f.type == 'ai' || f.type == 'svg' }">
								       <img src='/networkdisk/img/picture1.png' width='28px' style='margin:0 5px 5px 0px;'>
								    </c:when>
								     <c:when test="${f.type == 'docx' || f.type == 'doc' }">
								       <img src='/networkdisk/img/word.png' width='28px' style='margin:0 5px 5px 0px;'>
								    </c:when>
								    <c:when test="${f.type == 'txt' }">
								       <img src='/networkdisk/img/text.png' width='28px' style='margin:0 5px 5px 0px;'>
								    </c:when>
								    
								     <c:when test="${f.type == 'xls' }">
								       <img src='/networkdisk/img/xls.png' width='28px' style='margin:0 5px 5px 0px;'>
								    </c:when>
								     <c:when test="${f.type == 'pdf' }">
								       <img src='/networkdisk/img/pdf.png' width='28px' style='margin:0 5px 5px 0px;'>
								    </c:when>
								     <c:when test="${f.type == 'html' }">
										<img src='/networkdisk/img/html.png' width='28px' style='margin:0 5px 5px 0px;'>
								    </c:when>
								    <c:when test="${f.type == 'mp3' || f.type == 'wav' || f.type == 'mod' }">
										<img src='/networkdisk/img/music.png' width='28px' style='margin:0 5px 5px 0px;'>
								    </c:when>
								    <c:otherwise>
								       <img src='/networkdisk/img/others.png' width='28px' style='margin:0 5px 5px 0px;'>
								    </c:otherwise>
								</c:choose>
								
								<span id="n1">${f.name }</span><span class='fa fa-download' title='下载' ></span></li>
							<li style="width: 25%;"><span><c:if test="${f.size/1024 < 1}">${f.size }B</c:if>
								<c:if test="${f.size/1024 >=1 && (f.size/1024)/1024 < 1}">
									<f:formatNumber type="number" value="${f.size/1024 }"
										pattern="0.00" maxFractionDigits="2" />K</c:if> <c:if
									test="${(f.size/1024)/1024 >= 1}">
									<f:formatNumber type="number" value="${f.size/1024/1024 }"
										pattern="0.00" maxFractionDigits="2" />M</c:if></span></li>
							<li style="width: 30%;"><fmt:formatDate value="${f.addtime}"
									pattern="yyyy-MM-dd  HH:mm:ss" /></li>
						</ul>
					</c:forEach>
					</div>
					<div id="str"></div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$(".cate").click(function(){
				var cateid = $(this).next().attr("value");
				var catename = $(this).text();
				$("input[name='catebox']").removeAttr("checked");
				$("input[name='filebox']").removeAttr("checked");
				$("#july_allFile tr").empty();
				var $head=$("<td><a id='null' class='frist'  style='cursor: pointer; color: #333; text-decoration: none'> 全部文件</a></td><td><a id='"+cateid+"' class='aa'  style='cursor:pointer;text-decoration:none'> >"+catename+"</a></td>"); 
				$("#july_allFile tr").append($head);
				shownext(cateid); 
				$("#qdh").hide();
			});
			function shownext(cateid){
				
				$(".showcate").remove();
				$.ajax({
					url : "shownext?cateid=" + cateid,
					dataType : 'json',
					async : false,
					success : function(map) {
						$("#frist").remove();
						$(".showTr").remove();
						var listFile = map.filelist;
						var listCate = map.catelist;
						for(var i=0;i<listCate.length;i++){
							
							var time = listCate[i].addtime;
							var newTime = time.split("T");
							var $str = ("<ul class='showcate'>"
									+ "<li style='width: 50%; margin-left: -40px;'>"
									+ "<input type='checkbox' name='catebox' class='cateid' value='"
									+ listCate[i].id
									+ "' />"
									+ "<img src='/networkdisk/img/category.png' width='28px' style='margin:0 5px 5px 10px;'>"
									+ "<span id='n1' class='n2' >"
									+ listCate[i].name
									+ "</span></li>"
									+ "<li style='width: 25%;'>---</li>"
									+ "<li  style='width: 30%;'>"
									+ newTime[0]+" "+newTime[1]
									+ "</li></ul>"
							);
							$("#str").append($str);
						}
						for(var i=0;i<listFile.length;i++){
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
							}else
							{
								filesize=(listFile[i].size/(1024*1024)).toFixed(2);
								sizeflag="M";
							}
							/* 文件图标 */
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
							
							var $str = ("<ul class='showcate'>"
									+ "<li style='width: 50%; margin-left: -40px;padding-top:5px' class='downhover'>"
									+ "<input type='checkbox' name='filebox' class='filebox' value='"
									+ listFile[i].id
									+ "' />"
									+ "<img src='"
									+ type
									+ "'width='28px' style='margin:0 5px 5px 10px;'>"
									+ "<span id='n1' onclick='shownext("
									+ listFile[i].id
									+ ")'>"
									+ listFile[i].name
									+ "</span><span class='fa fa-download' title='下载'></span></li>"
									+ "<li style='width: 25%;'><span>"
									+ filesize + sizeflag
									+ "</span></li>"
									+ "<li  style='width: 30%;'>"
									+ newTime[0]+" "+newTime[1]
									+ "</li></ul>"
							)
							$("#str").append($str);
						}
					},
					error : function(){
						alert("false");
					}
				});
			}
			
			
			$('#str').on('click','.n2',function(){
				var cateid = $(this).parent('li').find('.cateid').val();
				var catename = $(this).text();
				 var $head=$("<td><a id='"+cateid+"' class='aa'  style='cursor:pointer;text-decoration:none'> >"+catename+"</a></td>"); 
 				 $("#july_allFile tr").append($head);
				shownext(cateid);
			});
			$('.tw1_body').on('click','.frist',function(){
				 $("#july_allFile tr").find('.aa').empty();
				$(".showcate").remove();
				$("#qdh").show();
			});
			$('.tw1_body').on('click','.aa',function(){
				var cateid=$(this).attr("id");
				var catename = $(this).text();
				var $head=$("<td><a id='"+cateid+"' class='aa'  style='cursor:pointer;text-decoration:none'>"+catename+"</a></td>"); 
 				$("#july_allFile tr").append($head);
				shownext(cateid);
 				$(this).parent('td').nextAll('td').remove();
			});
		</script>
		<script type="text/javascript">
			$(document).ready(function(){
				var size = new Array();
				$("input[name='filebox']").each(
						function(key, value) {
							size[key] = $("input[name='filebox']").parent().next().find("span").text();
						});
						/* alert(size); */
			});
		</script>
		<div class="col-lg-3 col-md-3 page3">
			<div class="module-aside aside" id="layoutAside">
				<div class="module-share-person-info">
					<div class="share-person-inner global-clearfix haha">
						<div class="share-person-avatar">
							<a href="#" target="_blank" title="去Ta的分享主页" class="person-icon">
								<img alt="" src="${pageContext.request.contextPath}/showphoto?uid=${user.id}"
								width="60px">
							</a>
						</div>
						<div class="share-person-data">
							<div class="share-person-data-top">
								<a href="#" target="_blank" title="去Ta的分享主页"
									class="share-person-username">${user.name }</a> 
								<em class="fa fa-vimeo"></em>
							</div>
							<a href="javascript: void(0)" class="share-follow-btn follow">
								<span class="fa fa-plus">立即订阅</span> <span class="fa fa-minus"
								style="display: none;">取消订阅</span>
							</a>
						</div>
					</div>
					<div class="share-person-intro" title="">${user.about }</div>
				</div>
			</div>
		</div>		
	</div>
	<div class="md-modal md-effect-13" id="modal-13" >
    		<div class="md-content" style="height:310px;">
     			<div class="dialog-header dialog-drag">
					<span class="dialog-header-title">保存到 </span>
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
      			</div>
    		</div>
  		</div>
	<div class="md-modal md-effect-10" id="modal-10" style="width: 440px;">
		<div class="md-content" style="height: 310px;">
			<div class="dialog-header dialog-drag" style="height:40px;line-height:35px; background: #77afff;color:#fff;font-size:20px;padding:5px;">
				<img src="/networkdisk/img/julyicon.png" width="30px" style="margin-top:-7px;margin-right:5px;"><span class="dialog-header-title" style="display: inline">登录July账号</span>
			</div>
			<div class="dialog-tree" style="border: none;height: 245px;overflow: hidden;">
				
					<div class="logininput">
						<input type="text" name="username" class="loginusername" id="name" placeholder="用户名" onblur="this.placeholder='用户名'" onfocus="this.placeholder=''"/> 
						<input type="password" class="userpassword" id="passWord" placeholder="密码" onBlur="this.placeholder='密码';" onFocus="this.placeholder='';"/>
					</div>
					<div class="loginbtn">
						<div class="loginsubmit fl" id="login">
							<input type="submit" value="登录" />
						</div>
						<div class="quxiao cancel">
							<span>取消</span>
						</div>
						<div class="logcheckbox" style='margin-top:-20px;'>
							<input id="bcdl" type="checkbox" checked="true" /> 保持登录
							<a href="#" style="float:right;text-decoration: none;color:#979696;">忘记密码?</a>
						</div>
					</div>
				
			</div>
		</div>

	</div>

	
	
	<script type="text/javascript">
		$("#login").click(function(){
			var name = $("#name").val();
			var passWord = $("#passWord").val();
			$.ajax({
				url : "sharelogin?name=" + name+"&passWord="+passWord,
				dataType : 'json',
				async : false,
				success : function(map) {
					var user = map.user;
					$("#modal-10").hide();					
					$(".login").hide();
					$(".username").append(user.name);
					$('#uid').val(user.id);
					$("#username").append(user.name);
					$(".photo").attr("src","showphoto?uid="+user.id);
					$(".sev").show();
					$('.overlay').hide();
				},
				error : function(){
					alert("登陆失败！");
				}
			});
		});
	</script>
	
</body>
<script src="js/classie.js"></script>
<script src="js/modalEffects.js"></script>
<script>
	$('.fa-plus').click(function() {
		$(this).hide();
		$('.fa-minus').show();
	});
	$('.fa-minus').click(function() {
		$(this).hide();
		$('.fa-plus').show();
	});
	$('body').on('click', '.load', function() {
		showOverlay();
		$('.md-effect-10').addClass('md-show');
	});
	$('.cancel').click(function() {
		$('.overlay').hide();
		$('.md-effect-10').removeClass('md-show');
	});
	$('.receivepage').on('mouseenter','ul li.downhover',function(){
		$(this).children('.fa-download').show();
	})
	$('.receivepage').on('mouseleave','ul li.downhover',function(){
		$(this).children('.fa-download').hide();
	})
	$('.receivepage').on('click','ul li.downhover .fa-download',function(){
		var Tfileid=$(this).parent('li').find('.filebox').val();
		var Tfilename=$(this).parent('li').find('#n1').text();
		window.location.href="fileDownload?fileFileName="+Tfilename+"&netFileID="+Tfileid;
	})
	var a=1;
	var flag=1;
	var cateids=[];
	var fileids=[];
	var btns=[];
	$('.aaa').click(function(){
		showOverlay();
		a=a+1;	
		var j=0;
		var k=0;
		var i=0;
		cateids=[];
		fileids=[];
		btns=[];
		$('.showcate input:checked').each(function(){ 
			btns[i]=$(this).val();
		if($(this).hasClass('cateid')){
			cateids[j++] = btns[i++];
		}else{
			fileids[k++] = btns[i++];
		}
		alert(fileids);
		});
		btnAjax(cb);
	})
	/* 选择保存到文件夹 */
	//封装ajax事件
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
		$('.md-effect-13').addClass('md-show');			
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
	/* 取消保存 */
    $('.cancel').click(function(){
		$('.menuTree').empty();
		$('.md-effect-13').removeClass('md-show');
		$('.overlay').hide();
	});
    var insertCate;
    $('.menuTree').off('click','.treename').on('click','.treename',function(){
		insertCate='';
		$(".treename").removeClass("active");  
        $(this).addClass("active");
        insertCate=$('.menuTree .active').next('input[type=text]').val();
	});
    $('.surein').unbind("click").click(function(){
    	
    	var fid = new Array();
		var fname = new Array();
		var cateid = new Array();
		var catename = new Array();
		var uid = $("#uid").val();
		$("input[name='filebox']:checked").each(
				function(key, value) {
					fid[key] = $(this).val();
					fname[key] = $(this).parent().find("span")
							.text();
				});
		$("input[name='catebox']:checked").each(
				function(key, value) {
					cateid[key] = $(this).val();
					catename[key] = $(this).parent().find("span")
							.text();
				});				
    	
	    $.ajax({
			url : "preservation?fidlist=" + fid
					+ "&fnamelist=" + fname+"&cateid="+cateid+"&catename="+catename+"&uid="+uid+"&uuid="+insertCate,
			dataType : 'json',	
			async : false,
			success : function(data) {
				if (data == 1) {
					alert("保存成功！");
					return ;
				} else if (data == 0) {
					alert("文件或文件夹已存在！");
				}
			},
			error : function() {
				alert("保存失败！");
			}
		}); 	
    });
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

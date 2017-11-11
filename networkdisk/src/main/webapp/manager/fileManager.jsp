<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/networkdisk/user/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/networkdisk/user/css/bootstrap-theme.min.css" />
<link href="/networkdisk/css/component.css" rel="stylesheet" />
<link href="/networkdisk/css/context.css" rel="stylesheet" />
<link rel="stylesheet" href="/networkdisk/manager/css/folder.css" />
<link rel="stylesheet"
	href="/networkdisk/font-awesome-4.7.0/css/font-awesome.min.css">
<script src="/networkdisk/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/networkdisk/js/ajaxfileupload.js"></script>
<script src="/networkdisk/user/js/bootstrap.min.js"></script>
<script src="/networkdisk/js/index.js"></script>
<script src="/networkdisk/js/jquery.rotate.min.js"></script>
<style type="text/css">

.recycle p
{
margin-left: 50px;
}
.files{
	width: 95%;
	
	height:300px;
	overflow-y: scroll;
  
}
.recycle{
	
	width: 95%;
	height:300px;
	overflow-y: scroll;
}
</style>

</head>
<body style="background: #fff">
<div class="files">

	
		<div class="Jdh">
			<table id="july_allFile" style="display: inline">
				<tr>
				</tr>
			</table>
			<span class="Sdh" style="float: right; display: inline-block;"></span>
		</div>

		<div class="Qdh">
			<ul>
				<li style="width: 55%; margin-left: -40px;"><span id="n1"
					style='margin-left: 10px;'>文件名</span></li>
				<li>大小</li>
				<li>修改日期</li>
			</ul>
		</div>
		<table class="table">
			<tbody id="mytbody">

			</tbody>
		</table>
		</div>
		
    <div class="recycle">
   <p>回收站文件</p>
    <div class="sharebox">
				<div class="name">
				<span id="n1"
					style='margin-left: 10px;'>文件名</span>
					
				</div>
				<div class="fufH">
					<span style="color: #5E5E5E;">大小</span>
				</div>
				<div class="fufHs">
					<span style="color: #5E5E5E;">删除时间</span>
				</div>
				<div class="fufH">
					<span style="color: #5E5E5E;">有效时间</span>
				</div>
			</div>
   <table class="table">
   <tbody id="recycletbody">
   </tbody>
   
   </table>
   
   </div> 



	<script type="text/javascript">
    var categorie =null;
	var recycle =null;
	var cateName = null;
	var caterid = null;
  
	var id="<%=request.getParameter("id")%>";
	
	function show(categorie_id, recycleflag) {
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
		$(".showTr").remove();
		$.ajax({
			type : "post",
			dataType : "json",
			url : "${pageContext.request.contextPath}/adminShowFileAndCate?Time="+new Date().getTime(),
			data : {
				 userid:id,
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
		 /*    var sum=parseInt(listCate.length+listFile.length);
			var $sumhead=$("<span class='j2'>已加载全部,共"+sum+"条</span>");
			$('.Sdh').html($sumhead);   */ 
				for (var i = 0; i < listCate.length; i++) {
					//分割时间字符串
					var time = listCate[i].addtime;
					var newTime = time.split("T");
					
					var $str = $("<tr class='showTr'>"
							+ "<td>"
		
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
							+ "<span class='fa fa-trash' title='删除'>"
							+ "</span>"
							+ "</div></td>"
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
					}else
					{
						filesize=(listFile[i].size/(1024*1024)).toFixed(2);
						sizeflag="M";
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
					var $str = $("<tr class='showTr'>"
							+ "<td>"
						
							+ "<img src='"
							+ type
							+ "'width='28px' style='margin:0 5px 5px 10px;'>"
							+ "<input id='listFileID' class='refileid' type='text' style='display:none' value="
							+ listFile[i].id
							+ ">"
							+ "<input id='listFileID' class='rename' type='text' style='display:none' value="
							+ listFile[i].name
							+ ">"
							+ "<a class='july_fileName'>"
							+ listFile[i].name
							+ "</a>"
							+ "<div class='more'>"				
							+ "<span class='fa fa-download' title='下载' >"
							+ "</span>"
							+ "<span class='fa fa-trash' title='删除'></span>"
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
				alert("查询失败")
			}						
		});
	}
 //显示回收站
 
  function july_recycle(){
	  $(".listshare").remove();		
					 $.ajax({
						    
							url : "${pageContext.request.contextPath}/adminShowRecycle?Time="+new Date().getTime(),
							dataType : 'json',
							data : {
								 userid:id
							},
							success : function(map) {
							
			                   
								var listCate = map.listCategories;
								var listFiles = map.listFiles;
								
								for (var i = 0; i < listCate.length; i++) {
									/* 修改时间格式 */
									var time = listCate[i].addtime;
									var newTime = time.split("T");
									
									var $str=$("<div class='listshare'  id='listFileandCate' style='width:100%'><span class='showRecycle'>"
									+"<div class='name'>"
									+"<img src='/networkdisk/img/category.png' width='28px' style='margin:0 5px 5px 10px;'>"
									+ "<input id='listCateID' class='reid' type='text' style='display:none' value="
									+ listCate[i].id
									+ ">"
									+"<a class='file-name'style='width:270px;'>"+listCate[i].name +"</a>"
								    +"<i class='fa fa-trash' title='删除'style='bottom:5px;'></i></div>"
								    +"<div class='fufH'>"
									+"<span style='color: #5E5E5E;'>"+ "--"+"</span>"
								    +"</div>"
							        +"<div class='fufHs'>"
									+"<span style='color: #5E5E5E;'>"+ newTime[0]+" "+newTime[1]+"</span>"
								    +"</div>"
								    +"<div class='fufH'style='margin-left:10px;'>"
									+"<span style='color: #5E5E5E;'>永久有效</span>"
								    +"</div>"
								    +"</span></div>");
									$("#recycletbody").append($str);
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
									var $str=$("<div class='listshare'id='listFileandCate'style='width:100%'><span class='showRecycle'>"
									+"<div class='name'>"
									
									+ "<img src='"
									+ type
									+ "'width='28px' style='margin:0 5px 5px 10px;'>"
									+ "<input id='listFilesID' class='refileid' type='text' style='display:none' value="
									+ listFiles[i].id
									+ ">"
									+"<a  class='rename' style='width:270px'>"+listFiles[i].name +"</a>"
								    +"<i class='fa fa-trash' title='删除' style='bottom:0px;'></i><i class='fa fa-download' title='下载' style='bottom:0px;'></i></div>"
								    +"<div class='fufH'>"
									+"<span style='color: #5E5E5E;'>"+ filesize+sizeflag+"</span>"
								    +"</div>"
							        +"<div class='fufHs'>"
									+"<span style='color: #5E5E5E;'>"+ newTime[0]+" "+newTime[1]+"</span>"
								    +"</div>"
								    +"<div class='fufH'style='margin-left:10px;'>"
									+"<span style='color: #5E5E5E;'>永久有效</span>"
								    +"</div>"
								    +"</span></div>");
									 $("#recycletbody").append($str); 
								}
								
							},
							error : function() {
								alert("查询失败！");
							}
						}); 
				 }
 
 
 
 


$(document).ready(function(){
	
		show(categorie, 0 );
		july_recycle();

})
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
		var cateid =$(this).parent('td').find('.reid').val();
		var catestate =$(this).parent('td').find('.restate').val();
		var catename =$(this).parent('td').find('.rename').val();
		cateName = catename;
		caterid = cateid;
		show(cateid,catestate);
	});
	
	/* 文件下载 */
	
	 $('#mytbody').on('click','.fa-download',function(){
	  var fileid =$(this).parent().parent('td').find('.refileid').val();
	  var filename =$(this).parent().parent('td').find('.rename').val();
	  window.location.href="fileDownload?fileFileName="+filename+"&netFileID="+fileid;
	});
	
	 /* 后台回收站文件下载 */
		
	 $('#recycletbody').on('click','.fa-download',function(){
	  var fileid =$(this).parents('#listFileandCate').find('.refileid').val();
	  var filename =$(this).parents('#listFileandCate').find('.rename').text();
	  window.location.href="adminFileDownLoad?fileFileName="+filename+"&netFileID="+fileid;
	});
	
	 /* 文件删除确认 */
	 $('#mytbody').on('click','.fa-trash',function() {
		 var msg = "你确认删除吗？删除后不可恢复！"
				 if (confirm(msg)==true){ 
					 /*  判断是否为文件夹 */
					 if($(this).parents('tr').find('.reid').length!=0){
						 var cateid=$(this).parents('tr').find('.reid').val();
						 deletecate(cateid);
					 }else{
						 var fileid=$(this).parents('tr').find('.refileid').val();
						 deletefile(fileid); 
					 }
				 }else{ 
				  return false; 
				 } 
		});
	 /*回收站 文件删除确认 */
	 $('#recycletbody').on('click','.fa-trash',function() {
		 var msg = "你确认删除吗？删除后不可恢复！"
				 if (confirm(msg)==true){ 
					 /*  判断是否为文件夹 */
					 if($(this).parents('#listFileandCate').find('.reid').length!=0){
						 var cateid=$(this).parents('#listFileandCate').find('.reid').val();
						 admindeletecate(cateid);
					 }else{
						 var fileid=$(this).parents('#listFileandCate').find('.refileid').val();
						 admindeletefile(fileid); 
					 }
				 }else{ 
				  return false; 
				 } 
		});
	 
	 /* 删除文件 */
	 function deletefile(fileid){
		 $.ajax({
				url : "${pageContext.request.contextPath}/deleteFile?file_id="+fileid,
				dataType : 'json',
				success : function(data) {
				 showchild(categorie,recycle);

				
				},
				error : function() {
					alert("删除文件失败！");
				}
			});
	 }
	 /* 删除文件夹 */
	 function deletecate(cateid){
		 $.ajax({
				url : "${pageContext.request.contextPath}/deleteCate?categorieID="+cateid,
				dataType : 'json',
				success : function(data) {
				showchild(categorie,recycle);
				},
				error : function() {
					alert("删除文件夹失败！");
				}
			});
	 }
	 
	 /* 后台回收站删除文件 */
	 function admindeletefile(fileid){
		 $.ajax({
				url : "${pageContext.request.contextPath}/deleteFile?file_id="+fileid,
				dataType : 'json',
				success : function(data) {
				 july_recycle();
				},
				error : function() {
				alert("删除文件失败！");
				}
			});
	 }
	 /* 删除文件夹 */
	 function admindeletecate(cateid){
		 $.ajax({
				url : "${pageContext.request.contextPath}/deleteCate?categorieID="+cateid,
				dataType : 'json',
				success : function(data) {

				july_recycle();
				
				},
				error : function() {
					alert("删除文件夹失败！");
				}
			});
	 }
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 /*  出现还原，删除选项 */
	 $('#recycletbody').on('mouseenter','.listshare',function() {
			$(this).children().find('i').css('display','inline-block');
			$(this).children().find('i').css('cursor','pointer');
		});
	 $('#recycletbody').on('mouseleave','.listshare',function() {
			$(this).children().find('i').css('display','none');
		});
	</script>



</body>

</html>
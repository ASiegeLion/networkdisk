<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分享界面</title>
<link rel="Shortcut Icon" href="/networkdisk/img/julyicon.png">
<link href="/networkdisk/user/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/networkdisk/user/css/bootstrap-theme.min.css" />
<link href="/networkdisk/css/style.css" rel="stylesheet" />
<link href="/networkdisk/css/share.css" rel="stylesheet" />
<script src="/networkdisk/js/jquery-1.11.2.min.js"></script>
<script src="/networkdisk/user/js/bootstrap.min.js"></script>
<script src="/networkdisk/js/index.js"></script>
<script src="/networkdisk/js/jquery.rotate.min.js"></script>
</head>
<body>


	<div id="backmessage"></div>
	<div id="in-nav">
		<div class="logo">
			<a id="logo" href="/networkdisk/index.jsp"> <img
				src="/networkdisk/img/LOGO.png"
				style="position: absolute; top: 3px;" />
			</a>
		</div>
		<div class="container1">
			<div class="row1">
				<div class="span1" style="display: inline;">
					<ul class="pull-left">
						<li><a href="goindex">网盘</a></li>
						<li class="active"><a href="findAll">分享</a></li>
						<li><a href="more">更多</a></li>
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
												</a> <a href="">${sessionScope.user.name }</a> <img src="/networkdisk/img/VIP1.png" style="display: inline; margin-bottom: 5px;" />
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
								style="margin-top: 10px;" /></a></li>
						<li><a href="#"><img src="/networkdisk/img/serve.png"
								style="margin-top: 10px;" /></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="share_all">
		<div class="share_content">
			<div class="share_content_left">
				<div class="moud">
					<ul id="share_tab" class="tabs">
						<li class="active">
							<a href="#session_content" data-toggle="tab"> 
							<font size="3"><span class="glyphicon glyphicon-user"></span> 会话</font>
							</a>
						</li>
						<li>
							<a href="#user_content" data-toggle="tab"> 
							<font size="3"><span class="glyphicon glyphicon-comment"></span> 好友</font>
							</a>
						</li>
					</ul>
				</div>

				<div id="share_content" class="tab-content">
					<div class="tab-pane fade in active" id="session_content">
						<table class="session_table">
							<c:forEach items="${map.listfriends }" var="friend">
								<tr>
									<td><img
										src="${pageContext.request.contextPath}/showphoto?uid=${friend.id}"
										width="45px" /></td>
									<td class="uname">
										<p class="user-name service-name-newfriend">${friend.name }</p>
										<p class="last-time show-time"></p>
										<p class="new-session show-session"></p>
										<p class="new-num-session show-num"></p> <input type="hidden"
										value="${friend.id }" class="fid">
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="tab-pane fade" id="user_content">
						<a href="friend_info.jsp" target="share_iframe"></a>
						<table class="user_table" align="left">
							<tr>
								<td><img src='/networkdisk/img/service-icon.png'></td>
								<td>
									<p class="user-name service-name-newfriend">新好友</p>
									<p class="last-time show-time"></p>
									<p class="new-session show-session">暂时没有新好友喔！</p>
									<p class="new-num-session show-num"></p>
								</td>
							</tr>
							<c:forEach items="${map.listfriends }" var="friend">
								<tr>
									<td><img
										src="${pageContext.request.contextPath}/showphoto?uid=${friend.id}"
										width="45px" /></td>
									<td class="uname">${friend.name}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div class="session_bottom">
					<ul>
						<li><a href="#">创建群组</a></li>
						<li>|</li>
						<li><a href="#myModal" data-toggle="modal">添加好友</a></li>
						<li>|</li>
						<li><a href="#">设置</a></li>
					</ul>
				</div>
				<!--模态框代码-->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h5 class="modal-title" id="myModalLabel">添加好友</h5>
							</div>
							<div class="modal-body">
								<div class="modal-body_item" style="margin-bottom: 10px;">
									<p>
										<span>根据July账号添加好友</span>
									</p>
									<form>
										<input type="text" placeholder="  用户名/邮箱"
											onfocus="this.placeholder=''"
											onblur="this.placeholder='  用户名/邮箱'" name="name" class="b1"
											style="width: 410px; border-radius: 0px; height: 30px" /> <a
											class="bn">搜索</a>
									</form>
								</div>
								<div class="search_result" style="display: none;">
									<span>搜索结果：</span>
									<div class="result"></div>
								</div>
							</div>
							<div class="modal-footer" style="display: none">
								<input type="hidden" value="${sessionScope.user.id }"
									name="friend.uid" id="user-id"> <input type="hidden"
									value="" name="friend.fid" id="friend-id"> <a
									class="bn1">加为好友</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="share_content_right">
				<div class="all-main-content" style="height: 590px;">
					<div class="user-info-content" style="display: none;">
						<div class="user-info-mainbox"
							style="width: 100%; margin: 0px; position: static;">
							<div class="user-list-main friend-recom-list">
								<div class="list-main-title">新好友通知</div>
								<div class="list-main-content" style="height: 400px;">
									<c:forEach items="${map.listfriends }" var="friend">
										<dl class='user-module'>
											<dt>
												<img src='showphoto?uid=${friend.id}' width='45' height='45'>
											</dt>
											<dd>
												<p class='user-name'>${friend.name}</p>
												<p class='user-name user-name-desc'>已添加您为好友</p>
											</dd>
											<dd>
												<a class='shareFile'>分享文件</a> <a href="javascript:;"
													class="addFriend added">已添加</a>
											</dd>
										</dl>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<div class="user-info-content-2" style="display: none;">
					<div class="user-info-mainbox" style="width: 500px;">
						<div class="user-info-main">
							<div class="user-info-summary">
								<div class="userPhoto">
									<img id="headphoto" src="" title="" width="100px">
								</div>
								<div class="userName"></div>
							</div>
							<div class="user-info-detail clearfix">
								<div class="title">
									<p>备&nbsp;&nbsp;&nbsp;&nbsp;注：</p>
									<p>昵&nbsp;&nbsp;&nbsp;&nbsp;称：</p>
									<p>百度帐号：</p>
								</div>
								<div class="text">
									<p class="noText">
										<a href="javascript:;" title="点击添加备注">点击添加备注</a>
									</p>
									<p class="noText">--</p>
									<p class="userName"></p>
									<input type='hidden' value='${sessionScope.user.id }'
										class='UID'> <input type='hidden' value='' class='FID'>
								</div>
							</div>
							<div class="user-info-button">
								<a href="javascript:;" class="select-file" title="分享文件">分享文件</a>
								<a href="javascript:;" title="删除好友" class='delefri'>删除好友</a> <a
									href="javascript:;" title="加入黑名单">加入黑名单</a>
							</div>
						</div>
					</div>
				</div>				
				</div>
				<iframe class="iframe" name="share_iframe" src="goshare_default"
					scrolling="auto" height="590px" width="710" border="0"
					frameborder="no"></iframe>
			</div>
		</div>
	</div>


</body>
<script>
	/* 搜索好友 */
	var friendid;
	$(".bn").click(function() {
		var name = $(".b1").val();
			$.ajax({
					type : "POST", //设置请求发送的方式  
					url : "findOne", //提交的地址  		   
					data : {'user.name' : name},
					dataType : 'json',
					beforeSend : function() {},
					success : function(map) {//提交成功的时候执行的函数  
							friendid = null;
							var friend=map.friend;
							$(".search_result").show();
							$('.result').empty();
							if (friend!=null) {
								$('.result').html("<img src='${pageContext.request.contextPath}/showphoto?uid="
												+ friend.id
												+ "'width='50px'>"
												+ "<span style='margin-left:10px'>"
												+ "July账号："
												+ friend.name
												+ "</span><span class='live' style='font-size:12px;color:#da1111'></span>");//jquery解析map数据
								friendid = friend.id;
								$('.modal-footer').show();
								$('#friend-id').val(friendid);
							} else {
									$('.result').html("<a style='color: #c00;'>没有找到你搜索的用户，检查下输入的帐号吧</a>");//jquery解析map数据	
									$('.modal-footer').hide();
								}
							}
						});
					});
	$(function(){
		$('#myModal').modal('hide')
	});
	$(".bn1").click(function() {
		var uid = $("#user-id").val();
		var fid = $("#friend-id").val();
		if(uid==fid){
			$('.live').html("(自己)");
			return;
		}
		$.ajax({
				type : "POST", //设置请求发送的方式  
				url : "insertOne", //提交的地址  		   
				data : {'friend.uid':uid,'friend.fid':fid},
				async:false, 
				success : function(data) {//提交成功的时候执行的函数 
					if(data=='false'){
						$('.live').html("(已存在)")
					}else{
						window.location.href='findAll';
					}
				}	
			});
	});
	
	/* 删除好友 */
	$('.delefri').click(function(){
		var msg="确认删除？";
		if(confirm(msg)==true){
			var fid= $('.FID').val();
			var uid= $('.UID').val();
			$.ajax({  
	            url:"deleteOne?friend.uid="+uid+"&friend.fid="+fid,
	            dataType: 'json',
	            async: false,
	            success:function(){  
	               alert('删除成功');
	               window.location.href='findAll';
	            },  
	            error:function(){  
	                alert("删除失败");  
	            }  
	        });  
			
		}
	})
	
	/* 分享文件 */
	$('.select-file').click(function(){
		$('.iframe').hide();
		$('.all-main-content').show();
		$('.user-info-content-2').hide();
		$('.module-content-all').show();
	})
	$('.close').click(function() {
		$(".search_result").hide();
		$('.result').empty();
		$(".b1").val("");
	})
	function logout() {
		if (confirm("确定退出？")) {
			window.location.href = "logout";
		}
	}
	$('.user_table tr:first').click(function(){
		$(this).siblings('.active').removeClass();
		$(this).addClass("active");
		$('.iframe').hide();
		$('.all-main-content').show();
		$('.module-content-all').hide();
		$('.user-info-content-2').hide();
		$('.user-info-content').show();
	})
	$('.user_table tr:not(:first)').click(function(){
		$(this).siblings('.active').removeClass();
		$(this).addClass("active");
		$('.iframe').hide();
		$('.all-main-content').show();
		$('.user-info-content').hide();
		$('.module-content-all').hide();
		$('.user-info-content-2').show();		
		var name=$(this).find('.uname').text();
		var friend_id ;
		$.ajax({  
            url:"findOne?name="+name,
            dataType: 'json',
            async: false,
            success:function(map){  
               var friend = map.friend;
               friend_id = friend.id;
               $("#headphoto").attr("title",friend.name);
               $('.userName').html(friend.name);
               $('.FID').val(friend_id);
            },  
            error:function(){  
                alert("error");  
            }  
        });  
		$("#headphoto").attr("src","showphoto?uid="+friend_id);
	})
	$('#share_tab li').click(function(){
		$('.user_table').find('.active').removeClass();
		$('.iframe').show();
		$('.list-main-content').hide();
		$('.all-main-content').hide();
		$('.module-content-all').hide();
		$('.user-info-content-2').hide();
		$('.user-info-content').hide();		
	})
	$('#share_tab li:eq(1)').click(function(){	
		$('.list-main-content').show();
		showfriAdd();
	})
	function showfriAdd(){
		$.ajax({  
            url:"findadd",
            dataType: 'json',
            async: false,
            success:function(map){  
               var fri = map.frilist;
               var userlist = map.userlist;
               var date = (new Date()).toLocaleDateString();              
               var d = parseInt(date.substr(8,2));
               var y = parseInt(date.substr(0,4));
               var m = parseInt(date.substr(5,2));
               $('.show-session').html(userlist[0].name+"等加你为好友");
               if(fri.length>0){
            	   $('.user_table .new-num-session').show();
                   $('.user_table .new-num-session').html(fri.length);  
               }              
               for(var i=0;i<fri.length;i++){
            	   var str = fri[i].addtime.toString();
            	   var year = parseInt(str.substr(0,4));
            	   var mouth = parseInt(str.substr(5,2));
            	   var day = parseInt(str.substr(8,2));
            	   if(d == day && y == year && m == mouth){
            		   $(".show-time").html(str.substr(11));
            	   }else{
            		   $(".show-time").html(str.substr(5,5)+" "+str.substr(11,5));
            	   }
                   var $fri=$("<dl class='user-module'>"
							 + "<dt>"
							 + "<img src='showphoto?uid="
							 + userlist[i].id
							 + "'width='45' height='45'>" 
							 + "</dt><dd>"
							 + "<p class='user-name'>"
							 + userlist[i].name
							 + "</p>"
							 + "<input type='hidden' class='UID' value='"
							 + fri[i].uid
							 + "'>"
							 + "<input type='hidden' class='FID' value='"
							 + fri[i].fid
							 + "'>"
							 + "<p class='user-name user-name-desc'>已添加您为好友</p>"
							 + "</dd><dd>"
							 + "<a class='shareFile'>分享文件</a>"
							 + "<a class='addFriend'>加为好友</a>"
							 + "</dd></dl>");
					$('.list-main-content').append($fri);
               }
            },  
            error:function(){  
                alert("error");  
            }  
        });
	}
	$('.list-main-content').on('click','.addFriend',function(){
		var fid= $(this).parents('.user-module').find('.FID').val();
		var uid= $(this).parents('.user-module').find('.UID').val();
		$.ajax({  
            url:"addOne?friend.uid="+uid+"&friend.fid="+fid,
            dataType: 'json',
            async: false,
            success:function(data){  
            	if(data=='false'){
            		alert('好友已存在')
            	}else{
            		 alert('添加成功');
                     window.location.href='findAll';                    
            	}           	              
            },  
            error:function(){  
                alert("添加失败");  
            }  
        });  
	})
</script>



<script type="text/javascript">
	var ws = new WebSocket("ws://127.0.0.1:8085"); 
	var uid = null;
	var friid = null;
	var content = null;
	var fid = new Array();
	var fidlist = new Array();
	var n = 0;
	$(document).ready(function(){
		$("input[class='fid']").each(function(key,value){
    		fid[key] = $(this).val();
		});
    	fidlist = fid.toString().split(",");
			 $.ajax({  
		            url:"getmessage?filecateid="+fid,
		            dataType: 'json',
		            async: false,
		            success:function(map){
		            	var meslist = map.meslist;
		            	for(var i=0;i<meslist.length;i++){
		            		$("input[class='fid']").each(function(){
			            		if($(this).val() == meslist[i].friendid){
			            			$(this).prev('.new-num-session').show();
			            			$(this).prev('.new-num-session').html(meslist[i].id);
			            		}
			            	});
		            	}
		            },  
		            error:function(){  
		                alert("error");  
		            }  
		        });  
		
		
		ws.onopen = function(){
			uid = $('#user-id').val();
			var str = "{\"userid\":\""+uid+"\",\"type\":\"1\"}";
			ws.send(str);
		}/* 当websocket创建成功时，即会触发onopen事件  */
		
		
		
		ws.onmessage = function(evt)//当客户端收到服务端发来的消息时，会触发onmessage事件，参数evt.data中包含server传输过来的数据
		{ 
			
			if(evt.data == "0"){
				$.ajax({  
		            url:"addmessage?uid="+friid+"&str="+content,
		            dataType: 'json',
		            async: false,
		            success:function(){  
		            	
		            },  
		            error:function(){  
		                alert("error");  
		            }  
		    	});
			
			}else{
				n++;
				var str = evt.data.toString();
				var s = new Array();
				s[0] = str.substr(str.length-36);
				s[1] = str.substr(0,str.length-38);
				
				
				var $leftstr = $("<li class='list other'>"
						+ "<div class='head-arrow'>"
						+ "<span class='head'>"
						+ "<img src='showphoto?uid="
						+ s[0]
						+"'></span>"
						+ "<span class='arrow'>"
						+ "<em class='left'></em></span></div>"
						+ "<div class='content'>"
						+ "<div class='text'>"
						+ s[1]
						+"</div>"
						+ "</div></li>"
				)
				$("input[class='fid']").each(function(){
	            		if($(this).val() == s[0]){
	            			$(this).prev('.new-num-session').show();
	            			$(this).prev('.new-num-session').html(n);
	            		}
	            });
				
				$('.module-content-all').each(function(){
					if($(this).find('.content-line').val() == s[0]){
						$(this).find(".personals").append($leftstr);
					}else{
						$(this).hide();
					}
			});						
			}
		}
		var trnum=$(".session_table tr").length;
		var ffid=[];
		$(document).ready(function(){			
			for(var i=0;i<trnum;i++){
				ffid[i]=$(".session_table tr:eq("+i+")").find(".fid").val();
				var $boxstr=$("<div class='module-content-all' style='display: none;'>"
						+"<div class='header header-show'>"
						+"<div class='user-name-box'>"	
						+"<span class='name' title=''></span></div>"
						+"</div><div class='all-main-content'>"
						+"<div class='main-content'><div class='module-conversation'><div class='all-content'><ul class='personals p-"				
						+i
						+"'>"
						+"<input type='hidden' class='content-line' value='"
						+ffid[i]
						+"'>"
						+"</ul></div>"
						+"<div class='send-message'>"
						+"<div class='select-file'>分享文件</div>"
						+"<div class='message'>"
						+"<textarea placeholder='输入文字消息' class='messageInput'></textarea>"
						+"<a href='javascript:void(0)' class='icon-smile'></a>"	
						+"<span class='send-button'>发送</span></div>"	 
						+"<div class='message-text'></div>"	
						+"<div class='message-text-size'></div></div>");
				$('.all-main-content').append($boxstr);
			}	
		})	
		var index;
		$('.session_table tr').click(function(){
			
			n=0;
			index=$('.session_table tr').index(this);
			friid = $(this).children('.uname').children('input').val();
			$(this).siblings('.active').removeClass();
			$(this).addClass("active");
			$('.iframe').hide();
			$('.all-main-content').show();			
			$('.user-info-content-2').hide();
			$('.name').html($(this).find('.user-name').text());
			$('.module-content-all').each(function(){
				if($(this).find('.content-line').val()==friid){
					$(this).show();
				}else{
					$(this).hide();
				}
			});						
			$(this).find('.new-num-session').hide();
			$.ajax({  
	            url:"getcontent?filecateid="+friid,
	            dataType: 'json',
	            async: false,
	            success:function(map){  
	            	var meslist = map.meslist;
	            	for(var i=0;i<meslist.length;i++){
	            		var $leftstr = $("<li class='list other'>"
	    						+ "<div class='head-arrow'>"
	    						+ "<span class='head'>"
	    						+ "<img src='showphoto?uid="
	    						+ friid
	    						+"'></span>"
	    						+ "<span class='arrow'>"
	    						+ "<em class='left'></em></span></div>"
	    						+ "<div class='content'>"
	    						+ "<div class='text'>"
	    						+ meslist[i].content
	    						+"</div>"
	    						+ "</div></li>"
	    				)
	    				$('.module-content-all').each(function(){
							if($(this).find('.content-line').val()==friid && friid==meslist[i].userid){
								$(this).show();
								$(this).find(".personals").append($leftstr);
							}else{
								$(this).hide();
							}
						});	
	            	}
	            	
	            },  
	            error:function(){  
	                alert("error");  
	            }  
	        });
		});
		
		$('.all-main-content').on('click','.send-button',function(){
			n=0;
			var uid = $('#user-id').val();
			content = $(this).parents('.message').find('.messageInput').val();
			if(content != ""){
				var str = "{\"userid\":\" "+uid+"\",\"friendid\":\" "+friid+" \",\"content\":\" "+content+" \",\"type\":\"0\"}";
				ws.send(str);
				$('.messageInput').val("");				
				var $rightstr = $("<li class='list me'>"
					+ "<div class='head-arrow'>"
					+ "<span class='head'>"
					+ "<img src='showphoto?uid="
					+ uid
					+"'></span>"
					+ "<span class='arrow'>"
					+ "<em class='right'></em></span></div>"
					+ "<div class='content'>"
					+ "<div class='text'>"
					+ content
					+"</div>"
					+ "</div></li>"
				)
				$(".p-"+index).append($rightstr);
			}else{
				alert("null");
			}
			
		});
		
	}); 
</script>


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
		$('.all-main-content').hide();
		$('.iframe').show();
      });
      </script>		
</html>
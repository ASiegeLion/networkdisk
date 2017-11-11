<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>找回密码</title>
<link rel="Shortcut Icon" href="/networkdisk/img/julyicon.png">
<link href="/networkdisk/user/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/networkdisk/user/css/bootstrap-theme.min.css" />
<link rel="stylesheet"
	href="/networkdisk/font-awesome-4.7.0/css/font-awesome.min.css">
<link href="/networkdisk/css/getpass.css" rel="stylesheet">
<link href="/networkdisk/css/component.css" rel="stylesheet" />
<script src="/networkdisk/js/jquery-1.11.2.min.js"></script>
<script src="/networkdisk/js/classie.js"></script>
<script src="/networkdisk/js/modalEffects.js"></script>
</head>
<body>

	<div id="overlay" class="overlay"></div>
	<div class="container2">
		<div class="container">
			<img src="/networkdisk/img/LOGO.png" /><span>丨账号设置</span>
			<div class="login" style="text-align: right; font-size: 14px;">
				<a href="#" class="load">登录</a><a href="register.jsp" class='reg'>注册</a>
			</div>
			
		</div>
		<div id="content">
			<div class="mod-forgot">
				<ul class="mod-sub-nav">
					<li class="mod-sub-list1 list1-active">确认帐号</li>
					<li class="mod-sub-list2">安全验证</li>
					<li class="mod-sub-list3">重置密码</li>
				</ul>
				<div class="mod-step-detail" id='step1'>
					<p class="step-email-info">请填写您需要找回的帐号</p>
					<div class="pass-input-container clearfix" id="pass-auth-select">
						<input type="text" class="pass-input pass-input-forgot"
							name="username" value="" id="account"> <label
							class="pass-input-label input-label-new1 w260"
							style="display: block;">请您输入注册邮箱</label>
						<div id="userName_clearBtn">
							<span class="fix-clear userName-clearbtn"></span>
						</div>
						<span class="pass-input-msg">请您输入注册邮箱</span>
					</div>
					<div class="pass-input-container vcode-container clearfix">
						<input type="text"
							class="pass-input pass-input-forgot vcode-input vcode-input-width"
							name="veritycode" value="" id="veritycode"> <label
							class="pass-input-label input-label-new1 vcode-label">请输入验证码</label>
						<div class="vcode-img vcode-img-big" id="v_container"
							title="验证码图片"></div>
						<span class="pass-input-msg">请您输入验证码</span>
					</div>
					<div>
						<a class="pass-button-submit" id="submit">下一步 </a>
					</div>
				</div>
				
				<script src="/networkdisk/js/gVerify.js"></script>
				
				<script type="text/javascript">
				    var email;
					var verifyCode = new GVerify("v_container");
					document.getElementById("submit").onclick = function() {
						var res = verifyCode
								.validate(document.getElementById("veritycode").value);
						var em = $("#account").val();
							if (res) {
								$.ajax({  
						            url:"getUserByEm?email="+em,
						            dataType: 'json',
						            async: false,
						            success:function(map){  
						               if(map.user == null){
						            	   alert("用户名不存在！"); 
						               }else{
						            	   var user = map.user;
						            	   $('.mod-sub-nav').find('li:eq(0)').removeClass('list1-active');
							       		   $('.mod-sub-nav').find('li:eq(1)').addClass('list2-active');
							       		   $('#step1').hide();
							       		   $('#step2').show();
							       		   $("#em").append(user.email);
							       		   $("#uname").append("您正在找回的帐号是："+user.name);
							       		   $("#email").val(user.email);
							       		   $("#uid").val(user.id);
							       		   email = user.email;
						               }
						            },  
						            error:function(){  
						                alert("用户名不存在！");  
						            }  
						        });  
							} else {
								$(".vcode-input-width").val("").focus();
							}
						
					}
				</script>
				<input type="hidden" value="" id="email">
				<div class="mod-step-detail" id='step2'style="display: none; position: relative;">
					<div class="forgot-auth-container">
						<p class="step-form-info">为了你的帐号安全，请完成身份验证</p>
						<div class="forgot-auth-type m-t10" id="mobile-auth">
							<div class="forgot-auth-title">邮箱验证</div>
							<div class="form-2-item clearfix pass-input-container">
								<label class="form-2-label">邮箱号：</label>
								<div class="form-2-content line-32" id="em"></div>
							</div>
							<p class="verify-method">验证码：</p>
							<div class="form-2-item clearfix">
								<div
									class="form-2-content pass-input-container vcode-container m-b-mobile">
									<input type="text"
										class="pass-input vcode-input pass-input-new"
										name="mobileVcode" value="" id="pass-input-mobileVcode">
									<label class="pass-input-label input-label-new1"
										style="width: 210px">邮箱验证码</label>
									<input class="pass-button-timer" id="pass-button-new1"  onclick="settime(this)" value='发送验证码'>
									<span class="pass-input-stip" id="forgot-mobileVcode-success"></span>
									<div class="clear"></div>
									<span class="pass-input-msg" id="forgot-mobileVcode-tip"
										style="position: absolute; top: 40px; left: -10px;">请填写验证码</span>
								</div>
							</div>
							<div style="margin-top: 10px;">
								<a class="pass-button-submit" id="submit2" style="width: 350px" onclick="chackCode()">下一步
								</a>
							</div>
						</div>
					</div>
				</div>
				
				<script type="text/javascript">
					var countdown=60; 
					function settime(obj) { 
						if(countdown == 60){
								    var email = $("#email").val();
								    if(email ==""){
								    	alert("请填写邮箱！")
								    	return;
								    }
							        $.ajax({  
							            url:"${pageContext.request.contextPath}/sendEmail",  
							            dataType: 'json',  
							            data:{"email":email},
							            success:function(data){ 
							            	if(data == true)
							            	alert("发送成功，请到邮箱查看验证码！");
							            	if(data == false)
							            	alert("发送失败！");
							             },  
							            error:function(){  
							                alert("发送失败！");  
							            }  
									}); 
						}if (countdown == 0) { 
					        obj.removeAttribute("disabled");    
					        $("#pass-button-new1").val("获取验证码"); 
					        countdown = 60; 
					        return;
					    } else { 
					        obj.setAttribute("disabled", true); 
					       /*  obj.val("重新发送(" + countdown + ")");  */
					        $("#pass-button-new1").val("重新发送(" + countdown + ")");
					        countdown--; 
					        setTimeout(function() { 
							    settime(obj)
							    }
							    ,1000) 
							}
					    } 
					
					function chackCode(){
						/* $('.mod-sub-nav').find('li:eq(1)').removeClass('list2-active');
						$('.mod-sub-nav').find('li:eq(2)').addClass('list3-active');
						$('#step2').hide();
						$('#step3').show(); */
						  var code = $("#pass-input-mobileVcode").val();
						 $.ajax({  
							 	url: "checkVCode?code="+code,       //后台处理程序
					            type: "post",               		//数据发送方式
					            dataType: "json",           		//接受数据格式   
					            success:function(data){ 
					            	if(data == true){
						            	$('.mod-sub-nav').find('li:eq(1)').removeClass('list2-active');
						    			$('.mod-sub-nav').find('li:eq(2)').addClass('list3-active');
						    			$('#step2').hide();
						    			$('#step3').show();
					            	}else{
					            		$('#forgot-mobileVcode-tip').html('验证码不正确！');
					            		$('#pass-input-mobileVcode').css('border-color', '#da1111');
					            		$('.m-b-mobile').find('.pass-input-msg').css('display','block');
					            	}
					             },  
					            error:function(){  
					                alert("验证码不正确！");  
					            }  
							}); 
					}
				</script>
				
				<input type="hidden" id="uid" value=""  >
				<div class="mod-step-detail" id='step3' style="display: none; position: relative;">
					<p class="step-form-tip m_l80" id="uname"></p>
						<div class="pass-input-container clearfix">
							<label class="pass-input-title l-h40" for="password">新密码</label>
							<input type="password" class="pass-input pass-input-forgot left pass-input-error"
								name="password" id="password" value="">
							<span class="pass-input-msg l-h40">请您填写密码</span>
						</div>
						<div class="pass-input-container clearfix">
							<label class="pass-input-title l-h40" for="repassword">确认新密码</label>
							<input type="password" class="pass-input pass-input-forgot left"
								name="verifypwd" id="verifypwd" value="">
							<span class="pass-input-msg l-h40"></span>
						</div>
						<div class="m_l80">
							<a class="pass-button-submit" id="submit3">确定</a>
						</div>
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
			$("#submit3").click(function(){
				var pwd = $("#password").val();
				var uid = $("#uid").val();
				$.ajax({  
				 	url: "updatepwd?passWord="+pwd+"&uid="+uid,       //后台处理程序
		            type: "post",               		//数据发送方式
		            dataType: "json",           		//接受数据格式   
		            success:function(data){ 
		            	alert("修改成功，返回登陆！");
		            	location.href="login.jsp";
		             },  
		            error:function(){  
		                alert("error");  
		            }  
				}); 
			});
		</script>
		
		<div class="md-modal md-effect-10" id="modal-10" style="width: 440px;">
			<div class="md-content" style="height: 310px;">
				<div class="dialog-header dialog-drag"
					style="height: 40px; line-height: 35px; background: #77afff; color: #fff; font-size: 20px; padding: 5px;">
					<img src="/networkdisk/img/julyicon.png" width="30px"
						style="position: relative; margin-bottom: 10px; margin-right: 5px;"><span
						class="dialog-header-title"
						style="display: inline; position: relative; bottom: 0px;">登录July账号</span>
				</div>
				<div class="dialog-tree"
					style="border: none; height: 245px; overflow: hidden;">
					<form action="" method="post" id="login_form">
						<div class="logininput">
							<input type="text" name="username" class="loginusername"
								value="用户名" onBlur="this.value='用户名';" onFocus="this.value='';" />
							<input type="text" class="userpassword" value="密码"
								onBlur="this.value='密码';" onFocus="this.value='';" />
						</div>
						<div class="loginbtn">
							<div class="loginsubmit fl">
								<input type="submit" value="登录" />
							</div>
							<div class="quxiao cancel">
								<span>取消</span>
							</div>
							<div class="logcheckbox" style='margin-top: -20px;'>
								<input id="bcdl" type="checkbox" checked="true" /> 保持登录 
								<a href="#" style="float: right; text-decoration: none; color: #979696;">忘记密码?</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="md-modal md-effect-13" id="modal-13" style="width: 910px;">
			<div class="md-content" style="height: 610px;">
				<div class="dialog-header dialog-drag" style="height: 40px; line-height: 35px; background: #77afff; color: #fff; font-size: 20px; padding: 5px;">
					<span class="fa fa-times" style="float:right;bottom:3px; margin-right: 5px;"></span>
				</div>
				<div class="dialog-tree" style="border: none; height: 245px;">
				11
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		/**
		 * 显示遮罩层
		 */

		function showOverlay() {
			// 遮罩层宽高分别为页面内容的宽高
			$('.overlay').css({
				'height' : $(window).height(),
				'width' : $(window).width()
			});
			$('.overlay').show();
		}
		$('body').on('click', '.load', function() {
			showOverlay();
			$('.md-effect-10').addClass('md-show');
		});
		$('body').on('click', '.model', function() {
			showOverlay();
			$('.md-effect-13').addClass('md-show');
		});
		$('.fa-times').click(function() {
			$('.overlay').hide();
			$('.md-effect-13').removeClass('md-show');
		});
		$('.cancel').click(function() {
			$('.overlay').hide();
			$('.md-effect-10').removeClass('md-show');
		});
		$("#login").click(function() {
			var name = $("#name").val();
			var passWord = $("#passWord").val();
			$.ajax({
				url : "sharelogin?name=" + name + "&passWord=" + passWord,
				dataType : 'json',
				async : false,
				success : function(map) {
					var user = map.user;
					$("#modal-10").hide();
					$(".login").hide();
					$(".username").append(user.name);
					$("#username").append(user.name);
					$(".photo").attr("src", "sharephoto?uid=" + user.id);
					$(".sev").show();
				},
				error : function() {
					alert("登陆失败！");

				}
			});
		});
		$('.w260').click(function() {
			$('#account').css('z-index', '2');
			$(this).css('z-index', '1');
			$("#account").focus();
			$('#account').css('border-color', 'rgb(55, 123, 203)');
		});
		$('#account').bind('input propertychange', function() {
			$('.w260').css('display', 'none');
		});
		$('#userName_clearBtn').click(function() {
			$("#account").val("").focus();
		})
		$('#account').blur(
				function() {
					if ($('#account').val().length == 0) {
						$(this).css('border-color', '#da1111');
						$('#pass-auth-select').find('.pass-input-msg').css(
								'display', 'block');
					} else {
						$(this).css('border-color', '#ddd');
						$('#pass-auth-select').find('.pass-input-msg').css(
								'display', 'none');
					}
				});
		$('.vcode-label').click(function() {
			$('.vcode-input-width').css('z-index', '2');
			$(this).css('z-index', '1');
			$(".vcode-input-width").focus();
			$('.vcode-input-width').css('border-color', 'rgb(55, 123, 203)');
		});
		$('.vcode-input-width').bind('input propertychange', function() {
			$('.vcode-label').css('display', 'none');
		});
		$('.vcode-input-width').blur(
				function() {
					if ($('.vcode-input-width').val().length == 0) {
						$(this).css('border-color', '#da1111');
						$(this).parents('.clearfix').find('.pass-input-msg')
								.css('display', 'block');
					} else {
						$(this).css('border-color', '#ddd');
						$(this).parents('.clearfix').find('.pass-input-msg')
								.css('display', 'none');
					}
				});
		$('.input-label-new1').click(
				function() {
					$('#pass-input-mobileVcode').css('z-index', '2');
					$(this).css('z-index', '1');
					$("#pass-input-mobileVcode").focus();
					$('#pass-input-mobileVcode').css('border-color',
							'rgb(55, 123, 203)');
				});
		$('#pass-input-mobileVcode').bind('input propertychange', function() {
			$('.input-label-new1').css('display', 'none');
		});
		$('#pass-input-mobileVcode').focus(function() {
			$(this).css('border-color', '#ddd');
			$('.m-b-mobile').find('.pass-input-msg').css('display','none');
		});
		$('#pass-input-mobileVcode').blur(function() {
					if ($('#pass-input-mobileVcode').val().length == 0) {
						$(this).css('border-color', '#da1111');
						$('.m-b-mobile').find('.pass-input-msg').css('display','block');
					} else {
						$(this).css('border-color', '#ddd');
						$('.m-b-mobile').find('.pass-input-msg').css('display','none');
					}
				});
		var password;
		$('#password').focus(function(){
			$(this).css('border-color', 'rgb(55, 123, 203)');
			$(this).next('.pass-input-msg').css('display','none');
		})
		$('#password').blur(function(){
			if ($('#password').val().length == 0) {
				$(this).css('border-color', '#da1111');
				$(this).next('.pass-input-msg').css('display','block');	
			}else{
				password=$(this).val();
				$(this).css('border-color', '#ddd');
				$(this).next('.pass-input-msg').css('display','none');
			}
		})
		$('#verifypwd').focus(function(){
			$(this).css('border-color', 'rgb(55, 123, 203)');
			$(this).next('.pass-input-msg').css('display','none');
		})
		$('#verifypwd').blur(function(){
			if ($('#verifypwd').val().length == 0) {
				$(this).css('border-color', '#da1111');
				$(this).next('.pass-input-msg').css('display','block');
				$(this).next('.pass-input-msg').html("请您输入确认密码");	
			}else{
				if($(this).val()!=password){
					$(this).css('border-color', '#da1111');
					$(this).next('.pass-input-msg').css('display','block');
					$(this).next('.pass-input-msg').html("您输入的密码与确认密码不一致")
				}else{
					$(this).css('border-color', '#ddd');
					$(this).next('.pass-input-msg').css('display','none');	
				}			
			}
		});
	</script>
	
	
	
</body>

</html>
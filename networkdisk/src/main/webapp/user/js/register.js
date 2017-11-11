
$(document).ready(function(){
				 $("#registerForm").validate({
					  rules: {
					    	name: {
					        required: true,
					        stringCheck:true,
					        byteRangeLength:[3,15],
					        remote: {
					            url: "checkUserName",     //后台处理程序
					            type: "post",               //数据发送方式
					            dataType: "json",           //接受数据格式   
					            data: {                     //要传递的数据
					                name: function() {
					                    return $("#username").val();
					                }
					            }
					        }
					        
					      },
					      trueName: {
						        required: true,
						        isChar:true,
						        stringMaxLength:8,
						        
						      },
					     sex:"required",
					      phone: {
						       required: true,
						       isMobile:true,
						     
						        remote: {
						            url: "checkPhone",     
						            type: "post",              
						            dataType: "json",              
						            data: {                     
						            	phone: function() {
						                    return $("#telphone").val();
						                }
						            }
						        }

						      },
					      passWord: {
					        required: true,
					        isPwd:true,
					        passwordLength:[6,12]
					       
					      },
					      repassword: {
						        required: true,
						        isPwd:true,
						        passwordLength:[6,12],
						        equalTo:"#password"
						      },
					      code: {
					        required: true,
					        remote: {
					            url: "checkVCode",     //后台处理程序
					            type: "post",               //数据发送方式
					            dataType: "json",           //接受数据格式   
					            data: {                     //要传递的数据
					                name: function() {
					                    return $("#code").val();
					                }
					            }
					        }
					       
					      },
					      email: {
					        required: true,
					         email: true,
					        remote: {
					            url: "checkEmail",     
					            type: "post",              
					            dataType: "json",              
					            data: {                     
					            	email: function() {
					                    return $("#email").val();
					                }
					            }
					        }
					      },
					      agree: "required"
					    },
					  
					    messages: {
					      name: {
					    	  remote: "用户名已存在",
					        required: "请输入用户名",
					      
					        
					      },
					      trueName: {
						        required: "请填写真实姓名",
						        rangelength: "姓名为2-4个中文"
						      },
					      passWord: {
					        required: "请输入密码",
					       
					      },
					      repassword: {
						        required: "请输入密码",
						        equalTo:"两次密码不一致"
						      },
					      code: {
					    	    remote: "验证码错误",
						        required: "请输入验证码",
						      },
					      phone:{
					    	remote: "手机号已注册",
					        required: "请输入手机号",
					      
  
					      },
					     
					      email:{
					    	    remote: "邮箱已注册",
						        required: "请输入邮箱",
						        email: "请输入一个正确的邮箱"
						      },
					      agree: "请接受协议",
					      sex: "请选择性别",
						      						      
					    }
					});			

});

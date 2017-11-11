$(document).ready(function() {
				$("#img").css("outline","none");
				$(".text").css("outline","none");
				$("#t1").focus(function(){
					$(".text").css("background","");
					$("#t1").css("background","lavender");
				});
				$("#t2").focus(function(){
					$(".text").css("background","");
					$("#t2").css("background","lavender");
				});
				$(".text").blur(function(){
					$(".text").css("background","");
				});
				/*判断为空*/
				$("#img").click(function(){
					
					var u = $("#t1").val();
					var p = $("#t2").val();
					var flag = true;
					if(u == "")
					{
						$(".hint").remove();
						$("#d1").append("<span style='color: red;font-size: 12px;margin-left: 100px;' class='hint'>username is empty</span>");
						if(p == "")
						{
						$("#d2").append("<span style='color: red;font-size: 12px;margin-left: 100px;' class='hint'>password is empty</span>");
						}
						flag = false;
					}else if(p == "")
					{
						$(".hint").remove();
						$("#d2").append("<span style='color: red;font-size: 12px;margin-left: 100px;' class='hint'>password is empty</span>");
						flag = false;
					}
					return flag;
				});
			});
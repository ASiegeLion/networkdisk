$(document).ready(function() {
	//子导航展开收缩
	$(".admin").mouseenter(function() {
		$(this).find(".c").removeClass("lbaxztop2").addClass("lbaxztop");
		$(this).next(".user").toggle().parents(".sev").siblings().find(".user").hide();
	});

	/*鼠标离开下拉框关闭*/
	$(".sev").mouseleave(function() {
		$(".user").hide();
		$(this).children(".admin").find(".c").addClass("lbaxztop2");
	});

	$(".g_1").mouseenter(function() {
		$(this).next(".equi").toggle().parents(".equip").siblings().find(".equi").hide();
	});
	$(".equip").mouseleave(function() {
		$(".equi").hide();
	});
	$(".list").mouseenter(function() {
		$(this).next(".listpal").toggle().parents(".ch").siblings().find(".listpal").hide();
	});
	$(".lp").mouseleave(function() {
		$(".listpal").hide();
	});
	$('.listpal li').click(function() {
		$(this).siblings().find('.active').removeClass();
		$(this).children('img').addClass("active");
	});
	var j = true;
	$('.choose-value').click(function(){
		if(j){
			$('.choose-list').css('display','block');
			j=false;
		}else{
			$('.choose-list').css('display','none');
			j = true;
		}
		
	})
	$('.choose-list li').click(function() {
		$(this).siblings('.choose-checked').removeClass();
		$(this).addClass('choose-checked');		
		$('#datetype').html($(this).text());
	});

	var toggle = true;
	$(".large").click(function() {
		if(toggle) {
			$(this).children("img").attr("src", "/networkdisk/img/row.png");
			toggle = false;
		} else {
			$(this).children("img").attr("src", "/networkdisk/img/other.png");
			toggle = true;
		}
	});
	/*全选反选*/
	$(".chk_1").click(function() {
		if(this.checked) {
			$("#tw1 .table :checkbox").prop("checked", true);
			$("#n1").html("已选中" + $("#tw1 .table tr").length + "个文件/文件夹");
			$('#g_button').css('display', 'none');
			$('.equip_1').css('display', 'block');
			$('.Qdh').find('li').nextAll('li').hide();
		} else {
			$("#tw1 .table :checkbox").prop("checked", false);
			$("#n1").html("文件夹");
			$('#g_button').css('display', 'block');
			$('.equip_1').css('display', 'none');
			$('.Qdh').find('li').nextAll('li').show();
		}
	});
	$('table').on('click','.chk_2',function() {
		 var num=$('#mytbody input:checked').length;
		 if(num>0&&num<$('#mytbody input:checkbox').length){
			 var msg="已选中"+num+"个文件/文件夹";
			 $('.Qdh').find('span').html(msg);
			 $('#g_button').css('display', 'none');
			 $('.equip_1').css('display', 'block');
			 $('.Qdh').find('li').nextAll('li').hide(); 
		 }else if(num==$('#mytbody input:checkbox').length){
			 $('.chk_1').prop('checked',true);
			 var msg="已选中"+num+"个文件/文件夹";
			 $('#g_button').css('display', 'none');
			 $('.equip_1').css('display', 'block');
			 $('.Qdh').find('span').html(msg);					 					 
		 }else{
			 $('.chk_1').attr('checked',false);
			 $('.Qdh').find('span').html('文件夹');
			 $('.equip_1').css('display', 'none');
			 $('#g_button').css('display', 'block');
			 $('.Qdh').find('li').nextAll('li').show();
		 }		
	});

	/*reception界面全选反选*/
	$(".ck1").click(function() {
		if(this.checked) {
			$("#qdh :checkbox").prop("checked", true);
			$("#n1").html("已选中" + $('#qdh input:checkbox').length + "个文件/文件夹");
		} else {
			$("#qdh :checkbox").prop("checked", false);
			$("#n1").html("文件夹");
		}
	});
	$('#qdh').on('click','input:checkbox',function() {
		 var num=$('#qdh input:checked').length;
		 if(num>0&&num<$('#qdh input:checked').length){
			 var msg="已选中"+num+"个文件/文件夹";
			 $('.Qdh').find('#n1').html(msg);
		 }else if(num==$('#qdh input:checked').length){
			 $('.chk_1').prop('checked',true);
			 var msg="已选中"+num+"个文件/文件夹";
			 $('.Qdh').find('#n1').html(msg);					 					 
		 }else{
			 $('.chk_1').attr('checked',false);
			 $('.Qdh').find('#n1').html('文件夹');
		 }		
	});
	/*批量把文件和文件夹放入回收站*/
	$('#f3').click(function() {
		var btns= [];
		var cateids=[];
		var fileids=[];
		var k=0;
		var j=0;
		var i=0;
		$('#mytbody input:checked').each(function(){ 
			 btns[i]=$(this).next().next('input').val();
			 if($(this).next().next('input').hasClass('reid')){	
				 cateids[j++]=btns[i++];
			 }else{
				 fileids[k++] = btns[i++];
			 }
		})
		 $.ajax({
				url : "${pageContext.request.contextPath}/batchdeletefileandcate?filelist="+fileids+"&catelist="+cateids,
				dataType : 'json',
				success : function(data) {
					showchild(categorie,recycle);
					var num=$('#mytbody input:checked').length;
					if(num>0&&num<$('#mytbody input:checkbox').length){
						 var msg="已选中"+num+"个文件/文件夹";
						 $('.Qdh').find('span').html(msg);
						 $('#g_button').css('display', 'none');
						 $('.equip_1').css('display', 'block');
						 $('.Qdh').find('li').nextAll('li').hide(); 
					 }else{
						 $('.chk_1').attr('checked',false);
						 $('.Qdh').find('span').html('文件夹');
						 $('.equip_1').css('display', 'none');
						 $('.Qdh').find('li').nextAll('li').show();
					 }
				},
				error : function() {
					alert("删除失败！");
				}
			});
		
		
	})
	$("#tabs a").click(function() {
		$(this).tab('show');
	});
	$(".tab a").click(function() {
		$(this).tab('show');
	});

	$('.timelin_content img').mouseenter(function() {
				$(this).prev('span').css('display', 'inline-block');
			});
			$('.timelin_content img').mouseout(function() {
				$(this).prev('span').css('display', 'none');
			});
			value2 = 0;
			$('.timeline_day1').rotate({
				bind: {
					click: function() {
						value2 += 180;
						$('#down').rotate({
							animateTo: value2
						});
						if(value2 % 360 == 0) {
							$('.timelin_content').css('display', 'block');
						} else {
							$('.timelin_content').css('display', 'none');
						}
					}
				}
			});
			$("#chall").click(function() {
				if(this.checked) {
					$(".timelin_content").find('span').css('display', 'inline-block');
					$("#c1").html("已选中" + $(".timelin_content").children('span').length + "张图片");
					$('.donetimeline').css('display', 'block');
				} else {
					$(".timelin_content").find('span').css('display', 'none');
					$("#c1").html("已选中0张图片");
					$('.donetimeline').css('display', 'none');
				}
			});
			$('.table').on('mouseenter','tr',function() {
				$(this).css('background','rgba(220, 200, 200, 0.4)');
				$(this).children().find('.more').css('display', 'inline-block');
				
			});
			$('.table').on('mouseleave','tr',function() {
				$(this).css('background','none');
				$(this).children().find('.more').css('display', 'none');
			});

			var i = true;
			$('.fa-window-maximize').click(function() {
				if(i) {
					$('#msg').css('bottom', '-300px');
					i = false;
				} else {
					$('#msg').css('bottom', '0px');
					i = true;
				}
			});
			$('#mydownload').click(function(){
				$('#msg').show();
			});
			$('#msg .fa-times').click(function() {
				$(this).parent('div').hide();
			});
			
			$("#newonefile").click(function() {
					$('.table').find('.july_fileName').addClass('off');
					$('.table').find('.july_cateName').addClass('off');
					if($('.sure').length==0){
						//创建tr节点
						var $tr = $("<tr></tr>");
						//遍历获取输入的内容
						var $td = $("<td><input type='checkbox' id='checkbox_a1'/><img src='/networkdisk/img/category.png' width='28px' style='margin:0 5px 5px 10px;'><input type='text' value='新建文件夹' class='filename'><i class='fa fa-check sure'></i><i class='fa fa-times dele'></td><td>-</td><td class='t3'></td>");
						//将内容循环添加到创建好的TD中
						$td.appendTo($tr);
						$tr.prependTo("#tw1 .table tbody");
						$('.filename').select();
						$('.nullfile').hide();
						//执行删除操作
						$(".dele").click(function() {
							$('.table').find('.july_fileName').removeClass('off');
							$('.table').find('.july_cateName').removeClass('off');
							$(this).parent().parent().remove();
						});
						
						$('.sure').click(function() {
						    var name=$(this).prev().val();
						    var flag = 0;
							$(".july_cateName").each(function() {
								
								if ($(this).text() == name) {
									flag = 1;
								}
							})
						   if(flag == 1){
								alert("文件夹中名字不能相同")
								return ;
							}else{
								$('.table').find('.july_fileName').removeClass('off');
								$('.table').find('.july_cateName').removeClass('off');
								$(this).parent().parent().remove();
								$.ajax({
									url : "${pageContext.request.contextPath}/bulidcate",
									dataType : 'json',
									data:{categorieName:name,categorieReid:categorie},
									async: false,                   
									success : function(data) {
									},
									error : function() {
										alert("新建文件夹失败！");
									}
								});		
								showchild(categorie,recycle);
							}
						});
					}else{
						alert("请完成当前文件夹的创建！");
					}
					
				});
});

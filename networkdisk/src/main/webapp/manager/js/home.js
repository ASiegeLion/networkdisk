$(document).ready(function() {
	
	$("#p1").css({
		"background": "whitesmoke"
	});
	$("#p1").find("a").css({
		"color": "black"
	})
	$("#p1").click(function() {
		$("#page").attr("src", "/networkdisk/manager/frist.jsp");
		$(".bot").css({
			"background": "black"
		});
		$("#p1").css({
			"background": "whitesmoke"
		});
		$(".net").css({
			"color": "whitesmoke",
		});
		$("#p1").find("a").css({
			"color": "black"
		})
		
	});
	$("#p2").click(function() {
		$("#page").attr("src", "getUserAll");
		$(".bot").css({
			"color": "white",
			"background": "black"
		});
		$("#p2").css({
			"background": "whitesmoke"
		});
		$(".net").css({
			"color": "white"
		});
		$("#p2").find("a").css({
			"color": "black"
		})
	});
	$("#p3").click(function() {
		$("#page").attr("src", "/networkdisk/manager/file.jsp");
		$(".bot").css({
			"background": "black"
		});
		$("#p3").css({
			"background": "whitesmoke"
		});
		$(".net").css({
			"color": "white"
		})
		$("#p3").find("a").css({
			"color": "black"
		})
	});

	$("#p5").click(function() {
		$("#page").attr("src", "/networkdisk/manager/self.jsp");

		$(".bot").css({
			"background": "black"
		});
		$("#p5").css({
			"background": "whitesmoke"
		});
		$(".net").css({
			"color": "white"
		})
		$("#p5").find("a").css({
			"color": "black"
		})
	});
	
	$("#p7").click(function() {
		
	/*	$("#page").attr("src", "/networkdisk/manager/notice.jsp");*/
		$(".bot").css({
			"background": "black"
		});
		$("#p7").css({
			"background": "whitesmoke"
		});
		$(".net").css({
			"color": "white"
		})
		$("#p7").find("a").css({
			"color": "black"
		})
	});

	$("#p9").click(function() {
		$("#page").attr("src", "/networkdisk/manager/link.jsp");

		$(".bot").css({
			"background": "black"
		});
		$("#p9").css({
			"background": "whitesmoke"
		});
		$(".net").css({
			"color": "white"
		})
		$("#p9").find("a").css({
			"color": "black"
		})
	});
	
});
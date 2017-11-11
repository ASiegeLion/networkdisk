<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>出错啦~</title>
<link rel="Shortcut Icon" href="/networkdisk/img/julyicon.png">
<link href="/networkdisk/css/dandelion.css" rel="stylesheet">
</head>
<body>
	<div id="da-wrapper" class="fluid">
		<div id="da-content">
			<div class="da-container clearfix">
				<div id="da-error-wrapper">
					<div id="da-error-pin"></div>
					<div id="da-error-code">
						<span style="font-size:28px;margin-top:50px;">&nbsp;&nbsp;系统发生未知异常、请重新登录</span>
					</div>
					<h1 class="da-error-heading">哎哟喂！页面让狗狗叼走了！</h1>
					<p>
						大家可以到狗狗没有叼过的地方看看！
						 <a href="${pageContext.request.contextPath}/login.jsp">&nbsp;&nbsp;点击登录&nbsp;&nbsp;</a>
					</p>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
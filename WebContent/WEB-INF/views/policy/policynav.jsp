<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 导入子导航栏 -->
	<%@ include file="../subnav.jsp" %>
	
	<script type="text/javascript" src="js/jquery-2.2.4.min.js"></script>
	<script src="js/jquery.cookie.js"></script>
	<script type="text/javascript">
		$(function(){
// 			$(".nav.nav-pills.nav-stacked").prepend("<li><a href='topolicy/eventnotification.action'>事件通知策略</a></li>");
			$(".nav.nav-pills.nav-stacked").prepend("<li><a href='topolicy/roleconflict.action'>角色冲突策略</a></li>");
			$(".nav.nav-pills.nav-stacked").prepend("<li><a href='topolicy/entitlement.action'>授权策略</a></li>");
// 			$(".nav.nav-pills.nav-stacked").prepend("<li><a href='topolicy/bizroleassign.action'>岗位分配策略</a></li>");
		})
	</script>
	
</body>
</html>
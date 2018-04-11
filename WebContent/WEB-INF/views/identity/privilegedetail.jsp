<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet">
<!-- custom style -->
<link href="css/custom.css?version=<%=Math.random()%>" rel="stylesheet">
<script type="text/javascript" src="js/loading.js"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<title>用户详情</title>
</head>
<body>

	<div class="container">
		<!-- 导航栏  -->
		<%@ include file="../nav.jsp"%>
		<!-- 面包屑 -->
		<%@ include file="../breadcrumb.jsp"%>
		<!-- 主体 -->
		<div class="row">
			<!-- 主体左 -->
			<%@ include file="identitynav.jsp"%>
			<!-- 主体右 -->
			<div class="col-md-10 subject">
				<div class="row">
					<div class="col-md-4">
						<div class="input-group">
							<span class="input-group-addon">用户标识</span> <input id="user_id" name="user_id" value="${user['userId']}" type="text" class="form-control"
								placeholder="" readonly="readonly">
						</div>
					</div>
					<div class="col-md-4 col-md-offset-2">
						<div class="input-group">
							<span class="input-group-addon">用户名称</span> <input id="user_name" name="user_name" value="${user['userName']}" type="text" class="form-control"
								placeholder="" readonly="readonly">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="input-group">
							<span class="input-group-addon">组织单位</span> <input id="user_ou" name="user_ou" value="" type="text" class="form-control" placeholder=""
								readonly="readonly">
						</div>
					</div>
					<div class="col-md-4 col-md-offset-2">
						<div class="input-group">
							<span class="input-group-addon">用户状态</span> <input id="user_status" name="user_status" value="${user['userStatus']}" type="text"
								class="form-control" placeholder="" readonly="readonly">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="input-group">
							<span class="input-group-addon">用户类型</span> <input id="user_type" name="user_type" value="${user['userType']}" type="text" class="form-control"
								placeholder="" readonly="readonly">
						</div>
					</div>
					<div class="col-md-4 col-md-offset-2">
						<div class="input-group">
							<span class="input-group-addon">电子邮箱</span> <input id="user_email" name="user_email" value="${user['userEmail']}" type="text"
								class="form-control" placeholder="" readonly="readonly">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="input-group">
							<span class="input-group-addon">员工标识</span> <input id="user_employeeid" name="user_employeeid" value="${user['userEmployeeId']}" type="text"
								class="form-control" placeholder="" readonly="readonly">
						</div>
					</div>
					<div class="col-md-4 col-md-offset-2">
						<div class="input-group">
							<span class="input-group-addon">电话号码</span> <input id="user_phonenumber" name="user_phonenumber" value="${user['userPhonenumber']}" type="text"
								class="form-control" placeholder="" readonly="readonly">
						</div>
					</div>
				</div>

				<ul id="myTab" class="nav nav-tabs">
					<li class="active"><a href="#home" data-toggle="tab"> 权限 </a></li>
					<!-- 					<li><a href="#ios" data-toggle="tab">岗位</a></li> -->
				</ul>
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade in active" id="home">
						<table class="table table-bordered table-hover table-striped" id="user_table">
							<caption id="search_result">&nbsp;</caption>
							<thead>
								<tr>
<!-- 									<th><input type="checkbox" /></th> -->
									<th>资源标识</th>
									<th>资源名称</th>
									<th>账号登录名称</th>
									<th>账号状态</th>
									<th>操作</th>	<!-- 查看权限	编辑权限 -->
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
						<!-- 控制分页的元素 用 class进行分页的话可以有上下两个分页导航，要求要在表格上面也有一个一样的ul -->
						<center>
							<ul class="pagination" id="pagination0"></ul>
						</center>
					</div>
				</div>

				<div class="row">
					<div class="center-block">
						<button class="btn btn-primary">分配权限</button>
						<a class="btn btn-primary" href="toidentity/privilege.action">取&nbsp;&nbsp;消</a>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-2.2.4.min.js"></script>
	<script src="js/jquery.cookie.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.js"></script>
	<!-- initial page -->
	<script src="js/init.js?version=<%=Math.random()%>"></script>
	<script type="text/javascript">
		$(function() {
			var status = $("#user_status").val();
			if (status == '1') {
				$("#user_status").val("已激活");
			}
			if (status == '0') {
				$("#user_status").val("已禁用");
			}
		})
	</script>
</body>
</html>
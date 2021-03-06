<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
<title>用户属性定义</title>
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
			<%@ include file="confignav.jsp"%>
			<!-- 主体右 -->
			<div class="col-md-10 subject">
				<div class="col-md-12">
					<button class="btn btn-primary">创&nbsp;&nbsp;建</button>
					<!-- 点击创建按钮的时候弹出模态框，选择后进入资源详情页面 -->
				</div>
				<form class="form-horizontal center-block" role="form" method="post" action="">
					<div class="form-group">
						<label for="userUuid" class="col-md-5 control-label">用户属性定义标识</label>
						<div class="col-md-3">
							<input type="text" class="form-control" id="userUuid" placeholder="">
						</div>
					</div>
					<div class="form-group">
						<label for="userName" class="col-md-5 control-label">用户属性定义名称</label>
						<div class="col-md-3">
							<input type="text" class="form-control" id="userName" placeholder="">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12">
							<button type="submit" class="btn btn-primary">查&nbsp;&nbsp;询</button>
						</div>
					</div>
				</form>
				<hr>
				<table class="table table-bordered table-hover table-striped">
					<caption>查询用户属性定义结果</caption>
					<thead>
						<tr>
							<th>用户属性定义标识</th>
							<th>用户属性定义名称</th>
							<th>用户属性定义描述</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>test</td>
							<td>test</td>
							<td>test</td>
							<td><a href="toconfig/userattrdefdetail.action">查看</a></td>
						</tr>
						<tr>
							<td>test</td>
							<td>test</td>
							<td>test</td>
							<td><a href="toconfig/userattrdefdetail.action">查看</a></td>
						</tr>
					</tbody>
				</table>
				<div class="center-block">
					<ul class="pagination">
						<li><a href="#">&laquo;</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">&raquo;</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../commonscript.jsp" %>
</body>
</html>
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
<title>用户属性定义详情</title>
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
				<div class="row">
					<div class="col-md-5">
						<div class="input-group">
							<span class="input-group-addon">用户属性定义标识</span> <input id="date_start" name="date" type="text" class="form-control" placeholder="" required oninvalid="setCustomValidity('required')"
								oninput="setCustomValidity('')">
						</div>
					</div>
					<div class="col-md-5 col-md-offset-1">
						<div class="input-group">
							<span class="input-group-addon">用户属性定义名称</span> 
							<input id="date_start" name="date" type="text" class="form-control" placeholder="" required oninvalid="setCustomValidity('required')"
								oninput="setCustomValidity('')">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-5">
						<div class="input-group">
							<span class="input-group-addon">用户属性定义描述</span> <input id="date_start" name="date" type="text" class="form-control" placeholder="" required oninvalid="setCustomValidity('required')"
								oninput="setCustomValidity('')">
						</div>
					</div>
				</div>
				<ul id="myTab" class="nav nav-tabs">
					<li class="active"><a href="#home" data-toggle="tab">属性</a></li>
<!-- 					<li><a href="#taskchain" data-toggle="tab">任务链</a></li> -->
				</ul>
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade in active" id="home">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>属性名</th>
									<th>内容</th>
									<th>描述</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>属性类型</td>
									<td>
										<select>
											<option>字符串</option>
											<option>整型</option>
											<option>布尔型</option>
											<option>时间</option>
										</select>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>必需的</td>
									<td>
										<select>
											<option>否</option>
											<option>是</option>
										</select>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>多值的</td>
									<td>
										<select>
											<option>否</option>
											<option>是</option>
										</select>
									</td>
									<td></td>
								</tr>
<!-- 								<tr> -->
<!-- 									<td>资源标识</td> -->
<!-- 									<td><select> -->
<!-- 											<option>-</option> -->
<!-- 									</select></td> -->
<!-- 									<td></td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td>完全回收</td> -->
<!-- 									<td><select> -->
<!-- 											<option>否</option> -->
<!-- 											<option>是</option> -->
<!-- 									</select></td> -->
<!-- 									<td>选择是则进行完整回收，否则为增量回收</td> -->
<!-- 								</tr> -->
							</tbody>
						</table>
					</div>
<!-- 					<div class="tab-pane fade" id="taskchain"> -->
<!-- 						<table class="table table-striped"> -->
<!-- 							<thead> -->
<!-- 								<tr> -->
<!-- 									<th>计划任务标识</th> -->
<!-- 									<th>计划任务类型</th> -->
<!-- 									<th>操作</th> -->
<!-- 								</tr> -->
<!-- 							</thead> -->
<!-- 							<tbody> -->
<!-- 							</tbody> -->
<!-- 						</table> -->
<!-- 						<form action="" class="form-inline"> -->
<!-- 							<select class="form-control"> -->
<!-- 								<option>-</option> -->
<!-- 							</select> -->
<!-- 							<button type="submit" class="btn btn-primary">添&nbsp;&nbsp;加</button> -->
<!-- 						</form> -->
<!-- 					</div> -->
				</div>
				<div class="center-block">
					<button class="btn btn-primary">编&nbsp;&nbsp;辑</button>
					<button class="btn btn-primary">删&nbsp;&nbsp;除</button>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../commonscript.jsp" %>
</body>
</html>
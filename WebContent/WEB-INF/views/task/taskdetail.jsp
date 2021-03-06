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
<link href="css/bootstrapValidator.min.css" rel="stylesheet">
<script type="text/javascript" src="js/loading.js"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<title>岗位分配策略详情</title>
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
			<%@ include file="tasknav.jsp"%>
			<!-- 主体右 -->
			<div class="col-md-10 subject">
				<form action="" id="form1">
					<div class="row">
						<div class="col-md-5 form-group">
							<div class="input-group">
								<span class="input-group-addon">计划任务标识</span> <input id="scd_job_id" name="scd_job_id" type="text" class="form-control" placeholder="" >
							</div>
						</div>
						<div class="col-md-5 col-md-offset-1 form-group">
							<div class="input-group">
								<span class="input-group-addon">计划任务类型</span> 
								<select class="form-control" id="scd_job_type" name="scd_job_type">
									<option>-</option>
									<option value="reconAccountScheduleJob">账号回收任务</option>
									<option value="reconRoleScheduleJob">角色回收任务</option>
	<!-- 								<option value="reconOUJob">组织单位回收任务</option> -->
									<option value="userSynchronisedScheduleJob">用户同步任务</option>
									<option value="assignAccountOwnerScheduleJob">账号拥有者分配任务</option>
	<!-- 								<option value="">用户重新评估任务</option> -->
								</select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-5 form-group">
							<div class="input-group">
								<span class="input-group-addon">Cron表达式</span> <input id="scd_job_cron" name="scd_job_cron" type="text" class="form-control" placeholder="" >
							</div>
						</div>
						<div class="col-md-5 col-md-offset-1 form-group">
							<div class="input-group">
								<span class="input-group-addon">计划任务状态</span> <input id="scd_job_status" name="scd_job_status" data-value="" type="text" class="form-control" placeholder="" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-5 form-group">
							<div class="input-group">
								<span class="input-group-addon">上一次运行时间</span> <input id="scd_job_last_run_time" name="scd_job_last_run_time" type="text" class="form-control" placeholder="" readonly="readonly">
							</div>
						</div>
						<div class="col-md-5 col-md-offset-1 form-group">
							<div class="input-group">
								<span class="input-group-addon">下一次运行时间</span> <input id="scd_job_next_run_time" name="scd_job_next_run_time" type="text" class="form-control" placeholder="" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-5 form-group">
							<div class="input-group">
								<span class="input-group-addon">计划任务描述</span> <input id="scd_job_desc" name="scd_job_desc" type="text" class="form-control" placeholder="" >
							</div>
						</div>
					</div>
				</form>
				<ul id="myTab" class="nav nav-tabs">
					<li class="active"><a href="#home" data-toggle="tab">属性</a></li>
					<li><a href="#taskchain" data-toggle="tab">任务链</a></li>
				</ul>
				<div id="myTabContent" class="tab-content" style="min-height:50vh;">
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
									<td>资源标识</td>
									<td><select id="resource_uuid_sel">
											<option>-</option>
									</select></td>
									<td></td>
								</tr>
<!-- 								<tr> -->
<!-- 									<td>完全回收</td> -->
<!-- 									<td><select id="full_recon_sel"> -->
<!-- 											<option value="false">否</option> -->
<!-- 											<option value="true">是</option> -->
<!-- 									</select></td> -->
<!-- 									<td>选择是则进行完整回收，否则为增量回收</td> -->
<!-- 								</tr> -->
							</tbody>
						</table>
					</div>
					<div class="tab-pane fade" id="taskchain">
						<table class="table table-striped" id="taskchain_table">
							<thead>
								<tr>
									<th>计划任务标识</th>
<!-- 									<th>计划任务类型</th> -->
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
<!-- 							
 -->
							</tbody>
						</table>
						<form class="form-inline" onsubmit="return false">
							<select class="form-control" id="schedule_uuid_sel">
								<option>-</option>
							</select>
							<button class="btn btn-primary" id="add_scd_chain_btn">添&nbsp;&nbsp;加</button>
						</form>
					</div>
				</div>
				<div class="center-block" id="button_div">
					<button class="btn btn-primary" id="save_scd_btn">保&nbsp;&nbsp;存</button>
					<a class="btn btn-primary" id="cancel_scd_btn" href="totask/task.action">取&nbsp;&nbsp;消</a>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../commonscript.jsp" %>
	<script src="js/task.js?version=<%=Math.random()%>"></script>
	<script type="text/javascript">
		$(function(){
			
			$('#form1').bootstrapValidator({
				message: '验证失败',
				live : 'disabled',
				feedbackIcons: {
// 					valid: 'glyphicon glyphicon-ok',
// 					invalid: 'glyphicon glyphicon-remove',
// 					validating: 'glyphicon glyphicon-refresh'
				},
				fields: {
					scd_job_id: {
						message: '计划任务验证失败',
						validators: {
							notEmpty: {
								message: '计划任务标识不能为空'
							}
						}
					},
					scd_job_cron: {
						validators: {
								remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}  
			                         url: 'totask/vaildatecronexpression.action',//验证地址
			                         message: 'cron表达式格式有误',//提示消息
// 			                         delay :  2000,	//2秒钟发送一次请求
			                         type: 'POST'//请求方式
			                         /**自定义提交数据，默认值提交当前input value
			                          *  data: function(validator) {
			                               return {
			                                   password: $('[name="passwordNameAttributeInYourForm"]').val(),
			                                   whatever: $('[name="whateverNameAttributeInYourForm"]').val()
			                               };
			                            }
			                          */
			                     }
						}
					}
				}
			});

		});

	</script>
</body>
</html>
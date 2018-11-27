<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    out.print(basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
 .form-group >img{width:100px;height:160px;}
 input[type=file]{display: none;}
</style>
    <base href="<%=basePath%>" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
    <script type="text/javascript" src="js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="js/upload.js"></script>
    <script type="text/javascript" >
        function updete(){
            //console.log("xx");
            $.ajax({
                type: "POST",
                url: "user/updateUser",
                data:users= $('#updateForm').serialize(), //将表单中的数据序列化
                success: function(data) {
                    console.log("success");
                }
            })
        }


    </script>
<head>
  <meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>后台模板</title>
<link rel="stylesheet" href="<%=basePath%>assets/css/amazeui.css" />
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=basePath%>assets/css/core.css" />
<link rel="stylesheet" href="<%=basePath%>assets/css/menu.css" />
<link rel="stylesheet" href="<%=basePath%>assets/css/index.css" />
<link rel="stylesheet" href="<%=basePath%>assets/css/admin.css" />
<link rel="stylesheet"
	href="<%=basePath%>assets/css/page/typography.css" />
<link rel="stylesheet" href="<%=basePath%>assets/css/page/form.css" />
</head>
<body>
	<!-- Begin page -->
	<header class="am-topbar am-topbar-fixed-top">
	<div class="am-topbar-left am-hide-sm-only">
		<a href="index.html" class="logo"><span>Admin<span>to</span></span><i
			class="zmdi zmdi-layers"></i></a>
	</div>

	<div class="contain">
		<ul class="am-nav am-navbar-nav am-navbar-left">

			<li><h4 class="page-title">修改用户信息</h4></li>
		</ul>

		<ul class="am-nav am-navbar-nav am-navbar-right">
			<li class="inform"><i class="am-icon-bell-o" aria-hidden="true"></i></li>
			<li class="hidden-xs am-hide-sm-only">
				<form role="search" class="app-search">
					<input type="text" placeholder="Search..." class="form-control">
					<a href=""><img src="<%=basePath%>assets/img/search.png"></a>
				</form>
			</li>
		</ul>
	</div>
	</header>
	<!-- end page -->


	<div class="user">
		<!--<div class="am-g">-->
		<!-- ========== Left Sidebar Start ========== -->
		<!--<div class="left side-menu am-hide-sm-only am-u-md-1 am-padding-0">
			<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 548px;">
				<div class="sidebar-inner slimscrollleft" style="overflow: hidden; width: auto; height: 548px;">-->
		<!-- sidebar start -->
		<div class="admin-sidebar am-offcanvas  am-padding-0"
			id="admin-offcanvas">
			<div class="am-offcanvas-bar admin-offcanvas-bar">
				<!-- User -->
				<div class="user-box am-hide-sm-only">
					<div class="user-img">
						<img src="<%=basePath%>assets/img/avatar-1.jpg" alt="user-img"
							title="Mat Helme" class="img-circle img-thumbnail img-responsive">
						<div class="user-status offline">
							<i class="am-icon-dot-circle-o" aria-hidden="true"></i>
						</div>
					</div>
					<h5>
						<a href="#">Mat Helme</a>
					</h5>
					<ul class="list-inline">
						<li><a href="#"> <i class="am-icon-cog"
								aria-hidden="true"></i>
						</a></li>

						<li><a href="#" class="text-custom"> <i
								class="am-icon-cog" aria-hidden="true"></i>
						</a></li>
					</ul>
				</div>
				<!-- End User -->

				<ul class="am-list admin-sidebar-list">
					<li><a href="<%=basePath%>index.html"><span
							class="am-icon-home"></span> 首页</a></li>
					<li class="admin-parent"><a class="am-cf"
						data-am-collapse="{target: '#collapse-nav1'}"><span
							class="am-icon-table"></span> 表格 <span
							class="am-icon-angle-right am-fr am-margin-right"></span></a>
						<ul class="am-list am-collapse admin-sidebar-sub am-in"
							id="collapse-nav1">
							<li><a href="user/list" class="am-cf"> 用户</span></a></li>
							<li><a href="admin/list">管理员</a></li>
							<li><a href="enterprise/list">企业</a></li>
							<li><a href="Type/list">类型</a></li>
							<li><a href="recruit/list">招聘信息</a></li>
							<li><a href="cv/list">简历</a></li>
							<li><a href="audit/list">审核表</a></li>
							<li><a href="deliverrecord/list">交易记录</a></li>
						</ul></li>
					<li class="admin-parent"><a class="am-cf"
						data-am-collapse="{target: '#collapse-nav2'}"><i
							class="am-icon-line-chart" aria-hidden="true"></i> 统计图表 <span
							class="am-icon-angle-right am-fr am-margin-right"></span></a>
						<ul class="am-list am-collapse admin-sidebar-sub am-in"
							id="collapse-nav2">
							<li><a href="chart_line.html" class="am-cf"> 折线图</span></a></li>
							<li><a href="chart_columnar.html" class="am-cf"> 柱状图</span></a></li>
							<li><a href="chart_pie.html" class="am-cf"> 饼状图</span></a></li>
						</ul></li>
					<li class="admin-parent"><a class="am-cf"
						data-am-collapse="{target: '#collapse-nav5'}"><span
							class="am-icon-file"></span> 表单 <span
							class="am-icon-angle-right am-fr am-margin-right"></span></a>
						<ul class="am-list am-collapse admin-sidebar-sub am-in"
							id="collapse-nav5">
							<li><a href="form_basic.html" class="am-cf"> 基本表单</a></li>
							<li><a href="form_validate.html">表单验证</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<!-- sidebar end -->

		<!--</div>
			</div>
		</div>-->
		<!-- ========== Left Sidebar end ========== -->



		<!--	<div class="am-g">-->
		<!-- ============================================================== -->
		<!-- Start right Content here -->
		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<div class="am-g">
					<!-- Row start -->
					<div class="am-u-sm-12">
						<div class="card-box">
							<ul class="am-nav am-fr">
								<li class="am-dropdown" data-am-dropdown><a
									class="am-dropdown-toggle" data-am-dropdown-toggle
									href="javascript:;"> <span class="am-icon-caret-down"></span>
								</a></li>
							</ul>
							<h4 class="header-title m-t-0 m-b-30"></h4>
							<div class="form-group">
							<img class="uploadImg" src="upload/studenthead/${users.uimage}" style="width:100px;height:160px;">
						</div>
						<input type="hidden" name="subfolder" value="studenthead"
							class="subfolder"> <input type="file" class="myFile"
							id="myFile" name="subfolder"> <input type="button" id="upload" value="上传图片">	
							<div class="am-g">
								<div class="am-u-md-6">
									<form action="" method="post" id="updateForm">
										<div class="am-form-group">
											<div class="am-g">
												<label class="am-u-md-2 am-md-text-right am-padding-left-0"
													for="doc-ipt-pwd-1">用户编号</label> <input class="am-u-md-10"
													name="uid" readonly="readonly" value="${users.uid}"
													id="doc-ipt-pwd-1" placeholder="修改用户编号">
											</div>
										</div>
										<div class="am-form-group">
											<div class="am-g">
												<label class="am-u-md-2 am-md-text-right am-padding-left-0"
													for="doc-ipt-email-1">管理员编号</label> <input
													class="am-u-md-10 form-control" name="aid"
													value="${users.aid}" id="doc-ipt-email-1"
													placeholder="修改管理员编号">
											</div>
										</div>
										<div class="am-form-group">
											<div class="am-g">
												<label class="am-u-md-2 am-md-text-right am-padding-left-0"
													for="doc-ipt-email-1">用户生日</label> <input
													class="am-u-md-10 form-control" name="birthday"
													value="${users.birthday}" id="doc-ipt-email-1"
													placeholder="修改用户生日">
											</div>
										</div>
										<div class="am-form-group">
											<div class="am-g">
												<label class="am-u-md-2 am-md-text-right am-padding-left-0"
													for="doc-ipt-email-1">性别</label> <input
													class="am-u-md-10 form-control" name="sex"
													value="${users.sex}" id="doc-ipt-email-1"
													placeholder="修改性别">
											</div>
										</div>
										<div class="am-form-group">
											<div class="am-g">
												<label class="am-u-md-2 am-md-text-right am-padding-left-0"
													for="doc-ipt-email-1">用户意向</label> <input
													class="am-u-md-10 form-control" name="intention"
													value="${users.intention}" id="doc-ipt-email-1"
													placeholder="修改用户意向">
											</div>
										</div>
										<div class="am-form-group">
											<div class="am-g">
												<label class="am-u-md-2 am-md-text-right am-padding-left-0"
													for="doc-ipt-email-1">用户姓名</label> <input
													class="am-u-md-10 form-control" name="uname"
													value="${users.uname}" id="doc-ipt-email-1"
													placeholder="修改用户姓名">
											</div>
										</div>
										<div class="am-form-group">
											<div class="am-g">
												<label class="am-u-md-2 am-md-text-right am-padding-left-0"
													for="doc-ipt-email-1">用户头像</label>
													<span><input type="text"
										name="uimage" value="${users.uimage}" class="uploadimgsrc"></span>
											</div>
										</div>
										<div class="am-form-group">
											<div class="am-g">
												<label class="am-u-md-2 am-md-text-right am-padding-left-0"
													for="doc-ipt-email-1">用户摘要</label> <input
													class="am-u-md-10 form-control" name="uabstract"
													value="${users.uabstract}" id="doc-ipt-email-1"
													placeholder="修改用户摘要">
											</div>
										</div>
										<div class="am-form-group">
											<div class="am-g">
												<label class="am-u-md-2 am-md-text-right am-padding-left-0"
													for="doc-ipt-email-1">用户密码</label> <input
													class="am-u-md-10 form-control" name="upassword"
													value="${users.upassword}" id="doc-ipt-email-1"
													placeholder="修改用户密码">
											</div>
										</div>
										<button class="am-btn am-btn-secondary" type="button"
											onclick="updete()">修改</button>
									</form>
								</div>

								<!-- col end -->
							</div>
							<!-- row end -->

						</div>
					</div>
					<!-- end right Content here -->
					<!--</div>-->
				</div>
			</div>
		</div>
	</div>
	<!-- navbar -->
	<a href="admin-offcanvas"
		class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
		data-am-offcanvas="{target: '#admin-offcanvas'}"> <!--<i class="fa fa-bars" aria-hidden="true"></i>-->
	</a>

	<script type="text/javascript"
		src="<%=basePath%>assets/js/jquery-2.1.0.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>assets/js/amazeui.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>assets/js/app.js"></script>
	<script type="text/javascript" src="<%=basePath%>assets/js/blockUI.js"></script>
</body>
</html>

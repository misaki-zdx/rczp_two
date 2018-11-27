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
		<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>后台模板</title>
		<link rel="stylesheet" href="<%=basePath%>assets/css/amazeui.css" />
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="<%=basePath%>assets/css/core.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/menu.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/index.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/admin.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/page/typography.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/page/form.css" />
		
		<script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
		<script type="text/javascript" >
        function addSubmit(){
            //console.log("xx");
            $.ajax({
                type: "POST",
                url: "/audit/addAudit",
                data:"auid=&"+$('#addForm').serialize(), //将表单中的数据序列化
                success: function(data) {
                    console.log("success");
                }
            })
        }

		</script>
		
	</head>
	<body>
		<!-- Begin page -->
		<header class="am-topbar am-topbar-fixed-top">		
			<div class="am-topbar-left am-hide-sm-only">
                <a href="index.html" class="logo"><span>Admin<span>to</span></span><i class="zmdi zmdi-layers"></i></a>
            </div>
	
			<div class="contain">
				<ul class="am-nav am-navbar-nav am-navbar-left">

					<li><h4 class="page-title">管理员添加</h4></li>
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
		
		
		<div class="admin">
			<!--<div class="am-g">-->
		<!-- ========== Left Sidebar Start ========== -->
		<!--<div class="left side-menu am-hide-sm-only am-u-md-1 am-padding-0">
			<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 548px;">
				<div class="sidebar-inner slimscrollleft" style="overflow: hidden; width: auto; height: 548px;">-->
                  <!-- sidebar start -->
				  <div class="admin-sidebar am-offcanvas  am-padding-0" id="admin-offcanvas">
				    <div class="am-offcanvas-bar admin-offcanvas-bar">
				    	<!-- User -->
						<div class="user-box am-hide-sm-only">
	                        <div class="user-img">
	                            <img src="<%=basePath%>assets/img/avatar-1.jpg" alt="user-img" title="Mat Helme" class="img-circle img-thumbnail img-responsive">
	                            <div class="user-status offline"><i class="am-icon-dot-circle-o" aria-hidden="true"></i></div>
	                        </div>
	                        <h5><a href="#">Mat Helme</a> </h5>
	                        <ul class="list-inline">
	                            <li>
	                                <a href="#">
	                                    <i class="am-icon-cog" aria-hidden="true"></i>
	                                </a>
	                            </li>
	
	                            <li>
	                                <a href="#" class="text-custom">
	                                    <i class="am-icon-cog" aria-hidden="true"></i>
	                                </a>
	                            </li>
	                        </ul>
	                    </div>
	                    <!-- End User -->
	            
						<ul class="am-list admin-sidebar-list">
					<li><a href="<%=basePath%>index.html"><span
							class="am-icon-home"></span> 首页</a></li>
					<li class="admin-parent"><a class="am-cf"
						data-am-collapse="{target: '#collapse-nav1'}"><span
							class="am-icon-table"></span>表 格<span
							class="am-icon-angle-right am-fr am-margin-right"></span></a>
						<ul class="am-list am-collapse admin-sidebar-sub am-in"
							id="collapse-nav1">
							<li><a href="user" class="am-cf"> 用户</a></li>
							<li><a href="recruit" class="am-cf"> 招聘</a></li>
							<li><a href="admin" class="am-cf"> 管理员</a></li>
							<li><a href="audit" class="am-cf">审理</a></li>
							<li><a href="cv" class="am-cf">简历</a></li>
							<li><a href="deliverrecord" class="am-cf">投递</a></li>
							<li><a href="enterprise" class="am-cf">企业</a></li>
							<li><a href="Type" class="am-cf">类别</a></li>
							<li><a href="user/EchartOne" class="am-cf"> 基本表格</a></li>
							<!-- <li><a href="table_complete.html">完整表格</a><> -->
						</ul></li>
				</ul>
			</div>
		</div>
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
								  <li class="am-dropdown" data-am-dropdown>
								    <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
								       <span class="am-icon-caret-down"></span>
								    </a>
								    <ul class="am-dropdown-content">
								      <li>隐藏</li>
								      <li>隐藏</li>
								      <li>隐藏</li>
								      <li>隐藏</li>
								      <li>可加</li>
								    </ul>
								  </li>
								</ul>
								<form action="" method="post" id="addForm" class="am-form" data-am-validator>
								 
								  <fieldset>
								    <legend>增加页面</legend>
								    <div class="am-form-group">
								      <label for="doc-vld-name-2">管理员id：</label>
								      <input type="text" name="aid" id="doc-vld-name-2" minlength="3" placeholder="管理员id" required/>
								    </div>
								
								    <div class="am-form-group">
								      <label for="doc-vld-email-2">企业id：</label>
								      <input type="email" name="eid" id="doc-vld-email-2" placeholder="企业id" required/>
								    </div>
								
								    <div class="am-form-group">
								      <label for="doc-vld-url-2">审计状态：</label>
								      <input type="url" name="austate" id="doc-vld-url-2" placeholder="审计状态" required/>
								    </div>
								

								    <button class="am-btn am-btn-secondary" type="submit" onclick="addSubmit()">提交</button>
								  </fieldset>
								</form>
								
								
							</div>
						</div>
					<!-- Row end -->
				</div>
			
			
			
			
			</div>
		</div>
		<!-- end right Content here -->
		<!--</div>-->
		</div>
		</div>
		
		<!-- navbar -->
		<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"><!--<i class="fa fa-bars" aria-hidden="true"></i>--></a>
		
		<script type="text/javascript" src="../assets/js/jquery-2.1.0.js" ></script>
		<script type="text/javascript" src="../assets/js/amazeui.min.js"></script>
		<script type="text/javascript" src="../assets/js/app.js" ></script>
		<script type="text/javascript" src="../assets/js/blockUI.js" ></script>
	</body>
	
</html>

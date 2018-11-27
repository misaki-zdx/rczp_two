    <%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>"/>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
	<jsp:include page="../common.jsp" />
	<script type="text/javascript">
	    var pageHelper;
        function loadView() {
        	var url = "user/selectUser";
    		//后面两个参数非必需
    		//会自动调用一次loadData()
    		pageHelper = pageHelpers(url, function(data) {
            var table = $("#xxxxxxx");
            var trs;
            table.html("");
            console.log(data);
            for (var i = 0; i < data.length; i++) {
                var tr = "<tr align='center'>" + "<td>" + data[i].uid + "</td>"
                    + "<td>" + data[i].aid + "</td>"
					+ "<td>" + data[i].birthday + "</td>"
                    + "<td>" + data[i].sex + "</td>"
                    + "<td>" + data[i].intention + "</td>"
                    + "<td>" + data[i].uname + "</td>"
                   // + "<td>" + data[i].uimage + "</td>"
                    + "<td><img src='upload/${user.uimage}uimage=" + data[i].uimage+ "'></td>"
                    + "<td>" + data[i].uabstract + "</td>"
                    + "<td>" + data[i].upassword + "</td>"
                    + "<td><a href='user/getUserAndUserByUid?uid="
					+ data[i].uid + "'>详情</a></td>"
                    + "<td><a href='user/showUid?uid=" + data[i].uid
                    + "'>修改</a></td>" + "<td><a href='user/deleteUser?uid="
                    + data[i].uid + "'>删除</a></td>"
                    + "<td><a href='user/addUser'>添加</a></td>" + "</tr>";

                trs += tr;
            }
            table.append(trs);
            $("#index").html("当前第" + pageHelper.indexPage() + "页");
			$("#total").html("共有" + pageHelper.total() + "条");
		});
        }
        window.onload = function() {
        	loadView()
    	};
	</script>
</head>
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

			<li><h4 class="page-title">基本表格</h4></li>
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
		<div class="admin-sidebar am-offcanvas  am-padding-0"
			id="admin-offcanvas">
			<div class="am-offcanvas-bar admin-offcanvas-bar">
				<!-- User -->
				<div class="user-box am-hide-sm-only">
					<div class="user-img">
						<img src="assets/img/avatar-1.jpg" alt="user-img"
							title="Mat Helme" class="img-circle img-thumbnail img-responsive">
						<div class="user-status offline">
							<i class="am-icon-dot-circle-o" aria-hidden="true"></i>
						</div>
					</div>
					<h5>
						<a href="#">Mat Helme</a>
					</h5>
					<ul class="list-inline">
						<li><a href="#"> <i class="fa fa-cog" aria-hidden="true"></i>
						</a></li>

						<li><a href="#" class="text-custom"> <i class="fa fa-cog"
								aria-hidden="true"></i>
						</a></li>
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
		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<div class="card-box">
					<!-- Row start -->
					<div class="am-g">
						<div class="am-u-sm-12 am-u-md-6">
							<div class="am-btn-toolbar">
								<div class="am-btn-group am-btn-group-xs">
									<button type="button" class="am-btn am-btn-default">
										<a href="user/addUser"> <span class="am-icon-plus"></span> 新增
										</a>
									</button>
								</div>
							</div>
						</div>

						<div class="am-u-sm-12 am-u-md-3">
							<div class="am-input-group am-input-group-sm">
								<input type="text" class="am-form-field"> <span
									class="am-input-group-btn">
									<button class="am-btn am-btn-default" type="button">搜索</button>
								</span>
							</div>
						</div>
					</div>
					<!-- Row end -->

					<!-- Row start -->
					<div class="am-g">
						<div class="am-u-sm-12">
							<table id="xxxxx"
								class="am-table am-table-striped am-table-hover table-main">
								<thead>
									<tr>
										<th class="table-id">用户编号</th>
										<th class="table-type">管理员编号</th>
										<th class="table-type">生日</th>
										<th class="table-id">性别</th>
										<th class="table-title">意向</th>
										<th class="table-type">姓名</th>
										<th class="table-id">头像</th>
										<th class="table-title">描述</th>
										<th class="table-type">密码</th>
										
									</tr>
								</thead>
								<tbody id="xxxxxxx">
								</tbody>
							</table>

							<button onclick="pageHelper.loadData(1)">首页</button>
							<button onclick="pageHelper.prePageData()">上一页</button>
							<span id="index"></span>，<span id="total"></span>
							<button onclick="pageHelper.nextPageData()">下一页</button>
							<button onclick="pageHelper.loadData(pageHelper.pages())">尾页</button>
							<hr />
						</div>

					</div>
					<!-- Row end -->

				</div>




			</div>


		</div>
	</div>
	<!-- end right Content here -->
	<!--</div>-->
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

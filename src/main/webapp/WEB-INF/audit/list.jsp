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
		
		<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>后台模板</title>
		
		<script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
		<script>
	var indexPage = 1;
	var lastPage = 10;
	var data = [];

	function loadData() {
		$.ajax({
			url : "audit/selectAll",
			type : "GET",
			//dataType : "JSON",
			data : {
				pageNum : indexPage,
				pageSize : 10
			},
			success : function(obj) {
			    console.log(obj);
				data = obj.list;
				lastPage = obj.lastPage;
				if (obj.isFirstPage) {
					indexPage = obj.firstPage;
				}
				if (obj.isLastPage) {
					indexPage = obj.lastPage
				}
				loadView();
			},
			error : function(err) {
				alert("网络异常");
			}
		});
	}

	function loadView() {

		var table = $("#table");
		var trs;
		table.html("");
		for (var i = 0; i < data.length; i++) {


			var tr = "<tr>" 
					/* +"<td><input type='checkbox' /></td>"  */
					+ "<td>" + data[i].auid + "</td>"
					+ "<td><a href='#'>" + data[i].aid + "</a></td>" 
					+ "<td>" + data[i].eid + "</td>" 
					+ "<td class='am-hide-sm-only'>" + data[i].austate + "</td>" 
					+ "<td><div class='am-btn-toolbar'><div class='am-btn-group am-btn-group-xs'><a class='am-btn am-btn-default am-btn-xs am-text-secondary' href='#'><span class='am-icon-pencil-square-o'></span> 详情</a>"
					+ "<a class='am-btn am-btn-default am-btn-xs am-hide-sm-only' href='audit/showAid?auid=" + data[i].auid + "'><span class='am-icon-copy'></span> 修改</a>" 
					+ "<a class='am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only' href='audit/delete?auid="
					+ data[i].auid + "'><span class='am-icon-trash-o'></span> 删除</a></div></div></td>"
					+ "</tr>";
					

			trs += tr;
		}
		table.append(trs);
	}

	function prePageData() {
		indexPage--;
		if (indexPage < 1) {
			indexPage = 1;
			return;
		}
		loadData();
	}

	function nextPageData() {
        indexPage++;
		if (indexPage > lastPage) {
			indexPage = lastPage;
			return;
		}
		loadData();
	}
	
	window.onload = function() {
		loadData();
	};
</script>
		<link rel="stylesheet" href="<%=basePath%>assets/css/amazeui.css" />
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="<%=basePath%>assets/css/core.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/menu.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/index.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/admin.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/page/typography.css" />
		<link rel="stylesheet" href="<%=basePath%>assets/css/page/form.css" />
	</head>
	<body>
		<!-- Begin page -->
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
						
		
	<!--	<div class="am-g">-->
		<!-- ============================================================== -->
		<!-- Start right Content here -->
		<div class="content-page" style="margin-top: 70px">
			<!-- Start content -->
			<div class="content">
				<div class="card-box">
					<!-- Row start -->
					<div class="am-g">
						<div class="am-u-sm-12 am-u-md-6">
				          <div class="am-btn-toolbar">
				            <div class="am-btn-group am-btn-group-xs">
				              <a href='audit/add'><button type="button" class="am-btn am-btn-default"><span class="am-icon-plus"></span> 新增</button></a>
				            </div>
				          </div>
				        </div>	
				        
						<div class="am-u-sm-12 am-u-md-3">
				          <div class="am-input-group am-input-group-sm">
				            <input type="text" class="am-form-field">
				          <span class="am-input-group-btn">
				            <button class="am-btn am-btn-default" type="button">搜索</button>
				          </span>
				          </div>
				        </div>
				      </div>
					  <!-- Row end -->
					  
					  <!-- Row start -->
					  	<div class="am-g">
        <div class="am-u-sm-12">
          <form class="am-form">
            <table class="am-table am-table-striped am-table-hover table-main">
              <thead>
              <tr>
                <!-- <th class="table-check"><input type="checkbox" /></th> --><th class="table-id">ID</th><th class="table-title">管理员id</th><th class="table-type">企业id</th><th class="table-author am-hide-sm-only">审计状态</th><th class="table-set">操作</th>
              </tr>
              </thead>
              <tbody id="table">

              </tbody>
            </table>
            <div class="am-cf">
              本页最多 10 条记录
              <div class="am-fr">
                <ul class="am-pagination">
                  <li><a onclick="prePageData()">«</a></li>
                  <!-- <li class="am-active"><a href="#">1</a></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                  <li><a href="#">4</a></li>
                  <li><a href="#">5</a></li> -->
                  <li><a onclick="nextPageData()">»</a></li>
                </ul>
              </div>
            </div>
            <hr />
            <p>注：.....</p>
          </form>
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
		<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"><!--<i class="fa fa-bars" aria-hidden="true"></i>--></a>

	</body>
	
</html>

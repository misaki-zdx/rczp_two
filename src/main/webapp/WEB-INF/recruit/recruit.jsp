<%--
  Created by IntelliJ IDEA.
  User: Misaki
  Date: 2018/11/12
  Time: 21:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%-- <%@ include file="../common/common.jsp" %> --%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>后台模板</title>
<link rel="stylesheet" href="assets/css/amazeui.css" />
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/core.css" />
<link rel="stylesheet" href="assets/css/menu.css" />
<link rel="stylesheet" href="assets/css/index.css" />
<link rel="stylesheet" href="assets/css/admin.css" />
<link rel="stylesheet" href="assets/css/page/typography.css" />
<link rel="stylesheet" href="assets/css/page/form.css" />
<!--<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.js"></script>-->
<script type="text/javascript" src="assets/js/jquery-2.1.0.js"></script>
<script type="text/javascript" src="assets/js/amazeui.min.js"></script>
<script type="text/javascript" src="assets/js/blockUI.js"></script>
<!--<script type="text/javascript" src="assets/js/app.js"></script>-->
<script type="text/javascript" src="js/page.js"></script>
<style>
.head-portrait {
	width: 40px;
	height: 40px;
}

.user-td-span {
	line-height: 36px; /*当有图片顶着td时， span line-height*/
}

table {
	table-layout: fixed;
}

.checkbox-other {
	padding-top: 16px;
}

.edit {
	padding-top: 13px;
}

td {
	text-overflow: ellipsis; /* for IE */
	-moz-text-overflow: ellipsis; /* for Firefox,mozilla */
	overflow: hidden;
	white-space: nowrap; / /
	white-space: nowrap 是为了保证无论单元格（TD）中文本内容有多少，都不会自动换行，此时多余的内容会在水平方向撑破单元格。
}

.table-td-set-now {
	width: 220px;
}

.am-pagination-span:hover {
	cursor: pointer;
}

#add-a {
	color: grey;
}

.delete_a {
	color: #dd514c;
}
</style>
<script type="text/javascript">
	$(function() {
		//console.log("host:"+host+",hostname:"+hostname+",href:"+href);

		//页面加载
		loadData("recruit", 12);

		//为删除按钮添加删除事件
		$('#btn-delete').click(function() {
			deletef();
		});

		//为搜索按钮添加搜索事件
		$('#queryByWork').click(function() {
			console.log('click');
			queryByWork();
		})

		//删除方法
		function deletef() {
			var deleteID = $(":checked");
			var arr = new Array();
			for (var i = 0; i < deleteID.length; i++) {
				var val = $(deleteID[i]).val();
				//转换为数字
				//arr[i] =parseInt(val);
				//第二种转换
				//发现parseInt方法在format'00'开头的数字时会当作2进制转10进制的方法进行转换，所以建议string转int最好用Number方法
				arr[i] = Number(val);
			}
			//console.log(arr);
			if (arr != '') {
				$.ajax({
					url : 'recruit/deleteMoreById',
					type : "post",
					//dataType: "json",
					contentType : "application/json",
					data : JSON.stringify(arr),
					success : function() {
						console.log("success");
						loadData("recruit", 12);
					},
					error : function() {
						console.log("error");
					}
				})
			}
		}

		//页面搜索方法 按工作搜索

		function queryByWork() {
			var dom = $('#work');
			var content = dom.val();
			var regu = "^[ ]+$";
			var re = new RegExp(regu);
			//console.log(typeof content+";"+content.length);
			if (content.length != 0 && re.test(content) != true) {
						queryFun = 'queryByWork/'+content;
						loadData("recruit", 12);
			}
		}

		//绑定点击事件
		$('#TOPcheckbox').click(function () {
		    var  flag = $(this).is(':checked')  //attr(":checked") 取不到
		    //input type 需要:
			var t1 =$(':checkbox:not(#TOPcheckbox)'); //选择器排除方式
            //console.log(flag+";"+t1);
			if(flag) {
                t1.prop("checked",true)   //这样才是标准做法  现在不推荐attr了
            }else {
                t1.prop("checked",false)
			}
        })
	})
</script>
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

				<li><h4 class="page-title">招聘信息列表</h4></li>
			</ul>

			<!--<ul class="am-nav am-navbar-nav am-navbar-right">
            <li class="inform"><i class="am-icon-bell-o" aria-hidden="true"></i></li>
            <li class="hidden-xs am-hide-sm-only">
                <form role="search" class="app-search">
                    <input type="text" placeholder="Search..." class="form-control">
                    <a href=""><img src="assets/img/search.png"></a>
                </form>
            </li>
        </ul>-->
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
					<li><a href="index.html"><span class="am-icon-home"></span>
							首页</a></li>
					<li class="admin-parent"><a class="am-cf"
						data-am-collapse="{target: '#collapse-nav1'}"><span
							class="am-icon-table"></span> 后台 <span
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
				<div class="card-box">
					<!-- Row start -->
					<div class="am-g">
						<div class="am-u-sm-12 am-u-md-6">
							<div class="am-btn-toolbar">
								<div class="am-btn-group am-btn-group-xs">
									<button type="button" class="am-btn am-btn-default">
										<span class="am-icon-plus"></span> <a href="recruit/add"
											id="add-a">新增</a>
									</button>
									<button type="button" class="am-btn am-btn-default"
										id="btn-delete">
										<span class="am-icon-trash-o"></span> 删除
									</button>
									<!-- <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 保存</button>
                                 <button type="button" class="am-btn am-btn-default"><span class="am-icon-archive"></span> 审核</button>
                                 <button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button>-->
								</div>
							</div>
						</div>

						<div class="am-u-sm-12 am-u-md-3">
							<div class="am-input-group am-input-group-sm">
								<input type="text" class="am-form-field" id="work"> <span
									class="am-input-group-btn">
									<button class="am-btn am-btn-default" type="button"
										id="queryByWork">搜索</button>
								</span>
							</div>
						</div>
					</div>
					<!-- Row end -->

					<!-- Row start -->
					<div class="am-g">
						<div class="am-u-sm-12">
							<form class="am-form">
								<table
									class="am-table am-table-striped am-table-hover table-main">
									<thead>
										<tr>
											<th class="table-id" style="padding-bottom: 13px;"><input
												type="checkbox" id="TOPcheckbox"/></th>
											<th class="table-id">ID</th>
											<th class="table-author ">公司ID</th>
											<th class="table-author">工作</th>
											<th class="table-author am-hide-sm-only">地址</th>
											<th class="table-author am-hide-sm-only">福利</th>
											<th class="table-author am-hide-sm-only">标题</th>
											<th class="table-author am-hide-sm-only">最低工资</th>
											<th class="table-author">最高工资</th>
											<%--<th class="table-author">工作描述</th>--%>
											<th class="table-author am-hide-sm-only">资格</th>
											<th class="table-date am-hide-sm-only">发布时间</th>
											<th class="table-td-set-now">操作</th>
										</tr>
									</thead>
									<tbody id="tbody">

									</tbody>
								</table>
								<div class="am-cf">
									本页共 <span id="span_dataRecordCount">15</span> 数据
									<div class="am-fr">
										<ul class="am-pagination">
											<!-- <li class="am-disabled"><span>«</span></li> -->
											<%--<li id="indexpage-span" class="am-disabled"><span class="am-pagination-span"
                                                                                          onclick="tindexPage()">首页</span>
                                        </li>
                                        <li class="am-active"><span class="am-pagination-span forward-page"
                                                                    onclick="forwardPage(this)">1</span></li>
                                        <li><span class="am-pagination-span forward-page"
                                                  onclick="forwardPage(this)">2</span></li>
                                        <li><span class="am-pagination-span forward-page"
                                                  onclick="forwardPage(this)">3</span></li>
                                        <!-- <li><span>1</span></li>
                                        <li><span>1</span></li>-->
                                        <!--<li><span >»</span></li>-->
                                        <li id="endPage-span"><span class="am-pagination-span"
                                                                    onclick="tendPage()">尾页</span></li>--%>
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


	<!-- navbar -->
	<a href="admin-offcanvas"
		class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
		data-am-offcanvas="{target: '#admin-offcanvas'}"> <!--<i class="fa fa-bars" aria-hidden="true"></i>-->
	</a>

</body>

</html>

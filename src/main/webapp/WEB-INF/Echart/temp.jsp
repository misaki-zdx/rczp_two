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
    <script src="https://cdn.bootcss.com/echarts/4.2.0-rc.2/echarts-en.common.js"></script>
    <script src="assets/js/jquery-2.1.0.js"></script>
    <style>
        #main {
            width: 600px;
            height: 400px;
        }
    </style>
    <script type="text/javascript">

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

            <li><h4 class="page-title">图表统计</h4></li>
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
                        <li><a href="user"   class="am-cf"> 用户</a></li>
                        <li><a href="recruit"  class="am-cf"> 招聘</a></li>
                        <li><a href="admin"   class="am-cf"> 管理员</a></li>
                        <li><a href="audit"  class="am-cf">审理</a></li>
                        <li><a href="cv"  class="am-cf">简历</a></li>
                        <li><a href="deliverrecord"  class="am-cf">投递</a></li>
                        <li><a href="enterprise"  class="am-cf">企业</a></li>
                        <li><a href="audit"  class="am-cf">审理</a></li>
                        <li><a href="#" class="am-cf"> 基本表格</a></li>
                        <!-- <li><a href="table_complete.html">完整表格</a></li> -->
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
                <%--<div id="main"></div>--%>

                    <!-- 大数据面积图  -->
                    <div class="card-box">
                        <div id="pie3" style="width: 600px;height: 400px;"></div>
                    </div>



                    <!-- 面积图  -->
                    <div class="card-box">
                        <div id="columnar" style="width: 600px;height: 400px;"></div>
                    </div>


                <script type="text/javascript">

                    /*    // 绘制图表
                        echarts.init(document.getElementById('main')).setOption({
                            series: {
                                type: 'pie',
                                data: [
                                    {name: 'A', value: 1212},
                                    {name: 'B', value: 2323},
                                    {name: 'C', value: 1919}
                                ]
                            }
                        });*/

                    /*----------------------柱状图-----------------------*/
                    //折柱混合
                    <%--  (function(){

                        var columnar = echarts.init(document.getElementById("columnar"));
                        var dataypes = new Array();
                            columnar.setOption(option).done(function (data) {
                                $.each(data,function (i,x) {
                                    dataypes.push(x.intention)
                                })
                            });

                        var option = {

                            title : {
                                text: "各部门男女年龄分布统计",
                                x: "left"
                            },

                            tooltip: {
                                trigger: 'axis'
                            },
                            toolbox: {
                                feature: {
                                    saveAsImage: {show: true}
                                }
                            },
                            legend: {
                                data:['男','女']
                            },
                            xAxis: [
                                {
                                    type: 'category',
                                    data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
                                }
                            ],
                            yAxis: [
                                {
                                    type: 'value',
                                    name: '数量',
                                    min: 0,
                                    max: 100,
                                    interval: 20,
                                    axisLabel: {
                                        formatter: '{value} 人'
                                    }
                                }],
                            series: [
                                {
                                    name:'男',
                                    type:'bar',
                                    data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]
                                },
                                {
                                    name:'女',
                                    type:'bar',
                                    data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
                                }/*,
                                {
                                    name:'平均温度',
                                    type:'line',
                                    yAxisIndex: 1,
                                    data:[2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3, 23.4, 23.0, 16.5, 12.0, 6.2]
                                }*/
                            ]
                        };

                        columnar4.setOption(option);
                    })();
                --%>


                    //饼状图
                    $(function () {
                        var pie3 = echarts.init(document.getElementById("pie3"));
                        //构造适合此方法的参数
                        $.get('user/test').done(function (data) {
                            //console.log(data)
                            var dataType = new Array();
                            $.each(data, function (i, x) {
                                //console.log(i,x)
                                dataType.push(x.name);
                            });


                            pie3.setOption({
                                title: {
                                    text: '用户意向职位统计',
                                    x: 'center'
                                },
                                tooltip: {
                                    trigger: 'item',
                                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                                },
                                legend: {
                                    orient: 'vertical',
                                    left: 'left',
                                    data:dataType/* [data[0].intention, data[1].intention, data[2].intention, data[3].intention, data[4].intention]*/
                                },
                                series: [
                                    {
                                        name: '详细数据',
                                        type: 'pie',
                                        radius: '55%',
                                        center: ['50%', '60%'],
                                        data:data/* [
                            {value: data[0].COUNT, name: data[0].intention},
                            {value: data[1].COUNT, name: data[1].intention},
                            {value: data[2].COUNT, name: data[2].intention},
                            {value: data[3].COUNT, name: data[3].intention},
                            {value: data[4].COUNT, name: data[4].intention}
                        ]*/,
                                        itemStyle: {
                                            emphasis: {
                                                shadowBlur: 10,
                                                shadowOffsetX: 0,
                                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                                            }
                                        }
                                    }
                                ]
                            })
                        })

                    })

                </script>
                <!-- Row end -->
            </div>
        </div>
    </div>
</div>
<!-- end right Content here -->
<!--</div>-->

</body>

</html>


<%@ page import="com.sccc.rczp.bean.po.User" %><%--
  Created by IntelliJ IDEA.
  User: Misaki
  Date: 2018/11/18
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
    <base href="<%=basePath%>">
    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/fav.png">
    <!-- Author Meta -->
    <meta name="author" content="codepixer">
    <!-- Meta Description -->
    <meta name="description" content="">
    <!-- Meta Keyword -->
    <meta name="keywords" content="">
    <!-- meta character set -->
    <meta charset="UTF-8">
    <!-- Site Title -->
    <title>Job Listing</title>

    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet">
    <!--
    CSS
    ============================================= -->
    <link rel="stylesheet" href="css/linearicons.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/animate.min.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .info li {
            width: 60%;
        }
        tr td img{
            width: 30px;
            margin-right: 5px;
        }
    </style>
</head>
<body>

<header id="header">
    <div class="container">
        <div class="row align-items-center justify-content-between d-flex">
            <div id="logo">
                <a href="index.html"><img src="img/logo.png" alt="" title=""/></a>
            </div>
            <nav id="nav-menu-container">
                <ul class="nav-menu">
                    <li class="menu-active"><a href="index">Home</a></li>
                    <li><a href="about-us.html">About Us</a></li>
                    <li><a href="category.html">Category</a></li>
                    <li><a href="price.html">Price</a></li>
                    <li><a href="blog-home.html">Blog</a></li>
                    <li><a href="contact.html">Contact</a></li>
                    <li class="menu-has-children"><a href="">Pages</a>
                        <ul>
                            <li><a href="elements.html">elements</a></li>
                            <li><a href="search.html">search</a></li>
                            <li><a href="single.html">single</a></li>
                        </ul>
                    </li>
                    <%
                        User user = (User) request.getSession().getAttribute("login");
                        if (user != null) {
                    %>
                    <li><a href="index/meDetail/${login.uid}"><%=user.getUname()%>
                    </a></li>
                    <li><a href="index/logout">logout</a></li>
                    <%
                    } else {
                    %>
                    <li><a class="ticker-btn" href="#">Signup</a></li>
                    <li><a class="ticker-btn" href="index/login">Login</a></li>
                    <%
                        }
                    %>
                </ul>
            </nav><!-- #nav-menu-container -->
        </div>
    </div>
</header><!-- #header -->

<!-- start banner Area -->
<section class="banner-area relative" id="home">
    <div class="overlay overlay-bg"></div>
    <div class="container">
        <div class="row d-flex align-items-center justify-content-center">
            <div class="about-content col-lg-12">
                <h1 class="text-white">
                    Me
                </h1>
                <p class="text-white link-nav"><a href="index.html">Home </a> <span class="lnr lnr-arrow-right"></span>
                    <a href="blog-home.html"> Me</a></p>
            </div>
        </div>
    </div>
</section>

<div>

</div>
<!-- End banner Area -->

<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief" style="height: 500px;">
    <ul class="layui-tab-title">
        <li class="layui-this">个人信息</li>
        <li>投递记录</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <ul class="info">
                <li style="width:550px; height:400px;margin-right: 16px"><img src="${user.uimage}" width="500px" height="350px"></li>
                <li><span class="first-block">ID:</span><span class="second-block">${user.uid}</span></li>
                <li><span class="first-block">姓名:</span><span class="second-block">${user.uname}</span></li>
                <li><span class="first-block">性别:</span><span class="second-block">${user.sex}</span></li>
                <li><span class="first-block">生日:</span><span class="second-block" id="birthday">${user.birthday}</span>
                </li>
                <li><span class="first-block">意向:</span><span class="second-block">${user.intention}</span>
                <li><span class="first-block">简介:</span><span class="second-block">${user.uabstract}</span>
                </li>
            </ul>

        </div>
        <div class="layui-tab-item">
            <div class="layui-form">
                 <table class="layui-table">
                    <colgroup>
                        <col width="200">
                        <col width="200">
                        <col width="150">
                        <col>
                    </colgroup>
                    <thead>
                    <tr>
                        <th>招聘名称</th>
                        <th>提交时间</th>
                        <th>状态</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="deliver" items="${user.deliverrecord}">
                        <tr>
                            <td>${deliver.recruitinformation.title}</td>
                            <td class="dtime">${deliver.dtime}</td>
                            <td><img src="" class="status_img"><span class="status_content">${deliver.passflag}</span></td>

                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="js/vendor/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="js/vendor/bootstrap.min.js"></script>
<%--<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>--%>
<script src="js/easing.min.js"></script>
<script src="js/hoverIntent.js"></script>
<script src="js/superfish.min.js"></script>
<script src="js/jquery.ajaxchimp.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.sticky.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/parallax.min.js"></script>
<script src="js/mail-script.js"></script>
<script src="js/main.js"></script>
<script src="layui/layui.all.js"></script>
<script src="js/MyCommonJs.js"></script>
<script>
    $(function () {

        var var1 = $('.dtime');
        $.each(var1, function (x, y) {
            //console.log(y.innerHTML)
            var1[x].innerHTML = convertDateTimeStamp(y.innerHTML);
        })

        var var2 = $('.status_content');
        var var5 = $('.status_img');
        //console.log(var5);
        // 0:：已投递  1：投递通过 ，等待面试
        $.each(var2, function (x, y) {
            var var3 = y.innerHTML;
            if (var3 == '0') {
                var2[x].innerHTML = '已投递'
                $(var5[x]).attr("src","svg/0.svg")
            } else if (var3 == '1') {
                $(var5[x]).attr("src","svg/1.svg")
                var2[x].innerHTML = '投递通过，等待通知'
            }
        })

        var var4 = document.getElementById("birthday");
        //console.log(var4.innerText)
       var4.innerHTML = convertDateBirthday(var4.innerHTML);
    });
</script>
</body>
</html>

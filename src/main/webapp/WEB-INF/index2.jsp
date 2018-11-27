<%@ page import="com.sccc.rczp.bean.po.User" %><%--
  Created by IntelliJ IDEA.
  User: Misaki
  Date: 2018/11/18
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
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
    <style>
        .thumb {
            margin-right: 20px;
        }

        .local-a-btns {
            background-color: #49e4fa;
            color: #fff;
            border: 1px solid transparent;
            display: inline-block;
            margin-top: 10px;
            padding: 10px 25px;
            -webkit-transition: all 0.3s ease 0s;
            -moz-transition: all 0.3s ease 0s;
            -o-transition: all 0.3s ease 0s;
            transition: all 0.3s ease 0s;
        }

        .local-a-btns:hover {
            background-color: #fff;
            color: #49e4fa;
            border: solid 1px #49e4fa;
        }
    </style>
</head>
<body>

<header id="header" id="home">
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
<section class="banner-area relative" id="home2">
    <div class="overlay overlay-bg"></div>
    <div class="container">
        <div class="row fullscreen d-flex align-items-center justify-content-center">
            <div class="banner-content col-lg-12">
                <h1 class="text-white">
                    上周发布了<span id="span-preWeekCount">1500+</span> 个新职位
                </h1>
                <form action="" class="serach-form-area" id="searchForm">
                    <div class="row justify-content-center form-wrap">
                        <div class="col-lg-4 form-cols">
                            <input type="text" class="form-control" name="work" placeholder="你在找什么!?">
                        </div>
                        <div class="col-lg-3 form-cols">
                            <div class="default-select" id="default-selects">
                                <select name="path">
                                    <option value="成都">成都</option>
                                    <option value="北京">北京</option>
                                    <option value="上海">上海</option>
                                    <option value="广州">广州</option>
                                    <option value="深圳">深圳</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-2 form-cols">
                            <button type="button" class="btn btn-info" id="btn-search">
                                <span class="lnr lnr-magnifier"></span> Search
                            </button>
                        </div>
                    </div>
                </form>
                <p class="text-white"><span>按标签搜索:</span> Tecnology, Business, Consulting, IT Company, Design,
                    Development等，都还不行，完善中！</p>
            </div>
        </div>
    </div>
</section>
<!-- End banner Area -->

<!-- Start features Area -->
<section class="features-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="single-feature">
                    <h4>搜索</h4>
                    <p>
                        本页面能尽量提供你需要要的查询
                    </p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="single-feature">
                    <h4>应用</h4>
                    <p>
                        请到官网下载正版app
                    </p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="single-feature">
                    <h4>安全</h4>
                    <p>
                        本页面能百分百的保护你的个人信息不会泄露，请不要相信短信的内容
                    </p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="single-feature">
                    <h4>通知</h4>
                    <p>
                        腾讯紧急聘用******
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End features Area -->

<!-- Start popular-post Area -->
<section class="popular-post-area pt-100">
    <div class="container">
        <div class="row align-items-center">
            <div class="active-popular-post-carusel">
            </div>
        </div>
    </div>
</section>
<!-- End popular-post Area -->

<!-- Start feature-cat Area -->
<section class="feature-cat-area pt-100" id="category">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="menu-content pb-60 col-lg-10">
                <div class="title text-center">
                    <h1 class="mb-10">推荐职位类别</h1>
                    <p>不知道选什么</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat">
                    <a href="category.html">
                        <img src="img/o1.png" alt="">
                    </a>
                    <p>安全</p>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat">
                    <a href="category.html">
                        <img src="img/o2.png" alt="">
                    </a>
                    <p>发展</p>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat">
                    <a href="category.html">
                        <img src="img/o3.png" alt="">
                    </a>
                    <p>软件技术</p>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat">
                    <a href="category.html">
                        <img src="img/o4.png" alt="">
                    </a>
                    <p>新闻媒体</p>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat">
                    <a href="category.html">
                        <img src="img/o5.png" alt="">
                    </a>
                    <p>医疗</p>
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="single-fcat">
                    <a href="category.html">
                        <img src="img/o6.png" alt="">
                    </a>
                    <p>电子政务</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End feature-cat Area -->
<div class="tlinks">Collect from <a href="http://www.cssmoban.com/" title="网站模板">网站模板</a></div>

<!-- Start post Area -->
<section class="post-area section-gap">
    <div class="container" id="container1">
        <div class="row justify-content-center d-flex">

            <div class="col-lg-8 post-list">
                <ul class="cat-list">
                    <li><a href="#">最新发布</a></li>
                </ul>
                <div id="newJob">
                </div>
                <a class="text-uppercase loadmore-btn mx-auto d-block" href="category.html">加载更多</a>

            </div>
            <div class="col-lg-4 sidebar">
                <div class="single-slidebar" id="byLocation">
                    <h4>按工作的位置</h4>
                    <ul class="cat-list">
                        <%-- <li><a class="justify-content-between d-flex" href="category.html"><p>New York</p><span>37</span></a></li>--%>
                    </ul>
                </div>

                <div class="single-slidebar">
                    <h4>推荐职位</h4>
                    <div class="active-relatedjob-carusel">

                        <div class="single-rated">
                            <img class="img-fluid" src="img/r1.jpg" alt="">
                            <a href="single.html" class="detailJob_url"><h4 class="Recommendtitle"></h4></a>
                            <h6>Premium Labels Limited </h6>
                            <p class="Recommenddes">

                            </p>
                            <h5>工作性质: 全日制</h5>
                            <p class="address Recommendbenefit"><span class="lnr lnr-map"></span> 56/8, Panthapath
                                Dhanmondi Dhaka</p>
                            <p class="address Recommendsalary"><span class="lnr lnr-database"></span></p>
                            <a href="#" class="apply_job btns text-uppercase">申请工作</a>
                        </div>

                        <div class="single-rated">
                            <img class="img-fluid" src="img/r1.jpg" alt="">
                            <a href="single.html" class="detailJob_url"><h4 class="Recommendtitle"></h4></a>
                            <h6>Premium Labels Limited </h6>
                            <p class="Recommenddes">

                            </p>
                            <h5>工作性质: 全日制</h5>
                            <p class="address Recommendbenefit"><span class="lnr lnr-map"></span> 56/8, Panthapath
                                Dhanmondi Dhaka</p>
                            <p class="address Recommendsalary"><span class="lnr lnr-database"></span></p>
                            <a href="#" class=" apply_job btns text-uppercase">申请工作</a>
                        </div>

                        <div class="single-rated">
                            <img class="img-fluid" src="img/r1.jpg" alt="">
                            <a href="single.html" class="detailJob_url"><h4 class="Recommendtitle"></h4></a>
                            <h6>Premium Labels Limited </h6>
                            <p class="Recommenddes">

                            </p>
                            <h5>工作性质： 全日制</h5>
                            <p class="address Recommendbenefit"><span class="lnr lnr-map"></span> 56/8, Panthapath
                                Dhanmondi Dhaka</p>
                            <p class="address Recommendsalary"><span class="lnr lnr-database"></span></p>
                            <a href="#" class="apply_job btns text-uppercase">申请工作</a>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>
    </div>
</section>
<!-- End post Area -->

<!-- start footer Area -->
<footer class="footer-area section-gap">
    <div class="container">
        <div class="row">
            <div class="col-lg-3  col-md-12">
                <div class="single-footer-widget">
                    <h6>Top Products</h6>
                    <ul class="footer-nav">
                        <li><a href="#">Managed Website</a></li>
                        <li><a href="#">Manage Reputation</a></li>
                        <li><a href="#">Power Tools</a></li>
                        <li><a href="#">Marketing Service</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-6  col-md-12">
                <div class="single-footer-widget newsletter">
                    <h6>Newsletter</h6>
                    <p>You can trust us. we only send promo offers, not a single spam.</p>
                    <div id="mc_embed_signup">
                        <form target="_blank" novalidate
                              action="#/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get"
                              class="form-inline">

                            <div class="form-group row" style="width: 100%">
                                <div class="col-lg-8 col-md-12">
                                    <input name="EMAIL" placeholder="Enter Email" onfocus="this.placeholder = ''"
                                           onblur="this.placeholder = 'Enter Email '" required="" type="email">
                                    <div style="position: absolute; left: -5000px;">
                                        <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value=""
                                               type="text">
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-12">
                                    <button class="nw-btn primary-btn">Subscribe<span
                                            class="lnr lnr-arrow-right"></span></button>
                                </div>
                            </div>
                            <div class="info"></div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-3  col-md-12">
                <div class="single-footer-widget mail-chimp">
                    <h6 class="mb-20">Instragram Feed</h6>
                    <ul class="instafeed d-flex flex-wrap">
                        <li><img src="img/i1.jpg" alt=""></li>
                        <li><img src="img/i2.jpg" alt=""></li>
                        <li><img src="img/i3.jpg" alt=""></li>
                        <li><img src="img/i4.jpg" alt=""></li>
                        <li><img src="img/i5.jpg" alt=""></li>
                        <li><img src="img/i6.jpg" alt=""></li>
                        <li><img src="img/i7.jpg" alt=""></li>
                        <li><img src="img/i8.jpg" alt=""></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="row footer-bottom d-flex justify-content-between">
            <p class="col-lg-8 col-sm-12 footer-text m-0 text-white">

                Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                All rights reserved | made with Colorlib - More Templates

            </p>
            <div class="col-lg-4 col-sm-12 footer-social">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-dribbble"></i></a>
                <a href="#"><i class="fa fa-behance"></i></a>
            </div>
        </div>
    </div>
</footer>
<!-- End footer Area -->

<script src="js/vendor/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="js/vendor/bootstrap.min.js"></script>

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
<script src="js/MyCommonJs.js"></script>
<!--自定义js -->
<script type="text/javascript">

    $(function () {
        $.ajax({
            url: 'user/indexContent',
            type: 'get',
            //data:{"uid":uid},
            success: function (data) {
                //console.log(data)
                //console.log("success")
                intiView(data);
                //initView3(data.recommend);
                localBindCss();
                //js写法
                // $('#span-preWeekCount').innerHTML =data.preWeekCount;
                //jq写法
                $('#span-preWeekCount').html(data.preWeekCount);
            },
            error: function () {
                console.log("error")
            }
        })

        //添加搜索事件
        $('#btn-search').click(function () {
            search();
        });

    })

    var div1 = $('#newJob');
    var Recomendtitle = $('.Recommendtitle');
    var Recommenddes = $('.Recommenddes');
    var Recommendbenefit = $('.Recommendbenefit');
    var Recommendsalary = $('.Recommendsalary');
    var detailJob_url = $('.detailJob_url');
    var apply_job = $('.apply_job');
  /*  var RecommendList = [];
    RecommendList.push(Recomendtitle);
    RecommendList.push(Recommenddes);
    RecommendList.push(Recommendbenefit);
    RecommendList.push(Recommendsalary);
    RecommendList.push(detailJob_url);
    RecommendList.push(apply_job);
    console.log(RecommendList)*/

    function intiView(data) {
        //console.log(data.newTime[0].job)      //通过 传递json
        var div2 = $('#byLocation');
        //console.log(data);
        div2.html('');
        div1.html("");
        var str = '';
        /* var jobDetailUrl = $('.jobDetailUrl');
         console.log(jobDetailUrl);
         var jobTitleUrl = $('.jobTitleUrl');
         var jobPath = $('.jobPath');
         var jobdes = $('.jobdes');
         */
        $.each(data.newTime, function (x, y) {
            /*$(jobDetailUrl[x]).attr('href','index/jobDeatil/'+y.rid);
            $(jobTitleUrl[x]).attr('href','index/jobDeatil/'+y.rid);
            jobPath[x].innerHTML = y.path;
            jobdes[x].innerHTML = y.jobdes;*/
           // console.log(x + " :" + y);
            str += '<div class="single-post d-flex flex-row">' +
                '                <div class="thumb">' +
                '                    <img src="img/post.png" alt="">' +
                '                    <ul class="tags"><li>' +
                '                            <a href="#">' + y.job + '</a>' +
                '                        </li>' +
                '                    </ul>' +
                '                </div>' +
                '                <div class="details">' +
                '                    <div class="title d-flex flex-row justify-content-between">' +
                '                        <div class="titles">' +
                '                            <a href="index/detailJob/' + y.rid + '"><h4>' + y.title + '</h4></a>' +
                '                            <h6>Premium Labels Limited</h6>' +
                '                        </div>' +
                '                        <ul class="btns">' +
                /* '                            <li><a href="#"><span class="lnr lnr-heart"></span></a></li>' +
                 '                            <li><a href="#">应用</a></li>' +*/
                '                        </ul>' +
                '                    </div>' +
                '                    <p>' + y.jobdes + '</p>' +
                '                    <h5>工作地址：' + y.path + '</h5>' +
                '                    <p class="address"><span class="lnr lnr-map"></span> 福利: ' + y.benefit + '</p>' +
                '                    <p class="address"><span class="lnr lnr-database"></span> ' + y.salaryMin / 1000 + 'k - ' + y.salaryMax / 1000 + 'k</p> <a href="index/applyJob?rid=' + y.rid + '" class="apply_job1">申请工作</a>' +
                '                </div>' +
                '            </div>';
        });
        initView3(data.recommend,data.newTime);
        div1.append(str);
        //div3.append(str3);
        str = '<h4>按工作的位置</h4><ul class="cat-list" >';
        $.each(data.groupByJob, function (x, y) {
            str += '<li><a class="justify-content-between d-flex" href="category.html"><p>' + y.job + '</p><span>' + y.COUNT + '</span></a></li>';
        });
        //console.log(str)
        div2.append(str + '</ul>');
    }

    function initView2(data) {
        var str = '';
        div1.html("");
        $.each(data, function (x, y) {
            str += '<div class="single-post d-flex flex-row">' +
                '                <div class="thumb">' +
                '                    <img src="img/post.png" alt="">' +
                '                    <ul class="tags"><li>' +
                '                            <a href="index/detailJob/' + y.rid + '">' + y.job + '</a>' +
                '                        </li>' +
                '                    </ul>' +
                '                </div>' +
                '                <div class="details">' +
                '                    <div class="title d-flex flex-row justify-content-between">' +
                '                        <div class="titles">' +
                '                            <a href="index/detailJob/' + y.rid + '"><h4>' + y.title + '</h4></a>' +
                '                            <h6>Premium Labels Limited</h6>' +
                '                        </div>' +
                '                        <ul class="btns">' +
                /* '                            <li><a href="#"><span class="lnr lnr-heart"></span></a></li>' +
                 '                            <li><a href="#">应用</a></li>' +*/
                '                        </ul>' +
                '                    </div>' +
                '                    <p>' + y.jobdes + '</p>' +
                '                    <h5>工作地址：' + y.path + '</h5>' +
                '                    <p class="address"><span class="lnr lnr-map"></span> 福利: ' + y.benefit + '</p>' +
                '                    <p class="address"><span class="lnr lnr-database"></span>   ' + y.salarymin / 1000 + 'k-' + y.salarymax / 1000 + 'k</p> <a href="index/applyJob?rid=' + y.rid + '" class="apply_job1">申请工作</a>' +
                '                </div>' +
                '            </div>';
        });
        div1.append(str);
    }


    //搜索按钮搜索方法
    function search() {
        var serialize = $('#searchForm').serialize();
        serialize = decodeURIComponent(serialize, true);
        //console.log(serialize);
        $.ajax({
            url: 'recruit/searchWork?' + serialize,
            success: function (data) {
                //console.log(data)
                initView2(data);
                localBindCss();
                window.location.href = "#container1";
            },
            error: function () {
                console.log("error")
            }
        })
    }

    function localBindCss() {
        bindCss('apply_job1', 'class', 'local-a-btns');
    }

    function initView3(data,data2) {
        var count = 0;
        if(data != null) {
            recommedEach(data, count);
            //console.log(data.length)
            //不止一次中招。。。。each中的参数只在此函数内有效  不能作为全局变量
            recommedEach(data2, count + data.length);
        }else {
            recommedEach(data2,count)
        }
    }
    function recommedEach(data,count) {
        //console.log(data)
        $.each(data, function (x, y) {
            if (count < 3) {
                Recomendtitle[count].innerHTML = y.title;
                Recommenddes[count].innerHTML = y.jobdes;
                Recommendbenefit[count].innerHTML = '福利：' + y.benefit;
                Recommendsalary[count].innerHTML = '<span class="lnr lnr-database"></span>   ' + y.salaryMin / 1000 + 'k - ' + y.salaryMax / 1000 + 'k';
                $(detailJob_url[count]).attr('href', 'index/detailJob/' + y.rid);
                $(apply_job[count]).attr("href", 'index/applyJob?rid=' + y.rid)
                count++;
            } else {
                return false;
            }
        })
    }

</script>
</body>
</html>

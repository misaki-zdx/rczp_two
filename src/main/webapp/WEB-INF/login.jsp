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
    <link rel="shortcut icon" href="img/elements/fav.png">
    <!-- Author Meta -->
    <meta name="author" content="colorlib">
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
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="layui/css/layui.css">
    <style>
        .layui-form-radio>i:hover, .layui-form-radioed>i {
             color: #49e4fa;
        }

        .layui-input-block{
            margin-left: 0;
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
                    <li><a class="ticker-btn" href="#">Signup</a></li>
                    <li><a class="ticker-btn" href="index/login">Login</a></li>
                </ul>
            </nav><!-- #nav-menu-container -->
        </div>
    </div>
</header><!-- #header -->

<!-- start banner Area -->
<section class="banner-area relative" id="home1">
    <div class="overlay overlay-bg"></div>
    <div class="container">
        <div class="row d-flex align-items-center justify-content-center">
            <div class="about-content col-lg-12">
                <h1 class="text-white">
                    登陆
                </h1>
                <p class="text-white link-nav"><a href="index.html">低谷 </a> <span class="lnr lnr-arrow-right"></span> <a
                        href="elements.html"> 巅峰</a></p>
            </div>
        </div>
    </div>
</section>
<!-- End banner Area -->

<!-- Start Align Area -->
<div class="whole-wrap">
    <div class="container">
        <div class="section-top-border">
            <div class="row">
                <div class="col-lg-8 col-md-8" style="margin: auto 196px;">
                    <h3 class="mb-30">登陆</h3>
                  <%--  <form action="" id="login-form">--%>
                    <form class="layui-form" action="" id="login-form">
                        <div class="mt-10">
                            <ul class="unordered-list">
                                <li>账号</li>
                            </ul>
                            <input type="text" name="rid" placeholder="账号"
                                   onfocus="this.placeholder = ''"
                                   onblur="this.placeholder = '账号'" required class="single-input">
                        </div>
                        <div class="mt-10">
                            <ul class="unordered-list">
                                <li>密码</li>
                            </ul>
                            <input type="password" name="upassword" placeholder="密码"
                                   onfocus="this.placeholder = ''"
                                   onblur="this.placeholder = '密码'" required class="single-input">
                        </div>

                        <div class="mt-10">
                            <div class="layui-form-item">
                                <%--<label class="layui-form-label">你的身份</label>--%>
                                <div class="layui-input-block">
                                    <input type="radio" name="enterpriseORuser" value="1" title="用户" checked="">
                                    <input type="radio" name="enterpriseORuser" value="0" title="企业" >
                                </div>
                            </div>
                        </div>

                        <div class="mt-10">
                            <!-- <button class="genric-btn primary radius">登陆</button> -->
                            <input id="btn-login" class="genric-btn primary radius" type="button"
                                   value="登陆"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Align Area -->

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
                        <form target="_blank" novalidate="true"
                              action="#/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                              method="get"
                              class="form-inline">

                            <div class="form-group row" style="width: 100%">
                                <div class="col-lg-8 col-md-12">
                                    <input name="EMAIL" placeholder="Enter Email"
                                           onfocus="this.placeholder = ''"
                                           onblur="this.placeholder = 'Enter Email '" required="" type="email">
                                    <div style="position: absolute; left: -5000px;">
                                        <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1"
                                               value=""
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
                All rights reserved | made with Colorlib - More Templates <a href="http://www.cssmoban.com/"
                                                                             target="_blank"
                                                                             title="模板之家">模板之家</a> -
                Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>

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
<script type="text/javascript"></script>
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
<script src="layui/layui.js"></script>
<%--<script src="js/layuiCommod.js"></script>--%>

<script type="text/javascript">
    layui.use(['layer', 'form', 'element'], function () {
        var layer = layui.layer
            , form = layui.form
            , element = layui.element

        //……
        //你的代码都应该写在这里面
        $(function () {
         /* $('input').blur(function () {
              if($(this).val() == ""){
                  layer.msg($(this).attr('placeholder')+'不能为空')
                  //$(this).focus()
              }
          })*/
            $('#btn-login').click(function () {
                if( check()) {
                    $.ajax({
                        url: 'index/loginx',
                        data: $("#login-form").serialize(),
                        success: function (data) {
                            console.log("success" + ";" + data)
                            if (data == 0) {
                                layer.msg("登陆成功");
                                window.location.href = 'index';
                            }
                            if (data == 1) {
                                layer.msg("登陆失败,请检查账号或者密码");
                            }
                        },
                        error: function () {

                            console.log("error")
                        }
                    })
                }
            })

        })
        element.init();
       form.render();
       function  check() {
           var selector = $('input');
           console.log(selector)
           var flag =true;
           $.each(selector,function (x,y) {
                        if(x == '2'){
                            return false;
                        }
                        if($(y).val() == ''){
                            //console.log(y)
                            layer.msg($(y).attr('placeholder')+'不能为空')
                            $(this).focus()
                            flag = false;
                            return false;
                        }
           })
           return flag;
       }
    })


</script>
</body>
</html>
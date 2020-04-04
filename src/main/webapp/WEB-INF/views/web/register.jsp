<%@include file="/common/taglib.jsp" %>
<%@page import="com.nhom8.camera.util.SecurityUtil" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link href="<c:url value="/template/web/css/bootstrap.css"/>" rel="stylesheet" type="text/css" media="all"/>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="<c:url value="/template/web/css/style.css"/>" rel="stylesheet" type="text/css" media="all"/>
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Shopping Responsive web template"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!--theme-style-->
    <link href="<c:url value="/template/web/css/style4.css"/>" rel="stylesheet" type="text/css" media="all"/>
    <!--//theme-style-->
    <script src="<c:url value="/template/web/js/jquery.min.js"/>"></script>
    <!--- start-rate---->
    <script src="<c:url value="/template/web/js/jstarbox.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/template/web/css/jstarbox.css"/>" type="text/css" media="screen"
          charset="utf-8"/>
</head>
<body>
<!-- header -->
<div class="header">
    <div class="container">
        <div class="head">
            <div class=" logo">
                <a href="<c:url value="/index"/>"><img src="<c:url value="/template/web/images/logo.png"/>" alt=""></a>
            </div>
        </div>
    </div>
    <div class="header-top">
        <div class="container">
            <div class="col-sm-5 col-md-offset-2  header-login">
                <ul>
                    <li><a href="<c:url value="/login" />">Login</a></li>
                    <li><a href="<c:url value="/register"/>">Register</a></li>

                </ul>
            </div>

            <div class="col-sm-5 header-social">
                <ul>
                    <li><a href="<c:url value="/logout" />">
                        Xin chào <%=SecurityUtil.getUserName()%>
                    </a></li>
                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>

    <div class="container">

        <div class="head-top">

            <div class="col-sm-8 col-md-offset-2 h_menu4">
                <nav class="navbar nav_bottom" role="navigation">

                    <!-- Brand and toggle get grouped for better mobile display -->
                    <%--                    <div class="navbar-header nav_2">--%>
                    <%--                        <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse"--%>
                    <%--                                data-target="#bs-megadropdown-tabs">--%>
                    <%--                            <span class="sr-only">Toggle navigation</span>--%>
                    <%--                            <span class="icon-bar"></span>--%>
                    <%--                            <span class="icon-bar"></span>--%>
                    <%--                            <span class="icon-bar"></span>--%>
                    <%--                        </button>--%>

                    <%--                    </div>--%>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                        <ul class="nav navbar-nav nav_1">
                            <li><a class="color" href="<c:url value="/home"/>">Home</a></li>
                            <li class="dropdown mega-dropdown active">
                                <a class="color1" href="#" class="dropdown-toggle" data-toggle="dropdown">Brand<span
                                        class="caret"></span></a>
                                <div class="dropdown-menu ">
                                    <div class="menu-top">
                                        <div class="col1">
                                            <div class="h_nav">
                                                <c:forEach items="${lstProductBranch}" var="branchs">
                                                    <ul>
                                                        <li>
                                                            <a href="<c:url value="/product/branchId=${branchs.id}"/>">${branchs.name}</a>
                                                        </li>

                                                    </ul>
                                                </c:forEach>
                                            </div>
                                        </div>

                                        <%--                                        <div class="col1 col5">--%>
                                        <%--                                            <img src="<c:url value="/template/web/images/me.png"/>"--%>
                                        <%--                                                 class="img-responsive" alt="">--%>
                                        <%--                                        </div>--%>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </li>
                            <li><a class="color4" href="<c:url value="/404"/>">About</a></li>
                            <li><a class="color6" href="<c:url value="/contact"/>">Contact</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->

                </nav>
            </div>
            <div class="col-sm-2 search-right">
                <%--                <ul class="heart">--%>
                <%--                    <li>--%>
                <%--                        <a href="<c:url value="/wishlist"/>">--%>
                <%--                            <span class="glyphicon glyphicon-heart" aria-hidden="true"></span>--%>
                <%--                        </a></li>--%>
                <%--                    <li><a class="play-icon popup-with-zoom-anim" href="#small-dialog"><i--%>
                <%--                            class="glyphicon glyphicon-search"> </i></a></li>--%>
                <%--                </ul>--%>
                <div class="cart box_1">
                    <a href="<c:url value="/checkout"/>">
                        <h3>
                            <div class="total">
                                <span>${sessionScope.myCartItems.size()}</span></div>
                            <img src="<c:url value="/template/web/images/cart.png"/>" alt=""/></h3>
                    </a>
                    <p><a href="javascript:;" class="simpleCart_empty">Empty Cart</a></p>
                </div>
                <div class="clearfix"></div>

                <!----->

                <!---pop-up-box---->
                <link href="<c:url value="/template/web/css/popuo-box.css"/>" rel="stylesheet" type="text/css"
                      media="all"/>
                <script src="<c:url value="/template/web/js/jquery.magnific-popup.js"/>"
                        type="text/javascript"></script>
                <!---//pop-up-box---->
                <%--                <div id="small-dialog" class="mfp-hide">--%>
                <%--                    <div class="search-top">--%>
                <%--                        <div class="login-search">--%>
                <%--                            <input type="submit" value="">--%>
                <%--                            <input type="text" value="Search.." onfocus="this.value = '';"--%>
                <%--                                   onblur="if (this.value == '') {this.value = 'Search..';}">--%>
                <%--                        </div>--%>
                <%--                        <p>Shopin</p>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
                <%--                <script>--%>
                <%--                    $(document).ready(function () {--%>
                <%--                        $('.popup-with-zoom-anim').magnificPopup({--%>
                <%--                            type: 'inline',--%>
                <%--                            fixedContentPos: false,--%>
                <%--                            fixedBgPos: true,--%>
                <%--                            overflowY: 'auto',--%>
                <%--                            closeBtnInside: true,--%>
                <%--                            preloader: false,--%>
                <%--                            midClick: true,--%>
                <%--                            removalDelay: 300,--%>
                <%--                            mainClass: 'my-mfp-zoom-in'--%>
                <%--                        });--%>

                <%--                    });--%>
                <%--                </script>--%>
                <!----->
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- header -->

<!--login-->
<div class="container">
    <div class="login">
        <form:form action="/register" modelAttribute="userRegister" method="POST">
            <div class="col-md-6 login-do">
                <div class="login-mail">
                    Full name
                    <input type="text" name="fullName" required="true" placeholder="Full name">
                    <i class="glyphicon "></i>
                </div>
                <div class="login-mail">
                    User name
                    <input type="text" name="userName" required="true" placeholder="User name">
                    <i class="glyphicon "></i>
                </div>
                <div class="login-mail">
                    Email
                    <input type="text" name="email" required="true" placeholder="Email">
                    <i class="glyphicon "></i>
                </div>
                <div class="login-mail">
                    Phone
                    <input type="text" name="phone" required="true" placeholder="Phone">
                    <i class="glyphicon "></i>
                </div>
                <div class="login-mail">
                    Password
                    <input type="password" name="password" required="true" placeholder="Password">
                    <i class="glyphicon "></i>
                </div>
                    <%--				   <a class="news-letter " href="#">--%>
                    <%--						 <label class="checkbox1"><input type="checkbox" name="checkbox" ><i> </i>Forget Password</label>--%>
                    <%--					   </a>--%>
                <label class="hvr-skew-backward">
                    <input type="submit" value="Submit">
                </label>

            </div>
            <div class="col-md-6 login-right">
                <h3>Completely Free Account</h3>

                <p></p>
                <a href="<c:url value="/login"/>" class="hvr-skew-backward">Login</a>

            </div>

            <div class="clearfix"></div>
        </form:form>
    </div>

</div>

<!--//login-->

<!--brand-->
<div class="container">
    <div class="brand">
        <div class="col-md-3 brand-grid">
            <img src="<c:url value="/template/web/images/ic.png"/>" class="img-responsive" alt="">
        </div>
        <div class="col-md-3 brand-grid">
            <img src="<c:url value="/template/web/images/ic1.png"/>" class="img-responsive" alt="">
        </div>
        <div class="col-md-3 brand-grid">
            <img src="<c:url value="/template/web/images/ic2.png"/>" class="img-responsive" alt="">
        </div>
        <div class="col-md-3 brand-grid">
            <img src="<c:url value="/template/web/images/ic3.png"/>" class="img-responsive" alt="">
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!--//brand-->

<!--//content-->
<!--//footer-->
<%@ include file="/common/web/footer.jsp" %>
<!--//footer-->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

<script src="<c:url value="/template/web/js/simpleCart.min.js"/>"></script>
<!-- slide -->
<script src="<c:url value="/template/web/js/bootstrap.min.js"/>"></script>

</body>
</html>
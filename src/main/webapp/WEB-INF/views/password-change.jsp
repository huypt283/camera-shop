<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.nhom8.camera.util.SecurityUtil" %>
<!DOCTYPE html>
<html>
<head>
    <title>Shopin A Ecommerce Category Flat Bootstrap Responsive Website Template | 404 :: w3layouts</title>
    <link href="<c:url value="/template/web/css/bootstrap.css"/>" rel="stylesheet" type="text/css" media="all"/>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="<c:url value="/template/web/css/style.css"/>" rel="stylesheet" type="text/css" media="all"/>
    <link href="<c:url value="/template/web/css/style4.css"/>" rel="stylesheet" type="text/css" media="all"/>
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Camera"/>

    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <script src="<c:url value="/template/web/js/jquery.min.js"/>"></script>

</head>
<body>
<c:set var="userNameCheck" value="<%=SecurityUtil.getUserName()%>"/>
<!--header-->
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
                    <c:if test="${userNameCheck == 'anonymousUser'}">
                        <li><a href="<c:url value="/register"/>">Register</a></li>
                    </c:if>
                    <c:if test="${userNameCheck != 'anonymousUser'}">
                        <li><a href="<c:url value="/edit-profile"/>">Edit profile</a></li>
                        <li><a href="<c:url value="/change-password"/>">Change password</a></li>
                    </c:if>
                </ul>
            </div>

            <c:if test="${userNameCheck != 'anonymousUser'}">
                <div class="col-sm-5 header-social">
                    <ul>
                        <li style="color: white">
                            Xin chào <%=SecurityUtil.getUserName()%>
                        </li>
                        <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                        <li><a href="<c:url value="/logout"/>" style="color: white; font-size: 15px">Logout</a></li>
                    </ul>
                </div>
            </c:if>
            <c:if test="${userNameCheck == 'anonymousUser'}">
                <div class="col-sm-5 header-social">
                    <ul>
                        <li><a href="<c:url value="/login" />" style="color: white; font-size: 15px">Login</a></li>
                    </ul>
                </div>
            </c:if>
            <div class="clearfix"></div>
        </div>
    </div>

    <div class="container">
        <div class="head-top">
            <div class="col-sm-8 col-md-offset-2 h_menu4">
                <nav class="navbar nav_bottom" role="navigation">
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
                                                <c:forEach items="${lstProductBranch}" var="branch">
                                                    <ul>
                                                        <li>
                                                            <a href="<c:url value="/product?branchId=${branch.id}"/>">${branch.name}</a>
                                                        </li>
                                                    </ul>
                                                </c:forEach>
                                            </div>
                                        </div>

                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </li>
                            <li><a class="color4" href="<c:url value="/info"/>">About</a></li>
                            <li><a class="color6" href="<c:url value="/contact"/>">Contact</a></li>
                        </ul>
                    </div>
                </nav>
            </div>

            <div class="col-sm-2 search-right">
                <ul class="heart">
                    <li><span class="glyphicon " aria-hidden="true"></span></li>
                    <li><a class="play-icon popup-with-zoom-anim" href="<c:url value="#small-dialog"/>"><i
                            class="glyphicon glyphicon-search"> </i></a></li>
                </ul>
                <c:if test="${userNameCheck != 'anonymousUser'}">
                    <div class="cart box_1">
                        <a href="<c:url value="/checkout"/>">
                            <h3>
                                <div class="total" id="total">
                                </div>
                                <img src="<c:url value="/template/web/images/cart.png"/>" alt=""/>
                            </h3>
                        </a>
                        <p><a href="<c:url value="/order-history"/>" class="simpleCart_empty">Order history</a></p>
                    </div>
                </c:if>
                <div class="clearfix"></div>
                <!----->

                <!---pop-up-box---->
                <link href="<c:url value="/template/web/css/popuo-box.css"/>" rel="stylesheet" type="text/css"
                      media="all"/>
                <script src="<c:url value="/template/web/js/jquery.magnific-popup.js"/>"
                        type="text/javascript"></script>
                <div id="small-dialog" class="mfp-hide">
                    <div class="search-top">
                        <div class="login-search">
                            <form:form action="/search" method="POST">
                                <input type="text" name="searchValue" placeholder="Search.." onfocus="this.value = '';"
                                       onblur="if (this.value == '') {this.value = 'Search..';}">
                                <input type="submit" value="">
                            </form:form>
                        </div>
                        <p style="font-size: 10px">Enter the product name or brand name</p>
                    </div>
                </div>
                <script>
                    $(document).ready(function () {
                        $('.popup-with-zoom-anim').magnificPopup({
                            type: 'inline',
                            fixedContentPos: false,
                            fixedBgPos: true,
                            overflowY: 'auto',
                            closeBtnInside: true,
                            preloader: false,
                            midClick: true,
                            removalDelay: 300,
                            mainClass: 'my-mfp-zoom-in'
                        });

                    });
                </script>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!--header-->

<!--banner-->
<div class="container">
    <div class="banner-top">
        <div class="container">
            <h1>Contact</h1>
            <em></em>
            <h2><a href="<c:url value="/"/>">Home</a><label>/</label>Change password</h2>
        </div>
    </div>
</div>
<!--banner-->
<!--login-->
<div class="container">
    <div class="brand">
    </div>
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3">
            <form:form class="form-valide" action="/change-password" method="POST"
                       modelAttribute="changepassword">
                <p><label>Email</label></p>
                <input type="email" class="input-lg form-control" name="email" id="email" placeholder="Enter email.." value="${user.email}" disabled="disabled">
                <p><label>Old password</label></p>
                <input type="password" class="input-lg form-control" name="oldPassword" id="passwordOld"
                       placeholder="Enter old password..">
                <form:errors path="oldPassword" cssStyle="color: red"></form:errors>
                <p><label>New password</label></p>
                <input type="password" class="input-lg form-control" name="password" id="password1"
                       placeholder="Enter new password.." autocomplete="off">
                <form:errors path="password" cssStyle="color: red"></form:errors>
                <div class="row">
                    <div class="col-sm-6">
                        <span id="8char" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> 8 Characters
                        Long<br>
                        <span id="ucase" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> One Uppercase
                        Letter
                    </div>
                    <div class="col-sm-6">
                        <span id="lcase" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> One Lowercase
                        Letter<br>
                        <span id="num" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> One Number
                    </div>
                </div>
                <p><label>Repeat new password</label></p>
                <input type="password" class="input-lg form-control" name="password2" id="password2"
                       placeholder="Enter new password again.." autocomplete="off">
                <div class="row">
                    <div class="col-sm-12">
                        <span id="pwmatch" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> Passwords
                        Match
                    </div>
                </div>
                <input type="submit" class="col-xs-12 btn btn-primary btn-load btn-lg"
                       data-loading-text="Changing Password..." value="Change Password">
            </form:form>
        </div>
    </div>
</div>
<!--//login-->

<!--brand-->
<div class="container">
    <div class="brand">
    </div>
</div>
<div class="container">
    <div class="brand">
        <div class="col-md-3 brand-grid">
            <img src="<c:url value="/template/web/images/nikon.jpg"/>" class="img-responsive" alt="">
        </div>
        <div class="col-md-3 brand-grid">
            <img src="<c:url value="/template/web/images/canon.png"/>" class="img-responsive" alt="">
        </div>
        <div class="col-md-3 brand-grid">
            <img src="<c:url value="/template/web/images/sony.png"/>" class="img-responsive" alt="">
        </div>
        <div class="col-md-3 brand-grid">
            <img src="<c:url value="/template/web/images/panasonic.jpg"/>" class="img-responsive" alt="">
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
<script>
    var baka = shoppingCart.get();
    var maintain = document.getElementById("total");
    var r = document.createElement("span");
    if (baka.length > 0) {
        r.innerHTML = baka.length;
        maintain.appendChild(r);
    } else {
        r.innerHTML = 0;
        maintain.appendChild(r);
    }
</script>
<script>
    $("input[type=password]").keyup(function () {
        var ucase = new RegExp("[A-Z]+");
        var lcase = new RegExp("[a-z]+");
        var num = new RegExp("[0-9]+");

        if ($("#password1").val().length >= 8) {
            $("#8char").removeClass("glyphicon-remove");
            $("#8char").addClass("glyphicon-ok");
            $("#8char").css("color", "#00A41E");
        } else {
            $("#8char").removeClass("glyphicon-ok");
            $("#8char").addClass("glyphicon-remove");
            $("#8char").css("color", "#FF0004");
        }

        if (ucase.test($("#password1").val())) {
            $("#ucase").removeClass("glyphicon-remove");
            $("#ucase").addClass("glyphicon-ok");
            $("#ucase").css("color", "#00A41E");
        } else {
            $("#ucase").removeClass("glyphicon-ok");
            $("#ucase").addClass("glyphicon-remove");
            $("#ucase").css("color", "#FF0004");
        }

        if (lcase.test($("#password1").val())) {
            $("#lcase").removeClass("glyphicon-remove");
            $("#lcase").addClass("glyphicon-ok");
            $("#lcase").css("color", "#00A41E");
        } else {
            $("#lcase").removeClass("glyphicon-ok");
            $("#lcase").addClass("glyphicon-remove");
            $("#lcase").css("color", "#FF0004");
        }

        if (num.test($("#password1").val())) {
            $("#num").removeClass("glyphicon-remove");
            $("#num").addClass("glyphicon-ok");
            $("#num").css("color", "#00A41E");
        } else {
            $("#num").removeClass("glyphicon-ok");
            $("#num").addClass("glyphicon-remove");
            $("#num").css("color", "#FF0004");
        }

        if ($("#password1").val() == $("#password2").val()) {
            $("#pwmatch").removeClass("glyphicon-remove");
            $("#pwmatch").addClass("glyphicon-ok");
            $("#pwmatch").css("color", "#00A41E");
        } else {
            $("#pwmatch").removeClass("glyphicon-ok");
            $("#pwmatch").addClass("glyphicon-remove");
            $("#pwmatch").css("color", "#FF0004");
        }
    });
</script>
</body>
</html>
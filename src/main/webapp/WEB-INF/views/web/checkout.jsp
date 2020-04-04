<%@include file="/common/taglib.jsp" %>
<%@page import="com.nhom8.camera.util.SecurityUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Shopin A Ecommerce Category Flat Bootstrap Responsive Website Template | Checkout :: w3layouts</title>
    <link href="<c:url value="/template/web/css/bootstrap.css"/>" rel="stylesheet" type="text/css" media="all"/>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="<c:url value="/template/web/css/style.css"/>" rel="stylesheet" type="text/css" media="all"/>
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Shopin Responsive web template, Bootstrap Web Templates, Flat Web Templates, AndroId Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"/>
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
<!--header-->

<!--banner-->
<%--<div class="banner-top">--%>
<%--    <div class="container">--%>
<%--        <h1>Checkout</h1>--%>
<%--        <em></em>--%>
<%--        <h2><a href="<c:url value="/home"/>">Home</a><label>/</label>Checkout</h2>--%>
<%--    </div>--%>
<%--</div>--%>
<!--login-->
<script>$(document).ready(function (c) {
    $('.close1').on('click', function (c) {
        $('.cart-header').fadeOut('slow', function (c) {
            $('.cart-header').remove();
        });
    });
});
</script>
<script>$(document).ready(function (c) {
    $('.close2').on('click', function (c) {
        $('.cart-header1').fadeOut('slow', function (c) {
            $('.cart-header1').remove();
        });
    });
});
</script>
<script>$(document).ready(function (c) {
    $('.close3').on('click', function (c) {
        $('.cart-header2').fadeOut('slow', function (c) {
            $('.cart-header2').remove();
        });
    });
});
</script>
<div class="check-out">
    <div class="container">

        <div class="bs-example4" data-example-id="simple-responsive-table">
            <div class="table-responsive">
                <table class="table-heading simpleCart_shelfItem" id="myData">
                    <tr>
                        <th class="table-grid">Item</th>

                        <th>Prices</th>
                        <th>Quanlity</th>
                        <th>Subtotal</th>
                    </tr>


                </table>
            </div>
        </div>
        <div class="produced">
            <a href="<c:url value="/order"/>" class="hvr-skew-backward">Check out</a>
            <a href="${pageContext.request.contextPath}/home" class="hvr-skew-backward">Continue shopphing</a>
        </div>
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
<script src="https://unpkg.com/lodash@4/lodash.min.js"></script>
<script src="https://unpkg.com/lowdb@0.17/dist/low.min.js"></script>
<script src="https://unpkg.com/lowdb@0.17/dist/LocalStorage.min.js"></script>
<script src="<c:url value="/template/web/js/custom.js"/>"></script>
<script>
    var data = shoppingCart.get();

    function appendData(data) {
        var mainContainer = document.getElementById("myData");

        for (var i = 0; i < data.length; i++) {
            var r = document.createElement("TR");
            r.innerHTML = '<tr class="cart-header2">\n' +
                '\t\t  <td class="ring-in"><a href="<c:url value="#"/>" class="at-in"><img src="<c:url value="/template/web/images/ch1.jpg"/>" class="img-responsive" alt=""></a>\n' +
                '\t\t\t<div class="sed">\n' +
                '\t\t\t\t<h5><a href=<c:url value="#"/>>' + data[i].name + '</a></h5>\n' +
                '\t\t\t</div>\n' +
                '\t\t\t<div class="clearfix"> </div>\n' +
                '\t\t\t<div class="close3"> </div></td>\n' +
                '\t\t\t<td>' + data[i].price + '</td>\n' +
                '\t\t\t<td>' + data[i].quantity + '</td>\n' +
                '\t\t\t<td class="item_price">' + data[i].price * data[i].quantity + '</td>\n' +
                '\t\t\t<td class="add-check"><a class="item_add hvr-skew-backward" href="#">Add To Cart</a></td>\n' +
                '\t\t  </tr>';
            mainContainer.tBodies[0].appendChild(r);
        }
        var r2 = document.createElement("TR");
        r2.innerHTML = ' <tr>\n' +
            '                    <td colspan="3" style="text-align: right" >Total Cash:</td>\n' +
            '                    <td colspan="1">' + total() + '</td>\n' +
            '                </tr>';
        mainContainer.tBodies[0].appendChild(r2);

        function total() {
            var data = shoppingCart.get();
            let sum = 0;
            for (let i = 0; i < data.length; i++) {
                sum += data[i].quantity * +data[i].price;
            }
            return sum;
        }

    }

    appendData(data);
</script>
</body>
</html>
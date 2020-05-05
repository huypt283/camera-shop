<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.nhom8.camera.util.SecurityUtil" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product</title>
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
    <!--- start-rate---->
<%--    <script src="<c:url value="/template/web/js/jstarbox.js"/>"></script>--%>
<%--    <link rel="stylesheet" href="<c:url value="/template/web/css/jstarbox.css"/>" type="text/css" media="screen"--%>
<%--          charset="utf-8"/>--%>
    <script src="<c:url value="/template/web/js/jquery.twbsPagination.js"/>" type="text/javascript"></script>
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
                                                <c:forEach items="${lstProductBranch}" var="branchs">
                                                    <ul>
                                                        <li>
                                                            <a href="<c:url value="/product?branchId=${branchs.id}"/>">${branchs.name}</a>

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
                    <li><a class="play-icon popup-with-zoom-anim" href="<c:url value="/search"/>"><i
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
            <h1>Shop Camera</h1>
            <em></em>
            <h2><a href="<c:url value="/"/>">Home</a><label>/</label>Product</h2>
        </div>
    </div>
</div>
<!--banner-->
<!--content-->
<div class="product">
    <div class="container">
<%--        <form action="<c:url value="/product"/>" id="submitForm1" method="get">--%>
            <div class="col-md-9">
                <div class="mid-popular">
                    <c:forEach items="${models1.productList}" var="product">
                        <div class="col-md-3 item-grid simpleCart_shelfItem">

                            <div class=" mid-pop">
                                <div class="pro-img">
                                    <img src="<c:url value="${product.productImage}"/>" class="img-responsive"
                                         alt="">
                                    <div class="zoom-icon ">
                                        <a href="<c:url value="/product/${product.id}"/>"><i
                                                class="glyphicon glyphicon-menu-right icon"></i></a>
                                    </div>
                                </div>
                                <div class="mid-1">
                                    <div class="women">
                                        <div class="women-top">
                                            <span>${product.branch.name}</span>
                                            <h6><a href="<c:url value="/product/${product.id}"/>">${product.name}</a>
                                            </h6>
                                        </div>
                                        <div class="img item_add">
                                            <a href="<c:url value="/checkout"/>"><img
                                                    src="<c:url value="/template/web/images/ca.png"/>" alt=""></a>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="mid-2">
                                        <p><label></label><em class="item_price">${product.unitPrice}</em></p>
                                        <div class="block">
                                            <div class="starbox small ghosting"></div>
                                        </div>

                                        <div class="clearfix"></div>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </c:forEach>
                    <div class="clearfix"></div>
                    <ul class="pagination" id="pagination"></ul>
                    <input type="hidden" value="" id="page_product" name="page_product"/>
                    <input type="hidden" value="${branchId}" id="branchId" name="branchId">
                </div>
            </div>
<%--        </form>--%>
        <div class="col-md-3 product-bottom">
            <!--categories-->
            <div class=" rsidebar span_1_of_left">
                <h4 class="cate">Categories</h4>
                <ul class="menu-drop">
                    <c:forEach items="${lstProductBranch}" var="branch">
                        <li class="item1">
                            <h3><a href="<c:url value="/product?branchId=${branch.id}"/>">${branch.name} </a></h3>
                        </li>

                    </c:forEach>
                </ul>
            </div>
            <!--initiate accordion-->
            <script type="text/javascript">
                $(function () {
                    var menu_ul = $('.menu-drop > li > ul'),
                        menu_a = $('.menu-drop > li > a');
                    menu_ul.hide();
                    menu_a.click(function (e) {
                        e.preventDefault();
                        if (!$(this).hasClass('active')) {
                            menu_a.removeClass('active');
                            menu_ul.filter(':visible').slideUp('normal');
                            $(this).addClass('active').next().stop(true, true).slideDown('normal');
                        } else {
                            $(this).removeClass('active');
                            $(this).next().stop(true, true).slideUp('normal');
                        }
                    });

                });
            </script>
            <!--//menu-->
        </div>
        <div class="clearfix"></div>
    </div>
    <!--products-->

    <!--//products-->
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


</div>
<!--//content-->
<!--//footer-->
<%@ include file="/common/web/footer.jsp" %>
<!--//footer-->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<c:url value="/template/web/js/simpleCart.min.js"/>"></script>
<!-- slide -->
<script src="<c:url value="/template/web/js/bootstrap.min.js"/>"></script>
<!--light-box-files -->
<script src="<c:url value="/template/web/js/jquery.chocolat.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/template/web/css/chocolat.css"/>" type="text/css" media="screen"
      charset="utf-8">
<!--light-box-files -->
<script type="text/javascript" charset="utf-8">
    $(function () {
        $('a.picture').Chocolat();
    });
</script>

<script src="https://unpkg.com/lodash@4/lodash.min.js"></script>
<script src="https://unpkg.com/lowdb@0.17/dist/low.min.js"></script>
<script src="https://unpkg.com/lowdb@0.17/dist/LocalStorage.min.js"></script>
<script src="<c:url value="/template/web/js/custom.js"/>"></script>
<script src="<c:url value="/template/web/js/addProduct.js"/>"></script>
<script>
    var totalPages = ${models1.totalPage};
    var currentPage = ${models1.page};
    $(function () {
        var obj = $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: 2,
            startPage: currentPage,
            onPageClick: function (event, page) {
                if (currentPage != page) {
                    // $('#limit').val(2);
                    $('#branchId').val(${branchId});
                    $('#page_product').val(page);
                    $('#submitForm1').submit();
                }
            }
        });
        /*console.info(obj.data());*/
    });
</script>
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
</body>
</html>
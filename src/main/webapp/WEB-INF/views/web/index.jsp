<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.nhom8.camera.util.SecurityUtil" %>
<!DOCTYPE html>
<html>
<head>

    <title>Shop Camera | Login :: w3layouts</title>
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
    <script src="<c:url value="/template/web/js/jquery.twbsPagination.js"/>" type="text/javascript"></script>
</head>
<body>
</div>
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
                            <li><a class="color4" href="<c:url value="/404"/>">About</a></li>
                            <li><a class="color6" href="<c:url value="/contact"/>">Contact</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->

                </nav>
            </div>
            <div class="col-sm-2 search-right">

                <div class="cart box_1">
                    <a href="<c:url value="/checkout"/>">
                        <h3>
                            <div class="total" id="total">
                                </div>
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

            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!--header-->


<!--banner-->
<div class="banner">
    <div class="container">
        <section class="rw-wrapper">
            <h1 class="rw-sentence">
                <span style="color: whitesmoke">Camera for you!</span>
                <div class="rw-words rw-words-1">
                    <span>Beautiful Designs</span>
                    <span>Sed ut perspiciatis</span>
                    <span>Totam rem aperiam</span>
                    <span>Nemo enim ipsam</span>
                    <span>Temporibus autem</span>
                    <span>intelligent systems</span>
                </div>
                <div class="rw-words rw-words-2">
                    <span>We denounce with right</span>
                    <span>But in certain circum</span>
                    <span>Sed ut perspiciatis unde</span>
                    <span>There are many variation</span>
                    <span>The generated Lorem Ipsum</span>
                    <span>Excepteur sint occaecat</span>
                </div>
            </h1>
        </section>
    </div>
</div>
<!--banner-->

<!--content-->
<div class="content">
    <div class="container">

        <form action="<c:url value='/home'/>" id="formSubmit" method="get">
            <div class="content-mid">
                <h3>Trending Items</h3>
                <label class="line"></label>
                <div class="mid-popular">
                    <c:forEach items="${models.productList}" var="products">
                        <div class="col-md-3 item-grid simpleCart_shelfItem">

                            <div class=" mid-pop">
                                <div class="pro-img">
                                    <img src="<c:url value="${products.productImage}"/>" class="img-responsive"
                                         alt="">
                                    <div class="zoom-icon ">
                                        <a class="picture" href="<c:url value="/template/web/images/pc.jpg"/>"
                                           rel="title" class="b-link-stripe b-animate-go  thickbox"><i
                                                class="glyphicon glyphicon-search icon "></i></a>
                                        <a href="<c:url value="/product"/>"><i
                                                class="glyphicon glyphicon-menu-right icon"></i></a>
                                    </div>
                                </div>
                                <div class="mid-1">
                                    <div class="women">
                                        <div class="women-top">
                                            <span>${products.branch.name}</span>
                                            <h6><a href="<c:url value="/product/${products.id}"/>">${products.name}</a>
                                            </h6>
                                        </div>
                                        <div class="img item_add">
                                            <a href="<c:url value="/checkout"/>"><img
                                                    src="<c:url value="/template/web/images/ca.png"/>" alt=""></a>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="mid-2">
                                        <p><label>$100.00</label><em class="item_price">${products.unitPrice}</em></p>
                                        <div class="block">
                                            <div class="starbox small ghosting"></div>
                                        </div>

                                        <div class="clearfix"></div>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </c:forEach>


                </div>
                <div class="clearfix"></div>
                <ul class="pagination" id="pagination"></ul>
                <input type="hidden" value="" id="page" name="page"/>
            </div>
        </form>

        <!--//products-->
        <!--brand-->
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
                <img src="<c:url value="/template/web/images/fujin.jpg"/>" class="img-responsive" alt="">
            </div>
            <div class="clearfix"></div>
        </div>
        <!--//brand-->
    </div>

</div>
<!--//content-->
<!--//footer-->
<%@ include file="/common/web/footer.jsp" %>
<!--//footer-->
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
    var baka= shoppingCart.get();
    var maintain = document.getElementById("total");
    var r=document.createElement("span");
    if(baka.length >0){
        r.innerHTML=baka.length;
        maintain.appendChild(r);}
    else {
        r.innerHTML= 0;
        maintain.appendChild(r);
    }
</script>

<script>
    var totalPages = ${models.totalPage};
    var currentPage = ${models.page};
    $(function () {
        var obj = $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: 2,
            startPage: currentPage,
            onPageClick: function (event, page) {
                if (currentPage != page) {
                    // $('#limit').val(2);
                    $('#page').val(page);
                    $('#formSubmit').submit();
                }
            }
        });
        /*console.info(obj.data());*/
    });
</script>
</body>
</html>
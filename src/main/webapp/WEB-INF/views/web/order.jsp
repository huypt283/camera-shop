<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.nhom8.camera.util.SecurityUtil" %>
<html>
<head>
    <title>Confirm order</title>
    <link href="<c:url value="/template/web/css/bootstrap.css"/>" rel="stylesheet" type="text/css" media="all" />
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="<c:url value="/template/web/css/style.css"/>" rel="stylesheet" type="text/css" media="all" />
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Shopping Responsive web template" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--theme-style-->
    <link href="<c:url value="/template/web/css/style4.css"/>" rel="stylesheet" type="text/css" media="all" />
    <!--//theme-style-->
    <script src="<c:url value="/template/web/js/jquery.min.js"/>"></script>
    <!--- start-rate---->
    <script src="<c:url value="/template/web/js/jstarbox.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/template/web/css/jstarbox.css"/>" type="text/css" media="screen" charset="utf-8" />

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
                    <li><a href="<c:url value="/change-password" />">
                        Xin chào <%=SecurityUtil.getUserName()%>
                    </a></li>&emsp;
                    <li><a href="<c:url value="/logout" />">
                        Logout
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
<div class="container">
    <div class="banner-top">
        <div class="container">
            <h1>Contact</h1>
            <em></em>
            <h2><a href="<c:url value="/"/>">Home</a><label>/</label>Order</h2>
        </div>
    </div>
</div>
<!--banner-->
<div class="container wrapper">
    <div class="row cart-head">
        <div class="container">
            <div class="row">
            </div>
            <div class="row">
                <p></p>
            </div>
        </div>
    </div>
    <div class="row cart-body">
        <form class="form-horizontal" id="orderForm" >
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-push-6 col-sm-push-6">
                <!--REVIEW ORDER-->
                <div class="panel panel-info">
                    <div class="panel-heading">
                        Review Order <div class="pull-right"><small><a class="afix-1" href="<c:url value="/checkout"/>">Edit Cart</a></small></div>
                    </div>
                    <div class="panel-body" id="myData">

                    </div>
                </div>
                <!--REVIEW ORDER END-->
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-pull-6 col-sm-pull-6">
                <!--SHIPPING METHOD-->
                <div class="panel panel-info">
                    <div class="panel-heading">Address</div>
                    <div class="panel-body">
                        <div class="form-group">
                            <div class="col-md-12">
                                <h4>Shipping Address</h4>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12"><strong>Full Name:</strong></div>
                            <div class="col-md-12">
                                <input type="text" class="form-control" id="fullName" name="fullName" value="" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12"><strong>Address:</strong></div>
                            <div class="col-md-12">
                                <input type="text" name="address" id="address" class="form-control" value="" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12"><strong>Phone:</strong></div>
                            <div class="col-md-12">
                                <input type="text" name="phone_number" id="phone_number" class="form-control" value="" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <button type="submit" class="btn btn-primary btn-submit-fix">Place Order</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </form>
    </div>
    <div class="row cart-footer">

    </div>
</div>
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
            <img src="<c:url value="/template/web/images/fujin.jpg"/>" class="img-responsive" alt="">
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!--//brand-->
<%--footer--%>
<%@ include file="/common/web/footer.jsp" %>
<!--//footer-->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<c:url value="/template/web/js/simpleCart.min.js"/>"> </script>
<!-- slide -->
<script src="<c:url value="/template/web/js/bootstrap.min.js"/>"></script>
<!--light-box-files -->
<script src="<c:url value="/template/web/js/jquery.chocolat.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/template/web/css/chocolat.css"/>" type="text/css" media="screen" charset="utf-8">
<!--light-box-files -->
<script type="text/javascript" charset="utf-8">
    $(function() {
        $('a.picture').Chocolat();
    });
</script>
<script src="<c:url value="/template/web/js/bootstrap.min.js"/>"></script>
<script src="https://unpkg.com/lodash@4/lodash.min.js"></script>
<script src="https://unpkg.com/lowdb@0.17/dist/low.min.js"></script>
<script src="https://unpkg.com/lowdb@0.17/dist/LocalStorage.min.js"></script>
<script src="<c:url value="/template/web/js/custom.js"/>"></script>
<script>
    $(document).ready(
        function() {
            // SUBMIT FORM
            $("#orderForm").submit(function(event) {
                // Prevent the form from submitting via the browser.
                event.preventDefault();
                var infor={
                    shippingAddress: $("#address").val(),
                    note: $("#fullName").val() + ', ' + $("#phone_number").val(),
                    totalPrice: total()
                };
                var listInfor=[];
                var zz= shoppingCart.get();
                for(let i=0; i<zz.length; i++){
                    var infor2={};
                    infor2["unitPrice"] = zz[i].price;
                    infor2["quantity"] = zz[i].quantity;
                    infor2["productId"] = zz[i].productId;
                    listInfor.push(infor2);
                }
                var data={
                    orderRequest: infor,
                    lineItemRequests: listInfor
                };
                ajaxPost(data);
            });

            function ajaxPost(data){
                $.ajax({
                    url: '/order',
                    type: 'POST',
                    dataType: 'json',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    success: function (result) {
                        window.location.href= "/index";
                    },
                    error: function (error) {
                        window.location.href= "/info";
                        shoppingCart.remove();
                    }
                });
            }

            function total() {
                var data = shoppingCart.get();
                let sum = 0;
                for (let i=0;i< data.length; i++){
                    sum+=data[i].quantity* + data[i].price;
                }
                return sum;
            }
        });
</script>
<script>
    var data = shoppingCart.get();

    function appendData(data) {
        var mainContainer = document.getElementById("myData");
        for (var i = 0; i < data.length; i++) {
            var r = document.createElement("div");
            r.setAttribute("class", "form-group");
            r.innerHTML = '  <div class="col-sm-3 col-xs-3">\n' +
                '<img class="img-responsive" src="' + location.origin + '/' + data[i].avatar + '" />\n' +
                '</div>\n' +
                '<div class="col-sm-6 col-xs-6">\n' +
                '<div class="col-xs-12">' + data[i].name +
                '</div>\n' +
                '<div class="col-xs-12"><small>Quantity:<span>' + data[i].quantity + '</span></small></div>\n' +
                '</div>\n' +
                '<div class="col-sm-3 col-xs-3 text-right">\n' +
                '<h6><span>' + data[i].price + '</span></h6><span>vnd</span>' +
                '</div>';
            mainContainer.appendChild(r);
        }
        var br = document.createElement("div");
        br.setAttribute("class", "form-group");
        br.innerHTML = '<hr />';
        mainContainer.appendChild(br);
        var r2 = document.createElement("div");
        r2.setAttribute("class", "form-group");
        r2.innerHTML = '<div class="col-xs-12">\n' +
            ' <strong>Subtotal</strong>\n' +
            '<div class="pull-right"><span>$</span><span>' + total() + '</span></div>\n' +
            '</div>\n' +
            '                            <div class="col-xs-12">\n' +
            '                                <small>Shipping</small>\n' +
            '                                <div class="pull-right"><span>-</span></div>\n' +
            '                            </div>';
        mainContainer.appendChild(r2);

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
</body>
</html>

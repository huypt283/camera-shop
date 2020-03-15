<%@include file="/common/taglib.jsp" %>
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>

</head>
<body>
<!--header-->
<c:import url="/WEB-INF/views/web/header.jsp"></c:import>
<!--banner-->
<div class="banner-top">
    <div class="container">
        <h1>Login</h1>
        <em></em>
        <h2><a href="<c:url value="/home"/>">Home</a><label>/</label>Login</h2>
    </div>
</div>
<!--login-->
<div class="container">
    <div class="login">

        <form:form action="/j_spring_security_check" id="loginFrom" method="POST" >
            <div class="col-md-6 login-do">
                <div class="login-mail">
                    <input type="text" placeholder="Email" name="email" required="">
                    <i  class="glyphicon glyphicon-envelope"></i>
                </div>
                <div class="login-mail">
                    <input type="password" placeholder="Password" name="password" required="">
                    <i class="glyphicon glyphicon-lock"></i>
                </div>
                <a class="news-letter " href="#">
                    <label class="checkbox1"><input type="checkbox" name="checkbox" ><i> </i>Forget Password</label>
                </a>
                <label class="hvr-skew-backward">
                    <input type="submit" value="login">
                </label>
            </div>
            <div class="col-md-6 login-right">
                <h3>Register new account.</h3>
                <a href="<c:url value="/register"/>" class=" hvr-skew-backward">Register</a>
            </div>

            <div class="clearfix"> </div>
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
<div class="footer">
    <div class="footer-middle">
        <div class="container">
            <div class="col-md-3 footer-middle-in">
                <a href="<c:url value="/home"/>"><img src="<c:url value="/template/web/images/log.png"/>" alt=""></a>
                <p>Suspendisse sed accumsan risus. Curabitur rhoncus, elit vel tincidunt elementum, nunc urna tristique nisi, in interdum libero magna tristique ante. adipiscing varius. Vestibulum dolor lorem.</p>
            </div>

            <div class="col-md-3 footer-middle-in">
                <h6>Information</h6>
                <ul class=" in">
                    <li><a href="<c:url value="/404"/>">About</a></li>
                    <li><a href="<c:url value="/contact"/>">Contact Us</a></li>
                    <li><a href="#">Returns</a></li>
                    <li><a href="<c:url value="/contact"/>">Site Map</a></li>
                </ul>
                <ul class="in in1">
                    <li><a href="#">Order History</a></li>
                    <li><a href="<c:url value="/wishlist"/>">Wish List</a></li>
                    <li><a href="<c:url value="/login"/>">Login</a></li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-3 footer-middle-in">
                <h6>Tags</h6>
                <ul class="tag-in">
                    <li><a href="#">Lorem</a></li>
                    <li><a href="#">Sed</a></li>
                    <li><a href="#">Ipsum</a></li>
                    <li><a href="#">Contrary</a></li>
                    <li><a href="#">Chunk</a></li>
                    <li><a href="#">Amet</a></li>
                    <li><a href="#">Omnis</a></li>
                </ul>
            </div>
            <div class="col-md-3 footer-middle-in">
                <h6>Newsletter</h6>
                <span>Sign up for News Letter</span>
                <form>
                    <input type="text" value="Enter your E-mail" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='Enter your E-mail';}">
                    <input type="submit" value="Subscribe">
                </form>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">
            <ul class="footer-bottom-top">
                <li><a href="#"><img src="<c:url value="/template/web/images/f1.png"/>" class="img-responsive" alt=""></a></li>
                <li><a href="#"><img src="<c:url value="/template/web/images/f2.png"/>" class="img-responsive" alt=""></a></li>
                <li><a href="#"><img src="<c:url value="/template/web/images/f3.png"/>" class="img-responsive" alt=""></a></li>
            </ul>
            <p class="footer-class">&copy; 2016 Shopin. All Rights Reserved | Design by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!--//footer-->

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

<script src="<c:url value="/template/web/js/simpleCart.min.js"/>"> </script>
<!-- slide -->
<script src="<c:url value="/template/web/js/bootstrap.min.js"/>"></script>

</body>
</html>
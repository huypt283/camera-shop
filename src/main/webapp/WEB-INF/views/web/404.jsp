<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.nhom8.camera.util.SecurityUtil" %>
<!--A Design by W3layouts 
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>Shopin A Ecommerce Category Flat Bootstrap Responsive Website Template | 404 :: w3layouts</title>
<link href="<c:url value="/template/web/css/bootstrap.css"/>" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<!--theme-style-->
<link href="<c:url value="/template/web/css/style.css"/>" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Shopin Responsive web template, Bootstrap Web Templates, Flat Web Templates, AndroId Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--theme-style-->
<link href="<c:url value="/template/web/css/style4.css"/>" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<script src="<c:url value="/template/web/js/jquery.min.js"/>"></script>
<!--- start-rate---->
<script src="<c:url value="/template/web/js/jstarbox.js"/>"></script>
	<link rel="stylesheet" href="<c:url value="/template/web/css/jstarbox.css"/>" type="text/css" media="screen" charset="utf-8" />
		<script type="text/javascript">
			jQuery(function() {
			jQuery('.starbox').each(function() {
				var starbox = jQuery(this);
					starbox.starbox({
					average: starbox.attr('data-start-value'),
					changeable: starbox.hasClass('unchangeable') ? false : starbox.hasClass('clickonce') ? 'once' : true,
					ghosting: starbox.hasClass('ghosting'),
					autoUpdateAverage: starbox.hasClass('autoupdate'),
					buttons: starbox.hasClass('smooth') ? false : starbox.attr('data-button-count') || 5,
					stars: starbox.attr('data-star-count') || 5
					}).bind('starbox-value-changed', function(event, value) {
					if(starbox.hasClass('random')) {
					var val = Math.random();
					starbox.next().text(' '+val);
					return val;
					} 
				})
			});
		});
		</script>
<!---//End-rate---->
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
<!--banner-->
<div class="banner-top">
	<div class="container">
		<h1>404</h1>
		<em></em>
		<h2><a href="<c:url value="/"/>">Home</a><label>/</label>404</h2>
	</div>
</div>
<!--login-->
	<div class="container">
		<div class="four">
		<h3>Thank You For The Trust!</h3>
		<p>IDon't worry, the product will be coming soon!</p>
		<a href="<c:url value="/"/>" class="hvr-skew-backward">Back To Home</a>
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
<%@ include file="/common/web/footer.jsp" %>		<
!--//footer-->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

	<script src="<c:url value="/template/web/js/simpleCart.min.js"/>"> </script>
<!-- slide -->
<script src="<c:url value="/template/web/js/bootstrap.min.js"/>"></script>
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
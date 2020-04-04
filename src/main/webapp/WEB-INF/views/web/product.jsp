<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!--A Design by W3layouts 
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>

	<title>Shop Camera | Login :: w3layouts</title>
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
	<script src="<c:url value="/template/web/js/jquery.twbsPagination.js"/>" type="text/javascript"></script>
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
				<ul >
					<li><a href="<c:url value="/login" />">Login</a></li>
					<li><a href="<c:url value = "/register"/>">Register</a></li>

				</ul>
			</div>

			<div class="col-sm-5 header-social">
				<ul >
					<li><a href="#"><i></i></a></li>
					<li><a href="#"><i class="ic1"></i></a></li>
					<li><a href="#"><i class="ic2"></i></a></li>
					<li><a href="#"><i class="ic3"></i></a></li>
					<li><a href="#"><i class="ic4"></i></a></li>
				</ul>

			</div>
			<div class="clearfix"> </div>
		</div>
	</div>

	<div class="container">

		<div class="head-top">

			<div class="col-sm-8 col-md-offset-2 h_menu4">
				<nav class="navbar nav_bottom" role="navigation">

					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header nav_2">
						<button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>

					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
						<ul class="nav navbar-nav nav_1">
							<li><a class="color" href="<c:url value = "/home"/>">Home</a></li>
							<li class="dropdown mega-dropdown active">
								<a class="color1" href="#" class="dropdown-toggle" data-toggle="dropdown">Brand<span class="caret"></span></a>
								<div class="dropdown-menu ">
									<div class="menu-top">

										<div class="col1">
											<div class="h_nav">
												<c:forEach items="${lstProductBranch}" var="branchs">
													<ul>
														<li><a href="<c:url value="/product/branchId=${branchs.id}"/>">${branchs.name}</a></li>

													</ul>
												</c:forEach>
											</div>
										</div>

										<div class="col1 col5">
											<img src="<c:url value="/template/web/images/me.png"/>" class="img-responsive" alt="">
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
							</li>
							<li><a class="color3" href="<c:url value="/product"/>">Sale</a></li>
							<li><a class="color4" href="<c:url value="/404"/>">About</a></li>
							<li ><a class="color6" href="<c:url value="/contact"/>">Contact</a></li>
						</ul>
					</div><!-- /.navbar-collapse -->

				</nav>
			</div>
			<div class="col-sm-2 search-right">
				<ul class="heart">
					<li>
						<a href="<c:url value="/wishlist"/>" >
							<span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
						</a></li>
					<li><a class="play-icon popup-with-zoom-anim" href="#small-dialog"><i class="glyphicon glyphicon-search"> </i></a></li>
				</ul>
				<div class="cart box_1">
					<a href="<c:url value="/checkout"/>">
						<h3><div class="total">
							<span >${sessionScope.myCartItems.size()}</span></div>
							<img src="<c:url value="/template/web/images/cart.png"/>" alt=""/></h3>
					</a>
					<p><a href="javascript:;" class="simpleCart_empty">Empty Cart</a></p>

				</div>
				<div class="clearfix"> </div>

				<!----->

				<!---pop-up-box---->
				<link href="<c:url value="/template/web/css/popuo-box.css"/>" rel="stylesheet" type="text/css" media="all"/>
				<script src="<c:url value="/template/web/js/jquery.magnific-popup.js"/>" type="text/javascript"></script>
				<!---//pop-up-box---->
				<div id="small-dialog" class="mfp-hide">
					<div class="search-top">
						<div class="login-search">
							<input type="submit" value="">
							<input type="text" value="Search.." onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search..';}">
						</div>
						<p>Shopin</p>
					</div>
				</div>
				<script>
					$(document).ready(function() {
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
				<!----->
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>


<!--banner-->
<div class="banner-top">
	<div class="container">

		<h1>Products</h1>
		<em></em>
		<h2><a href="<c:url value="/"/>">Home</a><label>/</label>Products</h2>
	</div>
</div>
	<!--content-->
		<div class="product">
			<div class="container">
				<form action="${models1.url}" id="submitForm1" method="get">
			<div class="col-md-9">
				<div class="mid-popular">
					<c:forEach items="${models1.productList}" var="products">
						<div class="col-md-3 item-grid simpleCart_shelfItem">

							<div class=" mid-pop">
								<div class="pro-img">
									<img src="<c:url value="/template/web/images/pc.jpg"/>" class="img-responsive" alt="">
									<div class="zoom-icon ">
										<a class="picture" href="<c:url value="/template/web/images/pc.jpg"/>" rel="title" class="b-link-stripe b-animate-go  thickbox"><i class="glyphicon glyphicon-search icon "></i></a>
										<a href="<c:url value="/product"/>"><i class="glyphicon glyphicon-menu-right icon"></i></a>
									</div>
								</div>
								<div class="mid-1">
									<div class="women">
										<div class="women-top">
											<span>${products.branch.name}</span>
											<h6><a href="<c:url value="/product/${products.id}"/>">${products.name}</a></h6>
										</div>
										<div class="img item_add">
											<a href="<c:url value="/checkout"/>"><img src="<c:url value="/template/web/images/ca.png"/>" alt=""></a>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="mid-2">
										<p ><label>$100.00</label><em class="item_price">${products.unitPrice}</em></p>
										<div class="block">
											<div class="starbox small ghosting"> </div>
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
				</div>
			</div>
				</form>
			<div class="col-md-3 product-bottom">
			<!--categories-->
				<div class=" rsidebar span_1_of_left">
						<h4 class="cate">Categories</h4>
							 <ul class="menu-drop">
                                 <c:forEach items="${lstProductBranch}" var="branch">
									 <li class="item1">
										 <h3><a href="<c:url value="/product/branchId=${branch.id}"/>">${branch.name} </a></h3>
									</li>

								 </c:forEach>
							</ul>
				</div>
				<!--initiate accordion-->
						<script type="text/javascript">
							$(function() {
							    var menu_ul = $('.menu-drop > li > ul'),
							           menu_a  = $('.menu-drop > li > a');
							    menu_ul.hide();
							    menu_a.click(function(e) {
							        e.preventDefault();
							        if(!$(this).hasClass('active')) {
							            menu_a.removeClass('active');
							            menu_ul.filter(':visible').slideUp('normal');
							            $(this).addClass('active').next().stop(true,true).slideDown('normal');
							        } else {
							            $(this).removeClass('active');
							            $(this).next().stop(true,true).slideUp('normal');
							        }
							    });
							
							});
						</script>
<!--//menu-->
 <section  class="sky-form">
					<h4 class="cate">Discounts</h4>
					 <div class="row row1 scroll-pane">
						 <div class="col col-4">
								<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Upto - 10% (20)</label>
						 </div>
						 <div class="col col-4">
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>40% - 50% (5)</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>30% - 20% (7)</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>10% - 5% (2)</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Other(50)</label>
						 </div>
					 </div>
				 </section> 				 				 
				 
					
					 <!---->
					 <section  class="sky-form">
						<h4 class="cate">Type</h4>
							<div class="row row1 scroll-pane">
								<div class="col col-4">
									<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Sofa Cum Beds (30)</label>
								</div>
								<div class="col col-4">
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Bags  (30)</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Caps & Hats (30)</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Jackets & Coats   (30)</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Jeans  (30)</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Shirts   (30)</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Sunglasses  (30)</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Swimwear  (30)</label>
								</div>
							</div>
				   </section>
				   		<section  class="sky-form">
						<h4 class="cate">Brand</h4>
							<div class="row row1 scroll-pane">
								<div class="col col-4">
									<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Roadstar</label>
								</div>
								<div class="col col-4">
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Levis</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Persol</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Nike</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Edwin</label>
									<label class="checkbox"><input type="checkbox" name="checkbox" ><i></i>New Balance</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Paul Smith</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Ray-Ban</label>
								</div>
							</div>
				   </section>		
		</div>
			<div class="clearfix"></div>
			</div>
				<!--products-->
			
			<!--//products-->
		<!--brand-->
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
			
			
		</div>
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
						<li><a href="#"><img src="<c:url value="/template/web/images/f1.png"/>" class="img-responsive" alt=""></a></li>
						<li><a href="#"><img src="<c:url value="/template/web/images/f1.png"/>" class="img-responsive" alt=""></a></li>
					</ul>
					<p class="footer-class">&copy; 2016 Shopin. All Rights Reserved | Design by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
		<!--//footer-->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

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
				if(currentPage != page){
					// $('#limit').val(2);
					$('#page_product').val(page);
					$('#submitForm1').submit();
				}
			}
		});
		/*console.info(obj.data());*/
	});
</script>
</body>
</html>
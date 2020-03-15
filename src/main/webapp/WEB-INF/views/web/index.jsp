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
</div>
<!--header-->
<c:import url="header.jsp"></c:import>
<!--banner-->
<div class="banner">
<div class="container">
<section class="rw-wrapper">
				<h1 class="rw-sentence">
					<span>Fashion &amp; Beauty</span>
					<div class="rw-words rw-words-1">
						<span>Beautiful Designs</span>
						<span>Sed ut perspiciatis</span>
						<span> Totam rem aperiam</span>
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
	<!--content-->
		<div class="content">
			<div class="container">
				<div class="content-top">
					<div class="col-md-6 col-md">
						<div class="col-1">
						 <a href="<c:url value="/sell_cameras/product"/>" class="b-link-stroke b-animate-go  thickbox">
		   <img src="<c:url value="/template/web/images/pi.jpg"/>" class="img-responsive" alt=""/><div class="b-wrapper1 long-img"><p class="b-animate b-from-right    b-delay03 ">Lorem ipsum</p><label class="b-animate b-from-right    b-delay03 "></label><h3 class="b-animate b-from-left    b-delay03 ">Trendy</h3></div></a>

							<!---<a href="single.jsp"><img src="images/pi.jpg" class="img-responsive" alt=""></a>-->
						</div>
						<div class="col-2">
							<span>Hot Deal</span>
							<h2><a href="<c:url value="/sell_cameras/product"/>">Luxurious &amp; Trendy</a></h2>
							<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years</p>
							<a href="<c:url value="/sell_cameras/product"/>" class="buy-now">Buy Now</a>
						</div>
					</div>
					<div class="col-md-6 col-md1">
						<div class="col-3">
							<a href="<c:url value="/sell_cameras/product"/>"><img src="<c:url value="/template/web/images/pi1.jpg"/>" class="img-responsive" alt="">
							<div class="col-pic">
								<p>Lorem Ipsum</p>
								<label></label>
								<h5>For Men</h5>
							</div></a>
						</div>
						<div class="col-3">
							<a href="<c:url value="/sell_cameras/product"/>"><img src="<c:url value="/template/web/images/pi2.jpg"/>" class="img-responsive" alt="">
							<div class="col-pic">
								<p>Lorem Ipsum</p>
								<label></label>
								<h5>For Kids</h5>
							</div></a>
						</div>
						<div class="col-3">
							<a href="<c:url value="/sell_cameras/product"/>"><img src="<c:url value="/template/web/images/pi3.jpg"/>" class="img-responsive" alt="">
							<div class="col-pic">
								<p>Lorem Ipsum</p>
								<label></label>
								<h5>For Women</h5>
							</div></a>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
				<!--products-->
			<div class="content-mid">
				<h3>Trending Items</h3>
				<label class="line"></label>
				<div class="mid-popular">
					<c:forEach items="${products}" var="products">
					<div class="col-md-3 item-grid simpleCart_shelfItem">

					<div class=" mid-pop">
					<div class="pro-img">
						<img src="<c:url value="/template/web/images/pc.jpg"/>" class="img-responsive" alt="">
						<div class="zoom-icon ">
						<a class="picture" href="<c:url value="/template/web/images/pc.jpg"/>" rel="title" class="b-link-stripe b-animate-go  thickbox"><i class="glyphicon glyphicon-search icon "></i></a>
						<a href="<c:url value="/sell_cameras/product"/>"><i class="glyphicon glyphicon-menu-right icon"></i></a>
						</div>
						</div>
						<div class="mid-1">
						<div class="women">
						<div class="women-top">
							<span>${products.branch.name}</span>
							<h6><a href="<c:url value="/sell_cameras/product/${products.id}"/>">${products.name}</a></h6>
							</div>
							<div class="img item_add">
								<a href="${pageContext.request.contextPath}/sell_cameras/cart/add/productId=${products.id}"><img src="<c:url value="/template/web/images/ca.png"/>" alt=""></a>
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
					<%--<div class="col-md-3 item-grid simpleCart_shelfItem">
					<div class=" mid-pop">
					<div class="pro-img">
						<img src="<c:url value="/template/web/images/pc1.jpg"/>" class="img-responsive" alt="">
						<div class="zoom-icon ">
						<a class="picture" href="<c:url value="/template/web/images/pc1.jpg"/>" rel="title" class="b-link-stripe b-animate-go  thickbox"><i class="glyphicon glyphicon-search icon "></i></a>
						<a href="<c:url value="/product"/>"><i class="glyphicon glyphicon-menu-right icon"></i></a>
						</div>
						</div>
						<div class="mid-1">
						<div class="women">
						<div class="women-top">
							<span>Women</span>
							<h6><a href="<c:url value="/product"/>">At vero eos</a></h6>
							</div>
							<div class="img item_add">
								<a href="#"><img src="<c:url value="/template/web/images/ca.png"/>" alt=""></a>
							</div>
							<div class="clearfix"></div>
							</div>
							<div class="mid-2">
								<p ><label>$100.00</label><em class="item_price">$70.00</em></p>
								  <div class="block">
									<div class="starbox small ghosting"> </div>
								</div>
								
								<div class="clearfix"></div>
							</div>
							
						</div>
					</div>
					</div>
					<div class="col-md-3 item-grid simpleCart_shelfItem">
					<div class=" mid-pop">
					<div class="pro-img">
						<img src="<c:url value="/template/web/images/pc2.jpg"/>" class="img-responsive" alt="">
						<div class="zoom-icon ">
						<a class="picture" href="<c:url value="/template/web/images/pc2.jpg"/>" rel="title" class="b-link-stripe b-animate-go  thickbox"><i class="glyphicon glyphicon-search icon "></i></a>
						<a href="<c:url value="/product"/>"><i class="glyphicon glyphicon-menu-right icon"></i></a>
						</div>
						</div>
						<div class="mid-1">
						<div class="women">
						<div class="women-top">
							<span>Men</span>
							<h6><a href="<c:url value="/product"/>">Sed ut perspiciati</a></h6>
							</div>
							<div class="img item_add">
								<a href="#"><img src="<c:url value="/template/web/images/ca.png"/>" alt=""></a>
							</div>
							<div class="clearfix"></div>
							</div>
							<div class="mid-2">
								<p ><label>$100.00</label><em class="item_price">$70.00</em></p>
								  <div class="block">
									<div class="starbox small ghosting"> </div>
								</div>
								
								<div class="clearfix"></div>
							</div>
							
						</div>
					</div>
					</div>
					<div class="col-md-3 item-grid simpleCart_shelfItem">--%>
					<%--<div class=" mid-pop">
					<div class="pro-img">
						<img src="<c:url value="/template/web/images/pc3.jpg"/>" class="img-responsive" alt="">
						<div class="zoom-icon ">
						<a class="picture" href="<c:url value="/template/web/images/pc3.jpg"/>" rel="title" class="b-link-stripe b-animate-go  thickbox"><i class="glyphicon glyphicon-search icon "></i></a>
						<a href="<c:url value="/product"/>"><i class="glyphicon glyphicon-menu-right icon"></i></a>
						</div>
						</div>
						<div class="mid-1">
						<div class="women">
						<div class="women-top">
							<span>Women</span>
							<h6><a href="<c:url value="/product"/>">On the other</a></h6>
							</div>
							<div class="img item_add">
								<a href="#"><img src="<c:url value="/template/web/images/ca.png"/>" alt=""></a>
							</div>
							<div class="clearfix"></div>
							</div>
							<div class="mid-2">
								<p ><label>$100.00</label><em class="item_price">$70.00</em></p>
								  <div class="block">
									<div class="starbox small ghosting"> </div>
								</div>
								
								<div class="clearfix"></div>
							</div>
							
						</div>
					</div>--%>
					</div>
					<div class="clearfix"></div>
				</div>
		<%--						<div class="mid-popular">
					<div class="col-md-3 item-grid simpleCart_shelfItem">
					<div class=" mid-pop">
					<div class="pro-img">
						<img src="<c:url value="/template/web/images/pc4.jpg"/>" class="img-responsive" alt="">
						<div class="zoom-icon ">
						<a class="picture" href="<c:url value="/template/web/images/pc4.jpg"/>" rel="title" class="b-link-stripe b-animate-go  thickbox"><i class="glyphicon glyphicon-search icon "></i></a>
						<a href="single.jsp"><i class="glyphicon glyphicon-menu-right icon"></i></a>
						</div>
						</div>
						<div class="mid-1">
						<div class="women">
						<div class="women-top">
							<span>Men</span>
							<h6><a href="<c:url value="/product"/>">On the other</a></h6>
							</div>
							<div class="img item_add">
								<a href="#"><img src="<c:url value="/template/web/images/ca.png"/>" alt=""></a>
							</div>
							<div class="clearfix"></div>
							</div>
							<div class="mid-2">
								<p ><label>$100.00</label><em class="item_price">$70.00</em></p>
								  <div class="block">
									<div class="starbox small ghosting"> </div>
								</div>
								
								<div class="clearfix"></div>
							</div>
							
						</div>
					</div>
					</div>
					<div class="col-md-3 item-grid simpleCart_shelfItem">
					<div class=" mid-pop">
					<div class="pro-img">
						<img src="<c:url value="/template/web/images/pc5.jpg"/>" class="img-responsive" alt="">
						<div class="zoom-icon ">
						<a class="picture" href="<c:url value="/template/web/images/pc5.jpg"/>" rel="title" class="b-link-stripe b-animate-go  thickbox"><i class="glyphicon glyphicon-search icon "></i></a>
						<a href="<c:url value="/product"/>"><i class="glyphicon glyphicon-menu-right icon"></i></a>
						</div>
						</div>
						<div class="mid-1">
						<div class="women">
						<div class="women-top">
							<span>Men</span>
							<h6><a href="<c:url value="/product"/>">Sed ut perspiciati</a></h6>
							</div>
							<div class="img item_add">
								<a href="#"><img src="<c:url value="/template/web/images/ca.png"/>" alt=""></a>
							</div>
							<div class="clearfix"></div>
							</div>
							<div class="mid-2">
								<p ><label>$100.00</label><em class="item_price">$70.00</em></p>
								  <div class="block">
									<div class="starbox small ghosting"> </div>
								</div>
								
								<div class="clearfix"></div>
							</div>
							
						</div>
					</div>
					</div>
					<div class="col-md-3 item-grid simpleCart_shelfItem">
					<div class=" mid-pop">
					<div class="pro-img">
						<img src="<c:url value="/template/web/images/pc6.jpg"/>" class="img-responsive" alt="">
						<div class="zoom-icon ">
						<a class="picture" href="<c:url value="/template/web/images/pc6.jpg"/>" rel="title" class="b-link-stripe b-animate-go  thickbox"><i class="glyphicon glyphicon-search icon "></i></a>
						<a href="<c:url value="/product"/>"><i class="glyphicon glyphicon-menu-right icon"></i></a>
						</div>
						</div>
						<div class="mid-1">
						<div class="women">
						<div class="women-top">
							<span>Women</span>
							<h6><a href="single.jsp">At vero eos</a></h6>
							</div>
							<div class="img item_add">
								<a href="#"><img src="<c:url value="/template/web/images/ca.png"/>" alt=""></a>
							</div>
							<div class="clearfix"></div>
							</div>
							<div class="mid-2">
								<p ><label>$100.00</label><em class="item_price">$70.00</em></p>
								  <div class="block">
									<div class="starbox small ghosting"> </div>
								</div>
								
								<div class="clearfix"></div>
							</div>
							
						</div>
					</div>
					</div>
					<div class="col-md-3 item-grid simpleCart_shelfItem">
					<div class=" mid-pop">
					<div class="pro-img">
						<img src="<c:url value="/template/web/images/pc7.jpg"/>" class="img-responsive" alt="">
						<div class="zoom-icon ">
						<a class="picture" href="<c:url value="/template/web/images/pc7.jpg"/>" rel="title" class="b-link-stripe b-animate-go  thickbox"><i class="glyphicon glyphicon-search icon "></i></a>
						<a href="<c:url value="/product"/>"><i class="glyphicon glyphicon-menu-right icon"></i></a>
						</div>
						</div>
						<div class="mid-1">
						<div class="women">
						<div class="women-top">
							<span>Men</span>
							<h6><a href="<c:url value="/product"/>">Sed ut perspiciati</a></h6>
							</div>
							<div class="img item_add">
								<a href="#"><img src="<c:url value="/template/web/images/ca.png"/>" alt=""></a>
							</div>
							<div class="clearfix"></div>
							</div>
							<div class="mid-2">
								<p ><label>$100.00</label><em class="item_price">$70.00</em></p>
								  <div class="block">
									<div class="starbox small ghosting"> </div>
								</div>
								
								<div class="clearfix"></div>
							</div>
							
						</div>
					</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>--%>
			<!--//products-->
			<!--brand-->
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
			<!--//brand-->
			</div>
			
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
<!--light-box-files -->
		<script src="<c:url value="/template/web/js/jquery.chocolat.js"/>"></script>
		<link rel="stylesheet" href="<c:url value="/template/web/css/chocolat.css"/>" type="text/css" media="screen" charset="utf-8">
		<!--light-box-files -->
		<script type="text/javascript" charset="utf-8">
		$(function() {
			$('a.picture').Chocolat();
		});
		</script>


</body>
</html>
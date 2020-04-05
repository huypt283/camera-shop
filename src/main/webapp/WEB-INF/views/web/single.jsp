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
<title>Shopin A Ecommerce Category Flat Bootstrap Responsive Website Template | Single :: w3layouts</title>
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
<link href="<c:url value="/template/web/css/form.css"/>" rel="stylesheet" type="text/css" media="all" />
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
		<h1>Single</h1>
		<em></em>
		<h2><a href="index.jsp">Home</a><label>/</label>Single</h2>
	</div>
</div>
<div class="single">

<div class="container">
<div class="col-md-9">
	<div class="col-md-5 grid">		
		<div class="flexslider">
			  <ul class="slides">
			    <li data-thumb="images/si.jpg">
			        <div class="thumb-image"> <img src="<c:url value="/template/web/images/si.jpg"/>" data-imagezoom="true" class="img-responsive"> </div>
			    </li>
			    <li data-thumb="images/si1.jpg">
			         <div class="thumb-image"> <img src="<c:url value="/template/web/images/si1.jpg"/>" data-imagezoom="true" class="img-responsive"> </div>
			    </li>
			    <li data-thumb="images/si2.jpg">
			       <div class="thumb-image"> <img src="<c:url value="/template/web/images/si2.jpg"/>" data-imagezoom="true" class="img-responsive"> </div>
			    </li> 
			  </ul>
		</div>
	</div>	
<div class="col-md-7 single-top-in">
						<div class="span_2_of_a1 simpleCart_shelfItem">
				<h3>${product.name}</h3>
							<input type="hidden" value="${product.id}" id="productid" name="productid">
				<p class="in-para"> ${product.branch.name}</p>
			    <div class="price_single">
				  <span class="reducedfrom item_price">${product.unitPrice}</span>

				 <div class="clearfix"></div>
				</div>
				<h4 class="quick">Quick Overview:</h4>
				<p class="quick_desc"> Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; es</p>

				 <div class="quantity"> 
								<div class="quantity-select">                           
									<div class="entry value-minus">&nbsp;</div>
									<div class="entry value"><span name="quantity-value">1</span></div>
									<div class="entry value-plus active">&nbsp;</div>
								</div>
							</div>
							<!--quantity-->
	<script>
    $('.value-plus').on('click', function(){
    	var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)+1;
    	divUpd.text(newVal);
    });

    $('.value-minus').on('click', function(){
    	var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)-1;
    	if(newVal>=1) divUpd.text(newVal);
    });
	</script>
	<!--quantity-->
				 
			    <a href="${pageContext.request.contextPath}/cart/add/productId=${product.id}" class="add-to item_add hvr-skew-backward">Add to cart</a>
			<div class="clearfix"> </div>
			</div>
		
					</div>
			<div class="clearfix"> </div>
			<!---->
			<div class="tab-head">
			 <nav class="nav-sidebar">
		<ul class="nav tabs">
          <li class="active"><a href="#tab1" data-toggle="tab">Product Description</a></li>
          <li class=""><a href="#tab2" data-toggle="tab">Additional Information</a></li> 
          <li class=""><a href="#tab3" data-toggle="tab">Reviews</a></li>  
		</ul>
	</nav>
	<div class="tab-content one">
<div class="tab-pane active text-style" id="tab1">
 <div class="facts">
									  <p > There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined </p>
										<ul>
											<li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Research</li>
											<li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Design and Development</li>
											<li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Porting and Optimization</li>
											<li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>System integration</li>
											<li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Verification, Validation and Testing</li>
											<li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Maintenance and Support</li>
										</ul>         
							        </div>

</div>
<div class="tab-pane text-style" id="tab2">
	
									<div class="facts">									
										<p > Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections </p>
										<ul >
											<li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Multimedia Systems</li>
											<li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Digital media adapters</li>
											<li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Set top boxes for HDTV and IPTV Player  </li>
										</ul>
							        </div>	

</div>
<div class="tab-pane text-style" id="tab3">

									 <div class="facts">
									  <p > There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined </p>
										<ul>
											<li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Research</li>
											<li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Design and Development</li>
											<li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Porting and Optimization</li>
											<li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>System integration</li>
											<li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Verification, Validation and Testing</li>
											<li><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Maintenance and Support</li>
										</ul>     
							     </div>	

 </div>
  
  </div>
  <div class="clearfix"></div>
  </div>
			<!---->	
</div>
<!----->

<div class="col-md-3 product-bottom product-at">
			<!--categories-->
				<div class=" rsidebar span_1_of_left">
						<h4 class="cate">Categories</h4>
							 <ul class="menu-drop">
							<li class="item1"><a href="#">Men </a>
								<ul class="cute">
									<li class="subitem1"><a href="<c:url value="/product"/>">Cute Kittens </a></li>
									<li class="subitem2"><a href="<c:url value="/product"/>">Strange Stuff </a></li>
									<li class="subitem3"><a href="<c:url value="/product"/>">Automatic Fails </a></li>
								</ul>
							</li>
							<li class="item2"><a href="#">Women </a>
								<ul class="cute">
									<li class="subitem1"><a href="<c:url value="/product"/>">Cute Kittens </a></li>
									<li class="subitem2"><a href="<c:url value="/product"/>">Strange Stuff </a></li>
									<li class="subitem3"><a href="<c:url value="/product"/>">Automatic Fails </a></li>
								</ul>
							</li>
							<li class="item3"><a href="#">Kids</a>
								<ul class="cute">
									<li class="subitem1"><a href="<c:url value="/product"/>">Cute Kittens </a></li>
									<li class="subitem2"><a href="<c:url value="/product"/>">Strange Stuff </a></li>
									<li class="subitem3"><a href="<c:url value="/product"/>">Automatic Fails</a></li>
								</ul>
							</li>
							<li class="item4"><a href="#">Accessories</a>
								<ul class="cute">
									<li class="subitem1"><a href="<c:url value="/product"/>">Cute Kittens </a></li>
									<li class="subitem2"><a href="<c:url value="/product"/>">Strange Stuff </a></li>
									<li class="subitem3"><a href="<c:url value="/product"/>">Automatic Fails</a></li>
								</ul>
							</li>
									
							<li class="item4"><a href="#">Shoes</a>
								<ul class="cute">
									<li class="subitem1"><a href="<c:url value="/product"/>">Cute Kittens </a></li>
									<li class="subitem2"><a href="<c:url value="/product"/>">Strange Stuff </a></li>
									<li class="subitem3"><a href="<c:url value="/product"/>">Automatic Fails </a></li>
								</ul>
							</li>
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
		<div class="clearfix"> </div>
	</div>
	
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
<%@ include file="/common/web/footer.jsp" %>
		<!--//footer-->
<script src="<c:url value="/template/web/js/imagezoom.js"/>"></script>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script defer src="<c:url value="/template/web/js/jquery.flexslider.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/template/web/css/flexslider.css"/>" type="text/css" media="screen" />

<script>
// Can also be used with $(document).ready()
$(window).load(function() {
  $('.flexslider').flexslider({
    animation: "slide",
    controlNav: "thumbnails"
  });
});
</script>

	<script src="<c:url value="/template/web/js/simpleCart.min.js"/>"> </script>
<!-- slide -->
<script src="<c:url value="/template/web/js/bootstrap.min.js"/>"></script>


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
<%--

anh code o day ne--%>
<script>
	function addSingleProductToCheckOut() {

		var btnAdd=document.querySelector('a[class="add-to item_add hvr-skew-backward"]');
		btnAdd.onclick = function(){
			var brand=document.querySelector('div[class="span_2_of_a1 simpleCart_shelfItem"] p').innerText;
			var name =document.querySelector('div[class="span_2_of_a1 simpleCart_shelfItem"] h3').innerText;
			var money=document.querySelector('div[class="span_2_of_a1 simpleCart_shelfItem"] span').innerText;
			var quantity=document.querySelector('div[class="span_2_of_a1 simpleCart_shelfItem"] div[class="quantity"] span').innerText;
			var productId=document.querySelector('div[class="span_2_of_a1 simpleCart_shelfItem"] input').value;

			if(!shoppingCart.isExist({ productId : productId })){
				shoppingCart.insert({
					brand : brand ,
					name : name,
					price : money,
					productId : productId,
					quantity: quantity
				});
			}
			else {
				let sl = shoppingCart.where({productId: productId}).quantity;
				sl = Number(sl)+1;
				shoppingCart.update({productId : productId},{quantity: sl.toString()});
			}
		}


	}
	addSingleProductToCheckOut();
</script>
</body>
</html>
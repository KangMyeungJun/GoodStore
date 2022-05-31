<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>About</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="static_link.jsp" %>
</head>
<body class="animsition">
<%@ include file="header.jsp" %>
<%@ include file="sidebar.jsp" %>
	<!-- Header -->
	<header class="header-v4">
		<!-- Header desktop -->
		<div class="container-menu-desktop">
			<!-- Topbar -->
			<div class="top-bar">
				<div class="content-topbar flex-sb-m h-full container">
					<div class="left-top-bar">
						Free shipping for standard order over $100
					</div>

					<div class="right-top-bar flex-w h-full">
						<a href="#" class="flex-c-m trans-04 p-lr-25">
							Help & FAQs
						</a>

						<a href="#" class="flex-c-m trans-04 p-lr-25">
							My Account
						</a>

						<a href="#" class="flex-c-m trans-04 p-lr-25">
							EN
						</a>

						<a href="#" class="flex-c-m trans-04 p-lr-25">
							USD
						</a>
					</div>
				</div>
			</div>

			<div class="wrap-menu-desktop how-shadow1">
				<nav class="limiter-menu-desktop container">
					
					<!-- Logo desktop -->		
					<a href="#" class="logo">
						<img src="${initParam.staticPath}images/icons/logo-01.png" alt="IMG-LOGO">
					</a>

					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">
							<li>
								<a href="index.html">Home</a>
								<ul class="sub-menu">
									<li><a href="index.html">Homepage 1</a></li>
									<li><a href="home-02.html">Homepage 2</a></li>
									<li><a href="home-03.html">Homepage 3</a></li>
								</ul>
							</li>

							<li>
								<a href="product.html">Shop</a>
							</li>

							<li class="label1" data-label1="hot">
								<a href="shoping-cart.html">Features</a>
							</li>

							<li>
								<a href="blog.html">Blog</a>
							</li>

							<li class="active-menu">
								<a href="about.html">About</a>
							</li>

							<li>
								<a href="contact.html">Contact</a>
							</li>
						</ul>
					</div>	

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m">
						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
							<i class="zmdi zmdi-search"></i>
						</div>

						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="2">
							<i class="zmdi zmdi-shopping-cart"></i>
						</div>

						<a href="#" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti" data-notify="0">
							<i class="zmdi zmdi-favorite-outline"></i>
						</a>
					</div>
				</nav>
			</div>	
		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->		
			<div class="logo-mobile">
				<a href="index.html"><img src="${initParam.staticPath}images/icons/logo-01.png" alt="IMG-LOGO"></a>
			</div>

			<!-- Icon header -->
			<div class="wrap-icon-header flex-w flex-r-m m-r-15">
				<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
					<i class="zmdi zmdi-search"></i>
				</div>

				<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart" data-notify="2">
					<i class="zmdi zmdi-shopping-cart"></i>
				</div>

				<a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti" data-notify="0">
					<i class="zmdi zmdi-favorite-outline"></i>
				</a>
			</div>

			<!-- Button show menu -->
			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
				</span>
			</div>
		</div>


		<!-- Menu Mobile -->
		<div class="menu-mobile">
			<ul class="topbar-mobile">
				<li>
					<div class="left-top-bar">
						Free shipping for standard order over $100
					</div>
				</li>

				<li>
					<div class="right-top-bar flex-w h-full">
						<a href="#" class="flex-c-m p-lr-10 trans-04">
							Help & FAQs
						</a>

						<a href="#" class="flex-c-m p-lr-10 trans-04">
							My Account
						</a>

						<a href="#" class="flex-c-m p-lr-10 trans-04">
							EN
						</a>

						<a href="#" class="flex-c-m p-lr-10 trans-04">
							USD
						</a>
					</div>
				</li>
			</ul>

			<ul class="main-menu-m">
				<li>
					<a href="index.html">Home</a>
					<ul class="sub-menu-m">
						<li><a href="index.html">Homepage 1</a></li>
						<li><a href="home-02.html">Homepage 2</a></li>
						<li><a href="home-03.html">Homepage 3</a></li>
					</ul>
					<span class="arrow-main-menu-m">
						<i class="fa fa-angle-right" aria-hidden="true"></i>
					</span>
				</li>

				<li>
					<a href="product.html">Shop</a>
				</li>

				<li>
					<a href="shoping-cart.html" class="label1 rs1" data-label1="hot">Features</a>
				</li>

				<li>
					<a href="blog.html">Blog</a>
				</li>

				<li>
					<a href="about.html">About</a>
				</li>

				<li>
					<a href="contact.html">Contact</a>
				</li>
			</ul>
		</div>

		<!-- Modal Search -->
		<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
			<div class="container-search-header">
				<button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
					<img src="${initParam.staticPath}images/icons/icon-close2.png" alt="CLOSE">
				</button>

				<form class="wrap-search-header flex-w p-l-15">
					<button class="flex-c-m trans-04">
						<i class="zmdi zmdi-search"></i>
					</button>
					<input class="plh3" type="text" name="search" placeholder="Search...">
				</form>
			</div>
		</div>
	</header>

	<!-- Cart -->
	<div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>

		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2">
					Your Cart
				</span>

				<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>
			
			<div class="header-cart-content flex-w js-pscroll">
				<ul class="header-cart-wrapitem w-full">
					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="${initParam.staticPath}images/item-cart-01.jpg" alt="IMG">
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								White Shirt Pleat
							</a>

							<span class="header-cart-item-info">
								1 x $19.00
							</span>
						</div>
					</li>

					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="${initParam.staticPath}images/item-cart-02.jpg" alt="IMG">
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								Converse All Star
							</a>

							<span class="header-cart-item-info">
								1 x $39.00
							</span>
						</div>
					</li>

					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="${initParam.staticPath}images/item-cart-03.jpg" alt="IMG">
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								Nixon Porter Leather
							</a>

							<span class="header-cart-item-info">
								1 x $17.00
							</span>
						</div>
					</li>
				</ul>
				
				<div class="w-full">
					<div class="header-cart-total w-full p-tb-40">
						Total: $75.00
					</div>

					<div class="header-cart-buttons flex-w w-full">
						<a href="shoping-cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
							View Cart
						</a>

						<a href="shoping-cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
							Check Out
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			About
		</h2>
	</section>	


	<!-- Content page -->
	<section class="bg0 p-t-75 p-b-120">
		<div class="container">
			<div class="row p-b-148">
				<div class="col-md-7 col-lg-8">
					<div class="p-t-7 p-r-85 p-r-15-lg p-r-0-md">
						<h3 class="mtext-111 cl2 p-b-16">
							Our Story
						</h3>

            <p class="stext-113 cl6 p-b-26">
              “사회적기업”이란 취약계층에게 사회서비스 또는 일자리를 제공하거나 지역사회에 공헌함으로써 지역주민의 삶의 질을 높이는 등의 사회적 목적을 추구하면서 재화 및 서비스의 생산·판매 등 영업활동을 하는 기업으로서 사회적기업으로 인증을 받은 자를 말합니다(「사회적기업 육성법」 제2조제1호).
						</p>
            <p class="stext-113 cl6 p-b-26">
              사회적기업은<br/>
              취약계층을 노동 시장으로 통합하여 지속 가능한 일자리를 제공하는 것으로 취약계층의 자활을 돕습니다. <br/>
              지역사회 통합 및 사회적투자확충을 통한 지역 경제 발전에 도움이 됩니다.<br/>
              공공서비스 수요 확충을 통한 사회 서비스 확충에 이바지 합니다.<br/>
              기업의 사회 공헌과 윤리적 경영문화를 확산시켜 착한 소비문화를 조성합니다.<br/>
								<a class="stext-111 cl8" href="http://www.pns.or.kr/default/mp1/mp1_sub2.php?sub=02">-ì¬ëê³¼ ì¸ì</a> 
						</p>


						<p class="stext-113 cl6 p-b-26">
              Good Store는<br/>
              사회적 기업에서 생산된 상품을 판매하고 다양한 분야의 사회적 기업들을 소개하는 것을 목적으로 제작된 웹페이지 입니다.<br/>
              실제 상품 판매는 이루어지지 않고 있습니다.<br/>
              홈페이지의 제품들을 포함한 더 다양한 상품들은<br/>
              <a href="https://www.sepp.or.kr/sepp/main">e-store 36.5</a> / 
              <a href="https://www.hknuri.co.kr/main.do">함께누리몰</a> 홈페이지에서 판매하고 있습니다<br/>
						</p>

					</div>
				</div>

				<div class="col-11 col-md-5 col-lg-4 m-lr-auto">
					<div class="how-bor1 ">
						<div class="hov-img0">
							<img src="${initParam.staticPath}images/about-01.jpg" alt="IMG">
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="order-md-2 col-md-7 col-lg-8 p-b-30">
					<div class="p-t-7 p-l-85 p-l-15-lg p-l-0-md">
						<h3 class="mtext-111 cl2 p-b-16">
              Technologies Used
            </h3>

						<p class="stext-113 cl6 p-b-26">
              Good Store 홈페이지 제작에는 다음과 같은 기술들이 사용되었습니다.
            </p>

            <div class="bor20 p-l-29 p-tb-9" style="margin-right:500px;">
              <div class="stext-114 cl6 p-r-40 p-b-11" style="font-weight:bold; color:rgb(88, 81, 81)">
                Back-End<br/>
              </div>
                <ul class="stext-114 cl6">
                  <li>Java</li>
                  <li>Spring</li>
                  <li>MyBatis</li>
                </ul>
            </div>
            
						<div class="bor21 p-l-29 p-tb-9 m-t-22" style="margin-right:500px;">
              <div class="flex-r-m p-r-40 stext-114 cl6 p-r-40 p-b-11" style="font-weight:bold; color:rgb(88, 81, 81)">
                Front-End
							</div>
              <div class="flex-r-m p-r-40" style="text-align:right">
              <ul class="stext-114 cl6">
                <li>HTML</li>
                <li>CSS</li>
                <li>JQuery</li>
              </ul>
            </div>
						</div>
					</div>
				</div>

				<div class="order-md-1 col-11 col-md-5 col-lg-4 m-lr-auto p-b-30">
					<div class="how-bor2">
						<div class="hov-img0">
							<img src="${initParam.staticPath}images/about-02.jpg" alt="IMG">
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>	
	
<%@ include file="footer.jsp" %>
<%@ include file="common_js.jsp" %>	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Shoping Cart</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<style type="text/css">
	
.outer.show {
   display: block;
}

.outer {
  
  	display: none;
  	position: fixed;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    text-align: center;
    font-size: 0;
    /* overflow-y: scroll; */
    background-color: rgba(0,0,0,.4);
    z-index: 10000;
    /* pointer-events: none; */
    /* opacity: 0; */
    transition: opacity .3s;
  
}

.inner {
  /* position: fixed; */
  position: absolute;
  top: 50%;
  left: 50%;

  background-color: #fff;
  /* border: 1px solid #333;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  margin: auto; */

  width: 700px;  
  height: 600px;

  /* z-index: 1; */
  align-items: center;
  overflow: auto;


  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
  transform: translateX(-50%) translateY(-50%);
}

.inner.hide {
        display: none;
}




.inner-wrap{
/* overflow: auto; */
margin: auto;
width: 600px;
margin-top: 70px;
/* margin-left: 50px; */
display: flex; 
flex-direction:column; 

/* font-family: Poppins-Bold; */
  font-size: 13px;
  /* font-weight: bold; */
  color: #555;
  /* text-transform: uppercase; */
  line-height: 1.6;
  /* padding-top: 15px;
  padding-bottom: 15px; */
  /* text-align: center; */
  border:1px solid #e6e6e6;
  /* background-color:  #e6e6e6; */
  /* margin-top: 70px; */
  cursor: pointer;
}


.inner1{
	display: none; 
  position: fixed;
  background-color: #fff;
  border: 1px solid #333;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  margin: auto;
  width: 650px;  
  height:580px;
 /* z-index: 1; */
  align-items: center;
  overflow: auto;
}
.inner1.show {
        display: block;
}

.inner-wrap1{
/* overflow: auto; */
margin: auto;
width: 500px;
margin-top: 70px;
/* margin-left: 50px; */
display: flex; 
flex-direction:column; 

/* font-family: Poppins-Bold; */
  font-size: 13px;
  /* font-weight: bold; */
  color: #555;
  /* text-transform: uppercase; */
  line-height: 1.6;
  /* padding-top: 15px;
  padding-bottom: 15px; */
  /* text-align: center; */
  /* border:1px solid #e6e6e6; */
  /* background-color:  #e6e6e6; */
  /* margin-top: 70px; */
  cursor: pointer;
}


.row-div{
font-family: Poppins-Regular;
width: 100%;
padding-top: 20px;
padding-bottom: 20px;
padding-left: 40px;
/* margin-right: 20px; */
display: flex; 
flex-direction:row; 
align-items: center;
border-bottom:1px solid #e6e6e6;
}

.product-info{
	margin-left:50px;
}
.product-info1{
	margin-left:80px;
}

.btn-complete-order{
	width: 120px;
	border: 1px solid #e6e6e6;
    border-radius: 22px;
	background-color: #f3f3f3;
	height: 45px;
	font-family: Poppins-Medium;
    font-size: 15px;
    line-height: 1.466667;
    text-transform: uppercase;
	color: #333;
	justify-content: center;
	align-items: center;
	display: flex;
	transition: all 0.4s;
	cursor: pointer;
	margin-bottom: 5px;
	margin-top: 5px;
	padding-right: 15px;
	padding-left: 15px;
}
.btn-complete-order:hover {
    border-color: #717fe0;
    background-color: #717fe0;
    color: #fff;
}

.refund-btn{
	width: 120px;
	border: 1px solid #e6e6e6;
    border-radius: 22px;
	background-color: #f3f3f3;
	height: 45px;
	font-family: Poppins-Medium;
    font-size: 15px;
    line-height: 1.466667;
    text-transform: uppercase;
	color: #333;
	justify-content: center;
	align-items: center;
	display: flex;
	transition: all 0.4s;
	cursor: pointer;
	margin-bottom: 5px;
	margin-top: 5px;
	padding-right: 15px;
	padding-left: 15px;
}
.refund-btn:hover {
    border-color: #717fe0;
    background-color: #717fe0;
    color: #fff;
}
</style>
</head>
<body class="animsition">
	
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
						<img src="images/icons/logo-01.png" alt="IMG-LOGO">
					</a>

					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">
							<li>
								<a href="index.html">Home</a>
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

							<li>
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
				<a href="index.html"><img src="images/icons/logo-01.png" alt="IMG-LOGO"></a>
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
					<img src="images/icons/icon-close2.png" alt="CLOSE">
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
							<img src="images/item-cart-01.jpg" alt="IMG">
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
							<img src="images/item-cart-02.jpg" alt="IMG">
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
							<img src="images/item-cart-03.jpg" alt="IMG">
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


	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="home-02.html" class="stext-109 cl8 hov-cl1 trans-04">
				홈
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				주문내역
			</span>
		</div>
	</div>
		

	<!-- 주문내역 -->
	<div class="bg0 p-t-75 p-b-85">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 m-lr-auto m-b-50" style="width: 2000px;">
					<div class="m-l-25 m-r--38 m-lr-0-xl"  style="width: 1100px;">
						<div class="wrap-table-shopping-cart-j" >
							<div class="order-info">
								<span  style="padding-left: 0px;">결제일자 </span><span>20220526ABAB</span>
								<span  style="padding-left: 50px;">주문번호 </span><span>20220526ABAB</span>
			
							</div>
							<table class="table-shopping-cart">
								<tr class="table_head">
									<td class="column-1-j"></td>
									<th class="column-1">상품</th>
									<th class="column-2">상품명</th>
									<th class="column-3">가격</th>
									<th class="column_4">진행상태</th>
									<th class="column-5-1"></th>
								</tr>

								<tr class="table_row">
									<td class="column-1-j">1</td>
									<td class="column-1">
										<div class="how-itemcart1">
											<img src="images/item-cart-04.jpg" alt="IMG">
										</div>
									</td>
									<td class="column-2">Fresh Strawberries</td>
									<td class="column-3">$ 36.00</td>
									<td class="column_4">배송완료</td>
									<td class="column_5">
										<div class="btn-complete-order" style="width: 120px;">
											구매확정
										</div>
										<div class="btn-complete-order" style="width: 120px; margin-top: 10px;">
											반품
										</div>
									</div></td>
								</tr>
								<tr class="table_row">
									<td class="column-1-j">2</td>
									<td class="column-1">
										<div class="how-itemcart1">
											<img src="images/item-cart-04.jpg" alt="IMG">
										</div>
									</td>
									<td class="column-2">Fresh Strawberries</td>
									<td class="column-3">$ 36.00</td>
									<td class="column_4" id="col">배송완료</td>
									<td class="column_5">
										<div id="buttons">
											<div class="btn-complete-order" style="width: 120px;">
												구매확정
											</div>
											<div class="btn-complete-order" style="width: 120px; margin-top: 10px;">
												반품
											</div>
										</div>
									</div></td>
								</tr>

							</table>





							<div class="order-info">
								<span  style="padding-left: 0px;">결제일자 </span><span>20220526ABAB</span>
								<span  style="padding-left: 50px;">주문번호 </span><span>20220526ABAB</span>
			
							</div>
							<table class="table-shopping-cart">
								<tr class="table_head">
									<td class="column-1-j"></td>
									<th class="column-1">상품</th>
									<th class="column-2">상품명</th>
									<th class="column-3">가격</th>
									<th class="column_4">진행상태</th>
									<th class="column-5-1"></th>
								</tr>

								<tr class="table_row">
									<td class="column-1-j">1</td>
									<td class="column-1">
										<div class="how-itemcart1">
											<img src="images/item-cart-04.jpg" alt="IMG">
										</div>
									</td>
									<td class="column-2">Fresh Strawberries</td>
									<td class="column-3">$ 36.00</td>
									<td class="column_4">배송완료</td>
									<td class="column_5">
										<div class="btn-complete-order" style="width: 120px;">
											구매확정
										</div>
										<div class="btn-complete-order" style="width: 120px; margin-top: 10px;">
											반품
										</div>
									</div></td>
								</tr>


							</table>





						</div>

						<div class="more-info trans-04" id="more-info" >
							<span> + 더보기</span>
		
						</div>
					</div>
				</div>

				
			</div>
		</div>
	</div>
		


	<!-- 모달 1 -->
	<div class="outer">
		<div class="inner">
			<div class="inner-wrap">
				<!-- 해당 주문 정보 -->
				<div class="row-div" style="font-family: Poppins-Bold;">
					<span>결제일자 </span><span style="padding-left: 10px;">20220526ABAB</span>
					<span  style="padding-left: 20px;">주문번호 </span><span style="padding-left: 10px;">20220526ABAB</span>
				</div>

				<div class="row-div" style="font-family: Poppins-Bold; font-weight: bold;">
					<input type="checkbox" name="checkAll" value="chooseAll" style="zoom:1.3;" class="checkAll"/> 
					<span  style="padding-left:10px;">전체 선택</span>
				</div>	

				<!-- 해당 주문 상품 -->
				<div class="row-div">
					<input type="checkbox" name="check" value="chooseAll1" style="zoom:1.3;" class="check"/>
					<div class="how-itemcart-j" style="margin-right: 0px;">
						<img src="images/item-cart-04.jpg" alt="IMG">
					</div>
					<div class="product-info">Fresh Strawberries</div>
					<div class="product-info1">35,000원</div>
				</div>	
				<div class="row-div">
					<input type="checkbox" name="check" value="chooseAll2" style="zoom:1.3;" class="check"/>
					<div class="how-itemcart-j" style="margin-right: 0px;">
						<img src="images/item-cart-04.jpg" alt="IMG">
					</div>
					<div class="product-info">Fresh Strawberries</div>
					<div class="product-info1">35,000원</div>
				</div>	

				<div style="display: flex; flex-direction: row; align-items: center; justify-content: center; margin-top: 20px; margin-bottom: 20px;">
					<div class="flex-c-m stext-101 cl2 size-118-1 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5" style="width: 110px;" id="complete-purchase">
						구매확정
					</div>
					<div style="width:20px;"></div>
					<div class="refund-btn" style="width: 110px;">
						반품
					</div>
				</div>
		</div>
		</div>

		<!--modal2-->
		<div class="inner1">
			<div class="inner-wrap1">
					<span  style="border-bottom:1px solid #e6e6e6; padding-bottom: 10px; text-align: left;"> > 반품</span>
					<!-- 해당 주문 상품 -->
					<div class="row-div">
						<div class="how-itemcart-j1" style="margin-right: 0px;">
							<img src="images/item-cart-04.jpg" alt="IMG">
						</div>
						<div class="product-info">Fresh Strawberries</div>
						<div class="product-info1">35,000원</div>
					</div>	
					<div class="row-div">
						<div class="how-itemcart-j1" style="margin-right: 0px;">
							<img src="images/item-cart-04.jpg" alt="IMG">
						</div>
						<div class="product-info">Fresh Strawberries</div>
						<div class="product-info1">35,000원</div>
					</div>	
	
					
					<div style="margin-top: 30px;">
						<div class="flex-w flex-r-m p-b-10">
							<div class="size-203 flex-c-m respon6">
								반품 사유 선택
							</div>
				
							<div class="size-204 respon6-next">
								<div class="rs1-select2 bor8 bg0" style="z-index: 10001;">
									<select class="js-select2" name="time" id="refund-select">
										<option>반품 사유를 선택해주세요.</option>
										<option>구매 의사 취소</option>
										<option>색상 및 사이즈 변경</option>
										<option>상품 잘못 주문</option>
										<option>서비스 불만족</option>
										<option>상품 파손</option>
									</select>
									<div class="dropDownSelect2"></div>
								</div>
							</div>
						</div>
					</div>
				
	
					<div style="display: flex; flex-direction: row; align-items: center; justify-content: center; margin-top: 20px; margin-bottom: 20px;">
						
						<div class="flex-c-m stext-101 cl2 size-118-1 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5" style="width: 110px;" id="refund-complete">
							반품 신청
						</div>
					</div>
				</div>
			</div>
	
		
	</div>





	
		

	<!-- Footer -->
	<footer class="bg3 p-t-75 p-b-32">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						Categories
					</h4>

					<ul>
						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Women
							</a>
						</li>

						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Men
							</a>
						</li>

						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Shoes
							</a>
						</li>

						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Watches
							</a>
						</li>
					</ul>
				</div>

				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						Help
					</h4>

					<ul>
						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Track Order
							</a>
						</li>

						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Returns 
							</a>
						</li>

						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								Shipping
							</a>
						</li>

						<li class="p-b-10">
							<a href="#" class="stext-107 cl7 hov-cl1 trans-04">
								FAQs
							</a>
						</li>
					</ul>
				</div>

				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						GET IN TOUCH
					</h4>

					<p class="stext-107 cl7 size-201">
						Any questions? Let us know in store at 8th floor, 379 Hudson St, New York, NY 10018 or call us on (+1) 96 716 6879
					</p>

					<div class="p-t-27">
						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-facebook"></i>
						</a>

						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-instagram"></i>
						</a>

						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-pinterest-p"></i>
						</a>
					</div>
				</div>

				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						Newsletter
					</h4>

					<form>
						<div class="wrap-input1 w-full p-b-4">
							<input class="input1 bg-none plh1 stext-107 cl7" type="text" name="email" placeholder="email@example.com">
							<div class="focus-input1 trans-04"></div>
						</div>

						<div class="p-t-18">
							<button class="flex-c-m stext-101 cl0 size-103 bg1 bor1 hov-btn2 p-lr-15 trans-04">
								Subscribe
							</button>
						</div>
					</form>
				</div>
			</div>

			<div class="p-t-40">
				<div class="flex-c-m flex-w p-b-18">
					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-01.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-02.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-03.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-04.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-05.png" alt="ICON-PAY">
					</a>
				</div>

				<p class="stext-107 cl6 txt-center">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | Made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a> &amp; distributed by <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

				</p>
			</div>
		</div>
	</footer>


	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>


<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/select2/select2.min.js"></script>
<script>
	$(".js-select2").each(function(){
		$(this).select2({
			minimumResultsForSearch: 20,
			dropdownParent: $(this).next('.dropDownSelect2')
		});
	})
</script>
<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});

		$(".checkAll").click(function(){
				$(".check").prop('checked',this.checked);
		})
			
			
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
	<script>
		const body = document.querySelector('body');
		const outer = document.querySelector('.outer');
		const inner = document.querySelector('.inner');
		const inner1 = document.querySelector('.inner1');
		const btnCompleteOrder = document.querySelector('.btn-complete-order');
		const refundBtn = document.querySelector('.refund-btn');
		const completePurchase = document.getElementById('complete-purchase');
		const refundComplete = document.getElementById('refund-complete');
		const checkAll = document.getElementById('checkAll');
	

		btnCompleteOrder.addEventListener('click', () => {
			document.querySelector(".outer").style.display='block';
			document.querySelector(".inner").style.display='block';
			document.querySelector(".inner1").style.display='none';
			
			outer.classList.toggle('show');
  
		  if (outer.classList.contains('show')) {
			  body.style.overflow = 'hidden';
			  
		  }
			// document.querySelector(".inner").style.display='block';
			// document.querySelector(".inner1").style.display='none';
		});



		refundBtn.addEventListener('click', () => {
			// outer.classList.toggle('show');
			document.querySelector(".inner").style.display='none';
			document.querySelector(".inner1").style.display='block';
		  if (outer.classList.contains('show')) {
			document.querySelector(".inner").style.display='none';
			document.querySelector(".inner1").style.display='block';
		  }
  
		});

  
		outer.addEventListener('click', (event) => {
		  if (event.target === outer) {
			outer.classList.toggle('show');
  
			if (!outer.classList.contains('show')) {
				document.querySelector(".inner").style.display='none';
		  		document.querySelector(".outer").style.display='none';
			 	body.style.overflow = 'auto';
			}
		  }
		});
  

		completePurchase.addEventListener('click', (event) => {
			
		  document.querySelector(".inner").style.display='none';
		  document.querySelector(".outer").style.display='none';
		  document.getElementById("buttons").innerHTML='';
		  document.getElementById("col").innerHTML='구매확정';
		  body.style.overflow = 'auto';
			
		  
		});
  

		refundComplete.addEventListener('click', (event) => {
		
			if(document.getElementById("refund-select").selectedIndex==0){
				alert("반품 사유를 선택해주세요.")
				return;
			}

		  document.querySelector(".inner").style.display='none';
		  document.querySelector(".outer").style.display='none';
		  document.getElementById("buttons").innerHTML='';
		  document.getElementById("col").innerHTML='반품';
		  body.style.overflow = 'auto';
			
		  
		});



		
	  </script>






</body>
</html>
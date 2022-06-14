<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- Header -->
	

	<header class="header-v4">
		<!-- Header desktop -->
		<div class="container-menu-desktop">
			<!-- Topbar -->
			<div class="top-bar">
				<div class="content-topbar flex-sb-m h-full container">
					<div class="left-top-bar">
						실제 상품 구매는 함께누리몰, e-store 36.5에서 제공하고 있습니다
					</div>

					<div class="right-top-bar flex-w h-full">

						<%-- <a href="${initParam.commonUrl}account_edit_chk.html" class="flex-c-m trans-04 p-lr-25">
							My Account
						</a> --%>

						<a href="#" class="flex-c-m trans-04 p-lr-25">
							KR
						</a>

						<a href="#" class="flex-c-m trans-04 p-lr-25">
							KRW
						</a>
					</div>
				</div>
			</div>

			<div class="wrap-menu-desktop how-shadow1">
				<nav class="limiter-menu-desktop container">
					
					<!-- Logo desktop -->		
					<a href="${initParam.commonUrl}index.html" class="logo">
						<img src="${initParam.staticPath}images/goodstore5.png" alt="IMG-LOGO">
					</a>

					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">
							<li class="active-menu">
								<a href="${initParam.commonUrl}index.html">Home</a>
							</li>

							<li class="label1" data-label1="hot">
								<a href="${initParam.commonUrl}product.html">Shop</a>
							</li>

							<li>
								<a href="${initParam.commonUrl}cart">Cart</a>
							</li>

							<li>
								<a href="${initParam.commonUrl}blog.html">Blog</a>
							</li>

							<li>
								<a href="${initParam.commonUrl}about.html">About</a>
							</li>
						</ul>
					</div>
          



					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m h-full">
            <div class="login-desktop">
              <ul class="login-menu">
                <c:choose>
                	<c:when test="${sessionScope.loginSession eq null}">
	                <li>
	                  <a href="signup">회원가입</a>
	                </li>
	                <li>
	                  <a href="signin_page">로그인</a>
	                </li>
	               </c:when>
	               
	               <c:otherwise>
	                <li>
	                  <a href="logout">로그아웃</a>
	                </li>
	               </c:otherwise>
				</c:choose>

                <!-- 세션에서 유저의 로그인을 확인하면
                <li>
                  <a href="signout.html">Sign Out</a>
                </li> -->
              </ul>
            </div>

						<div class="flex-c-m h-full">
							<div class="icon-header-item cl2 hov-cl1 trans-04 p-lr-11 js-show-modal-search">
								<i class="zmdi zmdi-search"></i>
							</div>
						</div>
							
						<div class="flex-c-m h-full p-l-18"> 
							<a href="${initParam.commonUrl}cart" class="icon-header-item cl2 hov-cl1 trans-04 p-lr-11">
								<i class="zmdi zmdi-shopping-cart"></i>
							</a>
						</div>
						
						<c:if test="${!empty sessionScope.loginSession}">
            			<div class="flex-c-m h-full p-l-18">
				            <a href="${initParam.commonUrl}wishlist?member_id=${sessionScope.loginSession}" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-" >
								<i class="zmdi zmdi-favorite-outline"></i>
							</a>
            			</div>
            			</c:if>

						<div class="flex-c-m h-full p-lr-19">
							<div class="icon-header-item cl2 hov-cl1 trans-04 p-lr-11 js-show-sidebar">
								<i class="zmdi zmdi-menu"></i>
							</div>
						</div>
					</div>
				</nav>
			</div>	
		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->		
			<div class="logo-mobile">
				<a href="${initParam.commonUrl}index.html"><img src="${initParam.staticPath}images/goodstore5.png" alt="IMG-LOGO"></a>
			</div>

			<!-- Icon header -->
			<div class="wrap-icon-header flex-w flex-r-m h-full m-r-15">
				<div class="flex-c-m h-full p-r-10">
					<div class="icon-header-item cl2 hov-cl1 trans-04 p-lr-11 js-show-modal-search">
						<i class="zmdi zmdi-search"></i>
					</div>
				</div>

				<div class="flex-c-m h-full p-lr-10 bor5">
					<div class="icon-header-item cl2 hov-cl1 trans-04 p-lr-11 icon-header-noti js-show-cart" data-notify="2">
						<i class="zmdi zmdi-shopping-cart"></i>
					</div>
				</div>
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
			<ul class="main-menu-m">
				<li>
					<a href="${initParam.commonUrl}index.html">Home</a>
					<ul class="sub-menu-m">
						<li><a href="${initParam.commonUrl}index.html">Homepage</a></li>
					</ul>
					<span class="arrow-main-menu-m">
						<i class="fa fa-angle-right" aria-hidden="true"></i>
					</span>
				</li>

				<li>
					<a href="${initParam.commonUrl}product.html">Shop</a>
				</li>

				<li>
					<a href="${initParam.commonUrl}shoping-cart.html" class="label1 rs1" data-label1="hot">Features</a>
				</li>

				<li>
					<a href="${initParam.commonUrl}blog">Blog</a>
				</li>

				<li>
					<a href="${initParam.commonUrl}about">About</a>
				</li>

			</ul>
		</div>



		<!-- Modal Search -->
		<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
			<div class="container-search-header">
			<!-- 검색 설정해줘야함 -->
				<button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
					<img src="${initParam.staticPath}images/icons/icon-close2.png" alt="CLOSE">
				</button>

				<!-- 검색으로 넘겨주기 -->
				<form action="${initParam.commonUrl}product" class="wrap-search-header flex-w p-l-15">
					<button class="flex-c-m trans-04">
						<i class="zmdi zmdi-search"></i>
					</button>
					<input class="plh3" type="text" name="keyword" placeholder="Search...">
				</form>
			</div>
		</div>
	</header>
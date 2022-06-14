<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- Sidebar -->
	<aside class="wrap-sidebar js-sidebar">
		<div class="s-full js-hide-sidebar"></div>

		<div class="sidebar flex-col-l p-t-22 p-b-25">
			<div class="flex-r w-full p-b-30 p-r-27">
				<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-sidebar">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>

			<div class="sidebar-content flex-w w-full p-lr-65 js-pscroll">
				<ul class="sidebar-link w-full">
					<li class="p-b-13">
						<a href="${initParam.commonUrl}index.html" class="stext-102 cl2 hov-cl1 trans-04">
							홈
						</a>
					</li>

					<li class="p-b-13">
						<a href="${initParam.commonUrl}cart" class="stext-102 cl2 hov-cl1 trans-04">
							장바구니
						</a>
					</li>

					<%-- <li class="p-b-13">
						<a href="${initParam.commonUrl}account_edit_chk.html" class="stext-102 cl2 hov-cl1 trans-04">
							나의 계정
						</a>
					</li> --%>

					<li class="p-b-13">
						<a href="orderList" class="stext-102 cl2 hov-cl1 trans-04">
							주문내역
						</a>
					</li>

				</ul>

				<div class="sidebar-gallery w-full p-tb-30">
					<span class="mtext-101 cl5">
						@GoodStore
					</span>

					<div class="flex-w flex-sb p-t-36 gallery-lb">
						<!-- item gallery sidebar -->
						<div class="wrap-item-gallery m-b-10">
							<a class="item-gallery bg-img1" href="https://www.sepp.or.kr/upload/item/031LPSE202110190000093049/20211019130323M.jpg" data-lightbox="gallery" 
							style="background-image: url('https://www.sepp.or.kr/upload/item/031LPSE202110190000093049/20211019130323M.jpg');"></a>
						</div>

						<!-- item gallery sidebar -->
						<div class="wrap-item-gallery m-b-10">
							<a class="item-gallery bg-img1" href="	https://www.sepp.or.kr/upload/item/033LPSE202008240000083492/20200824190423M.png" data-lightbox="gallery" 
							style="background-image: url('	https://www.sepp.or.kr/upload/item/033LPSE202008240000083492/20200824190423M.png');"></a>
						</div>

						<!-- item gallery sidebar -->
						<div class="wrap-item-gallery m-b-10">
							<a class="item-gallery bg-img1" href="https://www.sepp.or.kr/upload/item/053LPSE202108240000091379/20210824170137M.jpg" data-lightbox="gallery" 
							style="background-image: url('https://www.sepp.or.kr/upload/item/053LPSE202108240000091379/20210824170137M.jpg');"></a>
						</div>

						<!-- item gallery sidebar -->
						<div class="wrap-item-gallery m-b-10">
							<a class="item-gallery bg-img1" href="https://www.sepp.or.kr/upload/item/002LPSE201904020000012418/20210422164501M(1).jpg" data-lightbox="gallery" 
							style="background-image: url('https://www.sepp.or.kr/upload/item/002LPSE201904020000012418/20210422164501M(1).jpg');"></a>
						</div>

						<!-- item gallery sidebar -->
						<div class="wrap-item-gallery m-b-10">
							<a class="item-gallery bg-img1" href="${initParam.staticPath}images/gallery-05.jpg" data-lightbox="gallery" 
							style="background-image: url('${initParam.staticPath}images/gallery-05.jpg');"></a>
						</div>

						<!-- item gallery sidebar -->
						<div class="wrap-item-gallery m-b-10">
							<a class="item-gallery bg-img1" href="${initParam.staticPath}images/gallery-06.jpg" data-lightbox="gallery" 
							style="background-image: url('${initParam.staticPath}images/gallery-06.jpg');"></a>
						</div>

						<!-- item gallery sidebar -->
						<div class="wrap-item-gallery m-b-10">
							<a class="item-gallery bg-img1" href="${initParam.staticPath}images/gallery-07.jpg" data-lightbox="gallery" 
							style="background-image: url('${initParam.staticPath}images/gallery-07.jpg');"></a>
						</div>

						<!-- item gallery sidebar -->
						<div class="wrap-item-gallery m-b-10">
							<a class="item-gallery bg-img1" href="${initParam.staticPath}images/gallery-08.jpg" data-lightbox="gallery" 
							style="background-image: url('${initParam.staticPath}images/gallery-08.jpg');"></a>
						</div>

						<!-- item gallery sidebar -->
						<div class="wrap-item-gallery m-b-10">
							<a class="item-gallery bg-img1" href="${initParam.staticPath}images/gallery-09.jpg" data-lightbox="gallery" 
							style="background-image: url('${initParam.staticPath}images/gallery-09.jpg');"></a>
						</div>
					</div>
				</div>

				<div class="sidebar-gallery w-full">
					<span class="mtext-101 cl5">
						About Us
					</span>

					<p class="stext-108 cl6 p-t-27">
					사회적 기업 생산품 판매
					</p>
				</div>
			</div>
		</div>
	</aside>

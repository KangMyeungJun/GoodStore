<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Blog Detail</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../common/static_link.jsp" %>
</head>
<body class="animsition">
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/sidebar.jsp" %>

	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="blog.html" class="stext-109 cl8 hov-cl1 trans-04">
				Blog
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				누야하우스
			</span>
		</div>
	</div>


	<!-- Content page -->
	<section class="bg0 p-t-52 p-b-20">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-lg-9 p-b-80">
					<div class="p-r-45 p-r-0-lg">
						<!--  -->
						<div class="wrap-pic-w how-pos5-parent">
							<img class="blog-detail-img" src="https://adm.hknuri.co.kr/upload/editor/seller_main_item/3000/2461_2.jpg" alt="IMG-BLOG">

							<div class="flex-col-c-m size-123 bg9 how-pos5">
								<span class="ltext-107 cl2 txt-center">
									22
								</span>

								<span class="stext-109 cl3 txt-center">
									Jan 2018
								</span>
							</div>
						</div>

						<div class="p-t-32">
							<span class="flex-w flex-m stext-111 cl2 p-b-19">
								<span>
									<span class="cl4">By</span> Admin  
									<span class="cl12 m-l-4 m-r-6">|</span>
								</span>

								<span>
									22 Jan, 2018
									<span class="cl12 m-l-4 m-r-6">|</span>
								</span>

								<span>
                  <p>
                    <!--여기서부터 반복
                    해당 포스트 태그 테이블 반복문 돌리되, 마지막 태그 뒤에는 <span class="tag-separator">안들어가도록
                    -->
                    직업재활시설
                    <span class="tag-separator"></span>
                    중증장애인생산품판매시설
                    <span class="tag-separator"></span>
                    사회적기업
                    <!--반복문 끝-->
                    <span class="cl12 m-l-4 m-r-6">|</span>
                  </p>
								</span>

								<span>
									8 Comments
								</span>
							</span>

							<h4 class="ltext-109 cl2 p-b-28">
								누야하우스
							</h4>

							<p class="stext-117 cl6 p-b-26">
                누야하우스는 친환경 핸드메이드 제품(비누, 화장품)을 생산하여 취약계층의 고용창출을 목표로 자연사랑, 인간존중이라는 신념으로 착한제품, 신뢰할 수 있는 제품을 만들어 가는 장애인직업재활시설이자 사회적기업입니다.<br/><br/>					
              </p>

						</div>

						<div class="flex-w flex-t p-t-16">
							<span class="size-216 stext-116 cl8 p-t-4">
								Tags
							</span>

							<div class="flex-w size-217">
								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
                  직업재활시설
                </a>
								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
                  중증장애인생산품판매시설
								</a>
								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
                  사회적기업
								</a>
							</div>
						</div>

						<!--  -->
						<div class="p-t-40">
							<h5 class="mtext-113 cl2 p-b-12">
								Leave a Comment
							</h5>

							<p class="stext-107 cl6 p-b-40">
								Your email address will not be published. Required fields are marked *
							</p>

							<form>
								<div class="bor19 m-b-20">
									<textarea class="stext-111 cl2 plh3 size-124 p-lr-18 p-tb-15" name="cmt" placeholder="Comment..."></textarea>
								</div>

								<!-- <div class="bor19 size-218 m-b-20">
									<input class="stext-111 cl2 plh3 size-116 p-lr-18" type="text" name="email" placeholder="Email *">
								</div> -->

                <div class="flex-r-m">
								<button class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04">
									Post Comment
								</button>
                </div>
							</form>
              <div class="mtext-111 cl2 m-tb-20 p-b-12">
								Comments
							</div>

              <div class="blog-detail-comment">
                <div class="flex-w flex-sb-m p-b-10 m-t-10">
                  <span class="mtext-107 cl2 p-r-20">
                    test@google.com
                  </span>
                </div>

                <p class="stext-102 cl6 m-b-20">
                  포스트에 대한 테스트 댓글입니다 포스트에 대한 테스트 댓글입니다 포스트에 대한 테스트 댓글입니다 포스트에 대한 테스트 댓글입니다 포스트에 대한 테스트 댓글입니다 포스트에 대한 테스트 댓글입니다 
                </p>
              </div>
              <div class="blog-detail-comment">
                <div class="flex-w flex-sb-m p-b-10 m-t-10">
                  <span class="mtext-107 cl2 p-r-20">
                    test@google.com
                  </span>
                </div>

                <p class="stext-102 cl6 m-b-20">
                  포스트에 대한 테스트 댓글입니다 포스트에 대한 테스트 댓글입니다 포스트에 대한 테스트 댓글입니다 포스트에 대한 테스트 댓글입니다 포스트에 대한 테스트 댓글입니다 포스트에 대한 테스트 댓글입니다 
                </p>
              </div>
              <div class="blog-detail-comment">
                <div class="flex-w flex-sb-m p-b-10 m-t-10">
                  <span class="mtext-107 cl2 p-r-20">
                    test@google.com
                  </span>
                </div>

                <p class="stext-102 cl6 m-b-20">
                  포스트에 대한 테스트 댓글입니다 포스트에 대한 테스트 댓글입니다 포스트에 대한 테스트 댓글입니다 포스트에 대한 테스트 댓글입니다 포스트에 대한 테스트 댓글입니다 포스트에 대한 테스트 댓글입니다 
                </p>
              </div>
              <div class="blog-detail-comment">
                <div class="flex-w flex-sb-m p-b-10 m-t-10">
                  <span class="mtext-107 cl2 p-r-20">
                    test@google.com
                  </span>
                </div>

                <p class="stext-102 cl6 m-b-20">
                  포스트에 대한 테스트 댓글입니다 포스트에 대한 테스트 댓글입니다 포스트에 대한 테스트 댓글입니다 포스트에 대한 테스트 댓글입니다 포스트에 대한 테스트 댓글입니다 포스트에 대한 테스트 댓글입니다 
                </p>
              </div>

						<!-- Pagination -->
						<div class="flex-l-m flex-w w-full p-t-10 m-lr--7">
							<a href="#" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1">
								1
							</a>

							<a href="#" class="flex-c-m how-pagination1 trans-04 m-all-7">
								2
							</a>
						</div>

						</div>
					</div>
				</div>



        <!---------------------side-menu---------------------->
				<div class="col-md-4 col-lg-3 p-b-80">
					<div class="side-menu">
						<div class="bor17 of-hidden pos-relative">
							<input class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" name="search" placeholder="Search">

							<button class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04">
								<i class="zmdi zmdi-search"></i>
							</button>
						</div>


						<div class="p-t-50">
							<h4 class="mtext-112 cl2 p-b-27">
								Tags
							</h4>

							<div class="flex-w m-r--5">
								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									사회적기업
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									친환경인증기업
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									여성기업
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									장애인표준사업장
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									협동조합
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>	
	
<%@ include file="../common/footer.jsp" %>
<!-- <Modal1이 없음> -->
<%@ include file="../common/common_js.jsp" %>

</body>
</html>
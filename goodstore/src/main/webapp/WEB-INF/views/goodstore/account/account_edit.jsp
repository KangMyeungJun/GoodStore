<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<head>
	<title>GOOD STORE</title>
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

			<span class="stext-109 cl4">
				My Account
			</span>
		</div>
	</div>
		


			<!-- Content page -->
	<section class="bg0 p-t-104 p-b-116">
		<div class="container bor10">
			<div class="flex-c">
				<!-- <div class="bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md"> -->
				<div class="p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md m-b-100">
          <h4 class="mtext-105 cl2 p-b-30 m-tb-50 text-center">
            My Account
          </h4>
					<form class="frm1">
            <div class="col">
              <div for="zipcode" class="flex-l-m fs-22 p-l-10 m-t-60 m-b-25 bor16" style="font-weight:bold;">기본 정보 수정</div>
              <div class="w-full flex-w m-b-12">
                <label for="name" class="flex-l-m fs-18 m-b-8" style="width:100px">이름</label>
                <div class="flex-c-m bor8 trans-04 m-lr-12 m-b-10" style="width:25vw">
                  <input class="mtext-102 cl2 plh1 size-116 p-l-20 p-r-30" type="text" name="name" placeholder="테스트">
                </div>
              </div>
              <div class="w-full flex-w m-b-12">
                <label for="phone" class="flex-l-m fs-18 m-b-8" style="width:100px">휴대폰 번호</label>
                <div class="flex-c-m bor8 trans-04 m-lr-12 m-b-10" style="width:25vw">
                  <input class="mtext-102 cl2 plh1 size-116 p-l-20 p-r-30" type="text" name="phone" placeholder="010-1234-5678">
                </div>
              </div>

              <div class="w-full flex-w m-b-12">
                <label for="email" class="flex-l-m fs-18 m-b-8" style="width:100px">이메일</label>
                <div class="flex-c-m bor8 trans-04 m-lr-12 m-b-10" style="width:25vw">
                  <input class="mtext-102 cl2 plh1 size-116 p-l-20 p-r-30" type="text" name="email" placeholder="test@test.com" readonly="readonly">
                </div>
              </div>
                <label for="zipcode" class="flex-l-m fs-22 p-l-10 m-t-60 m-b-25 bor16" style="font-weight:bold;">주소지</label>
                <div class="flex-l-m trans-04 w-full m-b-10 m-r-12 bor19" style="width:8vw;">
                  <input class="mtext-102 cl2 plh1 size-116 p-l-20 p-r-30" type="text" name="zipcode" placeholder="123456">
                </div>
                <div class="flex-l-m trans-04 w-full m-b-10 m-r-12 bor12">
                  <input class="mtext-102 cl2 plh1 size-116 p-l-20 p-r-30" type="text" name="address1" placeholder="서울특별시 강남구 역삼동 테헤란로 132">
                </div>
                <div class="flex-l-m trans-04 w-full m-b-10 m-r-12 bor12">
                  <input class="mtext-102 cl2 plh1 size-116 p-l-20 p-r-30" type="text" name="address2" placeholder="한독약품빌딩 8층">
                </div>                
                <div class="flex-r-m">
                  <button type="button" class="flex-c-m stext-101 cl0 size-107 bg5 bor2 hov-btn3 p-lr-15 trans-04 m-tb-12">
                    수정완료
                  </button>
                </div>
            </div>
					</form>

          <form class="frm2 m-t-40">
            <div class="col">
              <div for="zipcode" class="flex-l-m fs-22 p-l-10 m-t-60 m-b-25 bor16" style="font-weight:bold;">비밀번호 변경</div>
              <div class="w-full flex-w m-b-12">
                <label for="name" class="flex-l-m fs-18 m-b-8" style="width:150px">새 비밀번호</label>
                <div class="flex-c-m bor8 trans-04 m-lr-12 m-b-10" style="width:25vw">
                  <input class="mtext-102 cl2 plh1 size-116 p-l-20 p-r-30" type="text" name="name" placeholder="새 비밀번호">
                </div>
              </div>
              <div class="w-full flex-w m-b-12">
                <label for="name" class="flex-l-m fs-18 m-b-8" style="width:150px">새 비밀번호 확인</label>
                <div class="flex-c-m bor8 trans-04 m-lr-12 m-b-10" style="width:25vw">
                  <input class="mtext-102 cl2 plh1 size-116 p-l-20 p-r-30" type="text" name="name" placeholder="새 비밀번호 확인">
                </div>
              </div>

              <div class="flex-r-m m-t-20">
                <button type="button" class="m-r-15 flex-c-m stext-101 cl0 size-107 bg5 bor2 hov-btn3 p-lr-15 trans-04 m-tb-12">
                  수정완료
                </button>
                <button type="button" class="flex-c-m stext-101 cl0 size-107 bg2 bor2 hov-btn3 p-lr-15 trans-04 m-tb-12" style="color: rgb(97, 97, 97)">
                  회원탈퇴
                </button>
              </div>
          </form>


				</div>
			</div>
		</div>
	</section>	
	
<%@ include file="../common/footer.jsp" %>
<%@ include file="../common/common_js.jsp" %>		
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<head>
	<title>GOOD STORE</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../common/static_link.jsp" %>
<style>
    .signupBox{
      font-family: Poppins-SemiBold;
      font-size: 16px;
      line-height: 1.6;
      width: 25vw;
      height: 50px;
      padding: 0 20px 0 20px;
      margin: 10px 0 20px 0;
      border: 1px solid #e6e6e6;
      border-radius: 2px;
    }
    
    .btnFont{
    	color: rgb(97, 97, 97);
    }
</style>
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
				Sign Up
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
            회원가입
          </h4>
					<form class="frm1">

              <div class="fs-22 p-l-10 m-t-60 m-b-25 bor16" style="font-weight:bold;">기본정보</div>
              <label for="name" class="fs-18">이름</label>
              <input class="signupBox plh1" type="text" name="name" placeholder="이름을 입력해주세요.">
              <label for="email" class="fs-18">이메일</label>
              <input class="signupBox plh1" type="text" name="email" placeholder="이메일을 입력해주세요.">
              <!-- <div>중복된 이메일이 존재합니다</div> -->
              <div class="flex-r-m">
                <button type="button" class="flex-c-m stext-101 cl0 size-107 bg2 bor2 hov-btn3 m-b-15 p-lr-15 trans-04 btnFont">
                  이메일 중복확인
                </button>
              </div>

              <label for="name" class="fs-18">비밀번호</label>
              <input class="signupBox plh1" type="text" name="name" placeholder="문자와 특수문자, 숫자를 조합하여 입력해주세요.">
              <input class="signupBox plh1" type="text" name="name" placeholder="비밀번호를 한번 더 입력해주세요." style="margin-top:-15px;">

              <label for="tel" class="fs-18">휴대폰번호</label>
              <input class="signupBox plh1" type="text" name="tel" placeholder="예시) 000-0000-0000">
              <!-- <div>중복된 휴대폰 번호가 존재합니다</div> -->              
              <div class="flex-r-m">
                <button type="button" class="flex-c-m stext-101 cl0 size-107 bg2 bor2 hov-btn3 m-b-15 p-lr-15 trans-04 btnFont">
                  휴대폰 중복확인
                </button>
              </div>


                <label for="zipcode" class="flex-l-m fs-22 p-l-10 m-t-40 m-b-25 bor16" style="font-weight:bold;">주소지</label>
                <div class="flex-l-m trans-04 w-full m-b-10 m-r-12 bor19" style="width:200px;">
                  <input class="mtext-102 cl2 plh1 size-116 p-l-20 p-r-30" type="text" name="zipcode" placeholder="우편번호">
                </div>
                <div class="flex-l-m trans-04 w-full m-b-10 m-r-12 bor12">
                  <input class="mtext-102 cl2 plh1 size-116 p-l-20 p-r-30" type="text" name="address1" placeholder="주소를 입력해주세요.">
                </div>
                <div class="flex-l-m trans-04 w-full m-b-10 m-r-12 bor12">
                  <input class="mtext-102 cl2 plh1 size-116 p-l-20 p-r-30" type="text" name="address2" placeholder="상세주소를 입력해주세요.">
                </div>                
                <div class="flex-r-m">
                  <button type="button" class="flex-c-m stext-101 cl0 size-107 bg5 bor2 hov-btn3 p-lr-15 trans-04 m-tb-12">
                    수정완료
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
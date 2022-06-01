<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
					<form class="frm">
            
            <div class="flex-w w-full">
              <div class="flex-c-m fs-18 m-b-8" style="width:170px">비밀번호 확인</div>
              <div class="flex-c-m bor8 how-pos4-parent trans-04 m-lr-12 m-b-10" style="width:25vw">
                <input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="password" name="password" placeholder="비밀번호 확인">
                <img class="how-pos4 pointer-none" src="${initParam.staticPath}images/icons/icon-password.png" alt="ICON">              
              </div>
              <div class="flex-c-m">
                <!--type과 onlick 속성은 백엔드 구현할 때 삭제할 것-->
                <button type="button" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-8" onclick="location.href='account_edit.html'">
                  Submit
                </button>
              </div>
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
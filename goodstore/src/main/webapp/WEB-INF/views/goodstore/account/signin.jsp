<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			<a href="index" class="stext-109 cl8 hov-cl1 trans-04">
				홈
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				로그인
			</span>
		</div>
	</div>
		


			<!-- Content page -->
	<section class="bg0 p-t-104 p-b-116">
		<div class="container bor10">
			<div class="flex-c">
				<!-- <div class="bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md"> -->
				<div class="p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
					<form action="signin_result" id="login-frm" method="get">
						<h4 class="mtext-105 cl2 txt-center p-b-30 m-tb-50" style="width:25vw">
							로그인
						</h4>

						<div class="bor8 m-b-20 how-pos4-parent">
							<input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" name="email" placeholder="아이디 입력" id="email">
							<img class="how-pos4 pointer-none" src="${initParam.staticPath}images/icons/icon-email.png" alt="ICON">
						</div>
            
						<div class="bor8 m-b-30 how-pos4-parent">
              <input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="password" name="password" placeholder="비밀번호 입력" id="password">
              <img class="how-pos4 pointer-none" src="${initParam.staticPath}images/icons/icon-password.png" alt="ICON">
						</div>
            
						<input type="button" value="Submit" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer" onclick="loginHandle()"/>
            <div class="flex-c-m cl0 size-121 p-lr-15 m-t-50">
              <a class="m-lr-10 cl2" href="find_email">아이디 찾기</a>
              <a class="m-lr-10 cl2" href="password">비밀번호 찾기</a>
              <a class="m-lr-10 cl1" href="signup">회원가입</a>
            </div>
					</form>
				</div>
			</div>
		</div>
	</section>	

<%@ include file="../common/footer.jsp" %>
<%@ include file="../common/common_js.jsp" %>
<script type="text/javascript">
	if('${loginErrMsg}'=="이메일이나 비밀번호가 틀립니다."){
		alert('${loginErrMsg}');
	}
	if('${newPass}'=="비밀번호가 새로 설정되었습니다."){
		alert('${newPass}');
	}
	

function loginHandle(){
	if($("#email").val()==""){
		alert("이메일을 입력해주세요.");
		$("#email").focus();
		return;
	}
	if($("#password").val()==""){
		alert("비밀번호를 입력해주세요.");
		$("#password").focus();return;
	}
	$("#login-frm").submit();
}

//history.replaceState({},null,location.pathname);
</script>		
</body>
</html>
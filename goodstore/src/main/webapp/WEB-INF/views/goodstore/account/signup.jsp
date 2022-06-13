<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
         
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
				홈
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				회원가입
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
			<form class="frm1" id="frm1" action="signup_result">

              <div class="fs-22 p-l-10 m-t-60 m-b-25 bor16" style="font-weight:bold;">기본정보</div>
              <label for="name" class="fs-18">이름</label>
              <input class="signupBox plh1" type="text" name="name" id="name" placeholder="이름을 입력해주세요.">
              <label for="email" class="fs-18">이메일</label>
              <input class="signupBox plh1" type="text" name="email" placeholder="이메일을 입력해주세요." id="email">
              <!-- <div>중복된 이메일이 존재합니다</div> -->
              <div class="flex-r-m" style="justify-content:space-between; align-items:flex-start;">
              <span id="email-chk-line"></span>
                <input type="button" value="이메일 중복확인" id="email-dup-chk" 
                class="flex-c-m stext-101 cl0 size-107 bg2 bor2 hov-btn3 m-b-15 p-lr-15 trans-04 btnFont"
                onclick="emailChkHandle()"/>
              </div>

              <label for="name" class="fs-18">비밀번호</label>
              <input class="signupBox plh1" type="password" name="password" id="password" placeholder="문자와 특수문자, 숫자를 조합하여 입력해주세요.">
              <input class="signupBox plh1" type="password" name="password2" id="password2" placeholder="비밀번호를 한번 더 입력해주세요." style="margin-top:-15px;" >

              <label for="tel" class="fs-18">휴대폰번호</label>
              <input class="signupBox plh1" type="text" id="tel" name="tel" placeholder="예시) 000-0000-0000">
              <!-- <div>중복된 휴대폰 번호가 존재합니다</div> -->              
              <div class="flex-r-m" style="justify-content:space-between; align-items:flex-start;">
              <span id="tel-chk-line"></span>
                <input value="휴대폰 중복확인" type="button" id="tel-dup-chk" onclick="telChkHandle()"
                class="flex-c-m stext-101 cl0 size-107 bg2 bor2 hov-btn3 m-b-15 p-lr-15 trans-04 btnFont"/>
              </div>


                <label for="zipcode" class="flex-l-m fs-22 p-l-10 m-t-40 m-b-25 bor16" style="font-weight:bold;">주소지</label>
                <div class="flex-l-m trans-04 w-full m-b-10 m-r-12 bor19" style="width:200px;">
                  <input class="mtext-102 cl2 plh1 size-116 p-l-20 p-r-30" type="text" name="zipcode" id="zipcode"
                  	placeholder="우편번호" onclick="sample6_execDaumPostcode()">
                </div>
                <div class="flex-l-m trans-04 w-full m-b-10 m-r-12 bor12">
                  <input class="mtext-102 cl2 plh1 size-116 p-l-20 p-r-30" type="text" id="address"
                  name="address" placeholder="주소를 입력해주세요." onclick="sample6_execDaumPostcode()">
                </div>
                <div class="flex-l-m trans-04 w-full m-b-10 m-r-12 bor12"> 
                  <input class="mtext-102 cl2 plh1 size-116 p-l-20 p-r-30" type="text"  id="address2"
                  name="address2" placeholder="상세주소를 입력해주세요.">
                </div>                
                <div class="flex-r-m">
                  <input type="button" value="가입하기" id="register-btn"
                  class="flex-c-m stext-101 cl0 size-107 bg5 bor2 hov-btn3 p-lr-15 trans-04 m-tb-12"/>
                </div>
					</form>
				</div>
			</div>
		</div>
	</section>	
<%@ include file="../common/footer.jsp" %>
<%@ include file="../common/common_js.jsp" %>	
<script type="text/javascript">
var emailChk=false;
var telChk=false;


function emailChkHandle(){//이메일 중복확인
	  //$("#spanEmail").css("display","none");
	  var email=$("#email").val();
	  var pattern=/\s/g;
	  let reg_email =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/; // 길이까지 확실한 검증
	    
	  if($("#email").val()==""){
		  alert("이메일을 입력해주세요.")
		  return;
	  }

	  if(email.match(pattern)){
	    	alert("이메일을 정확히 입력해주세요.");
	    	$("#email").focus();return;
	    }
	   	
	   	if(!reg_email.test(email)){
	    	alert("이메일을 정확히 입력해주세요.");
	    	$("#email").focus();return;
	    }
	  
	  
	  $.ajax({
		  url:"emailchk",
		  data:{email:$("#email").val()},
		  dataType:"json",
		  type:"get",
		  error:function(xhr){
			  alert(xhr.status);
		  },
		  success:function(json){
			  
			  if(json.flag!=0){
				  document.getElementById('email-chk-line').style.color="#FF0000";
				  document.getElementById('email-chk-line').innerText="사용 불가능합니다."
				  //alert("올바른 이메일을 입력해주세요");
			  }else{
				  emailChk=true;
				  document.getElementById('email-chk-line').style.color="#0000FF";
				  document.getElementById('email-chk-line').innerText="사용 가능합니다."
			 }//end else
			  
		  }//success
		  
	  });//ajax
	  
}//show



function telChkHandle(){//휴대폰 중복확인
	  //$("#spanEmail").css("display","none");
	  
	  if($("#tel").val()==""){
		  alert("휴대폰번호를 입력해주세요.");
		  return;
	  }
	  
	  var tel=$("#tel").val();
	  var pattern=/\s/g;
	  let reg_mobile = /^\d{3}-\d{3,4}-\d{4}$/; // 휴대폰 번호
	  
	  if(tel.match(pattern)){
	    	alert("휴대폰번호를 정확히 입력해주세요.");
	    	$("#tel").focus();return;
	    
	  	}
	  	if(!reg_mobile.test(tel)){
	    	alert("휴대폰번호를 정확히 입력해주세요.");
	    	$("#tel").focus();
	    	return;
	    }
	  
	  $.ajax({
		  url:"telChk",
		  data:{tel:$("#tel").val()},
		  dataType:"json",
		  type:"get",
		  error:function(xhr){
			  alert(xhr.status);
		  },
		  success:function(json){
			  
			  if(json.flag!=0){
				  document.getElementById('tel-chk-line').style.color="#FF0000";
				  document.getElementById('tel-chk-line').innerText="사용 불가능합니다."
				  //alert("올바른 이메일을 입력해주세요");
			  }else{
				  telChk=true;
				  document.getElementById('tel-chk-line').style.color="#0000FF";
				  document.getElementById('tel-chk-line').innerText="사용 가능합니다."
			 }//end else
			  
		  }//success
		  
	  });//ajax
	  
}//show
</script>	
<script type="text/javascript">
$("#email").keyup(function(){
	emailChk=false;
	document.getElementById('email-chk-line').innerText="";
})

$("#tel").keyup(function(){
	telChk=false;
	document.getElementById('tel-chk-line').innerText="";
})


//회원가입 
 $("#register-btn").click(function(){

	    var name=$("#name").val();
	    var tel=$("#tel").val();
	    
	    var email=$("#email").val();
	    
	    var password=$("#password").val();
	    var password2=$("#password2").val();
	    
	    var zipcode=$("#zipcode").val();
	    var address=$("#address").val();
	    var address2=$("#address2").val();
	    
	    var pattern=/\s/g;
	    
	    let reg_mobile = /^\d{3}-\d{3,4}-\d{4}$/; // 휴대폰 번호
	    let reg_email =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/; // 길이까지 확실한 검증
	    let reg_pw2 = /(?=.*[a-zA-ZS])(?=.*?[#?!@$%^&*-]).{8,}/; // 문자와 특수문자 조합의 6~24 자리
	    let reg_nick1 = /^[가-힣a-zA-Z0-9_-]{4,20}$/; // 닉네임
	    
	    var telConfirm=false;
	    
	    //---------------이름 유효성 검사--------------
	    if(name==""){
	    	alert("이름을 입력해주세요.");
	    	$("#name").focus();return;
	    }
	    
	    //-------------이메일 유효성 검사--------------
	    if(!emailChk){
	    	alert("이메일 중복체크를 해주세요.");
	    	$("#email").focus();return;
	    }
	    
	   
	    //-------------비밀번호 유효성 검사--------------
	    if(password==""){
	    	alert("비밀번호를 입력해주세요.");
	    	$("#password").focus();return;
	    }
	    if(password.match(pattern)){
	    	alert("비밀번호를 정확히 입력해주세요.");
	    	$("#password").focus();return;
	    }
	    if(!reg_pw2.test(password)){
	    	alert("문자와 특수문자, 숫자를 조합하여 8자 이상의 비밀번호를 입력해주세요.");
	    	$("#password").focus();return;
	    }

	    
	    //-------------비밀번호 확인 유효성 검사--------------
	    if(password2==""){
	    	alert("비밀번호를 확인해주세요.");
	    	$("#password2").focus();return;
	    }
	    if(password2.match(pattern)){
	    	alert("비밀번호를 확인해주세요.");
	    	$("#password").focus();return;
	    }
	    if(password!=password2){
	    	alert("비밀번호를 확인해주세요.");
	    	$("#password2").focus();return;
	    }
	    
	  //---------------전화번호 유효성 검사--------------
	    if(tel==""){
	    	alert("휴대폰를 입력해주세요.");
	    	$("#tel").focus();return;
	    }
	  
	    if(!telChk){
	    	alert("휴대폰 중복체크를 해주세요.");
	    	$("#tel").focus();return;
	    }
	    
	    
	    
	    
	    if(zipcode==""){
	    	alert("주소를 입력해주세요.");
	    	$("#zipcode").focus();return;
	    }
	    
	    if(address==""){
	    	alert("주소를 입력해주세요.");
	    	$("#address").focus();return;
	    }
	    
	    if(address2==""){
	    	alert("주소를 입력해주세요.");
	    	$("#address2").focus();return;
	    }

		
		
	    $("#frm1").submit();
		
    });//click
</script>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        
    	new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    //document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address2").focus();
            }
        }).open();
    		
    	
    }
    
 /*    if('${regisDone}'=="회원가입에 실패하였습니다."){
    	alert('${regisDone}');
    } */
</script>
</body>
</html>
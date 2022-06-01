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

			<!-- Content page -->
      <section class="bg0 p-t-104 p-b-116">
        <div class="container bor10">
          <div class="flex-c">
            <!-- <div class="bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md"> -->
            <div class="p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
              <form>
                <h4 class="mtext-105 cl2 txt-center p-b-30 m-tb-50" style="width:25vw">
                  새 비밀번호 설정
                </h4>

						<div class="bor8 m-b-20">
							<input class="stext-111 cl2 plh3 size-116 p-l-20 p-r-30" type="password" name="password" placeholder="새 비밀번호">
						</div>
            
						<div class="bor8 m-b-30">
              <input class="stext-111 cl2 plh3 size-116 p-l-20 p-r-30" type="password" name="password-conf" placeholder="새 비밀번호 확인">
						</div>
            
						<button class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">
							비밀번호 변경
						</button>
            
					</form>
				</div>
			</div>
		</div>
	</section>

<%@ include file="../common/footer.jsp" %>
<%@ include file="../common/common_js.jsp" %>		
</body>
</html>
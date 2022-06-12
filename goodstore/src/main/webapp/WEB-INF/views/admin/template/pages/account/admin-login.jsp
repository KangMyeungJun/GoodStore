<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Kmong Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${initParam.staticPath}assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${initParam.staticPath}assets/vendors/css/vendor.bundle.base.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="${initParam.staticPath}assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="${initParam.staticPath}assets/images/favicon.png" />
      <style type="text/css">
  .login_warning{margin-top: 30px; text-align: center; color:red;}
  </style>
  </head>
  <body>

  
  
    <script type="text/javascript">
		
		$(function(){
			
			
			 $("#loginbtn").click(function(){
				 if($("#id").val() == ""){
					alert("아이디를 입력해주세요");	
					return;
				 }//end if
				 if($("#password").val() == ""){
					alert("비밀번호를 입력해주세요");
					return;
				 }//end if
					$("#loginfrm").submit();
				})//click 
					});
      
      
      </script>
  
  
  
  

  
  
  
    <div class="container-scroller">
      <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="row w-100 m-0">
          <div class="content-wrapper full-page-wrapper d-flex align-items-center auth login-bg">
            <div class="card col-lg-4 mx-auto">
              <div class="card-body px-5 py-5">
                <h3 class="card-title text-left mb-3">Admin Login</h3>
                <form id="loginfrm" action="admin-login" method="post">
                  <div class="form-group">
                    <label>Username or email *</label>
                    <input type="text" class="form-control p_input" id="id" name="id">
                  </div>
                  <div class="form-group">
                    <label>Password *</label>
                    <input type="password" class="form-control p_input" id="password" name="password">
                  </div>
                  <c:if test="${result == 0 }">
                  <div class="login_warning">아이디 또는 비밀번호가 일치하지 않습니다.</div>
                  </c:if>
                  <div class="text-center">
                    <button type="button" id="loginbtn"class="btn btn-primary btn-block enter-btn">Login</button>
                  </div>

                </form>
              </div>
            </div>
          </div>
          <!-- content-wrapper ends -->
        </div>
        <!-- row ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="${initParam.staticPath}assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="${initParam.staticPath}assets/js/off-canvas.js"></script>
    <script src="${initParam.staticPath}assets/js/hoverable-collapse.js"></script>
    <script src="${initParam.staticPath}assets/js/misc.js"></script>
    <script src="${initParam.staticPath}assets/js/settings.js"></script>
    <script src="${initParam.staticPath}assets/js/todolist.js"></script>
    <!-- endinject -->
    
    <%-- <c:if test="${msg==error }">
    <script type="text/javascript">
    alert("아이디와 비밀번호가 일치하지 않습니다.")
    </script>
    </c:if> --%>
    
   
  </body>
</html>
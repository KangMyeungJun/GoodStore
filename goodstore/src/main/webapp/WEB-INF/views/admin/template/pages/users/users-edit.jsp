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
    <title>Store Admin</title>
    <!-- plugins:css -->
    <!-- 아이콘관련 -->
    <link rel="stylesheet" href="${initParam.staticPath}assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${initParam.staticPath}assets/vendors/css/vendor.bundle.base.css">

    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="${initParam.staticPath}assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="${initParam.staticPath}assets/images/favicon.png" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:../../partials/_sidebar.jsp -->
       <!-- leftSide -->     
 <%@ include file="../../include/leftnavi.jsp" %>
 <%@ include file="../../include/topnavi.jsp" %>
 <script type="text/javascript">   
 
 $(function(){
		const navActive = document.getElementById("nav-users");
		const uiShow = document.getElementById("ui-user");
		navActive.classList.add('active');
		uiShow.classList.add('show');
		
		
	 
	  $("#deleteUser").click(function(){
			alert("삭제하시겠습니까?");
			$("#frm").submit();
		})//click 

	});
 
</script>
 


     
<!----------------------------------------------------- 여기까지 좌,상단 nav bar ---------------------------------------------------------->

        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <!-- 여기에 본문 내용 채울 것. -->


            <div class="page-header">
              <h3 class="page-title"> Users </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="${initParam.middlePath }/admin/users">Users</a></li>
                  <li class="breadcrumb-item active" aria-current="page">User Status</li>
                  <li class="breadcrumb-item active" aria-current="page">User Edit</li>
                </ol>
              </nav>
            </div>
            <div class="row">

              <div class="col-12 grid-margin">
                <div class="card">


                  <div class="card-body">
                      <h4 class="card-title mb-1">User Edit</h4>
                      <p class="card-description">User info </p>
                    <div class="row">
                      <div class="col-12">
                        <div class="preview-list">

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>회원번호</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject"><c:out value="${userDetail.member_id}"/></h6>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>이메일</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject"><c:out value="${userDetail.email}"/></h6>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>이름</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject"><c:out value="${userDetail.name}"/></h6>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>가입일</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject"><c:out value="${userDetail.join_date}"/></h6>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>주소</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject"><c:out value="${userDetail.address}"/></h6>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>연락처</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject"><c:out value="${userDetail.tel}"/></h6>
                            </div>
                          </div>
                    <br/>

					<form id="frm" action="${initParam.middlePath }/admin/user_remove?member_id=${userDetail.member_id} " method="post">
                    <button id="deleteUser"  type="button" class="btn btn-outline-danger btn-icon-text">
                      <i class="mdi mdi-delete-forever btn-icon-prepend"></i>Delete</button>
                      
                    
                  </form> 
                </div>
              </div>
            </div>




          </div>
          <!-- content-wrapper ends -->
          <!-- partial:../../partials/_footer.jsp -->
          <footer class="footer">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
              <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © bootstrapdash.com 2020</span>
            </div>
          </footer>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
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
    <!-- Custom js for this page -->
    <!-- End custom js for this page -->
  </body>
</html>
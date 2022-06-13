<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Kmong Admin</title>
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
      <%@ include file="../../include/leftnavi.jsp" %>
      <%@ include file="../../include/topnavi.jsp" %>
      
      <script type="text/javascript">
      const navActive = document.getElementById("nav-category");
		const uiShow = document.getElementById("ui-category");
		navActive.classList.add('active');
		uiShow.classList.add('show');
		
		$(function(){
			 $("#addBtn").click(function(){
				 if($("#category_name").val() == "") {
					 alert("카테고리 이름을 입력해주세요");
					 $("#category_name").focus();
					 return;
				 }
					alert("카테고리를 추가하시겠습니까??");
					$("#categoryAddFrm").submit();
				})//click 
				
				
			
			
		});
      
      
      </script>
      


   
<!----------------------------------------------------- 여기까지 좌,상단 nav bar ---------------------------------------------------------->

        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <!-- 여기에 본문 내용 채울 것. -->


            <div class="page-header">
              <h3 class="page-title"> Categories </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="${initParam.middlePath }/admin/categories">Categories</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Category List</li>
                  <li class="breadcrumb-item active" aria-current="page">Category Add</li>
                </ol>
              </nav>
            </div>
            <div class="row">

              <!-- 표 테이블 시작 . JSP에서 자동화할것-->
              <div class="col-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Category Add</h4>
                    <form class="form-sample" id="categoryAddFrm" method="post"  action="${initParam.middlePath }/admin/category_addBtn" enctype="multipart/form-data"> <!--  -->
                      <p class="card-description">Category Add </p>


                      <!-- 이름, 작성자 -->
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Title</label>
                            <div class="col-sm-9">
                              <input type="text"  class="form-control"  placeholder="카테고리이름"  id="category_name"  name="category_name" />
                            </div>
                          </div>
                        </div>
                      </div>

                      <%-- <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Category Image</label>
                            <div class="col-sm-9">
                              <img src="${initParam.staticPath}assets/images/auth/Login_bg.jpg" style="height:200px;" alt="thumbnail">
                            </div>
                          </div>
                        </div>
                      </div> --%>

                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Image Upload</label>
                            <div class="col-sm-9">
                             <input type="file"  name="image"  id="image">  <!-- name ??? 이 image 가 아니라 file 로? -->
                              <div class="input-group col-xs-12">
                                <input type="text" class="form-control file-upload-info"  placeholder="Upload Image" >
                                <span class="input-group-append">
                                </span>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <button type="button" class="btn btn-outline-primary btn-icon-text" id="addBtn" name="addBtn">
                        <i class="mdi mdi-file-check btn-icon-prepend"></i> Submit </button>


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
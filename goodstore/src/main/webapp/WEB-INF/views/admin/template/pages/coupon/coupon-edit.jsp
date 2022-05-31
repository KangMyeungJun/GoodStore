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
    <link rel="stylesheet" href="../../assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../assets/vendors/css/vendor.bundle.base.css">

    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="../../assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="../../assets/images/favicon.png" />
  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:../../partials/_sidebar.jsp -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
          <a class="sidebar-brand brand-logo kmong-title" href="../../index.jsp" style="color:white; font-weight: bold;">

            <i class="mdi mdi-baby-face text-warning"></i>
            <span >Kmong Admin</span>
          </a>
          <a class="sidebar-brand brand-logo-mini" href="../../index.jsp"><i class="mdi mdi-baby-face"></i></a>
        </div>

        <!-- 목록창 -->
        <ul class="nav">
          <li class="nav-item profile">

          <!-- 프로필시작 -->
            <div class="profile-desc">

              <div class="profile-pic">
                <div class="count-indicator">
                  <img class="img-xs rounded-circle " src="../../assets/images/faces/squidGame.jpg" alt="">
                  <span class="count bg-success"></span>
                </div>
                <div class="profile-name">
                  <h5 class="mb-0 font-weight-normal">Admin</h5>
                  <span>Administrator</span>
                </div>
              </div>

            </div>
          </li>


          <li class="nav-item nav-category">
            <span class="nav-link">Navigation</span>
          </li>

          <!-- 대시보드 -->
          <li class="nav-item menu-items">
            <a class="nav-link" href="../../index.jsp">
              <span class="menu-icon">
                <i class="mdi mdi-speedometer"></i>
              </span>
              <span class="menu-title">Dashboard</span>
            </a>
          </li>

          <!-- 게시판관리 -->
          <li class="nav-item menu-items">
            <!-- <a class="nav-link" data-toggle="collapse" href="#ui-post" aria-expanded="false" aria-controls="ui-basic"> -->
            <a class="nav-link" data-toggle="collapse" data-target="#ui-post" aria-expanded="false" aria-controls="ui-basic">
              <span class="menu-icon">
                <i class="mdi mdi-calendar-text"></i>
              </span>
              <span class="menu-title">Posts</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-post">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../../pages/posts/posts.jsp">Post List</a></li>
              </ul>
            </div>
          </li>

          <!-- 회원관리 -->
          <li class="nav-item menu-items">
            <a class="nav-link" data-toggle="collapse" href="#ui-user" aria-expanded="false" aria-controls="ui-basic">
              <span class="menu-icon">
                <i class="mdi mdi-contacts"></i>
              </span>
              <span class="menu-title">Users</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-user">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../../pages/users/users.jsp">Users</a></li>
                <li class="nav-item"> <a class="nav-link" href="../../pages/users/experts.jsp">Experts</a></li>
              </ul>
            </div>
          </li>

          <!-- 결제관리 -->
          <li class="nav-item menu-items">
            <a class="nav-link" data-toggle="collapse" href="#ui-order" aria-expanded="false" aria-controls="ui-basic">
              <span class="menu-icon">
                <i class="mdi mdi-basket"></i>
              </span>
              <span class="menu-title">Orders</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-order">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../../pages/orders/orders.jsp">Order Status</a></li>
              </ul>
            </div>
          </li>

          <!-- 서비스관리 -->
          <li class="nav-item menu-items">
            <a class="nav-link" data-toggle="collapse" href="#ui-category" aria-expanded="false" aria-controls="ui-basic">
              <span class="menu-icon">
                <i class="mdi mdi-wrench"></i>
              </span>
              <span class="menu-title">Categories</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-category">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../../pages/categories/categories.jsp">Category List</a></li>
              </ul>
            </div>
          </li>
          
          <!-- 쿠폰관리 -->
          <li class="nav-item menu-items active">
            <a class="nav-link" data-toggle="collapse" href="#ui-coupon" aria-expanded="false" aria-controls="ui-basic">
              <span class="menu-icon">
                <i class="mdi mdi-wrench"></i>
              </span>
              <span class="menu-title">Coupon</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse show" id="ui-coupon">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="../../pages/coupon/coupons.jsp">Coupon List</a></li>
              </ul>
            </div>
          </li>
          
        </ul>
      </nav>


      <!-- 본문 -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:../../partials/_navbar.jsp -->
        <%@ include file="../../include/leftnavi.jsp" %>
<!----------------------------------------------------- 여기까지 좌,상단 nav bar ---------------------------------------------------------->

        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <!-- 여기에 본문 내용 채울 것. -->


            <div class="page-header">
              <h3 class="page-title"> Coupon </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="coupons.jsp">Coupon</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Coupon List</li>
                  <li class="breadcrumb-item active" aria-current="page">Coupon Add</li>
                </ol>
              </nav>
            </div>
            <div class="row">

              <!-- 표 테이블 시작 . JSP에서 자동화할것-->
              <div class="col-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Coupon Add</h4>
                    <form class="form-sample">
                      <p class="card-description">Coupon Add </p>

                      <!-- 이름, 작성자 -->
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                          
                            <label class="col-sm-3 col-form-label">쿠폰번호</label>
                            <div class="col-sm-9" style="margin-bottom: 10px">
                              <input type="text" class="form-control" value="1">
                            </div>
                            <label class="col-sm-3 col-form-label">쿠폰이름</label>
                            <div class="col-sm-9" style="margin-bottom: 10px">
                              <input type="text" class="form-control" value="대박할인쿠폰"/>
                            </div>
                            <label class="col-sm-3 col-form-label">할인율</label>
                            <div class="col-sm-9" style="margin-bottom: 10px">
                              <input type="text" class="form-control" value="50%"/>
                            </div>
                            <label class="col-sm-3 col-form-label">할인금액</label>
                            <div class="col-sm-9" style="margin-bottom: 10px">
                              <input type="text" class="form-control" value="0원"/>
                            </div>
                            <label class="col-sm-3 col-form-label">생성일</label>
                            <div class="col-sm-9" style="margin-bottom: 10px">
                              <input type="text" class="form-control" value="2022-05-23"/>
                            </div>
                            <label class="col-sm-3 col-form-label">쿠폰적용시작일</label>
                            <div class="col-sm-9" style="margin-bottom: 10px">
                              <input type="text" class="form-control" value="2022-05-23"/>
                            </div>
                            <label class="col-sm-3 col-form-label">쿠폰적용마감일</label>
                            <div class="col-sm-9" style="margin-bottom: 10px">
                              <input type="text" class="form-control" value="2022-05-25"/>
                            </div>
                            
                          </div>
                        </div>
                      </div>

                      
                   
                      <button type="button" class="btn btn-outline-primary btn-icon-text">
                        <i class="mdi mdi-file-check btn-icon-prepend"></i> Submit </button>
                        &emsp;
                      <button type="button" class="btn btn-outline-danger btn-icon-text">
                        <i class="mdi mdi-delete-forever btn-icon-prepend"></i>Delete</button>
                        <!-- <button type="submit" class="btn btn-danger mr-2">Delete</button> -->
                        &emsp;
                      <button type="button" class="btn btn-outline-warning btn-icon-text">
                        <i class="mdi mdi-reload btn-icon-prepend"></i> Reset </button>


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
    <script src="../../assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="../../assets/js/off-canvas.js"></script>
    <script src="../../assets/js/hoverable-collapse.js"></script>
    <script src="../../assets/js/misc.js"></script>
    <script src="../../assets/js/settings.js"></script>
    <script src="../../assets/js/todolist.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <!-- End custom js for this page -->
  </body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
  </head>
  <script type="text/javascript">
 
  function chkNull() {
  	
  	if ( $("#number").val() === "" ) {
  		alert("숫자를 입력해주세요!");
  		$("#number").focus();
  		return;
  	}
  	if ( $("#name").val() === "" ) {
  		alert("이름을 입력해주세요!");
  		$("#name").focus();
  		return;
  	}
  	
  	if ( $("#discount_rate").val() === "" ) {
  		alert("할인률을 입력해주세요!");
  		$("#discount_rate").focus();
  		return;
  	}
  	if ( $("#discount_rate").val() < 0 ) {
  		alert("할인률은 0보다 작을 수 없습니다.");
  		$("#discount_rate").focus();
  		return;
  	}
  	if ( $("#discount_rate").val() > 100 ) {
  		alert("할인률은 100보다 클 수 없습니다.");
  		$("#discount_rate").focus();
  		return;
  	}
  	
  	if ( $("#discount_price").val() === "" ) {
  		alert("할인가격을 입력해주세요!");
  		$("#discount_price").focus();
  		return;
  	}
  	
  	
  	if ( $("#start_date").val() === "" ) {
  		alert("시작날짜를 입력해주세요!");
  		$("#start_date").focus();
  		return;
  	}
  	
  	if ( $("#end_date").val() === "" ) {
  		alert("끝 날짜를 입력해주세요!");
  		$("#end_date").focus();
  		return;
  	}
  	
		  $("#couponFrm").submit();
  	
  }
  
  $(function() {
	  $("#frmBtn").click(function(){
		  chkNull()
	  })
  })
  </script>
  <body>
    <div class="container-scroller">
      <!-- partial:../../partials/_sidebar.jsp -->
<%@ include file="../../include/leftnavi.jsp" %>


      <!-- 본문 -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:../../partials/_navbar.jsp -->
        <nav class="navbar p-0 fixed-top d-flex flex-row">
          <div class="navbar-brand-wrapper d-flex d-lg-none align-items-center justify-content-center">
            <a class="navbar-brand brand-logo-mini" href="../../index.jsp"><i class="mdi mdi-baby-face text-warning"></i></a>
          </div>

          <div class="navbar-menu-wrapper flex-grow d-flex align-items-stretch">
            <!-- 축소버튼 -->
            <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
              <span class="mdi mdi-menu"></span>
            </button>

            <!-- 검색버튼 -->
            <ul class="navbar-nav w-100">
              <li class="nav-item w-100">
                <form class="nav-link mt-2 mt-md-0 d-none d-lg-flex search">
                  <input type="text" class="form-control" placeholder="Search products">
                </form>
              </li>
            </ul>

            <!-- 관리자계정 관리 -->
            <ul class="navbar-nav navbar-nav-right">
              
              <li class="nav-item dropdown">
                <a class="nav-link" id="profileDropdown" href="#" data-toggle="dropdown">
                  <div class="navbar-profile">
                    <img class="img-xs rounded-circle" src="../../assets/images/faces/squidGame.jpg" alt="">
                    <p class="mb-0 d-none d-sm-block navbar-profile-name">Admin</p>
                    <i class="mdi mdi-menu-down d-none d-sm-block"></i>
                  </div>
                </a>
                <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="profileDropdown">
                  <h6 class="p-3 mb-0">Profile</h6>
                  <div class="dropdown-divider"></div>

                  <a class="dropdown-item preview-item" href="../../pages/account/admin-setting.jsp">
                    <div class="preview-thumbnail">
                      <div class="preview-icon bg-dark rounded-circle">
                        <i class="mdi mdi-settings text-success"></i>
                      </div>
                    </div>
                    <div class="preview-item-content">
                      <p class="preview-subject mb-1">Settings</p>
                    </div>
                  </a>
                  <div class="dropdown-divider"></div>

                  <a class="dropdown-item preview-item" href="#void">
                    <div class="preview-thumbnail">
                      <div class="preview-icon bg-dark rounded-circle">
                        <i class="mdi mdi-baby-face-outline text-info"></i>
                      </div>
                    </div>
                    <div class="preview-item-content">
                      <p class="preview-subject mb-1">Return</p>
                    </div>
                  </a>
                  <div class="dropdown-divider"></div>


                  <a class="dropdown-item preview-item" href="../../pages/account/admin-login.jsp">
                    <div class="preview-thumbnail">
                      <div class="preview-icon bg-dark rounded-circle">
                        <i class="mdi mdi-logout text-danger"></i>
                      </div>
                    </div>
                    <div class="preview-item-content">
                      <p class="preview-subject mb-1">Log out</p>
                    </div>
                  </a>

                </div>
              </li>
            </ul>

            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
              <span class="mdi mdi-format-line-spacing"></span>
            </button>
          </div>
        </nav>
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
                      <p class="card-description">Coupon Add </p>

                      <!-- 이름, 작성자 -->
                          <form method="post" id="couponFrm" name="couponFrm" action="http://${initParam.domain}${initParam.middlePath}/admin/coupon/add">
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">쿠폰개수</label>
                            <div class="col-sm-9" style="margin-bottom: 10px">
                              <input type="number" class="form-control" placeholder="개수를 입력해주세요" id="number" name="number"/>
                            </div>
                            <label class="col-sm-3 col-form-label">쿠폰이름</label>
                            <div class="col-sm-9" style="margin-bottom: 10px">
                              <input type="text" class="form-control" id="name" name="name"/>
                            </div>
                            <label class="col-sm-3 col-form-label">할인율</label>
                            <div class="col-sm-9" style="margin-bottom: 10px" >
                              <input type="number"  min="0" max="100" class="form-control" id="discount_rate" name="discount_rate"/>
                            </div>
                            <label class="col-sm-3 col-form-label">할인금액</label>
                            <div class="col-sm-9" style="margin-bottom: 10px">
                              <input type="number" class="form-control" id="discount_price" name="discount_price"/>
                            </div>
                            <label class="col-sm-3 col-form-label">쿠폰적용시작일</label>
                            <div class="col-sm-9" style="margin-bottom: 10px">
                              <input type="date" class="form-control" placeholder="yyyy-MM-dd" id="start_date" name="start_date"/>
                            </div>
                            <label class="col-sm-3 col-form-label">쿠폰적용마감일</label>
                            <div class="col-sm-9" style="margin-bottom: 10px">
                              <input type="date" class="form-control" placeholder="yyyy-MM-dd" id="end_date" name="end_date"/>
                            </div>
                          </div>
                        </div>
                      </div>
                            </form>

                      
                   
                      <button type="button" class="btn btn-outline-primary btn-icon-text" id="frmBtn">
                        <i class="mdi mdi-file-check btn-icon-prepend"></i> Submit </button>
                          &emsp;
                         
                        


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
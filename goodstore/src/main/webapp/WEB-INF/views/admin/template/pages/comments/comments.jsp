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
 <!-- leftSide -->     
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
              <h3 class="page-title"> Comments </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">Comments</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Comments List</li>
                </ol>
              </nav>
            </div>
            <div class="row">
			   <div  style="width:750px; height:1000px; float:left; ">
                <div class="card">
          		<!-- Review -->
				<div class="flex-w flex-t p-b-68">				
					<div class="size-207">
						<div class="flex-w flex-sb-m p-b-17">
							<span class="mtext-107 cl2 p-r-20">
								Ariana Grande
							</span>
							<button style="margin-left: 550px;">delete</button>

							<span class="fs-18 cl11">
								<i class="zmdi zmdi-star"></i>
								<i class="zmdi zmdi-star"></i>
								<i class="zmdi zmdi-star"></i>
								<i class="zmdi zmdi-star"></i>
								<i class="zmdi zmdi-star-half"></i>
							</span>
						</div>

						<p class="stext-102 cl6">
							Quod autem in homine praestantissimum atque optimum est, id deseruit. Apud ceteros autem philosophos
						</p>
					</div>
				</div>

				<div class="flex-w flex-t p-b-68">				
					<div class="size-207">
						<div class="flex-w flex-sb-m p-b-17">
							<span class="mtext-107 cl2 p-r-20">
								Ariana Grande
							</span>
							<button style="margin-left: 550px;">delete</button>

							<span class="fs-18 cl11">
								<i class="zmdi zmdi-star"></i>
								<i class="zmdi zmdi-star"></i>
								<i class="zmdi zmdi-star"></i>
								<i class="zmdi zmdi-star"></i>
								<i class="zmdi zmdi-star-half"></i>
							</span>
						</div>

						<p class="stext-102 cl6">
							Quod autem in homine praestantissimum atque optimum est, id deseruit. Apud ceteros autem philosophos
						</p>
					</div>
				</div>

				<div class="flex-w flex-t p-b-68">				
					<div class="size-207">
						<div class="flex-w flex-sb-m p-b-17">
							<span class="mtext-107 cl2 p-r-20">
								Ariana Grande
							</span>
							<button style="margin-left: 550px;">delete</button>

							<span class="fs-18 cl11">
								<i class="zmdi zmdi-star"></i>
								<i class="zmdi zmdi-star"></i>
								<i class="zmdi zmdi-star"></i>
								<i class="zmdi zmdi-star"></i>
								<i class="zmdi zmdi-star-half"></i>
							</span>
						</div>

						<p class="stext-102 cl6">
							Quod autem in homine praestantissimum atque optimum est, id deseruit. Apud ceteros autem philosophos
						</p>
					</div>
				</div>



               </div>
             </div>
        	
				
              <!-- 표 테이블 시작 . JSP에서 자동화할것-->
              <div style="float:right;margin-left: 50px">
                <div class="card">
                  <div class="card-body" style="width:800px; height:900px; ">
                  	<div class="row">
                    <h4 class="card-title">Post List</h4>
                    </div>
                    <div class="form-group">
                      <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search Post title" aria-label="Recipient's username" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                          <button class="btn btn-fw btn-outline-secondary" type="button">Search</button>
                        </div>
                      </div>
                    </div><br/>
                    <div class="table-responsive">
                      <table class="table table-striped">
                        <thead>
                          <tr>
                            <th> PostNo. </th>
                            <th> Title </th>
                            <th> Registration date </th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td class="py-1">
                              1
                            </td>
                            <td>
                                <a href="#void" style="color:white;">
                                글 제목입니다아아아아
                                </a>
                            </td>
                            <td>2022-05-26</td>
                          </tr>
                          <tr>
                            <td class="py-1">
                              1
                            </td>
                            <td>
                                <a href="#void" style="color:white;">
                                글 제목입니다아아아아
                                </a>
                            </td>
                            <td>2022-05-26</td>
                          </tr>
                          <tr>
                            <td class="py-1">
                              1
                            </td>
                            <td>
                                <a href="#void" style="color:white;">
                                글 제목입니다아아아아
                                </a>
                            </td>
                            <td>2022-05-26</td>
                          </tr>
                          <tr>
                            <td class="py-1">
                              1
                            </td>
                            <td>
                                <a href="#void" style="color:white;">
                                글 제목입니다아아아아
                                </a>
                            </td>
                            <td>2022-05-26</td>
                          </tr>
                          <tr>
                            <td class="py-1">
                              1
                            </td>
                            <td>
                                <a href="#void" style="color:white;">
                                글 제목입니다아아아아
                                </a>
                            </td>
                            <td>2022-05-26</td>
                          </tr>
                          <tr>
                            <td class="py-1">
                              1
                            </td>
                            <td>
                                <a href="#void" style="color:white;">
                                글 제목입니다아아아아
                                </a>
                            </td>
                            <td>2022-05-26</td>
                          </tr>

                          
                        </tbody>
                      </table>
                    </div> 
                  </div>
                  <div style="text-align:center;">

                   
                  </div>

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
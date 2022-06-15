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
      <!-- partial:partials/_sidebar.jsp -->
 <!-- leftSide -->     
 <%@ include file="include/leftnavi.jsp" %>
 <%@ include file="include/topnavi.jsp" %>
<script type="text/javascript"> 
		const navActive = document.getElementById("nav-dashboard");
		navActive.classList.add('active');
		
		 var R=${totalOrderRCount};
		    var C=${totalOrderCCount};
		    var N=${totalOrderNCount};
		</script>


    
<!----------------------------------------------------- 여기까지 좌,상단 nav bar ---------------------------------------------------------->

        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">

            <div class="row">

              <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4>전체 사용자 수</h4>
                    <div class="row">
                      <div class="col-8 col-sm-12 col-xl-8 my-auto">
                        <div class="d-flex d-sm-block d-md-flex align-items-center">
                          <h2 class="mb-0">${userCount } 명</h2>
                          <p class="text-success ml-2 mb-0 font-weight-medium">+${todayCnt}</p>
                        </div>
                      </div>
                      <div class="col-4 col-sm-12 col-xl-4 text-center text-xl-right">
                        <i class="icon-lg mdi mdi-account
                        text-primary ml-auto"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4>전체 블로그 수</h4>
                    <div class="row">
                      <div class="col-8 col-sm-12 col-xl-8 my-auto">
                        <div class="d-flex d-sm-block d-md-flex align-items-center">
                          <h2 class="mb-0">${blogCount} 개</h2>
                           <p class="text-success ml-2 mb-0 font-weight-medium">+${todayBlogCount } 개</p>
                        </div>
                      </div>
                      <div class="col-4 col-sm-12 col-xl-4 text-center text-xl-right">
                        <i class="icon-lg mdi mdi-account-card-details
                        text-warning ml-auto"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              
              <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4>등록된 아이템 수</h4>
                    <div class="row">
                      <div class="col-8 col-sm-12 col-xl-8 my-auto">
                        <div class="d-flex d-sm-block d-md-flex align-items-center">
                          <h2 class="mb-0">${itemCount } 개</h2>
                        </div>
                      </div>
                      <div class="col-4 col-sm-12 col-xl-4 text-center text-xl-right">
                        <i class="icon-lg mdi mdi-library-books
                        text-info ml-auto"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-xl-3 col-sm-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4>완료된 주문 수</h4>
                    <div class="row">
                      <div class="col-8 col-sm-12 col-xl-8 my-auto">
                        <div class="d-flex d-sm-block d-md-flex align-items-center">
                          <h2 class="mb-0">${ordersCount } 건</h2>
                          <p class="text-success ml-2 mb-0 font-weight-medium">+${todayordersCount }</p>
                        </div>
                      </div>
                      <div class="col-4 col-sm-12 col-xl-4 text-center text-xl-right">
                        <i class="icon-lg mdi mdi-basket
                        text-success ml-auto"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>


            <div class="row">
              <div class="col-md-4 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">오늘의 주문내역</h4><br/>
                    <canvas id="doughnutChart" style="height:250px"></canvas>

                    <div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
                      <div class="text-md-center text-xl-left">
                        <h6 class="mb-1">Tranfer to Stripe</h6>
                        <p class="text-muted mb-0">${today }</p>
                      </div>
                      <div class="align-self-center flex-grow text-right text-md-center text-xl-right py-md-2 py-xl-0">
                        <h6 class="font-weight-bold mb-0">$593</h6>
                      </div>
                    </div>
                  </div>
                </div>
              </div>



              <div class="col-md-8 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <div class="d-flex flex-row justify-content-between">
                      <h4 class="card-title mb-1">등록된 카테고리</h4>
                    </div>
                    <div class="row">
                      <div class="col-12">
                        <div class="preview-list">
                        
                        
                        <c:forEach var="categoryList" items="${categoryList }">
                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail">
                              <%-- <img src="http://localhost/goodstore/upload/${categoryList.image}"/> --%>
                               <img src="${ initParam.uploadPath }${categoryList.image}"/> 
                            </div>
                            <div class="preview-item-content d-sm-flex flex-grow">
                              <div class="flex-grow">
                                <h6 class="preview-subject">${categoryList.category_name }</h6>
                              </div>
                            </div>
                          </div>
                          </c:forEach>

                        <!--   <div class="preview-item border-bottom">
                            <div class="preview-thumbnail">
                              <div class="preview-icon bg-success">
                                <i class="mdi mdi-auto-fix"></i>
                              </div>
                            </div>
                            <div class="preview-item-content d-sm-flex flex-grow">
                              <div class="flex-grow">
                                <h6 class="preview-subject">디자인</h6>
                              </div>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail">
                              <div class="preview-icon bg-info">
                                <i class="mdi mdi-camcorder-box"></i>
                              </div>
                            </div>
                            <div class="preview-item-content d-sm-flex flex-grow">
                              <div class="flex-grow">
                                <h6 class="preview-subject">영상/사진/음향</h6>
                              </div>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail">
                              <div class="preview-icon bg-danger">
                                <i class="mdi mdi-chart-bar"></i>
                              </div>
                            </div>
                            <div class="preview-item-content d-sm-flex flex-grow">
                              <div class="flex-grow">
                                <h6 class="preview-subject">마케팅</h6>
                              </div>
                            </div>
                          </div>

                          <div class="preview-item">
                            <div class="preview-thumbnail">
                              <div class="preview-icon bg-warning">
                                <i class="mdi mdi-file-document"></i>
                              </div>
                            </div>
                            <div class="preview-item-content d-sm-flex flex-grow">
                              <div class="flex-grow">
                                <h6 class="preview-subject">번역/통역</h6>
                                
                              </div>
                            </div>
                          </div> -->
                          
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>



          </div>




          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.jsp -->
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
    <script>
   
   
    </script>
    
    <script src="${initParam.staticPath}assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="${initParam.staticPath}assets/vendors/chart.js/Chart.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="${initParam.staticPath}assets/js/off-canvas.js"></script>
    <!-- <script src="assets/js/hoverable-collapse.js"></script> -->
    <!-- <script src="assets/js/misc.js"></script> -->
    <!-- <script src="assets/js/settings.js"></script> -->
    <!-- <script src="assets/js/todolist.js"></script> -->
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="${initParam.staticPath}assets/js/chart.js"></script>
    <!-- End custom js for this page -->
  </body>
</html>
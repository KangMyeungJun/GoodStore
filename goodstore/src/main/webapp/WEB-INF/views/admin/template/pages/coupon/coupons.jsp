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
  function search() {
	  $("#searchFrm").submit();
  }
  function prevSubmit() {
	 $("#prevFrm").submit();
  }
  function nextSubmit() {
	  $("#nextFrm").submit();
  }
  </script>
  <body>
    <div class="container-scroller">
      <!-- partial:../../partials/_sidebar.jsp -->
<%@ include file="../../include/leftnavi.jsp" %>
<%@ include file="../../include/topnavi.jsp" %>


      
<!----------------------------------------------------- 여기까지 좌,상단 nav bar ---------------------------------------------------------->

        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <!-- 여기에 본문 내용 채울 것. -->


            <div class="page-header">
              <h3 class="page-title"> Coupon </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">Coupon</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Coupon Status</li>
                </ol>
              </nav>
            </div>
            <div class="row">

              <!-- 표 테이블 시작 . JSP에서 자동화할것-->

              <div class="col-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Coupon Status</h4>
                    
                    <div class="form-group">
                      <div class="input-group">
                      <form id="searchFrm">
                        <input type="text" id="keyword" name="keyword" class="form-control" placeholder="Search Coupon name" aria-label="Recipient's username" aria-describedby="basic-addon2">
                        </form>
                        <div class="input-group-append">
                          <button class="btn btn-fw btn-outline-secondary" type="button" onclick="search()">Search</button>
                        </div>
                      </div>
                    </div><br/>
                    <div class="table-responsive">
                      <table class="table">
                        <thead>
                          <tr>
          
                            <th style="width:200px;"> 쿠폰번호 </th>
                            <th style="width:200px;"> 쿠폰명 </th>
                            <th> 할인율 </th>
                            <th style="width:200px;"> 할인금액</th>
                            <th style="width:200px;"> 쿠폰생성일 </th>
                            <th style="width:200px;"> 쿠폰적용시작일 </th>
                            <th style="width:200px;"> 쿠폰적용마감일 </th>
                            

                          </tr>
                        </thead>
                        <tbody>

                          
                          
                          <c:forEach items="${list }" var="item">
                          <tr>
                          <td class="py-1">
                              ${item.code }
                            </td>
                            <td><a href="http://${initParam.domain}${initParam.middlePath}/admin/coupon/${item.coupon_id}"> ${item.name }</a></td>
                            <td>${item.discount_rate }%</td>
                            <td>${item.discount_price }</td>
                            <td>${item.upload_date }</td>
                            <td>${item.start_date }</td>
                            <td>${item.end_date }</td>
                          </tr>
                          </c:forEach>
                          
                        

                         

                                            



                        </tbody>
                      </table>
                    </div>
                  
                          <button type="button" class="btn btn-primary btn-icon-text" onclick="location.href='http://${initParam.domain}${initParam.middlePath}/admin/coupon/add'">
                            <i class="mdi mdi-upload btn-icon-prepend"></i>쿠폰추가 </button>
                          
                  </div>
                  
                   <div style="text-align:center;">
					<form id="prevFrm">
					<input type="hidden" value="${prev }" name="p">
					<input type="hidden" value="${param.keyword }" name="keyword">
					</form>
					<form id="nextFrm">
					<input type="hidden" value="${next }" name="p">
					<input type="hidden" value="${param.keyword } %>" name="keyword">
					</form>
					
					<div style="text-align:center;height: 40px;">
					<c:if test="${ isPrevPage }">
					<a href="#void" onclick="prevSubmit()">prev</a>
					</c:if>
					<c:forEach var="i" begin="${firstPage}" end="${lastPage}" step="1">
					<a href="?p=${i}&keyword=${param.keyword}">${i}</a>
					</c:forEach>
					<c:if test="${ isNextPage }">
					<a href="#void" onclick="nextSubmit()">next</a>
                   </c:if>
                   
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
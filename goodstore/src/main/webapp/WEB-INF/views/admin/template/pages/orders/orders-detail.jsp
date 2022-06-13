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
    <!-- 아이콘관련 -->
    <link rel="stylesheet" href="${initParam.staticPath}assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${initParam.staticPath}assets/vendors/css/vendor.bundle.base.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="${initParam.staticPath}assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="${initParam.staticPath}assets/images/favicon.png" />
  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:../../partials/_sidebar.jsp -->
      
<%@ include file="../../include/leftnavi.jsp" %>
<%@ include file="../../include/topnavi.jsp" %>
 <script type="text/javascript">
		const navActive = document.getElementById("nav-orders");
		const uiShow = document.getElementById("ui-order");
		navActive.classList.add('active');
		uiShow.classList.add('show');
		
		 $(function(){
		  $("#remove_order").click(function(){
				alert("환불 처리 하시겠습니까?");
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
              <h3 class="page-title"> Orders </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="${initParam.middlePath }/admin/orders">Orders</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Order Status</li>
                  <li class="breadcrumb-item active" aria-current="page">Order Detail</li>
                </ol>
              </nav>
            </div>
            <div class="row">

              <!-- 표 테이블 시작 . JSP에서 자동화할것-->

              <div class="col-12 grid-margin">
                <div class="card">


                  <div class="card-body">
                      <h4 class="card-title mb-1">Order Detail</h4>
                      <p class="card-description">Order info </p>
                    <div class="row">
                      <div class="col-12">
                        <div class="preview-list">

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>주문번호</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject"><c:out value="${orderDetail.order_id}"/></h6>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>상품번호</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject"><c:out value="${orderDetail.item_id}"/></h6>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>상품명</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject"><c:out value="${orderDetail.item_name}"/></h6>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>구매자</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject"><c:out value="${orderDetail.name}"/></h6>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>판매자</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject">Admin</h6>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>판매가격</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject"><c:out value="${orderDetail.price}"/></h6>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>주문일자</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject"><c:out value="${orderDetail.order_date}"/></h6>
                            </div>
                          </div>

                          <div class="preview-item border-bottom">
                            <div class="preview-thumbnail" style="width:100px;">
                              <h4>상태</h4>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject"><c:out value="${orderDetail.status}"/></h6>
                            </div>
                          </div>


                          <br/>
                          <form id="frm" action="${initParam.middlePath }/admin/order_remove?order_id=${orderDetail.order_id} " method="post">
                          <button type="button"  id="remove_order" class="btn btn-outline-danger btn-icon-text">
                            <i class="mdi mdi-delete-forever btn-icon-prepend"></i>Delete</button>
      					</form>
    
                        </div>
                      </div>
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
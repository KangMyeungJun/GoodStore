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
		const navActive = document.getElementById("nav-users");
		const uiShow = document.getElementById("ui-user");
		navActive.classList.add('active');
		uiShow.classList.add('show');
		
		$(function(){
			$("#btnEmailSearch").click(function(){
				chkNull();
			});
			$("#keyword").keydown(function( evt ){
				if( evt.which == 13 ){
					chkNull();
				}//end if
			});
		});//ready

		function chkNull(){
			if($("#keyword").val() == "" ){
				alert("검색 키워드를 입력해주세요.");
				$("#keyword").focus();
				return;
			}//end if
			$("#emailSearchFrm").submit();
		}//chkNull
		
</script>
 


      <%-- <!-- 본문 -->
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
                    <img class="img-xs rounded-circle" src="${initParam.staticPath}assets/images/faces/squidGame.jpg" alt="">
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
        </nav> --%>
<!----------------------------------------------------- 여기까지 좌,상단 nav bar ---------------------------------------------------------->

        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <!-- 여기에 본문 내용 채울 것. -->


            <div class="page-header">
              <h3 class="page-title"> Users </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="users">Users</a></li>
                  <li class="breadcrumb-item active" aria-current="page">User Status</li>
                </ol>
              </nav>
            </div>
            <div class="row">

              <!-- 표 테이블 시작 . JSP에서 자동화할것-->
              <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">User Status</h4>
                    <div>총 사용자 수 : <c:out value="${userCount}"/>건 | 오늘 가입한 사용자 수: <c:out value="${todayCnt }"/>건</div><br/>
                      <form action="users" id="emailSearchFrm" method="get">
                    <div class="form-group">
                      <div class="input-group" >
                        <input type="text"  name="keyword" id="keyword"  class="form-control" placeholder="Search Email" aria-label="Recipient's username" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                          <button class="btn btn-fw btn-outline-secondary"  id="btnEmailSearch"   type="button">Search</button>
                        </div>
                      </div>
                    </div><br/>
                          </form>
                    
                    
                 
                    
                    
                    
                    <div class="table-responsive">
                      <table class="table table-striped">
                        <thead>
                          <tr>
                            <th> UserNo. </th>
                            <th> E-mail </th>
                            <th> Name </th>
                            <th> Join Date </th>
                            <th> delete </th>
                          </tr>
                        </thead>
                        <tbody>
                        
                        
                        
                        
                        
                        <c:if test="${ empty usersList  }">
                        <tr>
						<td colspan="7" style="width:100px; text-align:center">
						 검색하신 [<c:out value="${param.keyword }"/>]이메일은 존재하지 않습니다.<br/>
                        </td>
						</tr>
                        </c:if>
                        
                        
                        
                        <c:if test="${not empty usersList  }">
                         <c:forEach var="usersList" items="${usersList }">
                            <%--  <c:set var="i" value="${ i+1 }"/>
								<c:set var="total" value="${  totalCnt -( currentPage-1)*pageScale-i+1}"/>  --%>
                          <tr>
                            <td class="py-1">
                              <c:out value="${usersList.member_id}"/>
                            </td>
                           <td><c:out value="${usersList.email}"/></td> 
                            <td><c:out value="${usersList.name}"/></td>
                            <td><c:out value="${usersList.join_date}"/></td>
                            <td> 
                              <a href="user_delete?member_id=${usersList.member_id}" style="color:white;">
                                삭제
                              </a>
                            </td>
                          </tr>
                          </c:forEach>
                          </c:if>
                          
                         
                          
                           
                          <!-- <tr>
                            <td class="py-1">
                              1
                            </td>
                            <td> user1@naver.com </td>
                            <td>의뢰인1</td>
                            <td>April 9, 2022</td>
                            <td> 
                              <a href="#void" style="color:white;">
                                삭제
                              </a>
                            </td>
                          </tr>
                          <tr>
                            <td class="py-1">
                              1
                            </td>
                            <td> user1@naver.com </td>
                            <td>의뢰인1</td>
                            <td>April 9, 2022</td>
                            <td> 
                              <a href="#void" style="color:white;">
                                삭제
                              </a>
                            </td>
                          </tr>
                          <tr>
                            <td class="py-1">
                              1
                            </td>
                            <td> user1@naver.com </td>
                            <td>의뢰인1</td>
                            <td>April 9, 2022</td>
                            <td> 
                              <a href="#void" style="color:white;">
                                삭제
                              </a>
                            </td>
                          </tr> -->
                          


                        </tbody>
                      </table>
                    </div> 
                  </div>
                 <div id="pageNation" style="text-align: center">
<%
//String field=request.getParameter("field");
String keyword=request.getParameter("keyword");
%>
<c:forEach var="i" begin="1" end="${ pageCnt }" step="1" >
[ <a href="users?currentPage=${ i }<%= !"".equals(keyword) && keyword !=null?"&keyword="+keyword:"" %>"><c:out value="${ i }"/></a> ]
</c:forEach>
</div> 
                  
                  <!-- <div style="text-align: center;">Pagination 여기서 구현</div> -->

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
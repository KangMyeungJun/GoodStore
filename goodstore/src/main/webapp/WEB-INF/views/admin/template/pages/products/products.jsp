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
              <h3 class="page-title"> Products </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">Products</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Products List</li>
                </ol>
              </nav>
            </div>
            <div class="row">
			   <div  style="width:750px; height:1000px; float:left; ">
                <div class="card">
                  <div class="card-body">
                  <div class="row">
                    <h4 class="card-title">Post Edit</h4>
                    <div style="margin-left : 300px;">
                                          <button type="button" class="btn btn-outline-primary btn-icon-text">
                        <i class="mdi mdi-file-check btn-icon-prepend"></i> Submit </button>
                        &emsp;
                      <button type="button" class="btn btn-outline-danger btn-icon-text">
                        <i class="mdi mdi-delete-forever btn-icon-prepend"></i>Delete</button>
                        <!-- <button type="submit" class="btn btn-danger mr-2">Delete</button> -->
                        &emsp;
                      <button type="button" class="btn btn-outline-warning btn-icon-text">
                        <i class="mdi mdi-reload btn-icon-prepend"></i> Reset </button>
                        </div>
                        </div>
                    <form class="form-sample">

                      <!-- 이름, 작성자 -->
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">상품명</label>
                            <div class="col-sm-9">
                              <input type="text" class="form-control" value="상품명">
                            </div>
                          </div>
                        </div>
                        
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">재고</label>
                            <div class="col-sm-9">
                              <input type="text" class="form-control" value="5">
                            </div>
                          </div>
                        </div>
                      </div>

                      <!-- 카테고리, 작성일 -->
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">카테고리</label>
                            <div class="col-sm-9">
                              <select class="form-control">
                                <option>IT/Programming</option>
                                <option value="영상" selected>영상</option>
                                <option>Category3</option>
                                <option>Category4</option>
                              </select>
                            </div>
                          </div>
                        </div>
                      <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">가격</label>
                            <div class="col-sm-9">
                              <input type="text" class="form-control" value="50,000">
                            </div>
                          </div>
                        </div>
                      </div>

                      <!-- 가격 -->
                      <div class="row">
  
                      </div>

                      <!-- 썸네일 -->
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">썸네일</label>
                            <div class="col-sm-9">
                              <input type="file" name="img[]" class="file-upload-default">
                              <div class="input-group col-xs-12">
                                <input type="text" class="form-control file-upload-info" disabled="" placeholder="Upload Image">
                                <span class="input-group-append">
                                  <button class="file-upload-browse btn btn-primary" type="button">업로드</button>
                                </span>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>

                      <!-- 기존 썸네일 이미지 -->
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label"></label>
                            <div class="col-sm-9">
                              <img src="../../assets/images/auth/Login_bg.jpg" style="height:200px;" alt="thumbnail"/>
                            </div>
                          </div>
                        </div>
                        
                        <div style="margin-left: 40px;">
                        	<div>
                        	<input type="text"	name="option"/>                            
                            <button class="file-upload-browse btn btn-primary" type="button">옵션추가</button>

                            </div>
                            <div >
                            	<select class="form-select" multiple aria-label="multiple select example" style="border: 1px solid #FFFFFF; height: 180px; margin-top: 5px">
								  <option value = "90"selected>90</option>
								  <option value="100">100</option>
								  <option value="110">110</option>
								  <option value="120">120</option>
								  <option value="120">120</option>
								  <option value="120">120</option>
								  <option value="120">120</option>
								  <option value="120">120</option>
								  <option value="120">120</option>
								  <option value="120">120</option>
								  <option value="120">120</option>
								  <option value="120">120</option>
								  <option value="120">120</option>
								  <option value="120">120</option>
								  <option value="120">120</option>
								  <option value="120">120</option>
								</select>
                            </div>
                            	<button class="file-upload-browse btn btn-primary" type="button" style="margin-left: 210px">옵션삭제</button>
                        
                        </div>
                      </div>
                      <!-- 이미지 -->
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">이미지</label>
                            <div class="col-sm-9">
                              <input type="file" name="img[]" class="file-upload-default">
                              <div class="input-group col-xs-12">
                                <input type="text" class="form-control file-upload-info" disabled="" placeholder="Upload Image">
                                <span class="input-group-append">
                                  <button class="file-upload-browse btn btn-primary" type="button">업로드</button>
                                </span>

                              </div>
                                                              
                            </div>

                          </div>
                        </div>
                      </div>

                      <!-- 기존 이미지 -->
                      <div class="row">
                       
                            
                          <div>
                               <input type="checkbox" style="margin-left:80px">
                            <label class="col-sm-3 col-form-label"></label>
                            <div class="col-sm-9">
                              <img src="../../assets/images/auth/Login_bg.jpg" style="height:100px;" alt="thumbnail"/>
                            </div>
                          </div>
                                             
                          <div>
                            <input type="checkbox" style="margin-left:80px">
                            <label class="col-sm-3 col-form-label"></label>
                            <div class="col-sm-9">
                              <img src="../../assets/images/auth/Login_bg.jpg" style="height:100px;" alt="thumbnail"/>
                            </div>
                          </div>
                                             
                          <div>
                            <input type="checkbox" style="margin-left:80px">
                            <label class="col-sm-3 col-form-label"></label>
                            <div class="col-sm-9">
                              <img src="../../assets/images/auth/Login_bg.jpg" style="height:100px;" alt="thumbnail"/>
                            </div>
                          </div>
                                             
                          <div>
                            <input type="checkbox" style="margin-left:80px">
                            <label class="col-sm-3 col-form-label"></label>
                            <div class="col-sm-9">
                              <img src="../../assets/images/auth/Login_bg.jpg" style="height:100px;" alt="thumbnail"/>
                            </div>
                          </div>
                   
                   		       <span class="input-group-append" style="margin-top: 10px; margin-bottom: 20px;">
                                  <button class="file-upload-browse btn btn-primary" type="button">선택삭제</button>
                             </span>
					  </div>

                      <!-- 요약, 상세정보 -->

                      <div class="row">
                        <div class="col-md-12">
                          <div class="form-group">
                            <label for="exampleTextarea1">제품설명</label>
                            <textarea class="form-control" id="exampleTextarea1" rows="3">제품설명</textarea>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-12">
                          <div class="form-group">
                            <label for="exampleTextarea1">제품요약</label>
                            <textarea class="form-control" id="exampleTextarea1" rows="3">제품요약</textarea>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-12">
                          <div class="form-group">
                            <label for="exampleTextarea1">추가정보</label>
                            <textarea class="form-control" id="exampleTextarea1" rows="8">추가정보</textarea>
                          </div>
                        </div>
                      </div>


                    </form>
                  </div>
                </div>
              </div>	
				
              <!-- 표 테이블 시작 . JSP에서 자동화할것-->
              <div style="float:right;margin-left: 50px">
                <div class="card">
                  <div class="card-body" style="width:800px; height:900px; ">
                  	<div class="row">
                    <h4 class="card-title">Products List</h4>
                     <button type="button" class="btn btn-outline-primary btn-icon-text" style="margin-left: 640px; margin-bottom : 20px">
                        <i class="mdi mdi-file-check btn-icon-prepend"></i> New Item </button>
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
                            <th> ItemNo. </th>
                            <th> Category </th>
                            <th> Proprietary Name </th>
                            <th> Price </th>
                            <th> Quantity </th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td class="py-1">
                              1
                            </td>
                            <td> 의류 </td>
                            <td>
                                <a href="posts-edit.jsp" style="color:white;">
                                상품이름입니다!
                                </a>
                            </td>
                            <td>9,000</td>
                            <td> 80 </td>
                          </tr>
                          <tr>
                            <td class="py-1">
                              1
                            </td>
                            <td> 의류 </td>
                            <td>
                                <a href="posts-edit.jsp" style="color:white;">
                                상품이름입니다!
                                </a>
                            </td>
                            <td>9,000</td>
                            <td> 80 </td>
                          </tr>
                          <tr>
                            <td class="py-1">
                              1
                            </td>
                            <td> 의류 </td>
                            <td>
                                <a href="posts-edit.jsp" style="color:white;">
                                상품이름입니다!
                                </a>
                            </td>
                            <td>9,000</td>
                            <td> 80 </td>
                          </tr>
                          <tr>
                            <td class="py-1">
                              1
                            </td>
                            <td> 의류 </td>
                            <td>
                                <a href="posts-edit.jsp" style="color:white;">
                                상품이름입니다!
                                </a>
                            </td>
                            <td>9,000</td>
                            <td> 80 </td>
                          </tr>
                          <tr>
                            <td class="py-1">
                              1
                            </td>
                            <td> 의류 </td>
                            <td>
                                <a href="posts-edit.jsp" style="color:white;">
                                상품이름입니다!
                                </a>
                            </td>
                            <td>9,000</td>
                            <td> 80 </td>
                          </tr>
                          <tr>
                            <td class="py-1">
                              1
                            </td>
                            <td> 의류 </td>
                            <td>
                                <a href="posts-edit.jsp" style="color:white;">
                                상품이름입니다!
                                </a>
                            </td>
                            <td>9,000</td>
                            <td> 80 </td>
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
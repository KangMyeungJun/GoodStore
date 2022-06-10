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
  	if ( $("#title").val() === "" ) {
  		alert("제목을 입력해주세요!");
  		$("#title").focus();
  		return false;
  	}

  	
  	if ( $("#summary").val() === "" ) {
  		alert("요약을 입력해주세요!");
  		$("#summary").focus();
  		return false;
  	}
  		
  	if (fileNum == 0){	
  		alert("이미지를 추가해주세요!");
  		return false;
  	}	
  	
  	return true;
  	
  	
  }
  function prevSubmit() {
		 $("#prevFrm").submit();
	  }
	  function nextSubmit() {
		  $("#nextFrm").submit();
	  }


  //
  $(function(){
		$("#addTagBtn").click(function(){
			var inputTag = $("#optionInput").val();
			$("#tags").append("<option value='"+inputTag+"'>"+inputTag+"</option>")
		})
		
		$("#removeTagBtn").click(function(){
			$("#tags option:selected").remove();
		})
		$("#file1").on("change", handleImgFileSelect);
		
		$("#editBtn").click(function() {
			if(!chkNull()) {
				return;
			}
			var opt_vals = [];
			$("#tags option").each(function() {
				opt_vals.push($(this).val());
			})
			
			 var formData = new FormData();
			   formData.append("title",$("#title").val());
			   formData.append("summary",$("#summary").val());
			   formData.append("tagList",opt_vals);

			    for (var i = 0; i < filesArr2.length; i++) {
			        	formData.append("file1",filesArr2[0]);
			        }
			    			
			    $.ajax({
			        method: 'POST',
			        url: '${initParam.middlePath}/admin/posts/'+id,
			        dataType: 'json',
			        data: formData,
				   	contentType: false,
			        processData: false,
			        async:false,
			        		        
			        success: function () {
			           
			        },
			        error: function (xhr, desc, err) {
			        	//chkNull();
			        	alert("작성 완료되었습니다!");
			        	$(location).attr('href', 'http://${initParam.domain}${initParam.middlePath}/admin/posts/');
			        	
			            return;
			        }
			    })
			
		})
		$("#newBtn").click(function() {
			if(!chkNull()) {
				return;
			}
			var opt_vals = [];
			$("#tags option").each(function() {
				opt_vals.push($(this).val());
			})
			
			 var formData = new FormData();
			   formData.append("title",$("#title").val());
			   formData.append("summary",$("#summary").val());
			   formData.append("tagList",opt_vals);

			    for (var i = 0; i < filesArr2.length; i++) {
			        	formData.append("file1",filesArr2[0]);
			        }
			    			
			    $.ajax({
			        method: 'POST',
			        url: '${initParam.middlePath}/admin/posts/',
			        dataType: 'json',
			        data: formData,
				   	contentType: false,
			        processData: false,
			        async:false,
			        		        
			        success: function () {
			           
			        },
			        error: function (xhr, desc, err) {
			        	//chkNull();
			        	alert("작성 완료되었습니다!");
			        	$(location).attr('href', 'http://${initParam.domain}${initParam.middlePath}/admin/posts/');
			        	
			            return;
			        }
			    })
			
		})
		
		$("#delBtn").click(function(){
		    $.ajax({
		        method: 'POST',
		        url: '${initParam.middlePath}/admin/posts/delete/'+id,
		        
		        success: function () {
		        	alert("삭제되었습니다!");
		        	$(location).attr('href', 'http://${initParam.domain}${initParam.middlePath}/admin/posts/');
		           
		        },
		        error: function (xhr, desc, err) {
		        	alert("잠시후 다시 시도해주세요");
		        	$(location).attr('href', 'http://${initParam.domain}${initParam.middlePath}/admin/posts/');
		        	
		            return;
		        }
		    })	
    	})
    	
    	$("#newPostBtn").click(function(){
    		$("#newBtn").show();
    		$("#delBtn").hide();
    		$("#pageTitle").text("New Post");
    		$("#editBtn").hide();
    		$("#mainContainer").show();
    		
			$("#title").val(null);
			$("#summary").val(null);		
			$("#thumbImg").attr("src","");
			$("select[name='tags'] option").remove();
    		
    	})
    	
    	$("#searchBtn").click(function() {
    		$("#keywordFrm").submit();
    	})
  })//ready
  
  var id = 0;
  var tagCnt = 0;
  function edit(temp) {
  	$("#mainContainer").show();
		$("#newBtn").hide();
		$("#delBtn").show();
		$("#pageTitle").text("Post Edit");
		$("#editBtn").show();

  	id = temp;
		var uploadPath = "${initParam.uploadPath}";
		
		 $.ajax({
			 url:"${initParam.middlePath}/admin/posts/"+id,
			 method:"get",
			 dataType:"json",
			 success:function(data) {
  				$("#deleteBtn").show();
  		

				 
				$("#title").val(data.title);
				$("#summary").val(data.summary);		
				$("#thumbImg").attr("src",uploadPath  + data.image);
				$("select[name='tags'] option").remove();
				tagCnt=data.tags.length;
				for (var i = 0; i < data.tags.length; i++) {
					$("#tags").append("<option value='"+data.tags[i].name+"'>"+data.tags[i].name+"</option>")
					
				}
			 } 
		 })
	}
  
  var filesArr2 = new Array();
  function handleImgFileSelect(e) {
      var files = e.target.files;
      filesArr2 = Array.prototype.slice.call(files);
      
		
      var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;

      filesArr2.forEach(function(f) {
      	
          if (!f.type.match(reg)) {
              alert("확장자는 이미지 확장자만 가능합니다.");
              return;
          }

          sel_file = f;

          var reader = new FileReader();
          reader.onload = function(e) {
              $("#thumbImg").attr("src", e.target.result);
              $("#thumbImg").prop("style","height:120px");
          }
          reader.readAsDataURL(f);
      });
  }
  
  	
  
  </script>
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
                <form class="nav-link mt-2 mt-md-0 d-none d-lg-flex search" id="keywordFrmTop">
                  <input type="text" class="form-control" placeholder="Search products" name="keyword">
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
        </nav>
<!----------------------------------------------------- 여기까지 좌,상단 nav bar ---------------------------------------------------------->

        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <!-- 여기에 본문 내용 채울 것. -->


            <div class="page-header">
              <h3 class="page-title"> Posts </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">Posts</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Posts List</li>
                </ol>
              </nav>
            </div>
            <div class="row">
			   <div  style="width:750px; height:1000px; float:left; ">
                <div class="card">
                  <div class="card-body" style="display:none" id="mainContainer">
                  <div class="row">
                    <h4 class="card-title" id="pageTitle">Post Edit</h4>
                    <div style="margin-left : 300px;">
                       <button type="button" class="btn btn-outline-primary btn-icon-text" id="editBtn">
                        <i class="mdi mdi-file-check btn-icon-prepend"></i> Submit </button>
                       <button type="button" class="btn btn-outline-primary btn-icon-text" id="newBtn">
                        <i class="mdi mdi-file-check btn-icon-prepend"></i> Submit </button>
                        &emsp;
                      <button type="button" class="btn btn-outline-danger btn-icon-text" id="delBtn">
                        <i class="mdi mdi-delete-forever btn-icon-prepend"></i>Delete</button>
                        <!-- <button type="submit" class="btn btn-danger mr-2">Delete</button> -->
                        &emsp;
                        </div>
                        </div>
                    <form class="form-sample" id="postFrm" name="postFrm"  >

                      <!-- 이름, 작성자 -->
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">제목</label>
                            <div class="col-sm-9">
                              <input type="text" class="form-control" value="제목" id="title" name="title">
                            </div>
                          </div>
                        </div>
                        
                      </div>


  
                      

                      <!-- 썸네일 -->
                      <div class="row">
                        <div class="col-md-6" style="margin-left: 15px">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label" style="">썸네일</label>
                            <div class="col-sm-9">
                              <input type="file" name="file1" id="file1" >
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
                              <img src="" style="height:200px;width: 180px"  id="thumbImg" name="thumbImg"/>
                            </div>
                          </div>
                        </div>
                        
                        <div style="margin-left: 40px;">
                        	<div>
                        	<input type="text"	name="optionInput" id="optionInput" placeholder="추가할 옵션을 입력해주세요"/>                            
                            <button class="file-upload-browse btn btn-primary" type="button" id="addTagBtn">태그추가</button>

                            </div>
                            <div >
                            	<select class="form-select"  id="tags" name="tags" multiple aria-label="multiple select example" style="border: 1px solid #FFFFFF; height: 180px;  margin-top: 5px; width: 200px">
								</select>
                            </div>
                            	<button class="file-upload-browse btn btn-primary" type="button" style="margin-left: 210px" id="removeTagBtn">태그삭제</button>
                        
                        </div>
                      </div>
                      

                      <!-- 요약, 상세정보 -->


                      <div class="row">
                        <div class="col-md-12">
                          <div class="form-group">
                            <label for="exampleTextarea1">글 내용</label>
                            <textarea class="form-control"  rows="30" id="summary" name="summary">내용</textarea>
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
                    <h4 class="card-title">Post List</h4>
                     <button type="button" class="btn btn-outline-primary btn-icon-text" style="margin-left: 640px; margin-bottom : 20px" id="newPostBtn">
                        <i class="mdi mdi-file-check btn-icon-prepend"></i> New Post </button>
                    </div>
                    <div class="form-group">
                      <div class="input-group">
                        <form id="keywordFrm">
                        <input type="text"  class="form-control" id="keyword" name="keyword" placeholder="Search Post title" aria-label="Recipient's username" aria-describedby="basic-addon2">
                        </form>
                        <div class="input-group-append">
                          <button class="btn btn-fw btn-outline-secondary" type="button" id="searchBtn">Search</button>
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
                          <c:forEach items="${list }" var="item">
                          <tr>
                            <td class="py-1">
                              ${item.blog_id }
                            </td>
                            <td>
                                <a href="#void" onclick="edit(${item.blog_id})" id="edit" style="color:white;">
                                ${item.title }
                                </a>
                            </td>
                            <td>${item.upload_date }</td>
                          </tr>
                          
                          </c:forEach>
                          
                        </tbody>
                      </table>
                    </div> 
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
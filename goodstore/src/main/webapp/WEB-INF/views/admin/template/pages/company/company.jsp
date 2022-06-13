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
  	if ( $("#name").val() === "" ) {
  		alert("NAME을 입력해주세요");
  		$("#name").focus();
  		return false;
  	}

  	
  	if ( $("#type").val() === "" ) {
  		alert("TYPE을 입력해주세요");
  		$("#type").focus();
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
		
		
		$("#editBtn").click(function() {
			if(!chkNull()) {
				return;
			}

			
			 var formData = new FormData();
			   formData.append("name",$("#name").val());
			   formData.append("type",$("#type").val());


			    			
			    $.ajax({
			        method: 'POST',
			        url: '${initParam.middlePath}/admin/company/'+id,
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
			        	$(location).attr('href', 'http://${initParam.domain}${initParam.middlePath}/admin/company/');
			        	
			            return;
			        }
			    })
			
		})
		$("#newBtn").click(function() {
			if(!chkNull()) {
				return;
			}

			
			 var formData = new FormData();
			   formData.append("name",$("#name").val());
			   formData.append("type",$("#type").val());


			    			
			    $.ajax({
			        method: 'POST',
			        url: '${initParam.middlePath}/admin/company/',
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
			        	$(location).attr('href', 'http://${initParam.domain}${initParam.middlePath}/admin/company/');
			        	
			            return;
			        }
			    })
			
		})
		
		$("#delBtn").click(function(){
		    $.ajax({
		        method: 'POST',
		        url: '${initParam.middlePath}/admin/company/delete/'+id,
		        
		        success: function () {
		        	alert("삭제되었습니다!");
		        	$(location).attr('href', 'http://${initParam.domain}${initParam.middlePath}/admin/company/');
		           
		        },
		        error: function (xhr, desc, err) {
		        	alert("잠시후 다시 시도해주세요");
		        	$(location).attr('href', 'http://${initParam.domain}${initParam.middlePath}/admin/company/');
		        	
		            return;
		        }
		    })	
    	})
    	
    	$("#newPostBtn").click(function(){
    		$("#newBtn").show();
    		$("#delBtn").hide();
    		$("#pageTitle").text("New Company");
    		$("#editBtn").hide();
    		$("#mainContainer").show();
    		
			$("#name").val(null);
			$("#type").val(null);		

    		
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

		
		 $.ajax({
			 url:"${initParam.middlePath}/admin/company/"+id,
			 method:"get",
			 dataType:"json",
			 success:function(data) {
  				$("#deleteBtn").show();
  		

				 
				$("#name").val(data.name);
				$("#type").val(data.type);		
			 } 
		 })
	}
  

  
  	
  
  </script>
  <body>
    <div class="container-scroller">
      <!-- partial:../../partials/_sidebar.jsp -->
 <!-- leftSide -->     
 <%@ include file="../../include/leftnavi.jsp" %>
 <%@ include file="../../include/topnavi.jsp" %>


     
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
                    <h4 class="card-title" id="pageTitle">Company Edit</h4>
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
                            <label class="col-sm-3 col-form-label">Name</label>
                            <div class="col-sm-9">
                              <input type="text" class="form-control" value="Name" id="name" name="name">
                            </div>
                          </div>
                        </div>
                        
                      </div>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Type</label>
                            <div class="col-sm-9">
                              <input type="text" class="form-control" value="Type" id="type" name="type">
                            </div>
                          </div>
                        </div>
                        
                      </div>


  
                      




                      

                      <!-- 요약, 상세정보 -->





               		</form>
                  </div>
                </div>
           	</div>
				
              <!-- 표 테이블 시작 . JSP에서 자동화할것-->
              <div style="float:right;margin-left: 50px">
                <div class="card">
                  <div class="card-body" style="width:800px; height:900px; ">
                  	<div class="row">
                    <h4 class="card-title">Company List</h4>
                     <button type="button" class="btn btn-outline-primary btn-icon-text" style="margin-left: 640px; margin-bottom : 20px" id="newPostBtn">
                        <i class="mdi mdi-file-check btn-icon-prepend"></i> New Company </button>
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
                            <th> CompanyNo. </th>
                            <th> Name </th>
                            <th> Type </th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach items="${list }" var="item">
                          <tr>
                            <td class="py-1">
                              ${item.company_id }
                            </td>
                            <td>
                                <a href="#void" onclick="edit(${item.company_id})" id="edit" style="color:white;">
                                ${item.name }
                                </a>
                            </td>
                            <td>${item.type }</td>
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
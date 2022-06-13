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
<%-- <%@ include file="../../../../goodstore/common/static_link.jsp" %> --%>
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
  <style>
/*   #sidebar {
  position: none;
} */
  </style>
  <script type="text/javascript">
  $(function() {
	  $("#searchBtn").click(function(){
		  $("#keywordFrm").submit();
	  })
  })
  function prevSubmit(id,cp) {edit(id,cp)}
  function nextSubmit(id,cp) {edit(id,cp)}
  
  function deleteComment(cid) {
	  $.ajax({
			 url:"${initParam.middlePath}/admin/comment/delete/"+cid,
			 method:"post",
			 success:function() {
				 alert("삭제되었습니다!");
				edit(global_id,global_cp);
			 } 
		 })
  }
  var global_id = 0;
  var global_cp = 0;
  
  function edit(id,cp) {
/* 	  	$("#mainContainer").show();
		$("#newBtn").hide();
		$("#delBtn").show();
		$("#pageTitle").text("Post Edit");
		$("#editBtn").show(); */
		global_id = id;
		global_cp = cp;

  		
		var uploadPath = "${initParam.uploadPath}";
		
		 $.ajax({
			 url:"${initParam.middlePath}/admin/comment/"+id,
			 method:"get",
			 data:{'cp':cp},
			 dataType:"json",
			 error:function(request,status,error){
				 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				 },
			 success:function(json) {
				 var page = json.paging;
				 var paging="";
				paging +='<form id="prevFrm">'
				 +'<form id="prevFrm">'
				 +'<input type="hidden" value="'+paging.nextPage+'" name="cp">'
				 +'</form>'
				 +'<form id="nextFrm">'
				 +'<input type="hidden" value="'+paging.prevPage+'" name="cp">'
				 +'</form>'
				 +'<div style="text-align:center;height: 40px;">';
				 if (page.prevPages) {
					paging+= '<a href="#void" onclick="prevSubmit('+id+','+paging.prevPage+')">prev</a>';
				}
				for (var i = page.firstPage; i <= page.lastPage; i++) {
					paging+= '<a href="#void" onclick="edit('+id+','+i+')">'+i+'</a>';
					
				}	
				if (page.nextPages) {
					paging+= '<a href="javascript:void(0)" onclick="nextSubmit('+id+','+paging.nextPage+')">next</a>';
				}
				paging +=' </div>';	
                   
				 
				var data = json.list; 
				$("#commentOutput").html("");
				for (var i = 0; i < data.length; i++) {
					
					$("#commentOutput").append('<div class="flex-w flex-t p-b-68" style="border: 1px solid #FFFFFF">'
					+'<div class="size-207" style="margin: 10px" >'	
					+'<div class="flex-w flex-sb-m p-b-17">'
					+'<span>'+data[i].name+'</span>'
					+'<button style="margin-left: 600px;" class="btn btn-primary" onclick="deleteComment('+data[i].blog_comment_id+')">delete</button>'
					+'</div><p>'+data[i].review+'</p></div></div>'
					)

					
					
				}
					$("#pagingOutput").html("");					
				if (data.length != 0) {
					$("#pagingOutput").html(paging);					
				}
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
                <div class="card" id="commentOutput">
          		<!-- Review -->
<!-- 				<div class="flex-w flex-t p-b-68" style="border: 1px solid #FFFFFF">				
					<div class="size-207" style="margin: 10px" >
						<div class="flex-w flex-sb-m p-b-17">
							<span class="">
								Ariana Grande
							</span>
							<button style="margin-left: 600px;" class="btn btn-primary">delete</button>
							<span class="fs-18 cl11">
								<i class="zmdi zmdi-star"></i>
								<i class="zmdi zmdi-star"></i>
								<i class="zmdi zmdi-star"></i>
								<i class="zmdi zmdi-star"></i>
								<i class="zmdi zmdi-star"></i>
							</span>
						</div>
						<p>
							Quod autem in homine praestantissimum atque optimum est, id deseruit. Apud ceteros autem philosophos
						</p>
					</div>
				</div> -->
				
               </div>
               <div style="text-align:center;" id = "pagingOutput">


                </div>
                                 
             </div>
        	
				
              <!-- 표 테이블 시작 . JSP에서 자동화할것-->
              <div style="float:right;margin-left: 50px">
                <div class="card">
                  <div class="card-body" style="width:800px; height:900px; ">
                  	<div class="row">
                    <h4 class="card-title">Post List</h4>
                     
                    </div>
                    <div class="form-group" style="margin-left: 400px">
                      <div class="input-group">
                        <form id="keywordFrm">
                        <input type="text" class="form-control" style="width:100%" id="keyword" name="keyword" placeholder="Search Post title" aria-label="Recipient's username" aria-describedby="basic-addon2">
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
                                <a href="#void" onclick="edit(${item.blog_id},1)" id="edit" style="color:white;">
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
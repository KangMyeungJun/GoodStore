<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html lang="en">
  <head>
	<style type="text/css">
	

input[type="checkbox"][id^="cb"] {
  display: none;
}

.check {
  border: 1px solid #fff;
  padding: 10px;
  display: block;
  position: relative;
  margin: 10px;
  cursor: pointer;
  -webkit-touch-callout: none;
  -webkit-user-select: none;
  -khtml-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

label::before {
  background-color: white;
  color: white;
  content: " ";
  display: block;
  border-radius: 50%;
  border: 1px solid grey;
  position: absolute;
  top: -5px;
  left: -5px;
  width: 25px;
  height: 25px;
  text-align: center;
  line-height: 28px;
  transition-duration: 0.4s;
  transform: scale(0);
}

label img {
  height: 100px;
  width: 100px;
  transition-duration: 0.2s;
  transform-origin: 50% 50%;
}

:checked+label {
  border-color: #ddd;
}

:checked+label::before {
  content: "✓";
  background-color: grey;
  transform: scale(1);
}

:checked+label img {
  transform: scale(0.9);
  box-shadow: 0 0 5px #333;
  z-index: -1;
}
</style>  

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
    	if ( $("#item_name").val() === "" ) {
    		alert("상품명을 입력해주세요!");
    		$("#item_name").focus();
    		return false;
    	}
    	
    	if ( $("#stock").val() === "" ) {
    		alert("재고를 입력해주세요!");
    		$("#stock").focus();
    		return false;
    	}
    	
    	if ( $("#price").val() === "" ) {
    		alert("가격을 입력해주세요!");
    		$("#price").focus();
    		return false;
    	}
    	
    	if ( $("#description").val() === "" ) {
    		alert("설명을 입력해주세요!");
    		$("#description").focus();
    		return false;
    	}
    	
    	if ( $("#summary").val() === "" ) {
    		alert("요약을 입력해주세요!");
    		$("#summary").focus();
    		return false;
    	}
    	
    	if ( $("#additional_info").val() === "" ) {
    		alert("추가설명을 입력해주세요!");
    		$("#additional_info").focus();
    		return false;
    	}
    	
    	if (!$("#thumbImg").attr("src")) {
    		alert("썸네일을 추가해주세요!");
    		$("#file1").focus();
    		return false;
    	}		
    	// || (!document.getElementByName("sub_images"))
    	if ((fileNum == 0)){	
    		alert("이미지를 추가해주세요!");
    		return false;
    	}	
    	
    	return true;
    	
    	
    }
    //이미지 미리보기
    var sel_file;
 
    $(document).ready(function() {
    	$("#searchBtn").click(function() {
    		$("#keywordFrm").submit();
    	})
    	
    	$("#newBtn").click(function() {
    		
    		$("#mainContainer").show();
    		$("#pageTitle").text("New Post");
    		$("#deleteBtn").hide();
    		$("#company_id").attr("disabled",false);
    		$("#company").show();
    		$("#insertBtn").show();
    		$("#frmBtn").hide();
    		
				$("#item_name").val(null);
				$("#stock").val(null);
				$("#price").val(null);
				$("#description").val(null);
				$("#summary").val(null);
				$("#additional_info").val(null);				
				$("#thumbImg").attr("src","");
				$("#imgOutput").html(null);
    		
    	})
    	
    	 $("#insertBtn").click(function() {
		    // 폼데이터 담기
 		   		if(!chkNull()) {
    		    	return;
    		    }
		    var formData = new FormData();
		   formData.append("item_name",$("#item_name").val());
		   formData.append("stock",$("#stock").val());
		   formData.append("price",$("#price").val());
		   formData.append("description",$("#description").val());
		   formData.append("summary",$("#summary").val());
		   formData.append("additional_info",$("#additional_info").val());
		   formData.append("category",$("#category").val());
		   formData.append("company_id",$("#company_id").val());
		   
		   $("input:checkbox[name='sub_images']").each(function(){
		        formData.append("sub_images",$(this).val());
		    });
		  
		   
		 
		    for (var i = 0; i < filesArr2.length; i++) {
		        	formData.append("file1",filesArr2[0]);
		        }
		    
		    for (var i = 0; i < content_files.length; i++) {
		        // 삭제되지 않은 파일만 폼데이터에 담기
		        if (!content_files[i].is_delete) {
		            formData.append("sub_image", content_files[i]);
		        }
		    }
			
		    $.ajax({
		        method: 'POST',
		        url: '${initParam.middlePath}/admin/products/',
		        dataType: 'json',
		        data: formData,
			   	   	contentType: false,
		        processData: false,
		        async:false,
		        
		        
		        success: function (data) {
		           
		        },
		        error: function (xhr, desc, err) {
		        	chkNull();
		        	alert("작성 완료되었습니다!");
		        	$(location).attr('href', 'http://${initParam.domain}${initParam.middlePath}/admin/products/');
		        	
		            return;
		        }
		    })
    		
    	})
    	
    	$("#frmBtn").click(function(){
    		
    		    // 폼데이터 담기
    		    if(!chkNull()) {
    		    	return;
    		    }
    		    var formData = new FormData();
    		   formData.append("item_name",$("#item_name").val());
    		   formData.append("stock",$("#stock").val());
    		   formData.append("price",$("#price").val());
    		   formData.append("description",$("#description").val());
    		   formData.append("summary",$("#summary").val());
    		   formData.append("additional_info",$("#additional_info").val());
    		   formData.append("category",$("#category").val());
    		   
    		   $("input:checkbox[name='sub_images']").each(function(){
    		        formData.append("sub_images",$(this).val());
    		    });
    		  
    		   
    		 
    		    for (var i = 0; i < filesArr2.length; i++) {
    		        	formData.append("file1",filesArr2[0]);
    		        }
    		    
    		    for (var i = 0; i < content_files.length; i++) {
    		        // 삭제되지 않은 파일만 폼데이터에 담기
    		        if (!content_files[i].is_delete) {
    		            formData.append("sub_image", content_files[i]);
    		        }
    		    }
				
    		    $.ajax({
    		        method: 'POST',
    		        url: '${initParam.middlePath}/admin/products/'+itemId,
    		        dataType: 'json',
    		        data: formData,
  			   	   	contentType: false,
    		        processData: false,
    		        async:false,
    		        
    		        success: function (data) {
    		           
    		        },
    		        error: function (xhr, desc, err) {
    		        	alert("수정하였습니다!");
    		        	$(location).attr('href', 'http://${initParam.domain}${initParam.middlePath}/admin/products/');
    		        	
    		            return;
    		        }
    		    })
    		
    	})
    	$("#deleteBtn").click(function(){
		    $.ajax({
		        method: 'POST',
		        url: '${initParam.middlePath}/admin/products/delete/'+itemId,
		        
		        success: function () {
		        	alert("삭제되었습니다!");
		        	$(location).attr('href', 'http://${initParam.domain}${initParam.middlePath}/admin/products/');
		           
		        },
		        error: function (xhr, desc, err) {
		        	alert("잠시후 다시 시도해주세요");
		        	$(location).attr('href', 'http://${initParam.domain}${initParam.middlePath}/admin/products/');
		        	
		            return;
		        }
		    })	
    	})
        $("#file1").on("change", handleImgFileSelect);
        $("#input_file").on("change", fileCheck);
    });
    
 // 파일 현재 필드 숫자 totalCount랑 비교값
    var fileCount = 0;
    // 해당 숫자를 수정하여 전체 업로드 갯수를 정한다.
    var totalCount = 10;
    // 파일 고유넘버
    var fileNum = 0;
    // 첨부파일 배열
    var content_files = new Array();
    for (var i = 0; i < len; i++) {
		content_files.unshift("");
	}
    var filesArr = new Array();
    function fileCheck(e) {
        var files = e.target.files;
        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
        // 파일 배열 담기
        filesArr = Array.prototype.slice.call(files);
        
        // 파일 개수 확인 및 제한
        if (fileCount + filesArr.length > totalCount) {
          $.alert('파일은 최대 '+totalCount+'개까지 업로드 할 수 있습니다.');
          return;
        } else {
        	 fileCount = fileCount + filesArr.length;
        }
        filesArr.forEach(function(f) {
        	
            if (!f.type.match(reg)) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }
        }) 
        // 각각의 파일 배열담기 및 기타
        filesArr.forEach(function (f) {
          var reader = new FileReader();
          reader.onload = function (e) {
            content_files.push(f);
            $('#imgOutput').append( '<div>'
	 					+	'<input type="checkbox" value='+f.name+' name="sub_image" id="cb'+fileNum+'" />'
	 		 			+	'<label for="cb'+fileNum+'" class="check" id="imgLable'+fileNum+'"><img src="'+e.target.result+'" id=img'+fileNum+'/></label>'
	 					+ '</div>'
    		);
            fileNum ++;
          };
          reader.readAsDataURL(f);
        });
        console.log(content_files);
        //초기화 한다.
        $("#input_file").val("");
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

    
	var len = 0;
    function delSelected() {
    	
		 $.ajax({
 			 success:function() {
 				for (var i = 0; i < fileNum; i++) {
 					if( $('input:checkbox[ id="cb'+i+'"]').is(":checked") == true) {
 						 $('input:checkbox[ id="cb'+i+'"]').attr("name","disabled");
 						$('#imgLable'+i).css("display","none");	
 						if (i > len) {
 							content_files[i].is_delete = true;
 						}

 					}			
				}
			 } 
		 })
	}
    var itemId = 0;
    function edit(temp) {
    	$("#mainContainer").show();
		$("#insertBtn").hide();
		$("#pageTitle").text("Post Edit");
		$("#frmBtn").show();
		$("#company_id").attr("disabled",true);
		$("#company").hide();
    	$("#deleteBtn").show();
    	itemId = temp;
		var uploadPath = "${initParam.uploadPath}";
		
		 $.ajax({
			 url:"${initParam.middlePath}/admin/products/"+itemId,
			 method:"get",
			 dataType:"json",
 			 success:function(data) {
 				 
 				var output = "";  
 				len = data.sub_image.length;
 				for (var i = 0; i < data.sub_image.length; i++) {
 					output += '<div>'
 					+	'<input type="checkbox" value='+data.sub_image[i]+' name="sub_images" id="cb'+fileNum+'" />'
 		 			+	'<label for="cb'+fileNum+'" class="check" id="imgLable'+fileNum+'"><img src="${initParam.uploadPath}'+data.sub_image[i]+'"id=img'+fileNum+' /></label>'
 					+ '</div>';
 					fileNum++;
 					
				} 
 				 
 				$("#item_name").val(data.item_name);
 				$("#stock").val(data.stock);
 				$("#price").val(data.price);
 				$("#description").val(data.description);
 				$("#summary").val(data.summary);
 				$("#additional_info").val(data.additional_info);
 				$("#category").val(data.category_id).prop("selected",true);
 				$("#thumbImg").attr("src",uploadPath  + data.image);
 				$("#imgOutput").html(output);
 				

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
                  <div class="card-body" style="display:none" id="mainContainer">
                  <div class="row">
                    <h4 class="card-title" id="pageTitle">Post Edit</h4>
                    <div style="margin-left : 400px; margin-bottom:50px">
                                          <button type="button" class="btn btn-outline-primary btn-icon-text" id="frmBtn">
                        <i class="mdi mdi-file-check btn-icon-prepend"></i> Submit </button>
                                          <button type="button" class="btn btn-outline-primary btn-icon-text" id="insertBtn">
                        <i class="mdi mdi-file-check btn-icon-prepend"></i> Submit </button>
                        &emsp;
                      <button type="button" class="btn btn-outline-danger btn-icon-text" id="deleteBtn">
                        <i class="mdi mdi-delete-forever btn-icon-prepend"></i>Delete</button>
                        
                        <!-- <button type="submit" class="btn btn-danger mr-2">Delete</button> -->
                        &emsp;
                      
                        </div>
                        </div>
                    <form class="form-sample" id="editFrm" name="editFrm" enctype="multipart/form-data" method="post">

                      <!-- 이름, 작성자 -->
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">상품명</label>
                            <div class="col-sm-9">
                              <input type="text" class="form-control" value="상품명" id="item_name" name="item_name">
                            </div>
                          </div>
                        </div>
                        
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">재고</label>
                            <div class="col-sm-9">
                              <input type="number" class="form-control" value="5" id="stock" name="stock">
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
                              <select class="form-control" name="category" id="category">
                              	<c:forEach items="${categoryList }" var="item">
                              		<option value="${item.category_id }">${item.category_name }</option>
                              	</c:forEach>
                              </select>
                            </div>
                          </div>
                        </div>
                      <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">가격</label>
                            <div class="col-sm-9">
                              <input type="number" class="form-control" value="" id="price" name="price">
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- company -->
                      <div class="row" id="company">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">기업</label>
                            <div class="col-sm-9">
                              <select class="form-control" name="company_id" id="company_id" >
                              	<c:forEach items="${companyList }" var="item">
                              		<option value="${item.company_id }">${item.name }</option>
                              	</c:forEach>
                              </select>
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
                              <input type="file" name="file1" id = "file1"/>
                              
<!--                               <div class="input-group col-xs-12">
                                <input type="text" class="form-control file-upload-info" disabled placeholder="Upload Image">
                                <span class="input-group-append">
                                  <button class="file-upload-browse btn btn-primary" type="button">업로드</button>
                                </span>
                              </div> -->
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
                              <img src="" style="height:200px;" id="thumbImg"/>
                            </div>
                          </div>
                        </div>
                      </div>
                      
                      <!-- 이미지 -->
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">이미지</label>
                            <div class="col-sm-9">
                              <input type="file" name="sub_image" multiple="multiple" id="input_file">
<!--                               <div class="input-group col-xs-12">
                                <input type="text" class="form-control file-upload-info" disabled="" placeholder="Upload Image">
                                <span class="input-group-append">
                                  <button class="file-upload-browse btn btn-primary" type="button">업로드</button>
                                </span>

                              </div> -->
                                                              
                            </div>

                          </div>
                        </div>
                      </div>

                      <!-- 기존 이미지 -->
                      <div class="row" id="imgOutput" >
                       
					  </div>
           		     <span class="input-group-append" style="margin-top: 10px; margin-bottom: 20px;">
                           <button class="file-upload-browse btn btn-primary" type="button" onclick="delSelected()">선택삭제</button>
                     </span>

                      <!-- 요약, 상세정보 -->

                      <div class="row">
                        <div class="col-md-12">
                          <div class="form-group">
                            <label for="exampleTextarea1">제품설명</label>
                            <textarea class="form-control" id="description" rows="3" name="description"></textarea>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-12">
                          <div class="form-group">
                            <label for="exampleTextarea1">제품요약</label>
                            <textarea class="form-control" id="summary" rows="3" name="summary"></textarea>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-12">
                          <div class="form-group">
                            <label for="exampleTextarea1">추가정보</label>
                            <textarea class="form-control" id="additional_info" rows="8" name="additional_info"></textarea>
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
                     <button type="button" class="btn btn-outline-primary btn-icon-text" style="margin-left: 640px; margin-bottom : 20px" id="newBtn">
                        <i class="mdi mdi-file-check btn-icon-prepend"></i> New Item </button>
                    </div>
                    <div class="form-group">
                      <div class="input-group">
                      <form id="keywordFrm">
                        <input type="text" class="form-control" id="keyword" name="keyword" placeholder="Search Post title" aria-label="Recipient's username" aria-describedby="basic-addon2">
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
                            <th> ItemNo. </th>
                            <th> Category </th>
                            <th> Proprietary Name </th>
                            <th> Price </th>
                            <th> Quantity </th>
                          </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list }" var="item">
                           <tr>
                            <td class="py-1">
                              ${item.item_id }
                            </td>
                            <td> ${item.category_name } </td>
                            <td>
                                <a href="#void" onclick="edit(${item.item_id})" id="edit" style="color:white;">
                                ${item.item_name }
                                </a>
                            </td>
                            <td>${item.price }</td>
                            <td> ${item.stock } </td>
                          </tr>                       
                        </c:forEach>
                          
                  <%--     ${initParam.middlePath}/admin/products/${item.item_id }   --%>  
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
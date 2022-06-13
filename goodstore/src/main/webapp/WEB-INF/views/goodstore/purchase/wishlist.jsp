<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
	<title>Product</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<% 
String sortValue = "";
String keywordValue = "";
if(request.getParameter("sort") != null){
	sortValue = request.getParameter("sort");
}
if(request.getParameter("keyword") != null){
	keywordValue = request.getParameter("keyword");
}
%>
<style>
.product-list-img{height:20vw;}
@media (max-width: 1600px) {
	.product-list-img{height:25vw;}  
  }  
@media (max-width: 1300px){
	.product-list-img{height:30vw;}
  }
@media (max-width: 991px) {
    .product-list-img{height:35vw;}    
  }
@media (max-width: 767px) {
    .product-list-img{height:60vw;}    
  }
</style>
</head>
<body class="animsition">
<%@ include file="../../goodstore/common/header.jsp" %>
<%@ include file="../../goodstore/common/sidebar.jsp" %>

	<!-- Product -->
	<div class="bg0 m-t-23 p-b-140">
		<div class="container">
			<div class="flex-w flex-sb-m p-b-52">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*">
						All Products
					</button>

					<c:forEach var="category" items="${categoryList}">
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".<c:out value="${ category.category_name }"/>">
						<c:out value="${ category.category_name }"/>
					</button>
					</c:forEach>
				</div>
			</div>
			<div id="product-wrap">
			<div class="row isotope-grid" id="product-list-wrap">
		
				<c:forEach var="productList" items="${ wishlist }">
				<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item product-list-each ${productList.category_name}">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0">
							<img class="product-list-img" src="${ initParam.uploadPath }${ productList.image }" alt="IMG-PRODUCT">
						</div>
						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<span class="stext-105 cl3">
 								<c:out value="${ productList.com_name }"/>
								</span>
								
 								<a href="product_detail/${productList.category_id}/${ productList.item_id }" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
 								<c:out value="${ productList.item_name }"/>									 
								</a>

								<span class="stext-105 cl3">
								<fmt:formatNumber pattern="#,###" value="${productList.price}"/>원
								</span>
							</div>

							<div class="block2-txt-child2 flex-r p-t-3">
								<button value="${ productList.item_id }" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2 add-wishlist">
									<img class="icon-heart1 dis-block trans-04" src="${initParam.staticPath}images/icons/icon-heart-01.png" alt="ICON">
									<img class="icon-heart2 dis-block trans-04 ab-t-l" src="${initParam.staticPath}images/icons/icon-heart-02.png" alt="ICON">
								</button>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
			</div>

		</div>
	</div>
<%@ include file="../common/footer.jsp" %>
<div id="reload-js">
<%@ include file="../../goodstore/common/static_link.jsp" %>
<%@ include file="../common/common_js.jsp" %>
</div>
<!--------common js ----------->
<script>
$(function(){
	keepSort();
	$('.js-show-filter').trigger('click');
	menuColor('Shop');
	addWish();
});

function keepSort(){
	$(".filter-tope-group").children("button").each(function(index, obj){
		var index = sessionStorage.getItem("filterIndex");
		if($(this).index() == index){
			$(this).trigger('click');
			return;
		}
	});		
}
$(".filter-tope-group").children("button").on('click', function(){
	sessionStorage.setItem("filterIndex", $(this).index() ); // 저장
});//keepSort 정렬 필터 유지

</script>
</body>
</html>
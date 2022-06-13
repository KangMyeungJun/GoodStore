<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="product_content">
<div class="row isotope-grid" id="product-list-wrap">
<c:forEach var="productList" items="${ productList }">
<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item product-list-each ${productList.category_name}">
	<!-- Block2 -->
	<div class="block2">
		<div class="block2-pic hov-img0">
 			<img class="product-list-img" src="${initParam.uploadPath }${ productList.image }" alt="IMG-PRODUCT">
			<button class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1" value="${ productList.item_id}">
				Quick View
			</button>
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
				<a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
					<img class="icon-heart1 dis-block trans-04" src="${initParam.staticPath}images/icons/icon-heart-01.png" alt="ICON">
					<img class="icon-heart2 dis-block trans-04 ab-t-l" src="${initParam.staticPath}images/icons/icon-heart-02.png" alt="ICON">
				</a>
			</div>
		</div>
	</div>
</div>
</c:forEach>
</div>
</div>
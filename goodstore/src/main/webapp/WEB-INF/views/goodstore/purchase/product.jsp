<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
	<title>Product</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../../goodstore/common/static_link.jsp" %>
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
				<div class="flex-w flex-c-m m-tb-10">
					<div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter">
						<i class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
						<i class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						 Filter
					</div>

					<div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
						<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
						<i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						Search
					</div>
				</div>
				
				<!-- Search product -->
				<form class="dis-none panel-search w-full p-t-10 p-b-15">
					<div class="bor8 dis-flex p-l-15">
						<button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
							<i class="zmdi zmdi-search"></i>
						</button>
						<input type="hidden" name="sort" value="<%=sortValue%>"/>
						<input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text" name="keyword" placeholder="Search">
						
					</div>	
				</form>

				<!-- Filter -->
				<form class="dis-none panel-filter w-full p-t-10 filter-frm">
					<div class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
						<div class=" p-r-15 p-b-27 w-full">
						<input type="hidden" name="keyword" value="<%=keywordValue%>"/>
							<div class="mtext-106 cl2 p-b-15 w-full">
								Sort By
							</div>
							<div class="flex-sa" style="width:50%">
								<div class="p-b-6 ">
									<a href="${pageContext.request.contextPath}/product" class="filter-link mtext-101 trans-04 <%= sortValue.equals("") ? "filter-link-active" : ""%>">
										기본
									</a>
								</div>

								<div class="p-b-6">
									<button name="sort" value="wish_count" class="filter-link mtext-101 trans-04 <%= sortValue.equals("wish_count") ? "filter-link-active" : ""%>">인기순</button>
								</div>

								<div class="p-b-6">
									<button name="sort" value="upload_date" class="filter-link mtext-101 trans-04 <%= sortValue.equals("upload_date") ? "filter-link-active" : ""%>">최신순</button>
								</div>
								
								<div class="p-b-6">
									<button name="sort" value="item_name" class="filter-link mtext-101 trans-04 <%= sortValue.equals("item_name") ? "filter-link-active" : ""%>">이름순</button>
								</div>

								<div class="p-b-6">
									<button name="sort" value="price" class="filter-link mtext-101 trans-04 <%= sortValue.equals("price") ? "filter-link-active" : ""%>">가격 낮은 순</button>
								</div>

								<div class="p-b-6">
									<button name="sort" value="price_high" class="filter-link mtext-101 trans-04 <%= sortValue.equals("price_high") ? "filter-link-active" : ""%>">가격 높은 순</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div id="product-wrap">
			<div class="row isotope-grid" id="product-list-wrap">
		
				<c:forEach var="productList" items="${ productList }">
				<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item product-list-each ${productList.category_name}">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0">
							<img src="${initParam.staticPath}images/${ productList.image }" alt="IMG-PRODUCT">
							<button class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1" value="${ productList.item_id}">
								Quick View
							</button>
						</div>
						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<span class="stext-105 cl3">
 								<c:out value="${ productList.com_name }"/>
								</span>
								
 								<a href="product_detail/${ productList.item_id }" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
 								<c:out value="${ productList.item_name }"/>									 
								</a>

								<span class="stext-105 cl3">
 								<c:out value="${ productList.price }"/>원
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

			<!-- Load more -->
			<div class="flex-c-m flex-w w-full p-t-45">
				<button class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04" id="load-more">
					Load More
				</button>
			</div>
		</div>
	</div>
<%@ include file="../common/footer.jsp" %>
<div id="quick-view-wrap"></div>
<%@ include file="../common/common_js.jsp" %>
<script>
$('#load-more').click(function(){
	var startNum = $('#product-list-wrap .product-list-each').length;
	var addCnt = 8;
	var item_count = startNum + addCnt
	var productHtml = "";
	
	$.ajax({
		url : 'load_more.action',
		type : 'POST',
		dataType : "text",
		data : {
			"item_count" : item_count,
			"sort" : '<%=sortValue%>',
			"keyword" : '<%=keywordValue%>'
		},
		success :function(result){
			console.log("결과확인");
			var html = jQuery('<div>').html(result);
			var contents = html.find('div#product_content').html();
			$("#product-wrap").html(contents) 
			quickBtn();
///////////////////////main.js의 data-filter가 안먹힘 에러 해결필요 ///////////////////////
//			<c:import url="${initParam.staticPath}js/main.js"/>

		},
		error : function(){
			alert('에러입니다');
		}
	})
}); 
</script>
<script>
$(function(){quickBtn();});
function quickBtn(){
	$('.js-show-modal1').on('click',function(e){
	    e.preventDefault();
	    var bno = this.value;
		console.log('click');
		$.ajax({
			url : "quick_view.action",
			type : 'get',
			data : {
				item_id : bno
			},
			success:function(result){
				console.log('성공');
				var html = jQuery('<div>').html(result);
				var contents = html.find('div#quick_view').html();
				$("#quick-view-wrap").html(contents) 
			    $('.js-modal1').addClass('show-modal1');
				<c:import url="${initParam.staticPath}js/main.js"/>
				<c:import url="${initParam.staticPath}js/slick-custom.js"/>

				$('.js-addcart-detail').each(function(){
			    	var nameProduct = $('.quick-view-title').html();
			    	var numProduct = $('.num-product').val();
			    	$(this).on('click', function(){
			    		$.ajax({
			    			url : "add_cart.action",
			    			type : "post",
			    			data : {
			    				item_id : bno,
			    				quantity : numProduct
			    			},
			    			success:function(result){
			    				
			    				if(result == 1){
				    	    		swal(nameProduct, "is added to cart !", "success");
			    				}else{
			    					alert("로그인이 필요합니다");
			    				}
			    			},
			    			error:function(){
			    				alert("카트 담기 실패");
			    			}
			    		})
			    	});
			    }); //ajax add-cart 
			},
			error:function(request, status, error){
				alert(request.status+"\n"+request.responseText+"\n"+error);
			}
			});//ajax
		});
	};
</script>
<!---------------------------------- 하드코딩 에러없으면 지움 ----------------------------->
<!-- <script>
function quickBtn(){
$('.js-show-modal1').on('click',function(e){
    e.preventDefault();
    var bno = this.value;
	console.log('click');
	$.ajax({
		url : "quick_view.action",
		type : 'get',
		data : {
			item_id : bno
		},
		success:function(data){
	/* 		initialize image link attribute */
		    $('.quick-view-main').attr('src','');
		    $('.quick-view-sub').attr('src', '');
		    $('.quick-view-expand').attr('href','');
		    $('.num-product').val(1);
		    
	/* 	    first image box is filled with productDetail domain */
			if(data.productDetail){
			    $('.quick-view-title').html(data.productDetail.item_name);
			    $('.quick-view-price').html(data.productDetail.price);
			    $('.quick-view-summary').html(data.productDetail.summary);
				$('.quick-view-main').eq(0).attr('src','${initParam.staticPath}images/'+data.productDetail.image);
				$('.quick-view-sub').eq(0).attr('src','${initParam.staticPath}images/'+data.productDetail.image);
				$('.quick-view-expand').eq(0).attr('href','${initParam.staticPath}images/'+data.productDetail.image);
			}
			
	/* 		other images are filled with subImage domain */
			if(data.subImageList && data.subImageList.length){
				var subImage = data['subImageList'];
		    	for(var i in subImage){
			    	var index = i-0+1;
				    $('.quick-view-main').eq(index).attr('src','${initParam.staticPath}images/'+subImage[i]['sub_image']);
				    $('.quick-view-sub').eq(index).attr('src', '${initParam.staticPath}images/'+subImage[i]['sub_image']);
				    $('.quick-view-expand').eq(index).attr('href','${initParam.staticPath}images/'+subImage[i]['sub_image']);
		    	}
			}
			
		    $('.js-modal1').addClass('show-modal1');
			  
	 	    $('.js-addcart-detail').each(function(){
		    	//var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
		    	var nameProduct = $('.quick-view-title').html();
		    	var numProduct = $('.num-product').val();
		    	$(this).on('click', function(){
		    		$.ajax({
		    			url : "add_cart.action",
		    			type : "post",
		    			data : {
		    				item_id : bno,
		    				quantity : numProduct
		    			},
		    			success:function(result){
		    				
		    				if(result == 1){
			    	    		swal(nameProduct, "is added to cart !", "success");
		    				}else{
		    					alert("로그인이 필요합니다");
		    				}
		    			},
		    			error:function(){
		    				alert("카트 담기 실패");
		    			}
		    		})
		    	});
		    }); 
		},
		error:function(request, status, error){
			alert(request.status+"\n"+request.responseText+"\n"+error);
		}
		});//ajax
	});
};
</script> -->
</body>
</html>
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
				<div class="flex-w flex-c-m m-tb-10">
					<a href="${initParam.commonUrl}product" class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4">
						<i class="zmdi zmdi-replay cl2 m-r-6 fs-15 trans-04"></i>
						 필터초기화
					</a>
					
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
							<img class="product-list-img" src="${ initParam.uploadPath }${ productList.image }" alt="IMG-PRODUCT">
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
<div id="reload-js">
<%@ include file="../../goodstore/common/static_link.jsp" %>
<%@ include file="../common/common_js.jsp" %>
</div>
<!--------common js ----------->
<script>
$(function(){
	quickBtn();
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
<!----------- load more 구현 js ------------>
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
//			$("#product_content").replaceWith(result);
			var html = jQuery('<div>').html(result);
			var contents = html.find('div#product_content').html();
			$("#product-wrap").html(contents) 
			quickBtn();
			isotope();
			addWish();
			if($('.how-active1') != null){
				$('.how-active1').trigger('click');
			}
		},
		error : function(){
			alert('에러입니다');
		}
	})
}); 

function isotope(){
 var $topeContainer = $('.isotope-grid');
 var $filter = $('.filter-tope-group');

 // filter items on button click
 $filter.each(function () {
     $filter.on('click', 'button', function () {
         var filterValue = $(this).attr('data-filter');
         $topeContainer.isotope({filter: filterValue});
     });
     
 });

 // init Isotope
 $(window).on('load', function () {
     var $grid = $topeContainer.each(function () {
         $(this).isotope({
             itemSelector: '.isotope-item',
             layoutMode: 'fitRows',
             percentPosition: true,
             animationEngine : 'best-available',
             masonry: {
                 columnWidth: '.isotope-item'
             }
         });
     });
 });

 var isotopeButton = $('.filter-tope-group button');

 $(isotopeButton).each(function(){
     $(this).on('click', function(){
         for(var i=0; i<isotopeButton.length; i++) {
             $(isotopeButton[i]).removeClass('how-active1');
         }

         $(this).addClass('how-active1');
     });
 });

}//isotope 카테고리 클릭 plugin

</script>
<!--------- quickView, addToCart 구현 js ---------->
<script>
var numProduct = 1;
function quickBtn(){
	$('.js-show-modal1').on('click',function(e){
	    e.preventDefault();
	    var item_id = this.value;
		$.ajax({
			url : "quick_view.action",
			type : 'get',
			data : {
				item_id : item_id
			},
			success:function(result){
				console.log('성공');
				var html = jQuery('<div>').html(result);
				var contents = html.find('div#quick_view').html();
				$("#quick-view-wrap").html(contents) 
			    $('.js-modal1').addClass('show-modal1');
				modal1();
				slick3();
				quantityBtn();
				chkNumPro();
				
				$('.js-addcart-detail').each(function(){
			    	var nameProduct = $.trim(html.find('h4.quick-view-name').text())
			    	$(this).on('click', function(){
			    		$.ajax({
			    			url : "add_cart.action",
			    			type : "post",
			    			data : {
			    				item_id : item_id,
			    				quantity : numProduct
			    			},
			    			success:function(result){
			    				
			    				if(result == 1){
 				    	    		swal(nameProduct, "이/가 장바구니에 담겼습니다.", "success"); 
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
			});//ajax quick-view
		});
};
	
function quantityBtn(){
    $('.btn-num-product-down').on('click', function(){
        var numProduct = Number($(this).next().val());
        if(numProduct > 0) $(this).next().val(numProduct - 1);
    });

    $('.btn-num-product-up').on('click', function(){
        var numProduct = Number($(this).prev().val());
        $(this).prev().val(numProduct + 1);
    });
}//quantityBtn 장바구니 수량
 function chkNumPro(){
    $('.btn-num-product-up').on('click', function(){
        numProduct += 1;
    });
    $('.btn-num-product-down').on('click', function(){
    	numProduct -= 1;
    });
}//chkNumPro 장바구니 수량 value
function modal1(){
    $('.js-show-modal1').on('click',function(e){
        e.preventDefault();
        $('.js-modal1').addClass('show-modal1');
    });

    $('.js-hide-modal1').on('click',function(){
        $('.js-modal1').removeClass('show-modal1');
    });
}//modal1 quick-view modal창 show,hide
function slick3(){
    $('.wrap-slick3').each(function(){
        $(this).find('.slick3').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            fade: true,
            infinite: true,
            autoplay: false,
            autoplaySpeed: 6000,

            arrows: true,
            appendArrows: $(this).find('.wrap-slick3-arrows'),
            prevArrow:'<button class="arrow-slick3 prev-slick3"><i class="fa fa-angle-left" aria-hidden="true"></i></button>',
            nextArrow:'<button class="arrow-slick3 next-slick3"><i class="fa fa-angle-right" aria-hidden="true"></i></button>',

            dots: true,
            appendDots: $(this).find('.wrap-slick3-dots'),
            dotsClass:'slick3-dots',
            customPaging: function(slick, index) {
                var portrait = $(slick.$slides[index]).data('thumb');
                return '<img class="quick-view-sub" src=" ' + portrait + ' "/><div class="slick3-dot-overlay"></div>';
            },  
        });
    });
}//slick3 quick-view subImage 왼쪽정렬, 슬라이드
</script>
</body>
</html>
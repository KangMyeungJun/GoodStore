<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="product_content">
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
				
					<a href="product_detail/${productList.category_id}/${ productList.item_id }" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
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

<!-- <script>
$('.js-show-modal1').on('click',function(e){
	console.log('클릭');
    e.preventDefault();
    var bno = this.value;

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
</script> -->
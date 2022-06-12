<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
	<title>Product Detail</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../../goodstore/common/static_link.jsp" %>
</head>
<body class="animsition">
<%@ include file="../../goodstore/common/header.jsp" %>
<%@ include file="../../goodstore/common/sidebar.jsp" %>

	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="${initParam.commonUrl}index.html" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="${initParam.commonUrl}product.html" class="stext-109 cl8 hov-cl1 trans-04">
				Shop
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				${productDetail.category_name}
			</span>
		</div>
	</div>
		

	<!-- Product Detail -->
	<section class="sec-product-detail bg0 p-t-65 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-7 p-b-30">
					<div class="p-l-25 p-r-30 p-lr-0-lg">
						<div class="wrap-slick3 flex-sb flex-w">
							<div class="wrap-slick3-dots"></div>
							<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

							<div class="slick3 gallery-lb">
								<div class="item-slick3" data-thumb="${initParam.staticPath}images/${ productDetail.image }">
									<div class="wrap-pic-w pos-relative">
										<img src="${initParam.staticPath}images/${ productDetail.image }" alt="IMG-PRODUCT">

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${initParam.staticPath}images/${ productDetail.image }">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>
								
								<c:forEach items="${subImageList}" var="subImage">
								<div class="item-slick3" data-thumb="${initParam.staticPath}images/<c:out value="${ subImage.sub_image }"/>">
									<div class="wrap-pic-w pos-relative">
										<img src="${initParam.staticPath}images/<c:out value="${ subImage.sub_image }"/>" alt="IMG-PRODUCT">

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${initParam.staticPath}images/<c:out value="${ subImage.sub_image }"/>">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
					
				<div class="col-md-6 col-lg-5 p-b-30">
					<div class="p-r-50 p-t-5 p-lr-0-lg">
						<h4 class="mtext-105 cl2 js-name-detail p-b-14">
 							<c:out value="${ productDetail.item_name }"/>
						</h4>

						<span class="mtext-106 cl2">
 							<c:out value="${ productDetail.price }"/>원							
						</span>

						<p class="stext-102 cl3 p-t-23">
 							<c:out value="${ productDetail.summary }"/>
						</p>
						
						<!--  -->
						<div class="p-t-33">
							<div class="flex-w flex-r-m p-b-10">
								<div class="size-204 flex-w flex-m respon6-next">
									<div class="wrap-num-product flex-w m-r-20 m-tb-10">
										<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-minus"></i>
										</div>

										<input class="mtext-104 cl3 txt-center num-product" type="number" name="num-product" value="1">

										<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-plus"></i>
										</div>
									</div>

									<button class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
										Add to cart
									</button>
								</div>
							</div>	
						</div>

						<!--  -->
						<div class="flex-w flex-m p-l-100 p-t-40 respon7">
							<div class="flex-m bor9 p-r-10 m-r-11">
								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Add to Wishlist">
									<i class="zmdi zmdi-favorite"></i>
								</a>
							</div>

							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Facebook">
								<i class="fa fa-facebook"></i>
							</a>

							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Twitter">
								<i class="fa fa-twitter"></i>
							</a>

							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Google Plus">
								<i class="fa fa-google-plus"></i>
							</a>
						</div>
					</div>
				</div>
			</div>

			<div class="bor10 m-t-50 p-t-43 p-b-40">
				<!-- Tab01 -->
				<div class="tab01">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item p-b-10">
							<a class="nav-link active" data-toggle="tab" href="#description" role="tab">Description</a>
						</li>

						<li class="nav-item p-b-10">
							<a class="nav-link" data-toggle="tab" href="#information" role="tab">Additional information</a>
						</li>

						<li class="nav-item p-b-10">
							<a class="nav-link" data-toggle="tab" href="#reviews" role="tab">Review</a>
						</li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content p-t-43">
						<!-- - -->
						<div class="tab-pane fade show active" id="description" role="tabpanel">
							<div class="how-pos2 p-lr-15-md">
								<p class="stext-102 cl6">
		 							<c:out value="${ productDetail.description }"/>
								</p>
							</div>
						</div>
						
						<div class="tab-pane fade" id="information" role="tabpanel">
							<div class="how-pos2 p-lr-15-md">
								<p class="stext-102 cl6">
		 							<c:out value="${ productDetail.additional_info }"/>
								</p>
							</div>
						</div>

						<div class="tab-pane fade" id="reviews" role="tabpanel">
							<div class="row">
								<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
									<div class="p-b-30 m-lr-15-sm">
										<!-- Review -->
										<div id="comment_content">
										<c:forEach var="comment" items="${productComment}">
										<div class="flex-w flex-t p-b-68">

											<div class="size-207">
												<div class="flex-w flex-sb-m p-b-17">
													<span class="mtext-107 cl2 p-r-20">
														<c:out value="${comment.email}"/>
													</span>

													<span class="fs-18 cl11">
													<c:forEach begin="1" end="${comment.star}" step="1">
														<i class="zmdi zmdi-star"></i>
													</c:forEach>
													<c:forEach begin="1" end="${5-comment.star}" step="1">
														<i class="zmdi zmdi-star-outline"></i>
													</c:forEach>
													</span>
												</div>

												<p class="stext-102 cl6">
													<c:out value="${comment.review}"/>
												</p>
											</div>
										</div>
										</c:forEach>
										</div>
										
										
										<!-- Add review -->
										<div class="w-full">
											<h5 class="mtext-108 cl2 p-b-7">
												Add a review
											</h5>

											<div class="flex-w flex-m p-t-50 p-b-23">
												<span class="stext-102 cl3 m-r-16">
													Your Rating
												</span>

												<span class="wrap-rating fs-18 cl11 pointer">
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<input class="dis-none star-rating" type="number" name="star">
												</span>
											</div>

											<div class="row p-b-25">
												<div class="col-12 p-b-5">
													<label class="stext-102 cl3" for="review">Your review</label>
													<textarea class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10 item-review" id="review" name="review"></textarea>
												</div>

											</div>
											<input type="hidden" name="item_id" value="${productDetail.item_id}"/>
											<button class="flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10 comment-btn">
												Submit
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="bg6 flex-c-m flex-w size-302 m-t-73 p-tb-15">
			<span class="stext-107 cl6 p-lr-25">
				Company: <c:out value="${productDetail.com_name}"/>
				 | <c:out value="${productDetail.com_type}"/>
			</span>

			<span class="stext-107 cl6 p-lr-25">
				Categories: <c:out value="${productDetail.category_name}"/>
			</span>
		</div>
	</section>


	<!-- Related Products -->
	<section class="sec-relate-product bg0 p-t-45 p-b-105">
		<div class="container">
			<div class="p-b-45">
				<h3 class="ltext-106 cl5 txt-center">
					Related Products
				</h3>
			</div>

			<!-- Slide2 -->
			<div class="wrap-slick2">
				<div class="slick2">
				<c:forEach items="${relatedProducts}" var="relPro">
					<div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
						<!-- Block2 -->
						<div class="block2">
							<div class="block2-pic hov-img0">
								<img src="${initParam.staticPath}images/${relPro.image}" alt="IMG-PRODUCT">

								<a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
									Quick View
								</a>
							</div>

							<div class="block2-txt flex-w flex-t p-t-14">
								<div class="block2-txt-child1 flex-col-l ">
									<a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
										${relPro.item_name}
									</a>

									<span class="stext-105 cl3">
										${relPro.price}원
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
		</div>
	</section>


<%@ include file="../common/footer.jsp" %>
<%@ include file="../common/common_js.jsp" %>
<script>
$('.comment-btn').on('click', function(e){
	var review = $('.item-review').val();
	var star = $('.star-rating').val();
	var item_id = ${productDetail.item_id};
	var postUrl = "${initParam.commonUrl}add_comment.action";
	console.log(typeof(review), typeof(star), typeof(item_id));
	e.preventDefault();
 	$.ajax({
		url : postUrl,
		type : 'POST',
		data : {
			review : review,
			star : star,
			item_id : item_id
		}, 
		success : function(result){
			$('#comment_content').replaceWith(result);
			clearComment();
		},
		error : function(){
			alert('댓글추가 실패');
		}
	});//end ajax
});//end comment-btn

function clearComment(){
	$('.item-review').val('');
	$('.star-rating').val(0);
 	$('.zmdi-star').attr('class','item-rating pointer zmdi zmdi-star-outline'); 
}
</script>
</body>
</html>
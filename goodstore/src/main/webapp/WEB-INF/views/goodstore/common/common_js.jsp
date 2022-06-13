<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--===============================================================================================-->	
	<script src="${initParam.staticPath}vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${initParam.staticPath}vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="${initParam.staticPath}vendor/bootstrap/js/popper.js"></script>
	<script src="${initParam.staticPath}vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${initParam.staticPath}vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="${initParam.staticPath}vendor/daterangepicker/moment.min.js"></script>
	<script src="${initParam.staticPath}vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="${initParam.staticPath}vendor/slick/slick.min.js"></script>
	<script src="${initParam.staticPath}js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script src="${initParam.staticPath}vendor/parallax100/parallax100.js"></script>
	<script>
        $('.parallax100').parallax100();
	</script>
<!--===============================================================================================-->
	<script src="${initParam.staticPath}vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
		        delegate: 'a', // the selector for gallery item
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
<!--===============================================================================================-->
	<script src="${initParam.staticPath}vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="${initParam.staticPath}vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2').on('click', function(e){
			e.preventDefault();
		});

/* 		$('.js-addwish-b2').each(function(){
			var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-b2');
				$(this).off('click');
			});
		});

		$('.js-addwish-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		}); */

		/*---------------------------------------------*/

/* 		$('.js-addcart-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		}); */
	</script>
<!--===============================================================================================-->
	<script src="${initParam.staticPath}vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<!--===============================================================================================-->
	<script src="${initParam.staticPath}js/main.js"></script>
	<script>
    function menuColor(menuName){

		$('.main-menu').children("li").each(function(index, obj){
			$(this).removeClass('active-menu');
			if($(this).children().text()==menuName){
					$(this).addClass('active-menu');
			}
		})
	};
	</script>
	<!-- wishlist 구현메서드 -->
	<script>
	function addWish(){
		$('.add-wishlist').on('click',function(e){
		    e.preventDefault();
		    var item_id = this.value;
		    var addBtn = $(this);
		    //부모의 윗형제의 자식의 a태그 클래스명은 js-name-b2
		    var nameProduct = $.trim($(this).parent().prev().children('a').text());
	 		$.ajax({
				url : "add_wish.action",
				type : 'post',
				data : {
					item_id : item_id
				},
				success:function(result){
					
					if(result == 1){
		    	    		swal(nameProduct, "이/가 위시리스트에 추가되었습니다.", "success"); 
		    	    		addBtn.addClass('js-addedwish-b2');
		    				console.log($(this));
		    				$(this).off('click');
					}
		    		else if(result == 2){
	    	    		swal(nameProduct, "이/가 위시리스트에서 제거되었습니다.", "warning"); 
	    	    		addBtn.removeClass('js-addedwish-b2');
					}else{
	    	    		swal("에러", "로그인이 필요합니다", "error"); 
	    	    		location.reload();
					}
				},
				error:function(){
		    		swal("에러","위시리스트 추가 실패", "error"); 	    					
				}
			})//end ajax 
		});//end on click
	}//end addWish
	</script>

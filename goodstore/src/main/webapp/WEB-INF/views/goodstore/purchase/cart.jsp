<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>GOOD STORE</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../common/static_link.jsp" %>
<style type="text/css">
.plus-btn{
  width: 45px;
  height: 100%;
  cursor: pointer;
  }
  
input[type=checkbox]{
zoom: 1.3;
}
input[type=text]{
padding-left: 10px;
}
#purchase-btn{
justify-content: center;
align-items: center;
font-family: Poppins-Medium;
font-size: 15px;
line-height: 1.466667;
text-transform: uppercase;
color: #fff;
height: 50px;
background-color: #222;
border-radius: 25px;
transition: all 0.4s;
cursor: pointer;
padding-right: 15px;   

}	


#purchase-btn:hover {
    border-color: #717fe0;
    background-color: #717fe0;
    color: #fff;
}
	
</style>

</head>
<body class="animsition">

<%@ include file="../common/header.jsp" %>

<%@ include file="../common/sidebar.jsp" %>

	<!-- Cart -->
	<div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>

		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2">
					Your Cart
				</span>

				<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>
			
			<div class="header-cart-content flex-w js-pscroll">
				<ul class="header-cart-wrapitem w-full">
					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="${initParam.staticPath}images/item-cart-01.jpg" alt="IMG">
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								White Shirt Pleat
							</a>

							<span class="header-cart-item-info">
								1 x $19.00
							</span>
						</div>
					</li>

					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="${initParam.staticPath}images/item-cart-02.jpg" alt="IMG">
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								Converse All Star
							</a>

							<span class="header-cart-item-info">
								1 x $39.00
							</span>
						</div>
					</li>

					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="${initParam.staticPath}images/item-cart-03.jpg" alt="IMG">
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								Nixon Porter Leather
							</a>

							<span class="header-cart-item-info">
								1 x $17.00
							</span>
						</div>
					</li>
				</ul>
				
				<div class="w-full">
					<div class="header-cart-total w-full p-tb-40">
						Total: $75.00
					</div>

					<div class="header-cart-buttons flex-w w-full" style="justify-content: center;">
						<a href="cart" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
							구매하기
						</a>

						<!-- <a href="shoping-cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
							Check Out
						</a> -->
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04">
				홈
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				장바구니
			</span>
		</div>
	</div>
		
		
		
		
<!-- ----------------------------------------------------------------------------------- -->
	<!-- Shoping Cart -->
	<form action="purchase/success" method="post" id="complete-frm">
	<div class="bg0 p-t-75 p-b-85">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
				<div style="display: flex;">
					<span style="margin-right: auto; margin-top: 20px; margin-left: 30px;">
					<input type="checkbox" checked="checked" class="chkbox-all" style="display: inline-block; margin-left: 20px;"/> <span style="padding-left: 10px;"><strong>전체선택</strong></span>
					</span>
					<div class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10" 
						style="width: 70px; min-width: 90px; margin-left: auto; font-weight: bold;" id="delete-cart">
						삭제
					</div>
				</div>
					<div class="m-l-25 m-r--38 m-lr-0-xl">
						<div class="wrap-table-shopping-cart">
					
					
							<table class="table-shopping-cart">
								<tr class="table_head">
									<th class="column-1-c"></th>
									<th class="column-1">상품</th>
									<th class="column-2"></th>
									<th class="column-3">가격</th>
									<th class="column-4">수량</th>
									<th class="column-5">상품 금액</th>
								</tr>
								
		<!-- //////////////////for 문 돌릴 곳///////////////////////곳-->
						<c:forEach var="cartItem" items="${cartItemList}">
						<c:set var="i" value="${cartItem.price * cartItem.quantity}"/>
						<c:set var="t" value="${t+i}"/>
								<tr class="table_row">
									
									<td class="column-1-c">
									<input type="checkbox" class="product" name="product" 
										value="${cartItem.cart_id}" checked="checked" id="${cartItem.cart_id}-cb" 
										onclick="checkBoxHandle(<c:out value="${cartItem.cart_id}"/>,<c:out value="${cartItem.price}"/>)"/>
									</td>
									
									<td class="column-1">
										<div class="how-itemcart1">
											<%-- <img src="${initParam.staticPath}images/item-cart-04.jpg" alt="IMG"> --%>
											<!-- 상품상세로 가는 링크 넣어주기!!!! <a href -->
											<img src="${initParam.staticPath}images/item-cart-04.jpg" alt="IMG">
										</div>
									</td>
									<td class="column-2">${cartItem.item_name}
										<input type="hidden" name="item_id1" value="${cartItem.item_id}" id="${cartItem.cart_id}-item"/>
										<input type="hidden" name="quantity1" value="${cartItem.quantity}" id="${cartItem.cart_id}-q"/>
									</td>
									<td class="column-3"><fmt:formatNumber value="${cartItem.price}" pattern="##,###,###"/>원</td>
									<td class="column-4">
										<div class="wrap-num-product flex-w m-l-auto m-r-0">
											
											<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m" 
											onclick="plusBtnHandle(0,<c:out value="${cartItem.cart_id}"/>,<c:out value="${cartItem.price}"/>)">
												<i class="fs-16 zmdi zmdi-minus"></i>
											</div>
											<!-- 수량 -->				
											<input class="mtext-104 cl3 txt-center num-product" type="number"
												name="num-product1" value="${cartItem.quantity}" id="${cartItem.cart_id}"/>

											<!-- <div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m" >
												<i class="fs-16 zmdi zmdi-plus"></i>
											</div> -->
											
											<%-- <div class="plus-btn cl8 hov-btn3 trans-04 flex-c-m" onclick="plusBtnHandle(1,<c:out value="${cartItem.cart_id}"/>)"> --%>
											<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m" 
											onclick="plusBtnHandle(1,<c:out value="${cartItem.cart_id}"/>,<c:out value="${cartItem.price}"/>)">
											<input type="text" value="${cartItem.price}" id="<c:out value="${cartItem.cart_id}"/>-hd" style="display: none;"/> 
												<i class="fs-16 zmdi zmdi-plus"></i>
											</div> 
											
											
										</div>
									</td>
									<td class="column-5 totalprice" id="${cartItem.cart_id}-p"><fmt:formatNumber value="${cartItem.price * cartItem.quantity}" pattern="##,###,###"/>원</td>
								</tr>
									</c:forEach>
							</table>
						</div>



						<!-- 쿠폰 -->
						<div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
							<div class="flex-w flex-m m-r-20 m-tb-5">
								<input class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5" 
									type="text" name="coupon" placeholder="Coupon Code" id="coupon_input">
									
								<div class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5" 
										onclick="couponHandle()">
									쿠폰 적용
								</div>
							</div>
						</div>
					</div>
				</div>



				<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
					<div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm" style="width: 420px;">
						<h4 class="mtext-109 cl2 p-b-30">
							Total
						</h4>

						<div class="flex-w flex-t bor12 p-b-13">
							<div class="size-208">
								<span class="stext-110 cl2">
									상품 금액: 
								</span>
							</div>

							<div class="size-209">
								<span class="mtext-110 cl2" id="total-price">
									<fmt:formatNumber value="${t}" pattern="##,###,###"/>원
								</span>
							</div>
						</div>

						<div class="flex-w flex-t bor12 p-t-15 p-b-30">
							<div class="size-208 w-full-ssm">
								<span class="stext-110 cl2">
									Shipping:
								</span>
							</div>

							<div class="size-209 p-r-18 p-r-0-sm w-full-ssm">
								<p class="stext-111 cl6 p-t-2">
									배송은 결제일 2~3일 후 완료됩니다.
									</p>
										
								</div>
							</div>
							
							<!-- <div class="stext-110 cl2">
								<input type="checkbox" name="address" class="address-chkbox" 
									id="address-chkbox" style="display: inline-block;"/>
									<strong>기본배송지</strong> -->
									
							<div class="size-208" style=" height: 40px; padding-top: 20px;">
								<span class="stext-110 cl2">
								<div><input type="checkbox" name="address" class="address-chkbox" 
									id="address-chkbox" style="display: inline-block;"/>
									 &nbsp;&nbsp;&nbsp;기본배송지</div> 
								</span>
							</div>
									
									<div class="flex-w flex-t bor12 p-t-15 p-b-30">
									
										<div class="size-208 w-full-ssm" style="padding-top: 10px;">
											<span>수령인</span> 
										</div>
										<div>
										<input type="text" class="inputBorder" style="width: 200px"  id="name"/>
										</div>
										
										<div class="size-208 w-full-ssm" style="padding-top: 10px;">
											<span>휴대전화</span> 
										</div>
										<div>
										<input type="text" maxlength="4" title="휴대전화 뒷자리 입력" class="inputBorder" style="width: 100px;" id="tel1"/> - <input type="text" maxlength="4" title="휴대전화 국번 입력" class="inputBorder" style="width: 100px;"  id="tel2"/> - 
										<input type="text" maxlength="4" title="휴대전화 뒷자리 입력" class="inputBorder" style="width: 100px;"  id="tel3"/>
										</div>
									
										<div class="size-208 w-full-ssm" style="padding-top: 10px; width: 100%">
											<div style="display: flex; align-items: center;">
												<span>배송지</span> 
												<input type="button" value="주소찾기" class="inputBorder" 
												onclick="sample6_execDaumPostcode()"
												style="cursor: pointer; margin-bottom: 10px; margin-left: 20px; padding: 5px; height: 35px; width: 100px">
											</div>
										</div>
										<div>
											<div><input type="text" name="zipcode" class="inputBorder" style="margin-right: 10px; width: 130px;"  id="zipcode"/></div>
											<div style="width:330px;"><input type="text" name="addr" class="inputBorder"  id="addr"  style="width: 100%"/></div>
											<div><input type="text" placeholder="상세주소를 입력하세요" name="addr2" class="inputBorder"  id="addr2"style="width: 100%;"/></div>
										</div>
										
										
										<div class="w-full-ssm" style="padding-top: 10px; margin-top: 30px;">
											<div style="display: flex; align-items: center;">
											<span style="width: 100px;padding-top: 10px;">배송 메모</span> 
										
											<select title="배송메모" class="inputBorder">
											<option value="배송메모선택" >---배송메모선택---</option>
											<option value="부재시 경비실에 맡겨주세요" >부재시 경비실에 맡겨주세요</option>
											<option value="현관문 앞에 놓아주세요.">현관문 앞에 놓아주세요.</option>
											</select>
											</div>
										</div>
										
										
									</div>
									
									
							
							<div class="flex-w flex-t p-t-27 p-b-33">
								<div class="size-208">
									<span class="mtext-101 cl2">
										Total:  
									</span>
								</div>
	
								<div class="size-209 p-t-1">
									<span class="mtext-110 cl2" style="margin-left: 100px; text-align: left;" id="total-price2">
										<fmt:formatNumber value="${t}" pattern="##,###,###"/>원
									</span>
								</div>
							</div>

						<div style="display: flex; width:100%; justify-content: center;" onclick="purchaseDone()" >
						<input type="button" id="purchase-btn" style="width: 300px;"  value="구매하기" />
						</div>
							</div>
						<input type="hidden" name="address_flag" id="address_flag"/>
						<input type="hidden" name="coupon_id" id="coupon_id"/>
						
				 
				 <div style="display: none" id="item_inputs">
				 	
				 </div>
				 <div style="display: none" id="quntity_inputs">
				 	
				 </div>
				 <div style="display: none" id="total_price">
				 	
				 </div>

				</div>
			</div>
		</div>
	</div>
	</form>
	
		

<%@ include file="../common/footer.jsp" %>
<%@ include file="../common/common_js.jsp" %>

<script type="text/javascript">
var t="<c:out value='${t}'/>";

var couponFlag=false;
var couponPrice=0;
var coupon_id=0;
</script>

<script>


//전체선택 checkbox
 $(function(){
	 
	 
	 $("#coupon_input").keydown(function(evt){
		 
		 if(evt.which==13){
			 couponHandle();
		 }
		 
		 
	 })//coupon_input
	 
	 
	$(".chkbox-all").click(function(){
		couponFlag=false;
		//alert("Dddd")
		$(".product").prop('checked',this.checked);
		
		if(this.checked){
			t=0;
			
			total=0;
				$("input:checkbox[name=product]").each(function(index){
					
					var cartId1=$(this).val();
					var quantity1=document.getElementById(cartId1).value;
					var priceId1=cartId1+"-hd";
					var quantity1=document.getElementById(cartId1).value;
					var price1=document.getElementById(priceId1).value;
					//alert(price1);
					
					total+=parseInt(quantity1)*parseInt(price1);
				})
			
			t=total;
			
			var printT=t.toLocaleString('ko-KR')
			document.getElementById("total-price").innerText=printT+"원";
			document.getElementById("total-price2").innerText=printT+"원"; 
		}else{
			t=0;
			var printT=t.toLocaleString('ko-KR')
			document.getElementById("total-price").innerText=printT+"원";
			document.getElementById("total-price2").innerText=printT+"원"; 
		}
		
	});//click
	
	
	
	
	$(".address-chkbox").click(function(){ //기본 배송지 체크했을 때 db에서 회원 배송정보 가져옴 
		//alert("Dddd")
		
		var addr=document.getElementById("address-chkbox");
		
		if(addr.checked){//check가 선택됐을 때 
			$.ajax({
				url:"cart/address",
				async:false,
				type:"get",
				dataType:"json",
				error:function(xhr){
					alert(xhr.status+"/"+xhr.statusText);
				},
				success:function(json){
					
					document.getElementById("name").value=json.name;
					document.getElementById("tel1").value=json.tel1;
					document.getElementById("tel2").value=json.tel2;
					document.getElementById("tel3").value=json.tel3;
					document.getElementById("zipcode").value=json.zipcode;
					document.getElementById("addr").value=json.address;
					document.getElementById("addr2").value=json.address2;
				}
				
			});//ajax
			
		}else{
			document.getElementById("name").value="";
			document.getElementById("tel1").value="";
			document.getElementById("tel2").value="";
			document.getElementById("tel3").value="";
			document.getElementById("zipcode").value="";
			document.getElementById("addr").value="";
			document.getElementById("addr2").value="";
		}
	
	});//address-chkbox click

	
	
	$("#delete-cart").click(function(){ //삭제 버튼 클릭
		var chk=false;
	
		var checkArr=[]; //배열 초기화
		$("input:checkbox[name=product]:checked").each(function(index){
			chk=true;
			checkArr.push($(this).val()); //체크된것만 배열에 push
		})
		
		if(chk){
			if(confirm("정말 삭제하시겠습니까?")){
				
				$.ajax({
					url:"cart/remove",
					data:{valueArr:checkArr},
					async:false,
					type:"post",
					dataType:"json",
					error:function(xhr){
						alert(xhr.status+"/"+xhr.statusText);
					},
					success:function(json){
						if(json.success==1){
						location.href="http://localhost/goodstore/cart"
						}
					}
					
				});
				
			}
		}else{
			alert("삭제할 상품을 선택해주세요.")
		} 
		
	});
	
}); 

</script>


<script type="text/javascript">


//수량 조절
 function plusBtnHandle(updown,cart_id,p){
		couponFlag=false;
		document.getElementById("coupon_input").value="";
		
	 	var priceTotal=cart_id+"-p" //해당 상품의 가격과 개수가 곱해진 상품 금액의 아이디
		var price=document.getElementById(priceTotal); //해당 상품의 가격과 개수가 곱해진 상품 금액
		
		var quantity=document.getElementById(cart_id).value; //해당 cart_id의 개수
		//alert(quantity)
		//alert(price)
		
		//체크박스 체크 여부
		var id=cart_id+"-cb";
		var checkbox=document.getElementById(id);
		
		
		if(updown==0 && parseInt(quantity)<=1){//개수 0일때 새로고침
			quantity=1;
			location.href="http://localhost/goodstore/cart"
			alert("1개 이상 구매 가능합니다.")
			
		}else{
				 
			if(updown==1){//db에 넘겨주기 위해 원래 수량에 +1
				
				quantity=parseInt(quantity)+1
				
				if(checkbox.checked){
					t=parseInt(p)+parseInt(t); //최총 금액에 추가된 수량에 따른 해당상품의 값 넣어주기
				}
			}else if(updown==0){//db에 넘겨주기 위해 원래 수량에 -1
				
				
				quantity=parseInt(quantity)-1
				//alert(quantity)
					if(checkbox.checked){
				 		t=parseInt(t)-parseInt(p);
					} 
			} 
			
			
			
			var priceToShow=parseInt(p)*parseInt(quantity);//가격과 새로운 개수 곱하기
			var printP=priceToShow.toLocaleString('ko-KR'); //삼품의 총 상품 금액 
			var printT=t.toLocaleString('ko-KR'); //완전 총 금액

			//alert(priceToShow)
			
			$.ajax({
			url:"cart/quantity",
			data:{cart_id:cart_id,quantity:quantity},
			async:false,
			type:"post",
			dataType:"json",
			error:function(xhr){
				alert(xhr.status+"/"+xhr.statusText);
			},
			success:function(json){
				price.innerText=printP+"원";
				//alert(document.getElementById(cart_id).value);
				document.getElementById("total-price").innerText=printT+"원";
				document.getElementById("total-price2").innerText=printT+"원";
			}
			
			});
			
			
		}//end else
		
}  

</script>

<script type="text/javascript">

// 각 chexkbox 해제 함수 
function checkBoxHandle(cart_id, price){
	couponFlag=false;
	var id=cart_id+"-cb";
	
	var checkbox=document.getElementById(id);
	
	//alert(checkbox);
	
	//해당 체크박스가 해제되었는지?
	if(checkbox.checked){
		
		var quantity=document.getElementById(cart_id).value;
		//alert("요"+quantity);
		t=t+(parseInt(quantity)*parseInt(price));
		
	}else{
		var quantity=document.getElementById(cart_id).value;
		t=t-(parseInt(quantity)*parseInt(price));
	}
	
	var printT=t.toLocaleString('ko-KR')
	document.getElementById("total-price").innerText=printT+"원";
	document.getElementById("total-price2").innerText=printT+"원";
	document.getElementById("coupon_input").value="";
	
}//checkBoxHandle


function couponHandle(){
		var coupon=document.getElementById("coupon_input").value;
		//alert(coupon)
		
		var today=new Date();

		var priceBefore=t;
		
		
		if(coupon==""){
			alert("쿠폰 코드를 입력해주세요.")
		}else{
			
			
			$.ajax({
			url:"cart/coupon",
			data:{coupon_code:coupon},
			async:false,
			type:"get",
			dataType:"json",
			error:function(xhr){
				alert(xhr.status+"/"+xhr.statusText);
			},
			success:function(json){
				if(json.flag==0){
					alert("올바른 쿠폰코드가 아닙니다.");
				}else{
					couponFlag=true;
					var start_date=new Date(json.start_date);
					var end_date= new Date(json.end_date);
					
					if(today>=start_date && today<=end_date && t>=json.discount_price){
						
						document.getElementById("coupon_input").value=json.name;
						couponPrice=t-(t*(parseInt(json.discount_rate)/100));
						var printT=couponPrice.toLocaleString('ko-KR')
						document.getElementById("total-price").innerHTML="<del style='font-size:14px;'>"+priceBefore+"</del> "+printT+"원";
						document.getElementById("total-price2").innerText=printT+"원";
						coupon_id=json.coupon_id;
						alert("쿠폰이 적용되었습니다.");
					}else{
						alert("쿠폰 적용이 불가능합니다.")
					}
				}//end else
				
			}
			
			}); //ajax
		}//end else
		
}




//구매하기 버튼!////////////////////////////////////
function purchaseDone(){
	//alert("버튼클릭")
	
	var name=document.getElementById("name").value;
	var tel1=document.getElementById("tel1").value;
	var tel2=document.getElementById("tel2").value;
	var tel3=document.getElementById("tel3").value;
	var zipcode=document.getElementById("zipcode").value;
	var addr=document.getElementById("addr").value;
	var addr2=document.getElementById("addr2").value;
	
	if(name==""||tel1==""||tel2==""||tel3==""||zipcode==""||addr==""||addr2==""){
		alert("배송 정보를 입력해주세요.");
		
	}else{
	
	
	var chkBoxChk=false;
	// 체크된 상품이 있는지 유효성 검증
	
		var chk=false;
	
		var item_id=[]; //배열 초기화
		var quantity=[]; //배열 초기화
		var ItemName="";
		var amount="";
		var ItemName1="";
		var amount1="";
		var sentence="";
		var sentence2="";
		
		$("input:checkbox[name=product]:checked").each(function(index){
			chkBoxChk=true;
			
			//checkArr.push($(this).val()); //체크된것만 배열에 push
			
			ItemName=$(this).val()+"-item";
			amount=$(this).val()+"-q";
			
			//item_id.push(document.getElementById(ItemName).value);
			//quantity.push(document.getElementById(amount).value);
			
			ItemName1=document.getElementById(ItemName).value
			amount1=document.getElementById(amount).value
			
			sentence+="<input type='hidden' name='item_id' value='"+ItemName1+"'/>"
			sentence2+="<input type='hidden' name='quantity' value='"+amount1+"'/>"
		})
		//선택된 상품의 아이템아이디와 수량을 가져와야함!!!!!!!

			document.getElementById("item_inputs").innerHTML=sentence;
			document.getElementById("quntity_inputs").innerHTML=sentence2;
		
			 if(chkBoxChk){ //선택된 상품이있다면 
				
				var coupon_id1=document.getElementById("coupon_id");
				var address_flag=document.getElementById("address_flag");
				
				
				if(couponFlag){//쿠폰적용 된거
					
					document.getElementById("total_price").innerHTML="<input type='hidden' name='total_price' value='"+couponPrice+"'/>";
					coupon_id1.value=coupon_id; //쿠폰 아이디 넣기 input hidden에
					
					 if($("#address-chkbox").is(":checked")){ //기본배송지가 체크가 됐다면 
						address_flag.value='N'
						
						$("#complete-frm").submit();
					
							
					}else{//기본 배송지가 아니면 
						address_flag.value='Y'//배송 정보 insert 해줘야함.
						$("#complete-frm").submit();
					} 
					
				}else{//쿠폰적용 안된거
					
					document.getElementById("total_price").innerHTML="<input type='hidden' name='total_price' value='"+t+"'/>";
				
					if($("#address-chkbox").is(":checked")){ //기본배송지가 체크가 됐다면 
						address_flag.value='N'
						$("#complete-frm").submit();
						
					}else{
						address_flag.value='Y'//배송 정보 insert 해줘야함.
						$("#complete-frm").submit();
					}
					
					
				}//end else
			
		}else{
			alert("구매할 상품을 선택해주세요.")
		}//end else
		
		
		
	}
		
	
	
}//function
///////////////////////////////////////////////////////
</script>



<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        
    	if(!($("#address-chkbox").is(":checked"))){
    	new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    //document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();
            }
        }).open();
    		
    	}else{
    		alert("기본배송지를 해제한 후 이용해주세요.");
    	}
    	
    }
</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>About</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="static_link.jsp" %>
</head>
<body class="animsition">
<%@ include file="header.jsp" %>
<%@ include file="sidebar.jsp" %>


	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('${initParam.staticPath}images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			About
		</h2>
	</section>	


	<!-- Content page -->
	<section class="bg0 p-t-75 p-b-120">
		<div class="container">
			<div class="row p-b-148">
				<div class="col-md-7 col-lg-8">
					<div class="p-t-7 p-r-85 p-r-15-lg p-r-0-md">
						<h3 class="mtext-111 cl2 p-b-16">
							Our Story
						</h3>

            <p class="stext-113 cl6 p-b-26">
              “사회적기업”이란 취약계층에게 사회서비스 또는 일자리를 제공하거나 지역사회에 공헌함으로써 지역주민의 삶의 질을 높이는 등의 사회적 목적을 추구하면서 재화 및 서비스의 생산·판매 등 영업활동을 하는 기업으로서 사회적기업으로 인증을 받은 자를 말합니다(「사회적기업 육성법」 제2조제1호).
						</p>
            <p class="stext-113 cl6 p-b-26">
              사회적기업은<br/>
              취약계층을 노동 시장으로 통합하여 지속 가능한 일자리를 제공하는 것으로 취약계층의 자활을 돕습니다. <br/>
              지역사회 통합 및 사회적투자확충을 통한 지역 경제 발전에 도움이 됩니다.<br/>
              공공서비스 수요 확충을 통한 사회 서비스 확충에 이바지 합니다.<br/>
              기업의 사회 공헌과 윤리적 경영문화를 확산시켜 착한 소비문화를 조성합니다.<br/>
				<a class="stext-111 cl8" href="http://www.pns.or.kr/default/mp1/mp1_sub2.php?sub=02">-사람과 세상</a> 
			</p>


						<p class="stext-113 cl6 p-b-26">
              Good Store는<br/>
              사회적 기업에서 생산된 상품을 판매하고 다양한 분야의 사회적 기업들을 소개하는 것을 목적으로 제작된 웹페이지 입니다.<br/>
              실제 상품 판매는 이루어지지 않고 있습니다.<br/>
              홈페이지의 제품들을 포함한 더 다양한 상품들은<br/>
              <a href="https://www.sepp.or.kr/sepp/main">e-store 36.5</a> / 
              <a href="https://www.hknuri.co.kr/main.do">함께누리몰</a> 홈페이지에서 판매하고 있습니다<br/>
						</p>

					</div>
				</div>

				<div class="col-11 col-md-5 col-lg-4 m-lr-auto">
					<div class="how-bor1 ">
						<div class="hov-img0">
							<img src="${initParam.staticPath}images/about-01.jpg" alt="IMG">
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="order-md-2 col-md-7 col-lg-8 p-b-30">
					<div class="p-t-7 p-l-85 p-l-15-lg p-l-0-md">
						<h3 class="mtext-111 cl2 p-b-16">
			              Technologies Used
            			</h3>

						<p class="stext-113 cl6 p-b-26">
             			 Good Store 홈페이지 제작에는 다음과 같은 기술들이 사용되었습니다.
           				 </p>
           				 

					<div class="col">
						<div class="bor21 p-l-29 p-tb-9 m-t-22 m-b-10"  style="width:270px;">
			              <div class="flex-l-m p-r-40 stext-114 cl6 p-r-40 p-b-11" style="font-weight:bold; color:rgb(88, 81, 81)">
			                Front-End
						  </div>
			              <div class="flex-l-m">
			              <ul class="stext-114 cl6">
			                <li>HTML</li>
			                <li>CSS</li>
			                <li>JQuery</li>
			              </ul>
			            </div>
						</div>
			            <div class="bor20 p-l-29 p-tb-9 m-r-40" style="width:270px;">
			              <div class="flex-r-m stext-114 cl6 p-r-40 p-b-11" style="font-weight:bold; color:rgb(88, 81, 81)">
			                Back-End<br/>
			              </div>
			              <div class="flex-r-m p-r-50" style="text-align:right">
			                <ul class="stext-114 cl6">
			                  <li>JSP</li>
			                  <li>Java</li>
			                  <li>Spring</li>
			                  <li>Oracle</li>
			                  <li>MyBatis</li>
			                </ul>
			              </div>
			            </div>
			            
					</div>
					</div>
				</div>

				<div class="order-md-1 col-11 col-md-5 col-lg-4 m-lr-auto p-b-30">
					<div class="how-bor2">
						<div class="hov-img0">
							<img src="${initParam.staticPath}images/about-02.jpg" alt="IMG">
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>	
	
<%@ include file="footer.jsp" %>
<%@ include file="common_js.jsp" %>	
<script>
$(function(){
	//change selected menu color
	menuColor('About');
});
</script>
</body>
</html>
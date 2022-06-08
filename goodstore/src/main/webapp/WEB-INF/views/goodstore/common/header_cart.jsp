<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
		//alert(document.getElementById('cart-icon-chg').data)
		//alert($("div[data-notify]").val());
		//$("[data-notify]").val()

	$.ajax({
		url:"cart/header",
		async:false,
		type:"get",
		dataType:"json",
		error:function(xhr){
			alert(xhr.status+"/"+xhr.statusText);
		},
		success:function(json){
			var string="<div class='icon-header-item cl2 hov-cl1 trans-04 p-lr-11 icon-header-noti js-show-cart'";
			if(json.count!=0){
				string+="data-notify='"+json.count+"'><i class='zmdi zmdi-shopping-cart'></i></div>";
				document.getElementById('cart-icon-chg').innerHTML=string;
			}else{
				string+="data-notify='0'><i class='zmdi zmdi-shopping-cart'></i></div>";
				document.getElementById('cart-icon-chg').innerHTML=string;
			}
					
		}//success
		
	});
    //your stuff
    
    
    $("#cart-icon-chg").click(function(){
    	
    	location.href='cart';
    	
    })
	</script>
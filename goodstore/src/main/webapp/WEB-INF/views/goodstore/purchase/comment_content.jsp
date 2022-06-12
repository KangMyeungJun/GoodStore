<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

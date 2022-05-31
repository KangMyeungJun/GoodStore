<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String protocol = application.getInitParameter("protocol");
String serverName = application.getInitParameter("serverName");
String commonCss = application.getInitParameter("commonCss");
String commonImage = application.getInitParameter("commonImage");
String artifactId = application.getInitParameter("artifactId");

pageContext.setAttribute("protoco", protocol);
pageContext.setAttribute("serverName", serverName);
pageContext.setAttribute("commonCss", commonCss);
pageContext.setAttribute("commonImage", commonImage);
pageContext.setAttribute("artifactId", artifactId);
%>
 
<c:set var="commonUrl" value="${ protocol }${ serverName }${ artifactId }"/>
<c:set var="commonCss" value="${ protocol }${ serverName }${ artifactId }${ commonCss }"/>
<c:set var="commonImg" value="${ protocol }${ serverName }${ artifactId }${ commonImage }"/>
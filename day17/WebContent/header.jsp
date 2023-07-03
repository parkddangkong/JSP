<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="sales.*, product.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	request.setCharacterEncoding("UTF-8");	%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="salesDAO" value="${SalesDAO.getInstance() }" />
<c:set var="productDAO" value="${ProductDAO.getInstance() }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day17 - product & sales</title>
<style>
	a {
		text-decoration: none;
		color: inherit;
	}
	a:hover {
		text-decoration: underline;
	}
	nav > ul {
		list-style: none;
		display: flex;
		width: 900px;
		margin: auto;
	}
	nav > ul > li {
		flex: 1;
		text-align: center;
	}
	
</style>
</head>
<body>

<h1><a href="${cpath }">day17 - product & sales</a></h1>

<nav>
	<ul>
		<li><a href="${cpath }/productList.jsp">상품 목록</a></li>
		<li><a href="${cpath }/productAdd.jsp">상품 등록</a></li>
		<li><a href="${cpath }/salesList.jsp">매출 목록</a></li>
		<li><a href="${cpath }/salesAdd.jsp">매출 등록</a></li>
	</ul>
</nav>
<hr>
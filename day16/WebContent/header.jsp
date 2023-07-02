<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="diary.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	request.setCharacterEncoding("UTF-8");	%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="util" value="${FileUtil.getInstance(pageContext.request) }" />
<c:set var="dao" value="${DiaryDAO.getInstance() }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day16 - diary</title>
<style>
	textarea {
		resize: none;
		padding: 10px;
		width: 360px;
		height: 180px;
	}
	#root {
		width: 900px;
		margin: auto;
		display: flex;
		flex-flow: wrap;
	}
	.item {
		width: 250px;
		border: 2px solid grey;
		margin: 5px;
		padding: 5px;
	}
	.pic {
		text-align: center;
	}
	.pic > img {
		width: 230px;
	}
</style>
</head>
<body>

<h1>day16 - diary</h1>

<nav>
	<ul>
		<li><a href="${cpath }/list.jsp">목록</a></li>
		<li><a href="${cpath }/add.jsp">추가</a></li>
	</ul>
</nav>

<hr>
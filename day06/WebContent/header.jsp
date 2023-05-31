<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member1.*, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<%	request.setCharacterEncoding("UTF-8"); %>
<c:set var="dao" value="<%=new MemberDAO() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day06 (member1)</title>
</head>
<body>

<header>
	<h1><a href="${cpath }">day06</a></h1>
</header>

<nav>
	<ul>
		<li><a href="${cpath }/list.jsp">회원목록</a>
	</ul>
</nav>

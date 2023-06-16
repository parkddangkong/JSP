<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="sales.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var = "dao" value="<%=new SalesDAO() %>" />
<% SalesDAO dao = new SalesDAO();
   pageContext.setAttribute("dao", dao);
%>
<c:set var = "cpath" value="${pageContext.request.contextPath }" />

<%request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sales</title>
<style>
	header{
		border-bottom: 2px solid grey;
	}
	table{
		width : 700px;
		margin : 50px auto;
		border : 2px solid black;
		border-collapse : collapse;
	}
	td, th{
		padding : 5px 10px;
		border : 1px solid grey;
	}
	td:hover{
		cursor : pointer;
		background-color : lightpink;
	}
</style>
</head>
<body>

<header>
	<h1><a href="${cpath }">sales</a></h1>
</header>

<nav>
	<ul>
		<li><a href="${cpath }/list.jsp">목록</a>
		<li><a href="${cpath }/add.jsp">추가</a>
		<li><a href="${cpath }/delete.jsp">삭제</a>
	</ul>
</nav>

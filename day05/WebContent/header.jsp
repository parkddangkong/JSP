<%@page import="student.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="student.*, java.util.*"%>

<%
	request.setCharacterEncoding("UTF-8");

	StudentDAO dao = new StudentDAO();
	String cpath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>day05</title>
<style>
	a {
		text-decoration: none;
		color: inherit;
	}

	a:hover {
		text-decoration: underline;
	}
	
	h1{
		text-align: center;
	}
	nav > ul{
		display: flex;
		justify-content : center;
		
		list-style: none;
		width: 800px;
		margin : 0 auto;
		padding: 0;
	}
	nav > ul > li{
		flex: 1;
		text-align: center;
	}
</style>
</head>
<body>

	<header>
		<h1>
			<a href="<%=request.getContextPath()%>">day05</a>
		</h1>
	</header>
	
<nav>
	<ul>
		<li><a href="<%=request.getContextPath()%>/list.jsp">목록</a></li>
		<li><a href="<%=request.getContextPath()%>/add.jsp">추가</a></li>
	</ul>
</nav>

<hr>
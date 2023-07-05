<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*, board.*, reply.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% 	request.setCharacterEncoding("UTF-8"); %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="memberDAO" value="${MemberDAO.getInstance() }" />
<c:set var="boardDAO" value="${BoardDAO.getInstance() }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day19 - board</title>
<style>
	pre.cmd {
		background-color: black;
		color: lime;
		font-family: Consolas;
		font-size: 20px;
		padding: 5px;
		width: 900px;
		margin: 10px auto;
	}
	a {
		text-decoration: none;
		color: inherit;
	}
	a:hover {
		text-decoration: underline;
	}
	
	table#boardList {
		border: 2px solid black;
		border-collapse: collapse;
		width: 800px;
		margin: auto;
	}
	table#boardList > thead > tr {
		background-color: darkgrey;
	}
	table#boardList td, 
	table#boardList th {
		padding: 5px 10px;
		border: 1px solid grey;
	} 
	table#boardList th:nth-child(2) {
		width: 300px;
	}
	
	div.flex {
		width: 800px;
		margin: 10px auto;
		display: flex;
		justify-content: space-between;
	}
	.frame {
		width: 800px;
		margin: auto;
		box-sizing: border-box;
	}
	.frame > pre {
		background-color: #eee;
		font-size: 16px;
		padding: 10px;
	}
</style>
<link type="text/css" rel="stylesheet" href="${cpath }/css/style.css">
</head>
<body>
<header>
	<h1><a href="${cpath }">day19 - board</a></h1>
	<div id="loginInfo">
		<c:if test="${not empty login }">
			<p align="right">${login.userid } (${login.username })</p>
		</c:if>
	</div>
</header>
<nav>
	<ul>
		<c:if test="${empty login }">
			<li><a href="${cpath }/member/login.jsp">로그인</a></li>
		</c:if>
		<c:if test="${not empty login }">
			<li><a href="${cpath }/member/logout.jsp">로그아웃</a></li>
		</c:if>
		<li><a href="${cpath }/board/list.jsp">게시판</a></li>
	</ul>
</nav>



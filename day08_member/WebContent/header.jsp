<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="dao" value="${MemberDAO.getInstance() }" /> 
<!-- DAO에서 가져올 수 있는 생성자의 메서드를 써야지 -->
<c:set var="cpath" value="${pageContext.request.contextPath}"	/>

<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day08_member</title>
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
	<h1><a href="${cpath }">day08</a></h1>
	<div>DB : ${dao.test() }</div>
<nav>
	<ul>
		<li><a href="${cpath }/list.jsp">전체목록</a>
		<li><a href="${cpath }/add.jsp">(추가)가입</a>
		<li><a href="${cpath }/delete.jsp">탈퇴(삭제)</a>
		<li><a href="${cpath }/inform.jsp">정보조회</a>
		<li><a href="${cpath }/modify.jsp">수정</a>
	</ul>
</nav>
</header>

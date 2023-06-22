<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="phonebook.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="dao" value="${PhoneBookDAO.getInstance() }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#root {
		width: 500px;
/* 		height: 80vh; */
		height: 200px;
		border: 1px solid black;
		margin: 30px auto;
		padding: 10px;
		overflow-y: auto;
	}
	.item {
		display: flex;
		width: 100%;
		height: 30px;
		justify-content: space-between;
		font-size: 20px;
	}
	.item > div:nth-child(4) {
		cursor: pointer;
	}
</style>
</head>
<body>

<h1>day10 - phonebook</h1>
<hr>


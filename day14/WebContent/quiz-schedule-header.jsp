<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="schedule.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="dao" value="${ScheduleDAO.getInstance() }" />
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정표</title>
</head>
<body>

<header>
	<h1>일정표</h1>
	<ul>
		<li><a href="${cpath }/quiz-schedule-add.jsp">추가</a></li>
		<li><a href="${cpath }/quiz-schedule-list.jsp">목록</a></li>
	</ul>
</header>
<hr>

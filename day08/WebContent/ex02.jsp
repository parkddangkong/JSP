<%@page import="ex02.Test2DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02.jsp</title>
</head>
<body>

<h1>ConnectionPool 확인</h1>
<hr>

<c:set var="dao" value="<%=new ex02.Test2DAO() %>" />
<h3>${dao.getVersion() }</h3>

</body>
</html>
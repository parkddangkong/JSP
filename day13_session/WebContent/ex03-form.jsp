<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03-form.jsp</title>
</head>
<body>

<c:if test="${not empty login }">
	<c:redirect url="/ex03-main.jsp" />
</c:if>

<h1>간단 로그인 구현 (EL/JSTL, DAO/DTO)</h1>
<hr>

<form method="POST" action="ex03-action.jsp">
	<p><input type="text" name="userid" placeholder="ID"></p>
	<p><input type="password" name="userpw" placeholder="Password"></p>
	<p><input type="submit"></p>
</form>

</body>
</html>
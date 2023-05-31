<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05.jsp</title>
</head>
<body>

<h1>parameter에 따라 다르게 출력하기</h1>
<hr>

<c:if test="${empty param.age }">
	<form>
		<input type="number" name="age" placeholder="나이">
		<input type="submit">
	</form>
</c:if>

<c:if test="${not empty param.age }">
	<c:if test="${param.age >= 20 }">
		<h3>${param.age } : 성인</h3>
	</c:if>
	<c:if test="${param.age < 20 }">
		<h3>${param.age } : 미성년자</h3>
	</c:if>
	<a href="ex05.jsp"><button>다시 입력</button></a>
</c:if>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>c:if</h1>
<hr>

<h3>조건에 따라 종속문장을 실행(HTML 출력)한다. else는 없다</h3>

<c:set var="n1" value="12" />
<c:set var="n2" value="23" />

<c:set var="answer" value="${n1 + n2 }" />

<c:if test="${answer % 2 == 0 }">
	<h3>${answer } : 짝수</h3>
</c:if>

<c:if test="${answer % 2 != 0 }">
	<h3>${answer } : 홀수</h3>
</c:if>

</body>
</html>
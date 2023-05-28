<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>결과 확인</h1>
<hr>

<h3><%= session.getAttribute("msg") %></h3>
<a href="ex07-form.jsp"><button>다시 계산해보기</button></a>
</body>
</html>
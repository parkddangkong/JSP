<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02-logout.jsp</title>
</head>
<body>

<%
	session.invalidate();					// 세션을 무효화하고
	response.sendRedirect("ex02-form.jsp");	// 로그인 페이지로 이동시킨다
%>

</body>
</html>
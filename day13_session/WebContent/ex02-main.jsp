<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02-main.jsp</title>
</head>
<body>

<%
	if(session.getAttribute("login") == null) {
		response.sendRedirect("ex02-form.jsp");
	}
%>

<h1>로그인 이후 메인화면</h1>
<hr>

<h3>ID : ${login.userid }</h3>
<h3>Password : ********</h3>
<h3>Name : ${login.username }</h3>

<a href="ex02-logout.jsp"><button>로그아웃</button></a>

</body>
</html>
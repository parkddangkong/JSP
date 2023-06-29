<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04.jsp</title>
</head>
<body>

<h1>ex04.jsp - 세션 쿠키</h1>
<hr>

<h3>여기서 말하는 세션쿠키는 세션의 id를 저장해둔 쿠키를 말한다</h3>
<h3>session.getId() : <%=session.getId() %></h3>
<h3>cookie.JSESSIONID.value : ${cookie.JSESSIONID.value }</h3>
<a href="ex04-invalidate.jsp"><button>세션 무효화</button></a>

</body>
</html>
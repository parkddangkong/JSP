<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02-form.jsp</title>
</head>
<body>

<h1>EL Tag로 파라미터 출력하기</h1>
<hr>
<form methob="POST" action="ex02-result.jsp">
	<p><input type="text" name="name" placeholder="이름"></p>
	<p><input type="text" name="age" placeholder="나이"></p>
	<p><input type="submit"></p> 
</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05.jsp</title>
</head>
<body>

<h1>POST 형태로 전송</h1>
<hr>
<h3>request method는 내장 객체 request에서 확인 가능</h3>
<%
	// 요청에 담긴 파라미터가 한글 및 특수문자를 포함한다면 인코딩 규칙을 재설정해야 한다
	// 파라미터를 꺼내오기 전에 지정해야 한다
	request.setCharacterEncoding("UTF-8");

	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	
	String method = request.getMethod();
	// 스크립틀릿을 나누어서 적어도 하나의 자바코드로 식별한다 !!
%>
<h3>request.getMethod() : <%=method %></h3>

<%	if(method.equals("GET")) { %>
		<form method="POST">
			<p><input type="text" name="userid" placeholder="ID"></p>	
			<p><input type="password" name="userpw" placeholder="Password"></p>	
			<p><input type="submit" value="로그인"></p>	
		</form>
<% 	} %>

<%	if(method.equals("POST")) { %>
		<h3>userid : <%=userid %></h3>
		<h3>userpw : <%=userpw %></h3>
		<a href="ex05.jsp"><button>ex05.jsp</button></a>
<%	} %>




</body>
</html>







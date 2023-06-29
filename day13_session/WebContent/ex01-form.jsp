<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01-form.jsp</title>
</head>
<body>

<h1>session</h1>
<hr>

<form method="POST">
	<p><input type="text" name="memo" placeholder="세션에 저장할 내용"></p>
	<p>
		<input type="submit">
		<a href="ex01-remove.jsp"><input type="button" value="memo 지우기"></a>
		<a href="ex01-invalidate.jsp"><input type="button" value="session 폐기"></a>
	</p>
</form>

<fieldset>
	<legend>세션 내용 확인</legend>
	<h3>sessionId : <%=session.getId() %></h3>
	<h3>세션 생성 시간 : <%=session.getCreationTime() %></h3>
	<h3>마지막 접근 시간 (A) : <%=session.getLastAccessedTime() %></h3>
	<h3>현재 시간 (B) : <%=System.currentTimeMillis() %></h3>
	<h3>최대 유효 시간 (C): <%=session.getMaxInactiveInterval() %></h3>
	<%
		long a = session.getLastAccessedTime();
		long b = System.currentTimeMillis();
		long c = session.getMaxInactiveInterval();
	%>
	<h3><%=(b - a) / 1000 %> < <%=c %></h3>
	<h3>세션에 저장된 memo : <%=session.getAttribute("memo") %></h3>
</fieldset>

<%
	if(request.getMethod().equals("POST")) {
		request.setCharacterEncoding("UTF-8");
		String memo = request.getParameter("memo");
		session.setAttribute("memo", memo);
		session.setMaxInactiveInterval(300);
		response.sendRedirect("ex01-form.jsp");
	}
%>

</body>
</html>


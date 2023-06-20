<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz1-result.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	// POST방식의 요청이 아니라면 quiz1.jsp로 보내기
	if(request.getMethod().equals("POST") == false) {
		response.sendRedirect("quiz1.jsp");
	}
%>
<jsp:useBean id="dto" class="quiz1.Quiz1DTO" />
<jsp:setProperty property="*" name="dto" />

<%@ page import="quiz1.Quiz1DTO" %>
<table border="1" cellpadding="10" cellspacing="0">
	<tr>
		<td>userid</td>
		<td><jsp:getProperty name="dto" property="userid" /></td>
	</tr>
	<tr>
		<td>pw1</td>
		<td><%=dto.getPw1() %></td>
	</tr>
	<tr>
		<td>pw2</td>
		<td>${dto.pw2 }</td>
	</tr>
	<tr>
		<td>yyyy</td>
		<td><%=((Quiz1DTO)pageContext.getAttribute("dto")).getYyyy() %></td>
	</tr>
	<tr>
		<td>mm</td>
		<td>${dto.mm }</td>
	</tr>
	<tr>
		<td>dd</td>
		<td>${dto.dd }</td>
	</tr>
</table>

</body>
</html>
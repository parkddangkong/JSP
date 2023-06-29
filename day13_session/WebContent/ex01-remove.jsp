<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01-remove.jsp</title>
</head>
<body>

<%
	// 세션 전체를 폐기하지는 않고, 현재 세션에서 특정 attribute를 찾아서 제거한다
	session.removeAttribute("memo");

	// 세션은 보통, 다른 여러 페이지에서 공통으로 적용되기 때문에
	// 세션에 대한 처리를 수행하고 난 이후 redirect를 이용하여 페이지를 전환시킨다
	response.sendRedirect("ex01-form.jsp");
%>

</body>
</html>
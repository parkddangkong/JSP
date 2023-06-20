<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03-forward.jsp</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	String jspName = request.getParameter("jspName");
	
	request.setAttribute("test", "단비 쮸쮸바 먹고싶으니까 엄마가 이리루 와");
	
	RequestDispatcher rd;
	rd = request.getRequestDispatcher(jspName);
	rd.forward(request, response);
	// 대상 페이지가 request와 response를 그대로 전달받는다
%>

</body>
</html>
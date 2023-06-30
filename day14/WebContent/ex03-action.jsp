<%@page import="ex03.Ex03DTO"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03-action.jsp</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	String memo = request.getParameter("memo");
	
	// java.sql.Date
// 	java.sql.Date date1 = new java.sql.Date();	// undefined

	String date = request.getParameter("date");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	java.util.Date date1 = sdf.parse(date); 
	long time = date1.getTime();
	java.sql.Date date2 = new java.sql.Date(time);
	
	Ex03DTO dto = new Ex03DTO();
	dto.setDate(date2);
	dto.setMemo(memo);
	// String --(SimpleDateFormat)--> java.util.Date -> long -> java.sql.Date 
%>

<h3>date1 : <%=date1 %></h3>
<h3>time : <%=time %></h3>
<h3>date2 : <%=date2 %></h3>
<h3>dto.getDate() : <%=dto.getDate() %></h3>
<h3>dto.getMemo() : <%=dto.getMemo() %></h3>
<h3><%=System.nanoTime() %></h3>
</body>
</html>











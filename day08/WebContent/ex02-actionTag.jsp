<%@ page import="ex01.Test2" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01-actionTag.jsp</title>
</head>
<body>

<%
	Test2 ob7 = Test2.getInstance();
%>
<fieldset>
	<legend>ex01-actionTag.jsp</legend>
	<ul>
		 <li><%=ob7 %>
	</ul>
</fieldset>
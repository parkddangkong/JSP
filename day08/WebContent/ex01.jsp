<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ex01.*"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
</head>
<body>

<h1>singleton</h1>
<hr>

<h3>서로 다른 페이지에서 동일한 객체를 참조해도 상관없는 경우, 단일 객체 생성으로 제한시키기</h3>

<fieldset>
	<% Test1 ob1 = new Test1();  %>
	<c:set var="ob2" value="<%=new Test1() %>"	/>
	<jsp:useBean id="ob3" class="ex01.Test1"	/>	<!-- 기본생성자를 호출한다 -->
	<ul>
		<li>ob1 : <%=ob1 %></li>
		<li>ob2 : ${ob2 }</li>
		<li>ob3 : ${ob3 }</li>
	</ul>
</fieldset>
<br>

<fieldset>
	 <% // Test2 ob4 = new Test2(); // 외부 생성자 호출 불가능
	 		Test2 ob4 = Test2.getInstance();
	 %>
	 <c:set var ="ob5" value="${Test2.getInstance() }" />
	 
	 <ul>
	 	<li>ob4 : <%=ob4 %></li>
	 	<li>ob5 : ${ob5 }</li>
	 </ul>
	
</fieldset>

<%@ include file = "ex01-directive.jsp" %>

<jsp:include page="ex02-actionTag.jsp"	/>

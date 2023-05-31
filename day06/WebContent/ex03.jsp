<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp</title>
</head>
<body>

<h1>c:set</h1>
<hr>

<h3>변수 선언 (객체는 지정한 scope에 attribute형태로 만들어진다)</h3>

<c:set var="test1" value="첫번째 객체" />
<%	pageContext.setAttribute("test1", "첫번째 객체"); %>

<c:set var="test2" scope="request">두번째 객체</c:set>
<%	request.setAttribute("test2", "두번째 객체"); %>

<c:set var="test3" value="<%=new HashMap<String, Object>() %>" scope="session" />
<%	session.setAttribute("test3", new HashMap<String, Object>()); %>

<c:set var="test4" value="<%=response.getWriter() %>" scope="application" />
<%	application.setAttribute("test4", response.getWriter()); %>

<h3>선언된 attribute 는 EL Tag를 이용하여 접근 및 출력할 수 있다</h3>

<p>\${test1 } : ${test1 }</p>
<p>\${test2 } : ${test2 }</p>
<p>\${test3 } : ${test3 }</p>
<p>\${test4 } : ${test4 }</p>

<hr>
<h3>객체를 생성할 수도 있고, 생성된 attribute의 속성을 지정할 수도 있다</h3>
<%@ page import="ex03.Member" %>

<c:set var="m1" value="<%=new Member() %>" />
<%	pageContext.setAttribute("m1", new Member()); %>

<p>\${m1.name } : ${m1.name }</p>
<p>\${m1.age } : ${m1.age }</p>

<c:set target="${m1 }" property="name" value="이지은" />
<%	((Member)pageContext.getAttribute("m1")).setName("이지은"); %>

<c:set target="${m1 }" property="age" value="31" />
<%	((Member)pageContext.getAttribute("m1")).setAge(31); %>

<p>\${m1.name } : ${m1.name }</p>
<p>\${m1.age } : ${m1.age }</p>

<c:remove var="m1" scope="page" />
<p>\${m1.name } : ${m1.name }</p>
<p>\${m1.age } : ${m1.age }</p>



</body>
</html>
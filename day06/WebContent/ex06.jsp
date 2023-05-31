<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ex03.Member, java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06.jsp</title>
</head>
<body>

<h1>forEach</h1>
<hr>
<%
	ArrayList<Member> list = new ArrayList<>();
	
	Member m1 = new Member();
	m1.setName("이지은");
	m1.setAge(31);
	
	Member m2 = new Member();
	m2.setName("홍진호");
	m2.setAge(42);
	
	Member m3 = new Member();
	m3.setName("나단비");
	m3.setAge(5);
	
	list.add(m1);
	list.add(m2);
	list.add(m3);
	
	pageContext.setAttribute("list", list);
%>
<h3>컬렉션 혹은 배열 내부의 각 요소를 반복하여 처리하기</h3>

<table border="1" cellpadding="10" cellspacing="0">
	<tr>
		<th>index</th>
		<th>count</th>
		<th>first</th>
		<th>last</th>
		<th>이름</th>
		<th>나이</th>
	</tr>
	<c:forEach var="member" items="${list }" varStatus="st">
	<tr bgcolor="${st.index % 2 == 0 ? 'lightpink' : 'skyblue' }">
		<td>${st.index }</td>
		<td>${st.count }</td>
		<td>${st.first }</td>
		<td>${st.last }</td>
		<td>${member.name }</td>
		<td>${member.age }</td>
	</tr>
	</c:forEach>
</table>

<h3>컬렉션 없이 일정한 구간 사이의 숫자로 반복을 수행하기</h3>

<table border="1" cellpadding="10" cellspacing="0">
	<%--	for(int i = 10; i <= 50; i += 5) { --%>
	<tr>
	<c:forEach var="i" begin="10" end="50" step="5">
		<td>${i }</td>
	</c:forEach>
	</tr>
</table>

<h3>문자열의 특정 글자를 기준으로 분리하여 반복 (split)</h3>

<table border="1" cellpadding="10" cellspacing="0">
	<tr>
	<c:forTokens var="lang" items="C lang, Java, Python, PHP" delims=",">
		<td>${lang }</td>
	</c:forTokens>
	</tr>
</table>















</body>
</html>
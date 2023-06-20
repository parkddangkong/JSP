<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05.jsp</title>
</head>
<body>

<h1>EL Tag</h1>
<hr>

<h3>Expression Language, 표현 언어</h3>
<h3>내장 객체에 저장된 attribute에 빠르게 접근하여 값을 출력하는 태그</h3>
<h3>JSP 내장 스펙이므로, 외부 라이브러리 없이 사용 가능하다</h3>

<ul>
	<li>내장 객체를 명시하지 않아도 순서대로 접근하여 attribute를 찾아서 출력한다</li>
	<li>순서는 pageContext -> request -> session -> application 순서이다 </li>
	<li>pageScope.attr, requestScope.attr, sessionScope.attr, applicationScope.attr</li>
	<li>scope를 지정하여 특정 범위에서만 탐색할 수도 있다</li>
	<li>attribute의 getter에 접근할 수 있다</li>
	<li>배열 및 리스트의 경우 indexing 으로 접근할 수 있다</li>
	<li>map이면 key로 접근할 수도 있다</li>
	<li>문자열은 홑따옴표로 표기한다</li>
	<li>파라미터 및 헤더에 접근할 수 있다</li>
	<li>단순한 연산자 처리도 가능하며, 산술연산은 문자열에 적용되지 않는다</li>
	<li>()를 명시하여 메서드 호출도 가능하다</li>
</ul>

<jsp:useBean id="test" class="ex04.Circle" scope="application" />
<jsp:setProperty property="radius" name="test" value="50.7" />
${test.calc() }
<h3>\${test } : ${test }</h3>
<h3>\${pageScope.test } : ${pageScope.test }</h3>
<h3>\${requestScope.test } : ${requestScope.test }</h3>
<h3>\${sessionScope.test } : ${sessionScope.test }</h3>
<h3>\${applicationScope.test } : ${applicationScope.test }</h3>

<%@ page import="java.util.*" %>
<%
	String[] arr = {"짱구", "맹구", "훈이", "유리", "철수"};
	pageContext.setAttribute("arr", arr);
	
	List<String> list = Arrays.asList(arr);
	pageContext.setAttribute("list", list);
	
	HashMap<String, Integer> map = new HashMap<>();
	map.put("이지은", 31);
	map.put("홍진호", 42);
	map.put("나단비", 5);
	map.put("john", 20);
	pageContext.setAttribute("map", map);
%>
<hr>
<h3>배열/리스트/맵 접근</h3>
<h3><%=((String[])pageContext.getAttribute("arr"))[1] %></h3>
<h3>\${arr[1] } : ${arr[1] }</h3>
<br>

<h3><%=((List<String>)pageContext.getAttribute("list")).get(2) %></h3>
<h3>\${list[2] } : ${list[2] }</h3>
<br>

<h3><%=((HashMap<String, Integer>)pageContext.getAttribute("map")).get("이지은") %>살</h3>
<h3>\${map['이지은']} : ${map['이지은']}살</h3>
<h3>\${map.john} : ${map.john }살</h3>


</body>
</html>
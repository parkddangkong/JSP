<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp</title>
</head>
<body>

<h1>객체 타입 배열 출력하기</h1>
<hr>
<%@ page import="ex01.Human" %>
<%
	Human ob1 = new Human("이지은",31);
	Human ob2 = new Human("홍진호",42);
	Human ob3 = new Human("나단비",5);
	Human ob4 = new Human("이제훈",40);
	
	Human[] arr = {ob1, ob2, ob3, ob4};
	List<Human> list = Arrays.asList(arr);
	
	request.setAttribute("arr", arr);
	request.setAttribute("list", list);
%>

<ul>
	<li><%=((Human[])request.getAttribute("arr"))[0].getName() %>,
	<%=((Human[])request.getAttribute("arr"))[0].getAge() %>
	</li>
	<li>${arr[1].name }, ${arr[1].age }</li>
	</ul>
	<ol>
<%
	for(int i =0;i<arr.length;i++){
		pageContext.setAttribute("i", i);
		%>
		<li>${arr[i] }</li>
		<% 
		}
%></ol>
<ul>
<%
	for(Human ob : arr){
		pageContext.setAttribute("ob", ob);
		%><li>${ob }</li><% 
	}
%>
</ul>

</body>
</html>
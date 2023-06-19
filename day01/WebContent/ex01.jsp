<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
</head>
<body>

<h1>선언부와 스크립틀릿 변수의 차이</h1>
<hr>

<%=pageContext.getSession() %>

<%!
	// declaration, 선언부
	// JSP는 컴파일되면 Servlet 클래스로 변환된 후 실행된다 (상속으로 구현된다)
	// 선언부에서는 작성될 클래스의 멤버 필드 및 멤버 메서드를 추가할 수 있다
	// (필드 및 메서드 작성이므로 연산식을 수행할 수 없다)
	int n1 = 10;
	// n1++;
%>

<%
	// scriptlet, 스크립틀릿
	// jsp가 서블릿으로 변환되면 service(), doGet(), doPost() 등의 메서드를 가진다
	// 스크립틀릿은 생성된 서블릿 객체가 한번의 요청을 받았을때 마다 수행되는 service() 함수이다
	// (함수 내부이므로 연산식 및 제어문을 수행할 수 있다)
	int n2 = 10;
	n1++;	// 멤버 메서드 내부에서는 멤버 필드를 참조할 수 있다
	n2++;	// 메서드 내부에서 지역변수를 참조한다
	
	out.print("Hello");
%>
<h3>n1 : <%=n1 %></h3>
<h3>n2 : <%=n2 %></h3>

<ol>
	<li>클라이언트가 요청을 한다</li>
	<li>서블릿 컨테이너에서 서블릿 객체를 생성한다</li>
	<li>받은 요청과 보낼 응답 객체를 준비한다</li>
	<li>대상 클라이언트에 관해 처리할 내용을 새로운 스레드에서 실행한다</li>
	<li>요청과 응답을 스레드에 전달하여 서블릿이 처리한다</li>
	<li>Service메서드를 통해 doGet이나 doPost같은 함수를 실행한다</li>
	<li>6의 결과로 만들어진 응답을 컨테이너로 보낸다</li>
	<li>컨테이너는 http응답을 클라이언트에게 전송한다</li>
</ol>

<img src="servlet.png">



</body>
</html>
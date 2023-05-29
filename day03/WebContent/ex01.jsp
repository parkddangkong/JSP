<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
</head>
<body>
	<h1>EL Tag</h1>
	<hr>
	
<ul>
	<li>페이지간의 객체 공유를 위해서 attribute를 사용할 수 있다</li>
	<li>attribute에 저장하면 Object로 업캐스팅 된다</li>
	<li>객체 다운캐스팅을 위해서는 코드가 길어진다</li>
	<li>EL태그의 기본적인 사용법은 attribute를 출력하는 것이다</li>
	<li>출력결과는 toString()의 반환값으로 출력된다</li>
</ul>

<%@ page import="ex01.Human" %>
<%
	Human ob1 = new Human("이지은",31);
	Human ob2 = new Human("홍진호",42);
	Human ob3 = new Human("나단비",5);
	Human ob4 = new Human("이제훈",40);
	
	pageContext.setAttribute("ob1", ob1);
	request.setAttribute("ob2", ob2);
	session.setAttribute("ob3", ob3);
	application.setAttribute("ob4", ob4);
%>

<fieldset>
	<h3>
		이름 : <%=((Human)pageContext.getAttribute("ob1")).getName() %><br>
		나이 : <%=((Human)pageContext.getAttribute("ob1")).getAge() %>
	</h3>
	<h3>
		이름 : ${ob1.name }<br>
		나이 : ${ob1.age }
	</h3>
	<h3>${ob1 }</h3>
</fieldset>
<br>

<fieldset>
	<h3>
		이름 : ${ob2.name }<br>
		나이 : ${ob2.age }
	</h3>
</fieldset>
<br>
<fieldset>
	<h3>
		이름 : ${ob3.name }<br>
		나이 : ${ob3.age }
	</h3>
</fieldset>
<br>

<fieldset>
	<h3>
		이름 : ${ob4.name }<br>
		나이 : ${ob4.age }
	</h3>
</fieldset>
</body>
</html>
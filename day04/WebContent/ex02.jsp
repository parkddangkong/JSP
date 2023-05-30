<%@page import="ex02.TestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02.jsp</title>
</head>
<body>

<h1>DAO를 이용한 데이터 화면 출력</h1>
<hr>

<div>
<jsp:useBean id="dao" class="ex02.TestDAO" />
<h3>version : ${dao.getVersion() }</h3>
</div>

<br><br>


<%
	TestDAO dao2 = new TestDAO();
	String version = dao2.getVersion();
	System.out.println(version);
%>

<div>
<h3>version : <%=dao2.getVersion() %></h3>
</div>

<%
	// 현재 페이지에서 dao 사용이 끝났다면 반드시 close() 호출하기
	dao2.close();
%>

</body>
</html>
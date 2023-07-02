<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ex02.FileUtil" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// 	FileUtil util = new FileUtil();
	FileUtil util = FileUtil.getInstance(request);
	File f = util.getUploadFile(request);
	String fileName = f.getName();
	long length = f.length();
%>
<fieldset>
	<ul>
		<li>fileName : <%=fileName %></li>
		<li>fileSize : <%=length %></li>
		<li>content : <img src="image/<%=fileName %>" width="300"></li>
	</ul>
</fieldset>

<p>
	<a href="ex02.jsp"><button>돌아가기</button></a>
</p>	

</body>
</html>
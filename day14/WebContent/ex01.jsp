<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
</head>
<body>

<h1>쿠키 유효시간 확인</h1>
<hr>
<%
	Cookie jsessionid = null;
	Cookie[] cs = request.getCookies();
	for(int i = 0; cs != null && i < cs.length; i++) {
		Cookie c = cs[i];
		if(c.getName().equals("JSESSIONID")) {
			jsessionid = c;
			break;
		}
	}
	Cookie c1 = new Cookie("test", "1234");
	c1.setMaxAge(60);
	response.addCookie(c1);
	
	Cookie c2 = new Cookie("JSESSIONID", session.getId());
	c2.setMaxAge(120);
	response.addCookie(c2);
%>
<h3>jsessionid : <%=jsessionid %></h3>
<%-- <h3>jsessionid.getValue() : <%=jsessionid.getValue() %></h3> --%>
<h3>session.getId() : <%=session.getId() %></h3>
<br>
<h3>\${cookie.test.value } : ${cookie.test.value }</h3>
<h3>\${cookie.test.maxAge } : ${cookie.test.maxAge }</h3>

</body>
</html>
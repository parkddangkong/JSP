<%@page import="java.lang.reflect.Array"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URLDecoder"%>
<%!public int getCommaCount(String s) {
		int count = 0;
		for (int i = 0; i < s.length(); i++) {
			char ch = s.charAt(i);
			if (ch == ',') {
				count += 1;
			}
		}
		return count;
	}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex07-view.jsp</title>
</head>
<body>

	<h1>ex07-view.jsp</h1>
	<hr>

	<h3>idx : ${param.idx }</h3>
	<%
	String idx = request.getParameter("idx");

	Cookie[] cs = request.getCookies();
	String value = "";
	for (int i = 0; cs != null && i < cs.length; i++) {
		if (cs[i].getName().equals("recent")) {
			value = URLDecoder.decode(cs[i].getValue(), "UTF-8");
		}
	}
	if ("".equals(value)) {
		value += idx;
	} 
	else if (getCommaCount(value) == 4) {
		value = value.substring(value.indexOf(",") + 1);
		value += "," + idx;
	} 
	else {
		value += "," + idx;
	}
	
	Cookie c = new Cookie("recent", URLEncoder.encode(value, "UTF-8"));
	c.setMaxAge(60 * 5);
	response.addCookie(c);
	%>
	<h3>recent : ${URLDecoder.decode(cookie.recent.ch, 'UTF-8') }</h3>

	<a href="ex07.jsp"><button>목록으로</button></a>
</body>
</html>
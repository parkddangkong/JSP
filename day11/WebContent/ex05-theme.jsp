<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05-theme.jsp</title>
<c:set var="theme" value="${URLDecoder.decode(cookie.theme.value) }" />
<c:choose>
	<c:when test="${theme == 'Light Theme' }">
		<c:set var="bgcolor" value="white" />
		<c:set var="color" value="#black" />
	</c:when>
	<c:when test="${theme == 'Dark Theme' }">
		<c:set var="bgcolor" value="#111" />
		<c:set var="color" value="#ccc" />
	</c:when>
	<c:when test="${theme == 'Pink Theme' }">
		<c:set var="bgcolor" value="#111" />
		<c:set var="color" value="hotpink" />
	</c:when>
</c:choose>
<style>
	html{
		color: ${color};
		background-color: ${bgcolor};
	}
</style>
</head>
<body>

	<h1>컬러 테마</h1>
	<hr>

	<form method="POST">
		<p>
			<select name="theme">
				<option ${theme == 'Light Theme' ? 'selected' : ''}>Light Theme</option>
				<option ${theme == 'Dark Theme' ? 'selected' : ''}>Dark Theme</option>
				<option ${theme == 'Pink Theme' ? 'selected' : ''}>Pink Theme</option>
			</select>
			<input type="submit">
		</p>
	</form>

<%
	if(request.getMethod().equals("POST")){
		String theme = request.getParameter("theme");
		theme = URLEncoder.encode(theme,"UTF-8");
		Cookie c = new Cookie("theme",theme);
		c.setMaxAge(60*5);
		response.addCookie(c);
		response.sendRedirect("ex05-theme.jsp");
	}
%>

	<fieldset style="width: 500px; height: 400px; overflow: scroll;">
		<pre>
네가 참 궁금해 그건 너도 마찬가지
이거면 충분해 쫓고 쫓는 이런 놀이
참을 수 없는 이끌림과 호기심
묘한 너와 나 두고 보면 알겠지
Woo 눈동자 아래로
Woo 감추고 있는 거
Woo yeah It's so bad It's good
난 그 맘을 좀 봐야겠어
Narcissistic my god I love it
서로를 비춘 밤
아름다운 까만 눈빛 더 빠져 깊이
(넌 내게로 난 네게로)
숨 참고 love dive
Woo lalalalalalala
Woo 어서 와서 love dive
Woo oh perfect sacrifice yeah
숨 참고 love dive
마음은 이렇게 알다가도 모르지
사랑이라는 건 한순간에 필 테니
직접 들어와 두 눈으로 확인해
내 맘 가장 깊은 데로 오면 돼
Woo 망설일 시간은
Woo 3초면 되는 걸
Woo yeah It's so bad It's good
원하면 감히 뛰어들어
Narcissistic my god I love it
서로를 비춘 밤
아름다운 까만 눈빛 더 빠져 깊이
(넌 내게로 난 네게로)
숨 참고 love dive
Woo lalalalalalala
Woo 어서 와서 love dive
Woo oh perfect sacrifice yeah
숨 참고 love dive
숨 참고 love dive
숨 참고 love dive
숨 참고 love dive
숨 참고 love dive
Woo lalalalalalala
Woo 어서 와서 love dive
Woo oh perfect sacrifice yeah
숨 참고 love dive
	</pre>
	</fieldset>

</body>
</html>
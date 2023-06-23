<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05-theme.jsp</title>

<c:set var="theme" value="${URLDecoder.decode(cookie.theme.value) }" />
<c:choose>
	<c:when test="${theme == 'Dark Theme' }">
		<c:set var="bgcolor" value="#111" />
		<c:set var="color" value="#ccc" />
	</c:when>
	<c:when test="${theme == 'Pink Theme' }">
		<c:set var="bgcolor" value="#111" />
		<c:set var="color" value="hotpink" />
	</c:when>
	<c:when test="${theme == 'Light Theme' }">
		<c:set var="bgcolor" value="white" />
		<c:set var="color" value="black" />
	</c:when>
</c:choose>

<style>
	html {
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
			<option ${theme =='Light Theme' ? 'selected' : '' }>Light Theme</option>
			<option ${theme =='Dark Theme' ? 'selected' : '' }>Dark Theme</option>
			<option ${theme =='Pink Theme' ? 'selected' : '' }>Pink Theme</option>
		</select>
		<input type="submit">
	</p>
</form>

<%
	if(request.getMethod().equals("POST")) {
		String theme = request.getParameter("theme");
		theme = URLEncoder.encode(theme, "UTF-8");
		Cookie c = new Cookie("theme", theme);
		c.setMaxAge(60 * 5);
		response.addCookie(c);
		response.sendRedirect("ex05-theme.jsp");
	}
%>

<fieldset style="width: 500px; height: 300px; overflow-y: scroll;">
	<pre>
또 모르지? 내 마음이 저 날씨처럼 바뀔지
날 나조차 다 알 수 없으니 (나나나나나나)
그게 뭐가 중요하니, 지금 네게 완전히
푹 빠졌단 게 중요한 거지 (나나나나나나)
아마 꿈만 같겠지만 분명 꿈이 아니야
달리 설명할 수 없는, 이건 사랑일 거야
방금 내가 말한 감정 감히 의심하지 마
그냥 좋다는 게 아냐 (what's after like?)
You-ooh and I-I, it's more than like
L 다음 또 O 다음 난, yeah, yeah, yeah
You-ooh and I-I, it's more than like (like)
What's after like?
What's after like?
조심해 두 심장에 핀 새파란 이 불꽃이
저 태양보다 뜨거울 테니 (나나나나나)
난 저 위로 또 아래로, 내 그래프는 폭이 커
Yeah, that's me (yeah, that's me)
두 번 세 번 피곤하게 자꾸 질문하지 마
내 장점이 뭔지 알아? 바로 솔직한 거야
방금 내가 말한 감정 감히 의심하지 마 (우우우우우)
그냥 좋다는 게 아냐 (what's after like?)
You-ooh and I-I, it's more than like
L 다음 또 O 다음 난, yeah, yeah, yeah
You-ooh and I-I, it's more than like (what's the after like?)
What's after like?
What after like? 내 맘에 strike
지금 느낀 짜릿함은 마치 tike
L-O 다음에 I 그 다음에 V-E
여긴 너와 내 space, 아무도 막지 못해
나를 보면 눈 깜빡할
시간 조차도 아까울 걸
드디어 만나 반가워 (what's the after like?)
L-O-V-E 사이 놓일 I (what's after like?)
You-ooh and I-I, it's more than like
E 앞 또 V 앞 난, yeah, yeah, yeah
You-ooh and I-I, it's more than like (like)
What's after like?
You-ooh and I-I, it's more than like
L 다음 또 O 다음 난, yeah, yeah, yeah
You-ooh and I-I, it's more than like (like)
What's after like?
What's after likе?	
	</pre>
</fieldset>

</body>
</html>
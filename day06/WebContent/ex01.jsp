<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
		접두사 c로 시작하는 태그모음을 선언한다
		라이브러리 jstl 내부의 core에 해당하는 내용을 접두사 c로 시작하는 태그로 사용하겠다
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
</head>
<body>

<h1>JSTL</h1>
<hr>

<h3>JSP Standard Tag Library</h3>

<ul>
	<li>core : 변수 선언, 객체 속성 수정, 삭제, if, for, redirect 등 핵심 기능</li>
	<li>fmt : format, 날짜나 숫자의 표현서식을 지정한다</li>
	<li>fn : functions, split이나 length 와 같은 간단한 함수들을 태그형식으로 지원한다</li>
	<li>sql : DB에 접속하고 쿼리를 실행하는 과정을 태그로 지원한다</li>
	<li>xml : 다른 xml파일을 불러와서 자바 객체를 생성하거나 설정을 수행한다</li>
</ul>

</body>
</html>
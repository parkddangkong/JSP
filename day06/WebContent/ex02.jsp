<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02.jsp</title>
</head>
<body>

<h1>JSTL core</h1>
<hr>

<table border="1" cellpadding="10" cellspacing="0">
	<tr bgcolor="silver">
		<th>태그</th>
		<th>형식</th>
		<th>설명</th>
	</tr>
	<tr>
		<td>set</td>
		<td>&lt;c:set var="이름" value="값" scope="내장객체범위" /></td>
		<td>
			지정한 이름으로 scope에 attribute를 생성한다.<br>
			기존 객체가 있다면, 값을 덮어쓴다
		</td>
	</tr>
	<tr>
		<td>if</td>
		<td>&lt;c:if test="조건"> ... 종속문장 ... &lt;/c:if></td>
		<td>
			test의 조건이 참이면 내부 종속문장을 실행한다<br>
			시작태그와 마무리태그를 분리해서 작성해야 한다
		</td>
	</tr>
	<tr>
		<td>forEach</td>
		<td>
			&lt;c:forEach var="반복변수" items="컬렉션"><br>
			 ... 종속문장 ... <br>
		 	&lt;/c:forEach>
		</td>
		<td>
			items의 길이만큼 반복하여, 각 요소를 var에 담고<br>
			var의 값을 출력하거나, 연산을 수행할 수 있다
		</td>
	</tr>
</table>

</body>
</html>
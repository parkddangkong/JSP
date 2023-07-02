<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
</head>
<body>

<h1>jsp 파일 업로드</h1>
<hr>

<fieldset>
	<ul>
		<li>파일은 글자로 구성되는 요소가 아니므로, GET으로 전달할 수 없다</li>
		<li>첨부파일의 크기를 예측할 수 없어서, 일정한 크기로 나눠서 전송해야 한다</li>
		<li>기본 내장객체 request에는 파일을 처리하는 메서드가 없다</li>
		<li>MultipartRequest로 새로 생성해서 업로드 파일을 처리한다</li>
	</ul>
</fieldset>

<form method="POST" enctype="multipart/form-data" action="ex01-action.jsp">
	<p><input type="text" name="title" placeholder="제목"></p>
	<p><input type="file" name="uploadFile"></p>
	<p><input type="submit"></p>
</form>


</body>
</html>




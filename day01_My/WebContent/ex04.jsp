<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04.jsp</title>
</head>
<body>

<h1>form 태그를 이용한 파라미터 전달</h1>
<hr>

<%--
		form 태그는 사용자 입력값을 포함한 새로운 요청을 만들어서 서버에 전송하는 태그이다
		
		form 태그는 다음 속성을 사용할 수 있다
		
			action : 요청을 받을 서버의 주소
					생략하면 현재 주소에서 요청을 받는다
					
			method : 요청 방식(GET, POST, HEAD, PUT, PATCH, DELETE...)
					단, form 태그는 GET, POST, HEAD 만 사용 가능하다
					생략하면 GET이 지정된다
					
					GET : 클라이언트의 입장에서 data를 받기 위해 사용하는 메서드
							어떤 내용을 받을지에 대해 파라미터를 쿼리스트링 형태로 전달할 수 있다
							따라서, 파라미터는 주소창을 통해서 전달한다
							(select와 밀접함)
							
					POST : 클라이언트가 입력하는 data를 서버(혹은 DB)에 만들기 위한 메서드
							입력받은 내용은 주소창을 통하여 전달하지 않는다
							HTTP 요청 패킷의 body에 from-data 형식으로 포함되어 전달된다
							(일정한 form의 양식에 맞춘 서류봉투를 건낸 것)

 --%>


<form>
	<p><input type="text" name="name" placeholder="이름 입력"></p>
	<!-- 파라미터를 이용해서 새로운 요청을 만드는 태그는 p태그 -->
	<p><input type="number" name="age" placeholder="나이 입력"></p>
	<p><input type="submit"></p>
</form>

<fieldset>
	<legend>naver로 연결되는 form</legend>
	<form action="http://search.naver.com/search.naver">
		<input type = "text" name="query" placeholder="네이버 검색어 입력">
		<input type="submit" value="검색">
	</form>
</fieldset>

<fieldset>
	<legend>현재 서버의 ex03.jsp 로 연결되는 form</legend>
	<form action="ex03.jsp">
		<input type = "text" name="name" placeholder="이름 입력">
		<input type="submit" value="제출">
	</form>
</fieldset>


<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String msg;
	
	if(name == null || age == null || "".equals(name) || "".equals(age)){
		msg = "안녕하세요";
	}
	else{
		msg = String.format("%s님 (%s살) 안녕하세여", name, age);
	}

%>
<h3><%=msg %></h3>
</body>
</html>
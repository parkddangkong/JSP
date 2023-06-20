<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02.jsp</title>
</head>
<body>

<h1>jsp 액션 태그</h1>
<hr>

<fieldset>
	JSP가 개발된 후, 자바개발자가 아닌 사람들(ex. 퍼블리셔)도 코드를 작성할 수 있도록<br>
	만들어진 태그형식의 자바코드를 말한다<br>
	XML기반의 태그이므로, 반드시 마무리태그를 작성해야만 한다
</fieldset>
<br>
<table border="1" cellpadding="10" cellspacing="0">
	<tr>
		<th>액션태그</th>
		<th>예시</th>
		<th>역할</th>
	</tr>
	<tr>
		<td>jsp:useBean</td>
		<td>&lt;jsp:useBean id="dto" class="package.ClassName" /></td>
		<td>
			지정한 클래스의 기본생성자로 객체를 생성하고<br> 
			id의 이름으로 객체 생성 및 attribute등록
		</td>
	</tr>
	<tr>
		<td>jsp:setProperty</td>
		<td>&lt;jsp:setProperty property="age" name="dto" /></td>
		<td>
			name에서 지정한 객체의 property속성에 값을 대입한다<br>
			값은 동일한 이름의 parameter에서 가져온다
		</td>
	</tr>
	<tr>
		<td>jsp:getProperty</td>
		<td>&lt;jsp:getProperty property="age" name="dto" /></td>
		<td>
			name에서 지정한 객체의 property속성을 가져온다<br>
			보통 화면 출력에 사용되지만, EL 태그로 인해 사용 빈도는 낮다
		</td>
	</tr>
	<tr>
		<td>jsp:forward</td>
		<td>&lt;jsp:forward page="other.jsp" /></td>
		<td>
			지정한 페이지로 포워드한다.<br>
			요청이 유지되기 때문에 request의 파라미터 및  attribute가 유효하다
		</td>
	</tr>
	<tr>
		<td>jsp:include</td>
		<td>&lt;jsp:include page="other.jsp" /></td>
		<td>
			지정한 페이지를 현재 위치에 포함시킨다<br>
		</td>
	</tr>
</table>


<jsp:useBean id="test" class="ex01.Ex01DTO" scope="page" />

<jsp:setProperty property="age" name="test" value="31" />

<h3>test.age : <jsp:getProperty name="test" property="age" /></h3>
<h3>test.age : ${test.age }</h3>

<fieldset>
	<jsp:include page="ex01-form.jsp" />
</fieldset>












</body>
</html>
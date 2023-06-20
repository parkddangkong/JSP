<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp</title>
</head>
<body>

<h1>redirect와 forward</h1>
<hr>

<table border="1" cellpadding="10" cellspacing="0">
	<tr>
		<td>redirect</td>
		<td>
			response.sendRedirect(주소)
		</td>
		<td>
			브라우저가 받을 응답에 이동할 주소를 작성한다<br>
			브라우저는 응답을 받은 후, 전달받은 주소로 새로운 요청을 보낸다<br>
			브라우저가 능동적으로 주소를 변경하기 때문에, 바뀐 주소가 주소창에 드러난다<br>
			새로운 요청이므로, 기존의 request에 담긴 parameter/attribute는 사용불가<br>
			현재 서버 외부의 주소에도 리다이렉트 할 수 있다
		</td>
	</tr>
	<tr>
		<td>forward</td>
		<td>
			RequestDispatcher rd;<br>
			rd = request.getRequestDispatcher(페이지이름);<br> 
			rd.forward(request, response);
		</td>
		<td>
			서버에서 지정한 페이지로 요청과 응답을 넘긴다<br>
			클라이언트는 페이지 변경 내역을 알 수 없다<br>
			서버에서 임의로 변경하기 때문에, 브라우저의 주소는 바뀌지 않는다<br>
			request를 전달하면서 페이지를 전환하므로, 기존 parameter/attribute를 사용할 수 있다<br>
			현재 서버 내부의 페이지로만 포워드할 수 있다
		</td>
	</tr>
</table>


<fieldset>
	<legend>redirect</legend>
	<form action="ex03-redirect.jsp" method="POST">
		<p>
			<input type="text" name="url" placeholder="URL">
			<input type="submit">
		</p>
	</form>
</fieldset>
<br>

<fieldset>
	<legend>forward</legend>
	<form action="ex03-forward.jsp" method="POST">
		<p>
			<input type="text" name="jspName" placeholder="jspName">
			<input type="submit">
		</p>
	</form>
</fieldset>



</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>

<h3>추가</h3>

<form action="<%=cpath%>/add-action.jsp" method="POST">
	<p><input type="text" name="name" placeholder="이름"></p>
	<p><input type="number" name="age" placeholder="나이"></p>
	<p>
		<select name="gender" required>
			<option value="">==성별==</option> 
			<option value="남성">남성</option> 
			<option value="여성">여성</option>
		</select>
	</p>
	<p><input type="submit"></p>
</form>

</body>
</html>
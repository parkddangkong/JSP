<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>

<h3>수정</h3>

<%
	String name = request.getParameter("name");
	StudentDTO dto = dao.selectOne(name);
	// select name, age, gender from student where name ='%s'
	// select * from student where name = '%s'
%>


<form action="<%=cpath%>/modify-action.jsp" method="POST">
	<p><input type="text" name="name" placeholder="이름" value="<%=dto.getName()%>" required></p>
	<p><input type="number" name="age" placeholder="나이" value="<%=dto.getAge()%>" required></p>
	<p>
		<select name="gender" required>
			<option value="">==성별==</option> 
			<option value="남성" <%=dto.getGender().equals("남성") ? "selected" : ""%>>남성</option> 
			<option value="여성"<%=dto.getGender().equals("여성") ? "selected" : ""%>>여성</option>
		</select>
	</p>
	<p><input type="submit"></p>
</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>

<h3>목록</h3>

<table border="1" cellpadding="10" cellspacing="0" width="700" align="center">
	<thead>
		<tr bgcolor="silver">
			<th>NAME</th>
			<th>AGE</th>
			<th>GENDER</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
	</thead>
	<tbody>
	<%
		List<StudentDTO> list = dao.selectAll();
		for(int i =0;i<list.size();i++){
			StudentDTO dto = list.get(i);
	%>
		<tr>
			<td><%=dto.getName() %></td>
			<td><%=dto.getAge() %></td>
			<td><%=dto.getGender() %></td>
			<td><a href="<%=cpath%>/modify.jsp?name=<%=dto.getName()%>"><button>수정</button></a></td>
			<td><a href="<%=cpath%>/delete.jsp?name=<%=dto.getName()%>"><button>삭제</button></a></td>
		</tr>
		<%	} %>
	</tbody>

</body>
</html>
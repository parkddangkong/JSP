<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<%
	String name = request.getParameter("name");

// delete student where name = 'dto.getName()'
	int row = dao.delete(name);

	System.out.println("row : "+row);

	if(row !=0){
		response.sendRedirect(cpath + "/list.jsp");
	}
	else{
	%>
	<h3>삭제 실패</h3>
	<a href="<%=cpath%>/list.jsp"><button>목록</button></a>
	<%
	}
	%>
</body>
</html>
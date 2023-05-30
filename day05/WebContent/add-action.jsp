<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="header.jsp" %>

<jsp:useBean id="dto" class="student.StudentDTO"	/>
<jsp:setProperty property="*" name="dto"	/>

<%	// insert into student values('dto.getName()', dto.getAge(), 'dto.getGender()')
	int row = dao.insert(dto);
	if(row == 1){
		response.sendRedirect(cpath + "/list.jsp");
	}
	else{
%>
	<h3>추가되지 않았습니다</h3>
	<a href="<%=cpath%>/add.jsp"><button>다시 작성하기</button></a>
	<%
	}	
%>

</body>
</html>
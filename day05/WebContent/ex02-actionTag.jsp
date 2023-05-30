<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="ex02-header.jsp"	/>
<%
	int num =4;		// 지역 변수를 공유하지 않는다
					// 각각 컴파일하고 결과만 합쳐서 보여준다
%>
<h3>num : <%=num %></h3>
</body>
</html>
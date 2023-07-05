<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<c:set var="row" value="${boardDAO.delete(param.idx, login.idx) }" />
<%--
		delete board where idx=? and writer=?
 --%>

<script>
	const row = '${row}'
// 	const row = 
	if(row != 0) {
		alert('삭제 성공 !!')
		location.href = '${cpath}/board/list.jsp'
	}
	else {
		alert('삭제 실패 !!')
		history.go(-1)
	}
</script>

</body>
</html>
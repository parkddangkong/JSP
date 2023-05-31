<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<c:set var="row" value="${dao.delete(param.idx) }" />
<h3>${row != 0 ? '삭제 실패' : '삭제 성공' }</h3>
<a href="${cpath }/list.jsp"><button>목록으로</button></a>
</body>
</html>
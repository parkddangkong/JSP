<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="diary.*" %>
<%@ include file="header.jsp" %>
<body>

<c:if test="${pageContext.request.method == 'GET' }">
	<h3>추가</h3>
	<form method="POST" enctype="multipart/form-data">
		<p><input type="file" name="pic" required></p>
		<p><textarea name="content" placeholder="내용을 입력하세요" required></textarea></p>
		<p><input type="submit"></p>
	</form>
</c:if>

<c:if test="${pageContext.request.method == 'POST' }">
	<c:set var="dto" value="${util.getDTO(pageContext.request) }" />
	<c:set var="row" value="${dao.insert(dto) }" />
	<h3>${row != 0 ? '추가 성공' : '추가 실패' }</h3>
	<a href="${cpath }/list.jsp"><button>목록으로</button></a>
</c:if>

</body>
</html>







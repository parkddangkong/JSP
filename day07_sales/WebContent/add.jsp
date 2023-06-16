<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>

<c:if test="${pageContext.request.method == 'GET' }">
	<form method="POST">
		<p><input type="text" name="name" placeholder="이름"></p>
		<p><input type="text" name="price" placeholder="가격"></p>
		<p><input type="text" name="cnt" placeholder="갯수"></p>
		<p><input type="submit"></p>
	</form>
</c:if>

<c:if test="${pageContext.request.method == 'POST'} ">
	<jsp:useBean id="dto" class="sales.SalesDTO" />
	<jsp:setProperty property="*" name="dto"/>
	<c:set var="row" value="${dao.insert(dto) }" />
	<h3>${row !=0 ? '추가실패' : '추가성공' }</h3>
	<a href="${cpath }/list.jsp"><button>목록으로</button></a>
</c:if>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h3>상품 목록</h3>

<c:set var="list" value="${productDAO.select() }" />
<c:forEach var="dto" items="${list }">
	<div class="item">
		<div>${dto.idx }</div>
		<div>${dto.name }</div>
		<div>${dto.price }</div>
	</div>
</c:forEach>
</body>
</html>
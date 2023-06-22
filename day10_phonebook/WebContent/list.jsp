<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<div id="root">
	<c:set var="list" value="${dao.selectAll() }" />
	<c:forEach var="dto" items="${list }">
	<div class="item">
		<div>${dto.idx }</div>
		<div>${dto.name }</div>
		<div>${dto.pnum }</div>
		<div>${dto.bookmark > 0 ? '★' : '☆' }</div>
	</div>
	</c:forEach>
</div>

</body>
</html>
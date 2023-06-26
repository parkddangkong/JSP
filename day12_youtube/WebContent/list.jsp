<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="list" value="${dao.selectAll() }" />

<main>
<div id="root">
	<div class="wrap">
	<c:forEach var="dto" items="${list }">
		<div class="item">
			<div class="thumbnail">
				<a href="${cpath }/view.jsp?idx=${dto.idx}"><img src="${dto.thumbnail }"></a>
			</div>
			<div class="title">
				<c:if test="${fn:length(dto.title) > 35 }">
					${fn:substring(dto.title, 0, 35) }...
				</c:if>
				<c:if test="${fn:length(dto.title) <= 35 }">
					${dto.title }
				</c:if>
			</div>
			<div class="channel">${dto.channel }</div>
		</div>
	</c:forEach>
	</div>
</div>
</main>
</body>
</html>
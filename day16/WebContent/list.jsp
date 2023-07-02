<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h3>목록</h3>

<c:set var="list" value="${dao.select() }" />

<div id="root">
	<c:forEach var="dto" items="${list }">
		<div class="item">
			<div class="idx">${dto.idx }</div>
			<div class="pic">
				<img src="${cpath }/image/${dto.pic }">
			</div>
			<div class="content">${dto.content }</div>
			<div class="writeDate">${dto.writeDate }</div>
			<div class="ipaddr">${dto.ipaddr }</div>
		</div>	
	</c:forEach>
</div>

</body>
</html>
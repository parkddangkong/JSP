<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<h3>게시판</h3>


<table id="boardList">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일자</th>
			<th>IP</th>
		</tr>
	</thead>
	
	<tbody>
	<c:set var="list" value="${boardDAO.select() }" />
	<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.idx }</td>
			<td>${dto.title }</td>
			<td>${dto.writer }</td>
			<td>${dto.writeDate }</td>
			<td>${dto.ipaddr }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<div class="flex">
	<div></div>
	<div>
		<a href="${cpath }/board/write.jsp"><button>새 글 쓰기</button></a>
	</div>
</div>










</body>
</html>
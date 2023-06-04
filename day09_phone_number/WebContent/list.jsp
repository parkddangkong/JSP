<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<c:set var="list" value="${dao.selectAll() }" />

<h3>목록</h3>

<table>
	<thead>
		<tr>
			<th>IDX</th>
			<th>NAME</th>
			<th>NUMBER</th>
			<th>BOOKMARK</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="dto" items="${list }">
			<tr>
				<td>${dto.idx }</td>
				<td><a href="${cpath }/view.jsp?idx=${dto.idx}">${dto.name }</a>
				<td>${dto.pnumber }</td>
				<td><a href="${cpath }/bookmark.jsp?idx=${dto.idx}">
				${dto.bookmark == 1 ? '★' : '☆'}
				</a></td>
			</tr>
	 
		</c:forEach>
	</tbody>
</table>


</body>
</html>
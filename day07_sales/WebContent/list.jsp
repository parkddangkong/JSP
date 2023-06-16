<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h3>목록</h3>

<c:set var="list" value="${dao.selectAll() }"/>
<table>
		<tr>
			<th>IDX</th>
			<th>NAME</th>
			<th>PRICE</th>
			<th>CNT</th>
			<th>STATUS</th>
		</tr>
		<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.idx }</td>
			<td>${dto.name }</td>
			<td>${dto.price }</td>
			<td>${dto.cnt }</td>
			<td>${dto.status }</td>
			<td><a href="${cpath }/delete.jsp?idx=${dto.idx }"><button>삭제</button></a></td>
		</tr>
		</c:forEach>
	</table>


</body>
</html>
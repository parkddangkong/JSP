<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<h3>목록</h3>

<c:set var="list" value="${dao.selectAll() }"/>
<table>
		<tr>
			<th>IDX</th>
			<th>TITLE</th>
			<th>MEMO</th>
			<th>SDATE</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.idx }</td>
			<td>${dto.title }</td>
			<td>${dto.memo }</td>
			<td>${dto.sdate }</td>
			<td><a href="${cpath }/delete.jsp?idx=${dto.idx }"><button>정상</button></a></td>
		</tr>
		</c:forEach>
	</table>

</body>
</html>
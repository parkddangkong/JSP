<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="list" value="${dao.selectAll() }" />
<%-- <h3>dao : ${dao }</h3> --%>
<%-- <h3>list : ${list }</h3> --%>

<h3>목록</h3>

<table>
	<thead>
		<tr>
			<th>IDX</th>
			<th>USERID</th>
			<th>USERPW</th>
			<th>USERNAME</th>
			<th>EMAIL</th>
			<th>BIRTH</th>
			<th>GENDER</th>
			<th>AGE</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.idx }</td>
			<td><a href="${cpath }/view.jsp?idx=${dto.idx}">${dto.userid }</a></td>
			<td>${dto.userpw }</td>
			<td>${dto.username }</td>
			<td>${dto.email }</td>
			<td>${dto.birth }</td>
			<td>${dto.gender }</td>
			<td>${dto.age }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

</body>
</html>
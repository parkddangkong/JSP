<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h3>회원목록</h3>
<%--	1) dao 객체가 생성되어 있어야 한다 (header.jsp, attribute) --%>

<%--	2) dao의 함수를 호출하여 list를 받아둔다 (c:set, attribute) --%>
<c:set var="list" value="${dao.selectAll() }" />

<%--	3) List<DTO> 형식으로 만들어진 list를 c:forEach문으로 반복하여 출력한다 --%>
<table border="1" cellpadding="10" cellspacing="0">
	<tr bgcolor="silver">
		<th>IDX</th>
		<th>USERID</th>
		<th>USERPW</th>
		<th>USERNAME</th>
		<th>EMAIL</th>
		<th>BIRTH</th>
		<th>GENDER</th>
		<th>AGE</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>
	<c:forEach var="dto" items="${list }">
	<tr>
		<td>${dto.idx }</td>
		<td>${dto.userid }</td>
		<td>${dto.userpw }</td>
		<td>${dto.username }</td>                                           
		<td>${dto.email }</td>
		<td>${dto.birth }</td>
		<td>${dto.gender }</td>
		<td>${dto.age }</td>
		<td><button>수정</button></td>
		<td><button>삭제</button></td>
	</tr>
	</c:forEach>
</table>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="quiz-schedule-header.jsp" %>

<h3>일정 목록</h3>

<c:set var="list" value="${dao.selectAll() }" />

<table border="1" cellpadding="10" cellspacing="0">
	<tr>
		<th>제목</th>
		<th>기간</th>
	</tr>
	<c:forEach var="dto" items="${list }">
	<tr>
		<td>${dto.title }</td>
		<td>${dto.sdate } ~ ${dto.edate } (${dto.days }일) (${DateUtil.getDaysDiff(dto) }일)</td>
	</tr>
	</c:forEach>
</table>

</body>
</html>
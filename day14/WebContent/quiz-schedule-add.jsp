<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="quiz-schedule-header.jsp" %>

<h3>추가</h3>

<c:if test="${pageContext.request.method == 'GET' }">
	<form method="POST">
		<p><input type="text" name="title" placeholder="제목" autocomplete="off" required autofocus></p>
		<p>시작날짜 : <input type="date" name="sdate"></p>
		<p>종료날짜 : <input type="date" name="edate"></p>
		<p><input type="submit" value="등록"></p>
	</form>
</c:if>

<c:if test="${pageContext.request.method == 'POST' }">
	<jsp:useBean id="dto" class="schedule.ScheduleDTO" />
	<jsp:setProperty property="title" name="dto" />
	<jsp:setProperty property="sdate" name="dto" value="${DateUtil.toSqlDate(param.sdate) }" />
	<jsp:setProperty property="edate" name="dto" value="${DateUtil.toSqlDate(param.edate) }" />
	<c:set var="row" value="${dao.insert(dto) }" />
	<h3>추가 ${row != 0 ? '성공' : '실패' }</h3>
	<a href="${cpath }/quiz-schedule-list.jsp"><button>목록으로</button></a>
</c:if>

</body>
</html>



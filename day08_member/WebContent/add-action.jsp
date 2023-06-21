<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<jsp:useBean id="input" class="member.MemberDTO" />
<jsp:setProperty property="*" name="input" />
<c:set var="result" value="${dao.insert(input) }" />

<c:if test="${result != 0 }">
	<script>
		alert('추가 성공');
		location.href = 'index.jsp';
	</script>
</c:if>

<c:if test="${result == 0 }">
	<script>
		alert('추가 실패');
		history.go(-1);
	</script>
</c:if>

</body>
</html>
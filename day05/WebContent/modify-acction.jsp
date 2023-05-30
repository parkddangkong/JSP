<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>

<jsp:useBean id="dto" class="student.StudentDTO" />
<jsp:setProperty property="*" name="dto" />

<script>
	const row = `${dao.modify(dto)}`	// SQL에 영향받은 줄 수를 정수로 반환

	if(row != 0){		// 문자열과 정수간의 비교도 가능하다('0' == 0)
		alert('수정 성공')	// 메세지 표시
		location.href = `${cpath}/list.jsp`	// 현재페이지로 리다이렉트
	}
	else{
		alert('수정 실패')	// 메세지 표시
		history.go(-1)	// 브라우저의 이전 페이지로 이동하는 자바스크립트 코드
	}
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<main>
	<div id="root">
		<c:if test="${pageContext.request.method == 'GET' }">
			<form method="POST">
				<p><input type="text" name="channel" placeholder="채널이름"></p>
				<p><input type="text" name="thumbnail" placeholder="썸네일 경로"></p>
				<p><input type="text" name="iframe" placeholder="소스코드 복사"></p>
				<p><input type="submit">
			</form>
		</c:if>
	
		<c:if test="${pageContext.request.method == 'POST' }">
			<jsp:useBean id="dto" class="youtube.YoutubeDTO" />
			<jsp:setProperty property="*" name="dto" />
			<c:set var="row" value="${dao.insert(dto) }" />
			<h3>결과 : ${row != 0 ? '성공' : '실패' }</h3>
			<a href="${cpath }/list.jsp"><button>목록으로</button></a>
		</c:if>
	</div>
</main>
</body>
</html>
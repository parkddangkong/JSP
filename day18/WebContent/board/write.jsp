<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<h3>새 글 작성</h3>
<c:if test="${empty login }">
	<c:redirect url="/member/login.jsp" />
</c:if>

<form method="POST">
	<p>
		<input type="text" name="writerName" value="${login.userid }" readonly>
		<input type="hidden" name="writer" value="${login.idx }">
	</p>
	<p><input type="text" name="title" placeholder="제목" autofocus></p>
	<p>
		<textarea name="content" placeholder="내용을 작성하세요"></textarea>
	</p>
	<p><input type="submit" value="작성완료"></p>
</form>

<c:if test="${pageContext.request.method == 'POST' }">
	<c:set var="userAgent" value="<%=request.getHeader(\"user-agent\") %>" />
	<jsp:useBean id="dto" class="board.BoardDTO" />
	<jsp:setProperty property="*" name="dto" />
	<jsp:setProperty property="ipaddr" name="dto" value="${pageContext.request.remoteAddr }" />
	<jsp:setProperty property="userAgent" name="dto" value="${userAgent }" />
	<c:set var="row" value="${boardDAO.insert(dto) }" />
	<c:redirect url="/board/list.jsp" />
</c:if>

</body>
</html>


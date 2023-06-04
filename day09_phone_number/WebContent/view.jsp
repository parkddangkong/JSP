<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="dto" value="${dao.selectOne(param.idx) }" />

<h3>전화번호</h3>

<ul>
  <li>name : ${dto.name }</li>
  <li>pnumber : ${dto.pnumber }</li>
  <li>bookmark : ${dto.bookmark }</li>
</ul>

<p>
	<a href="${cpath }/modify.jsp?idx=${dto.idx}">수정</a>
	<a href="${cpath }/delete.jsp?idx=${dto.idx}">삭제</a>
</p>
</body>
</html>
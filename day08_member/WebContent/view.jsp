<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<c:set var="dto" value="${dao.selectOne(param.idx) }" />
<!-- select * from member1 where idx=? -->

<h3>회원 정보</h3>

<ul>
	<li>userid : ${dto.userid }</li>
	<li>userpw : *******</li>
	<li>username : ${dto.username }</li>
	<li>birth : ${dto.birth }</li>
	<li>gender : ${dto.gender }</li>
	<li>age : ${dto.age }</li>
</ul>

<p>
	<a href="${cpath }/modify.jsp?idx=${dto.idx}">수정</a> 
	<a href="${cpath }/delete.jsp?idx=${dto.idx}">삭제</a>
</p>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<h3>전화번호 수정</h3>

<form method="POST" action="modify-action.jsp">
	<table>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" placeholder="이름"
				value="${dto.name }" required></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" name="pnumber" placeholder="전화번호"
				value="${dto.pnumber }" required></td>
		</tr>
		<tr>
			<td>즐겨찾기</td>
			<td><input type="checkbox" name="bookmark"
			value="${dto.bookbark }"></td>
		</tr>
	</table>
	<p>
		<input type="submit" value="수정">
	</p>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<h3>전화번호 추가</h3>

<form method="POST" action="add-action.jsp">
	<table>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" placeholder="이름" required></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" name="pnumber" placeholder="전화번호"
				required></td>
		</tr>
		<tr>
			<td>즐겨찾기</td>
			<td><input type="checkbox" name="bookmark" required></td>
		</tr>
	</table>
	<p>
	
		<input type="submit" value="추가">
	</p>
</form>

</body>
</html>
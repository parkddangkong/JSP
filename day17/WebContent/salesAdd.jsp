<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h3>매출 등록</h3>

<c:if test="${pageContext.request.method == 'GET' }">
	<form method="POST">
		<p>
			<select name="product" required>
				<option value="">=== 등록할 상품을 선택하세요 ===</option>
			<c:set var="productList" value="${productDAO.select() }" />
			<c:forEach var="product" items="${productList }">
				<option value="${product.idx }">${product.name }</option>
			</c:forEach>
			</select>
		</p>
		<p><input type="number" name="cnt" placeholder="상품수량"></p>
		<p><input type="submit"></p>
	</form>
</c:if>

<c:if test="${pageContext.request.method == 'POST' }">
	<jsp:useBean id="dto" class="sales.SalesDTO" />
	<jsp:setProperty property="*" name="dto" />
	<c:set var="row" value="${salesDAO.insert(dto) }" />
	<h3>${row != 0 ? '추가 성공' : '추가 실패' }</h3>
	<a href="${cpath }/salesList.jsp"><button>매출목록으로</button></a>
</c:if>
</body>
</html>
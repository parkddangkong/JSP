<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h3>상품 등록</h3>

<c:if test="${pageContext.request.method == 'GET' }">
	<form method="POST">
		<p><input type="text" name="name" placeholder="상품이름"></p>
		<p><input type="number" name="price" placeholder="상품가격"></p>
		<p><input type="submit"></p>
	</form>
</c:if>

<c:if test="${pageContext.request.method == 'POST' }">
	<jsp:useBean id="dto" class="product.ProductDTO" />
	<jsp:setProperty property="*" name="dto" />
	<c:set var="row" value="${productDAO.insert(dto) }" />
	<h3>${row != 0 ? '추가 성공' : '추가 실패' }</h3>
	<a href="${cpath }/productList.jsp"><button>상품목록으로</button></a>
</c:if>

</body>
</html>
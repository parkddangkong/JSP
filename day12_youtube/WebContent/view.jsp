<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="dto" value="${dao.select(param.idx) }" />
<main>
<div class="flex">
	<div class="left">
		<div class="mov">${dto.iframe }</div>
		<h3>${dto.title }</h3>
		<div>${dto.channel }</div>
	</div>
	
	<div class="right">
		<%--	beforeAdd : 5,4,3,2,1 --%>
		<c:set var="beforeAdd" value="${URLDecoder.decode(cookie.recent.value, 'UTF-8') }" />
		<c:set var="afterAdd" value="${CookieUtil.add(beforeAdd, param.idx) }" />
		<%--	afterAdd :  3,5,4,2,1 --%>
		<%
			String afterAdd = (String)pageContext.getAttribute("afterAdd");
			afterAdd = URLEncoder.encode(afterAdd, "UTF-8");
			Cookie c = new Cookie("recent", afterAdd);
			c.setMaxAge(600);
			response.addCookie(c);
		%>
		<%--	beforeAdd 기반의 영상 목록 불러오기 --%>
		<c:set var="recentList" value="${dao.selectList(beforeAdd) }" />		
		<c:forEach var="recentItem" items="${recentList }">
		<div class="recentList flex">
			<div>
				<a href="${cpath }/view.jsp?idx=${recentItem.idx}">
					<img src="${recentItem.thumbnail }"></a>
			</div>
			<div>
				<div class="title">
				<c:if test="${fn:length(recentItem.title) > 17 }">
					${fn:substring(recentItem.title, 0, 17) }...
				</c:if>
				<c:if test="${fn:length(recentItem.title) <= 17 }">
					${recentItem.title }
				</c:if>
				</div>
				<div class="channel">${recentItem.channel }</div>
			</div>
		</div>
		</c:forEach>
		
		<h3>쿠키 목록</h3>
		<h3>beforeAdd : ${beforeAdd }</h3>
		<h3>afterAdd : ${afterAdd }</h3>	
	</div>
</div>
</main>

</body>
</html>
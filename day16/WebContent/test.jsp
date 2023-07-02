<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>test.jsp</h1>
<hr>

<h3>접속자의 IP : <%=request.getRemoteAddr() %></h3>
<h3>접속자의 IP : ${pageContext.request.remoteAddr }</h3>
<h3>userAgent : <%=request.getHeader("user-agent") %></h3>

<%
	File dir = new File(application.getRealPath("sample"));
	String[] list = dir.list();
	pageContext.setAttribute("list", list);
%>

<style>
	#root {
		width: 600px;
		margin: auto;
	}
	.slider {
		margin: auto;
		width: 600px;
		height: 400px;
		position: relative;
		overflow: hidden;
		background-color: black;
	}
	.items {
		display: flex;
		align-items: center;
		position: relative;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		transition-duration: 0.5s;
	}
	.leftBtn {
		z-index: 1;
		position: absolute;
		top: 50%;
		left: 10px;
		border-radius: 50%;
	}
	.rightBtn {
		z-index: 1;
		position: absolute;
		top: 50%;
		right: 10px;
		border-radius: 50%;
	}
	.item {
		position: relative;
	}
	.item img {
		width: 600px;
	}
</style>

<div id="root">
	<h3>작성자</h3>
	<div class="slider">
		<button class="leftBtn"><</button>
		<button class="rightBtn">></button>
		<div class="items" style="left: 50%;">
		<c:forEach var="fileName" items="${list }">
			<div class="item">
				<div><img src="sample/${fileName }"></div>
			</div>
		</c:forEach>
		</div>
	</div>
</div>

<script>
	const leftBtn = document.querySelector('button.leftBtn')
	const rightBtn = document.querySelector('button.rightBtn')
	
	const items = document.querySelector('.items')
	
	leftBtn.onclick = () => {
		const currentLeft = items.style.left
		const left = +currentLeft.substr(0, currentLeft.length - 1)
		console.log(left)
		items.style.left = (left + 100) + '%' 
	}
	rightBtn.onclick = () => {
		const currentLeft = items.style.left
		const left = +currentLeft.substr(0, currentLeft.length - 1)
		console.log(left)
		items.style.left = (left - 100) + '%' 
	}
</script>


</body>
</html>